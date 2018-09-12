From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] staging: mt7621-pci: Use PTR_ERR_OR_ZERO in mt7621_pcie_parse_dt()
Date: Wed, 12 Sep 2018 02:50:08 +0000
Message-ID: <1536720608-106123-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, matthias.bgg@gmail.com, blogic@openwrt.org, sergio.paracuellos@gmail.com, neil@brown.name, peter.vernia@gmail.com, oliver.huebers@web.de
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index ba1f117..d2cb910 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -396,10 +396,7 @@ static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
 	}
 
 	pcie->base = devm_ioremap_resource(dev, &regs);
-	if (IS_ERR(pcie->base))
-		return PTR_ERR(pcie->base);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->base);
 }
 
 static int mt7621_pcie_request_resources(struct mt7621_pcie *pcie,
