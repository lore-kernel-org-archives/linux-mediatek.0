Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2A3606A32A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3d/GPEza;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fkt7Gr5R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pLnHP2sSL2Ayd5vdm+IJQYw65szjvJF1Z/xHPJkLud8=; b=3d/GPEzaCfX1mU
	swCT/VaNXBRnryLEYVSrUQcCAe6y7/VWQ1KHWhVqJMEaXlV3oj0ZcTE2iD2wcrofn3G0d5z4C2Z0W
	VSO2dp/5VWoYTDE7MIKy7K1W7n/IIATpIdWGAk4ATB+HKnV+8lL5Y/ZMnbmOO8wLd2x1ryIL4/aFT
	sHdBOTsxfs84+Co7vYrQPtJ/CJrDKI8X9Wvd7K0h8uLKetZduhhQ00xJ47bmmeklaNp7DCOybz5rw
	EckcCnhH6zzQCo/bpCGWoCASFAs4PaffOGtidTg9v7N6uJ+AvX5x9eJYrB00AF0+mnYqGJbJFyK6X
	dDntZQ/ohUZoUbmpCL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNz-0000000GxcV-3cHS;
	Fri, 27 Nov 2026 16:01:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNE-0000000GwxX-1Goi;
	Fri, 27 Nov 2026 16:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795230;
	bh=kaNEy/j2T5LlELnKXNbkuDqDKRS7Cia/k+vvRxgCMBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fkt7Gr5RzWCyDf5WjwTAEBHMHG63q3tEt51kRrNioIE1fDyhFe2xLEi/5IsfNQYWu
	 Y3kj0jndz54NRX1ocDZuXzbYQLRcSkFlf1+7POOnn46750O9uPDOTqRpK47WLDJQ60
	 9e3DO81pycbhzF0lbcGxxIJYepR0zKJH+keqGJTgCxxV3vaMX4yIJKXmXNi61tR2Gg
	 lWpzEd9/lTfUfDEsBCU6OXw47TcQV9yw9aP4E1ZA60ZXfcuN8YH4cKssqfXo7imzCY
	 4jqrCIAGU3/71FUsou+1TjL3a4yyT1MoQHl+FXE7lzeBT5HWvNV6JW1ye+tBDGfNOf
	 orAbN5E5XODhg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2748E17E0883;
	Fri, 27 Nov 2026 17:00:29 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:08 +0100
Subject: [PATCH v16 05/23] phy: mediatek: ufs: Add support for resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-5-6f2568f7c119@collabora.com>
References: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
In-Reply-To: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=4189;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Xiam/osGtxwhAktccgjDDFTyNPIgL14W489k6VlIrPg=;
 b=cCpWYFTfA/6CBwf8qvWOXiiZ12Hp8Ay/9VVgsKxO5EXtzOpix5cRWW7TfK2MsjamDl0nYIxqs
 IIU+/EvPELvCuBkhTqZD7AkGsVSr7GpH0dO2fdBeEFBnqGdy+rIlqR4
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080032_514845_533A246C 
X-CRM114-Status: GOOD (  19.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The MediaTek UFS PHY supports PHY resets. Until now, they've been
implemented in the UFS host driver. Since they were never documented in
the UFS HCI node's DT bindings, and no mainline DT uses it, it's fine if
it's moved to the correct location, which is the PHY driver.

Implement the MPHY reset logic in this driver and expose it through the
phy subsystem's reset op. The reset itself is optional, as judging by
other mainline devices that use this hardware, it's not required for the
device to function.

If no reset is present, the reset op returns -EOPNOTSUPP, which means
that the ufshci driver can detect it's present and not double sleep in
its own reset function, where it will call the phy reset.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-ufs.c | 72 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 8acd5bb1d916..487a21f42ff3 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -4,12 +4,15 @@
  * Author: Stanley Chu <stanley.chu@mediatek.com>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "phy-mtk-io.h"
 
@@ -35,9 +38,17 @@
 
 #define UFSPHY_CLKS_CNT    2
 
+#define UFS_MTK_SIP_MPHY_CTRL       BIT(8)
+
+enum ufs_mtk_mphy_op {
+	UFS_MPHY_BACKUP = 0,
+	UFS_MPHY_RESTORE
+};
+
 struct ufs_mtk_phy {
 	struct device *dev;
 	void __iomem *mmio;
+	struct reset_control *reset;
 	struct clk_bulk_data clks[UFSPHY_CLKS_CNT];
 };
 
@@ -140,9 +151,60 @@ static int ufs_mtk_phy_power_off(struct phy *generic_phy)
 	return 0;
 }
 
+static int ufs_mtk_phy_ctrl(struct ufs_mtk_phy *phy, enum ufs_mtk_mphy_op op)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, UFS_MTK_SIP_MPHY_CTRL, op,
+		      0, 0, 0, 0, 0, &res);
+
+	switch (res.a0) {
+	case SMCCC_RET_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_INVALID_PARAMETER:
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ufs_mtk_phy_reset(struct phy *generic_phy)
+{
+	struct ufs_mtk_phy *phy = get_ufs_mtk_phy(generic_phy);
+	int ret;
+
+	if (!phy->reset)
+		return -EOPNOTSUPP;
+
+	ret = reset_control_assert(phy->reset);
+	if (ret)
+		return ret;
+
+	usleep_range(100, 110);
+
+	ret = reset_control_deassert(phy->reset);
+	if (ret)
+		return ret;
+
+	/*
+	 * To avoid double-sleep and other unintended side-effects in the ufshci
+	 * driver, don't return the phy_ctrl retval here, but just return -EPROTO.
+	 */
+	ret = ufs_mtk_phy_ctrl(phy, UFS_MPHY_RESTORE);
+	if (ret) {
+		dev_err(phy->dev, "UFS_MPHY_RESTORE SMC command failed: %pe\n",
+			ERR_PTR(ret));
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
 static const struct phy_ops ufs_mtk_phy_ops = {
 	.power_on       = ufs_mtk_phy_power_on,
 	.power_off      = ufs_mtk_phy_power_off,
+	.reset          = ufs_mtk_phy_reset,
 	.owner          = THIS_MODULE,
 };
 
@@ -162,8 +224,18 @@ static int ufs_mtk_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->mmio))
 		return PTR_ERR(phy->mmio);
 
+	phy->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(phy->reset))
+		return dev_err_probe(dev, PTR_ERR(phy->reset), "Failed to get reset\n");
+
 	phy->dev = dev;
 
+	if (phy->reset) {
+		ret = ufs_mtk_phy_ctrl(phy, UFS_MPHY_BACKUP);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to back up MPHY\n");
+	}
+
 	ret = ufs_mtk_phy_clk_init(phy);
 	if (ret)
 		return ret;

-- 
2.56.1


