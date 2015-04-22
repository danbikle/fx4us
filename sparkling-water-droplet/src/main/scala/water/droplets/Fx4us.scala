
package water.droplets

import java.io.File

import hex.tree.gbm.GBM
import hex.tree.gbm.GBMModel.GBMParameters
import org.apache.spark.h2o.{StringHolder, H2OContext}
import org.apache.spark.{SparkFiles, SparkContext, SparkConf}
import water.fvec.DataFrame

object Fx4us {

  def main(args: Array[String]) {

    // Create Spark Context
    val conf = configure("Sparkling Water Droplet")
    val sc = new SparkContext(conf)

    // Create H2O Context
    val h2oContext = new H2OContext(sc).start()
    import h2oContext._

    // In Scala how to create array of floating point numbers?
    val fp1 = Array[Double](-1.1, 0.1, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9)

    // nn should be number of times to push:
    val nn = 2

    val fp2 = leftpushn(nn, fp1)
    val fp3 = rightpushn(nn, fp1)

    // Shutdown application
    sc.stop()
  }

  // This should add to left, subtract from right:
  def leftpushn(n:Int, array_in:Array[Double]):Array[Double] = {
    val lpiece = array_in.slice(0,n) // the small piece
    val rpiece = array_in.dropRight(n)
    lpiece ++ rpiece
  }

  // This should subtract from left, add to right:
  def rightpushn(n:Int, array_in:Array[Double]):Array[Double] = {
    val lpiece = array_in.drop(n) // the large piece
    val rpiece = array_in.drop(-n + array_in.length)
    lpiece ++ rpiece
  }

  def configure(appName:String = "Fx4us"):SparkConf = {
    val conf = new SparkConf()
      .setAppName(appName)
    conf.setIfMissing("spark.master", sys.env.getOrElse("spark.master", "local"))
    conf
  }
}
