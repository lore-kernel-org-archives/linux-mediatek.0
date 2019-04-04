From: =?UTF-8?q?Antti=20Ker=C3=A4nen?= <detegr@gmail.com>
Subject: [PATCH] staging: mt7621-pci-phy: prevent use of uninitialized variable
Date: Thu,  4 Apr 2019 15:44:17 +0300
Message-ID: <20190404124414.22846-1-detegr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com
Cc: gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com, benniciemanuel78@gmail.com, neil@brown.name, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Antti=20Ker=C3=A4nen?= <detegr@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Do not use uninitialized variable 'port' when printing an error message

Signed-off-by: Antti Keränen <detegr@gmail.com>
---
 drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
index 118302c122ee..aa3ae7777632 100644
--- a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
+++ b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
@@ -331,7 +331,7 @@ static int mt7621_pci_phy_probe(struct platform_device *pdev)
 
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret) {
-		dev_err(dev, "failed to get address resource(id-%d)\n", port);
+		dev_err(dev, "failed to get address resource\n");
 		return ret;
 	}
 
-- 
2.21.0
