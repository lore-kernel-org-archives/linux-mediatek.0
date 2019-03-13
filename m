From: Armando Miraglia <arma2ff0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] spi: mediatek: Attempt to address style issues in mt7621-spi.c
Date: Wed, 13 Mar 2019 12:27:48 +0100
Message-ID: <20190313112747.GA235429@google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Running Lindent on the mt7621-spi.c file in drivers/staging I noticed that the
file contained style issues. This change attempts to address such style
problems.

Signed-off-by: Armando Miraglia <armax-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

--2oS5YaxWCcQjTEyO
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="mt7621-spi.patch"

diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
index b509f9fe3346..03d53845f8c5 100644
--- a/drivers/staging/mt7621-spi/spi-mt7621.c
+++ b/drivers/staging/mt7621-spi/spi-mt7621.c
@@ -52,14 +52,14 @@
 #define MT7621_LSB_FIRST	BIT(3)
 
 struct mt7621_spi {
-	struct spi_master	*master;
-	void __iomem		*base;
-	unsigned int		sys_freq;
-	unsigned int		speed;
-	struct clk		*clk;
-	int			pending_write;
-
-	struct mt7621_spi_ops	*ops;
+	struct spi_master *master;
+	void __iomem *base;
+	unsigned int sys_freq;
+	unsigned int speed;
+	struct clk *clk;
+	int pending_write;
+
+	struct mt7621_spi_ops *ops;
 };
 
 static inline struct mt7621_spi *spidev_to_mt7621_spi(struct spi_device *spi)
@@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
 	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
 
 	if ((spi->max_speed_hz == 0) ||
-		(spi->max_speed_hz > (rs->sys_freq / 2)))
+	    (spi->max_speed_hz > (rs->sys_freq / 2)))
 		spi->max_speed_hz = (rs->sys_freq / 2);
 
 	if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
@@ -316,9 +316,10 @@ static int mt7621_spi_setup(struct spi_device *spi)
 }
 
 static const struct of_device_id mt7621_spi_match[] = {
-	{ .compatible = "ralink,mt7621-spi" },
+	{.compatible = "ralink,mt7621-spi"},
 	{},
 };
+
 MODULE_DEVICE_TABLE(of, mt7621_spi_match);
 
 static int mt7621_spi_probe(struct platform_device *pdev)
@@ -408,9 +409,9 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
 
 static struct platform_driver mt7621_spi_driver = {
 	.driver = {
-		.name = DRIVER_NAME,
-		.of_match_table = mt7621_spi_match,
-	},
+		   .name = DRIVER_NAME,
+		   .of_match_table = mt7621_spi_match,
+		   },
 	.probe = mt7621_spi_probe,
 	.remove = mt7621_spi_remove,
 };

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--2oS5YaxWCcQjTEyO--
