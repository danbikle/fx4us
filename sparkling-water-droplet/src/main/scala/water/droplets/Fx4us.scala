
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

    // In Scala how to create array of floats?
    val floats1 = Array[Double](1.1, 2.2, 3.3, 4.4, 5.5)
    val floats2 = Array[Double](1.1, 1.1, 2.2, 3.3, 4.4)
    // nn will become func arg:
    val nn = 1

    // In Scala how to slice, index?
    val floats3 = floats1.slice(0,nn)

    // In scala how to slice from end of array?
    val floats4 = floats1.dropRight(nn)

    // In Scala how to concat arrays?
    val floats5 = floats3 ++ floats4

    // Shutdown application
    sc.stop()
  }

  def configure(appName:String = "Fx4us"):SparkConf = {
    val conf = new SparkConf()
      .setAppName(appName)
    conf.setIfMissing("spark.master", sys.env.getOrElse("spark.master", "local"))
    conf
  }
}
