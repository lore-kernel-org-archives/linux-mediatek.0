Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5012C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8M/ZUPaLvIFBaNsU5iy0TFRUxi/d9UUIrlIYPkXzZI=; b=HBcYXhqGeOVKmY
	68O1MK1zZAgnafZaLJriH5oRPXzVxPrfnwvvjBlDWA8bhs69Bkv3izXPguU0kbPem1RdwHv0B/Pqy
	++D8ZHDqMqM6YBZF3bv6KPLOyYzIXWMa4df/aX7FwlO+Aikg44POYNvlTR/1qKcDJsvw8M6d/lOwD
	JTemVVTs6cC/oK8Zeb55I6TvAIP7TfzoAOMo32SMn3sm8TED7f9reXxB6bj076+JXkos9tpr/ei2t
	G+0xbTcZn08OvJwt/X3pvKf7zXRRiMX1/EEpjJGuwA31iRT7V0GwsZJ24GVMVEt7tKsO/mFCfgOVE
	Yy5q5e1n8z17TKyCl2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMag-00FdMz-Ve; Wed, 01 Jun 2022 11:32:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaD-00FdCk-5A; Wed, 01 Jun 2022 11:32:14 +0000
X-UUID: 214625d9f3d347f39cae5c9295652e00-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2d4bcb23-1d00-471d-8415-ac27da506f14,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:3cd9268a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 214625d9f3d347f39cae5c9295652e00-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1889018043; Wed, 01 Jun 2022 04:32:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 11/15] remoteproc: mediatek: Add SCP core 1 SRAM offset
Date: Wed, 1 Jun 2022 19:21:57 +0800
Message-ID: <20220601112201.15510-12-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043213_242100_7735D78D 
X-CRM114-Status: GOOD (  19.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Because SCP core 0 and core 1 both boot from address 0 and have the same
viewpoint of memory, HW has a set of registers, "SRAM offset", to add
offset to accessed address for SCP core 1 to solve this problem.

The "SRAM offset" configuration is composed by specifying a range and an
offset. The value of range is from the viewpoint of SCP core 1.
When SCP core 1 accessing addresses in the configured range, SCP bus
adds an offset to shift the destination on SCP SRAM. This shift is
transparent to the software running on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp_dual.c | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index 16cf9d2628c8..4e8d7f5cdad6 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -33,6 +33,27 @@ static void mt8195_power_off_sram(void __iomem *addr)
 static int mt8195_scp_dual_before_load(struct mtk_scp *scp)
 {
 	u32 sec_ctrl;
+	struct device *dev = scp->dev;
+	struct device_node *main_np;
+	struct platform_device *main_pdev;
+	struct mtk_scp *scp_core0;
+
+	/* Get sram start address from SCP core 0 */
+	main_np = of_parse_phandle(dev->of_node, "mediatek,scp-core", 1);
+	if (!main_np) {
+		dev_warn(dev, "Invalid SCP main core phandle\n");
+		return -EINVAL;
+	}
+
+	main_pdev = of_find_device_by_node(main_np);
+	of_node_put(main_np);
+
+	if (!main_pdev) {
+		dev_err(dev, "Cannot find SCP core 0 device\n");
+		return -ENODEV;
+	}
+	scp_core0 = platform_get_drvdata(main_pdev);
+	put_device(&main_pdev->dev);
 
 	mt8195_power_on_sram(scp->reg_base + MT8195_CPU1_SRAM_PD);
 
@@ -42,6 +63,27 @@ static int mt8195_scp_dual_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
 
+	/* The value of SRAM offset range is from the viewpoint of SCP core 1.
+	 * This configuration adds an offset on SCP bus when SCP core 1 accesses SCP SRAM
+	 * to solve the SCP core 0 and core 1 both fetch the 1st instruction from the same
+	 * SRAM address.
+	 *
+	 * Because SCP core 0 and core 1 both boot from address 0, this must be configured
+	 * before boot SCP core 1.
+	 *
+	 * Configure the range of SRAM addresses will be added offset.
+	 */
+	writel(0, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_LOW);
+	writel(scp->sram_size, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_HIGH);
+
+	/* configure the offset value */
+	writel(scp->sram_phys - scp_core0->sram_phys, scp->reg_base + MT8195_L2TCM_OFFSET);
+
+	/* enable adding sram offset when fetching instruction and data */
+	sec_ctrl = readl(scp->reg_base + MT8195_SEC_CTRL);
+	sec_ctrl |= MT8195_CORE_OFFSET_ENABLE_I | MT8195_CORE_OFFSET_ENABLE_D;
+	writel(sec_ctrl, scp->reg_base + MT8195_SEC_CTRL);
+
 	return 0;
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
