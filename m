From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] staging: mt7621-pci-phy: Use devm_platform_ioremap_resource()
 in mt7621_pci_phy_probe()
Date: Wed, 18 Sep 2019 21:12:48 +0200
Message-ID: <1c16a43c-3a01-8a86-02b0-1941ab7321dd@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?Q?Antti_Ker=c3=a4nen?= <detegr@gmail.com>, Emanuel Bennici <benniciemanuel78@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Brown <neil@brown.name>, Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 21:01:32 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c b/drivers/sta=
ging/mt7621-pci-phy/pci-mt7621-phy.c
index d2a07f145143..6ca4a33d13c3 100644
=2D-- a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
+++ b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
@@ -324,7 +324,6 @@ static int mt7621_pci_phy_probe(struct platform_device=
 *pdev)
 	const struct soc_device_attribute *attr;
 	struct phy_provider *provider;
 	struct mt7621_pci_phy *phy;
-	struct resource *res;
 	int port;
 	void __iomem *port_base;

@@ -344,14 +343,7 @@ static int mt7621_pci_phy_probe(struct platform_devic=
e *pdev)

 	phy->dev =3D dev;
 	platform_set_drvdata(pdev, phy);
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get address resource\n");
-		return -ENXIO;
-	}
-
-	port_base =3D devm_ioremap_resource(dev, res);
+	port_base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port_base)) {
 		dev_err(dev, "failed to remap phy regs\n");
 		return PTR_ERR(port_base);
=2D-
2.23.0
