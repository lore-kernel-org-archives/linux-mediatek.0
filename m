Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC68C47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b52zJglgr54jvrdtnvlGDp0I7GAvbQ6SL/mFyDNYJug=; b=egJ38vRmszUW6Chcnvu3lHnybT
	lh5mUlsE8hmzdeouIMqVdSxgOxQ+5OBiYV4pyCoNaVaiJfOPKwyINrbMEJhXup0aQHBOnZwoykDMQ
	qGkE3lkh7kMro5J+ymLewd/ID1P93VavAiQiBeV+8XrAzFEnlDwZB+0lWMjXpT2HIIjaTO/s9+xGY
	lfnkM6wkO7VEcpzs4d/FuwbWhtz+pSCbWnBu2uTNGvS4gFVBSzpMbQH9ykHYF4Pl0Agr7F85PsPVM
	7DvanuF7pDGsetowuxjVTqlc6UohwDzebB5LyLa9xw4x1IoPhMFvTwhTFq7W/7vYCHsJYg/Y1QJOi
	w/2Ls3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLH2G-00Cy0O-2T;
	Thu, 04 Jan 2024 06:16:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLH2D-00CxzE-2W;
	Thu, 04 Jan 2024 06:16:55 +0000
X-UUID: d64d5384aac811eeafd70d0b34820190-20240103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b52zJglgr54jvrdtnvlGDp0I7GAvbQ6SL/mFyDNYJug=;
	b=P/XqNSr1IUEyUuBoUchK3dj+q6xOQ5pLMaiDkQBemd2Cob8S/vWYYNYg/rgDvgkQBnX8+zGsVy5eAuuK276y08IEL1OinPsNZPP5KnbRgaPT1sFQIy9sPKqw5DzgTLvSCyeJ8VdETjxS4EuEev42jGs4KlFtdBdSOE85iPb45HI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:cd50d46c-9fb1-4498-9aa7-f2abfcab5448,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:ceacf97e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d64d5384aac811eeafd70d0b34820190-20240103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1470391160; Wed, 03 Jan 2024 23:16:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 14:16:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 14:16:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias
 Nyman <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v5 2/3] usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
Date: Thu, 4 Jan 2024 14:16:39 +0800
Message-ID: <20240104061640.7335-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104061640.7335-1-chunfeng.yun@mediatek.com>
References: <20240104061640.7335-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_221653_890626_D6F86C1D 
X-CRM114-Status: GOOD (  19.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For Gen1 isoc-in transfer, host still send out unexpected ACK after device
finish the burst with a short packet, this will cause an exception on the
connected device, such as, a usb 4k camera.
It can be fixed by setting rxfifo depth less than 4k bytes, prefer to use
3k here, the side-effect is that may cause performance drop about 10%,
including bulk transfer.

Fixes: 926d60ae64a6 ("usb: xhci-mtk: modify the SOF/ITP interval for mt8195")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: no changes
v4:
drop Cc stable
add reviewed-by Angelo
change rxfifo depth in bytes
v3:
add Cc stable
change @rxfifo_depth from int to u32, due to property's value range is changed
v2:
use 'rx-fifo-depth' property;
add header file 'linux/bitfield.h' to avoid building error on some ARCH;
---
 drivers/usb/host/xhci-mtk.c | 40 +++++++++++++++++++++++++++++++++++--
 drivers/usb/host/xhci-mtk.h |  2 ++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index bbdf1b0b7be1..3252e3d2d79c 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -7,6 +7,7 @@
  *  Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -73,6 +74,9 @@
 #define FRMCNT_LEV1_RANG	(0x12b << 8)
 #define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
 
+#define HSCH_CFG1		0x960
+#define SCH3_RXFIFO_DEPTH_MASK	GENMASK(21, 20)
+
 #define SS_GEN2_EOF_CFG		0x990
 #define SSG2EOF_OFFSET		0x3c
 
@@ -114,6 +118,8 @@
 #define SSC_IP_SLEEP_EN	BIT(4)
 #define SSC_SPM_INT_EN		BIT(1)
 
+#define SCH_FIFO_TO_KB(x)	((x) >> 10)
+
 enum ssusb_uwk_vers {
 	SSUSB_UWK_V1 = 1,
 	SSUSB_UWK_V2,
@@ -165,6 +171,35 @@ static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
 	writel(value, hcd->regs + SS_GEN2_EOF_CFG);
 }
 
+/*
+ * workaround: usb3.2 gen1 isoc rx hw issue
+ * host send out unexpected ACK afer device fininsh a burst transfer with
+ * a short packet.
+ */
+static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
+{
+	struct usb_hcd *hcd = mtk->hcd;
+	u32 value;
+
+	if (!mtk->rxfifo_depth)
+		return;
+
+	value = readl(hcd->regs + HSCH_CFG1);
+	value &= ~SCH3_RXFIFO_DEPTH_MASK;
+	value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK,
+			    SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+	writel(value, hcd->regs + HSCH_CFG1);
+}
+
+static void xhci_mtk_init_quirk(struct xhci_hcd_mtk *mtk)
+{
+	/* workaround only for mt8195 */
+	xhci_mtk_set_frame_interval(mtk);
+
+	/* workaround for SoCs using SSUSB about before IPM v1.6.0 */
+	xhci_mtk_rxfifo_depth_set(mtk);
+}
+
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
@@ -448,8 +483,7 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 		if (ret)
 			return ret;
 
-		/* workaround only for mt8195 */
-		xhci_mtk_set_frame_interval(mtk);
+		xhci_mtk_init_quirk(mtk);
 	}
 
 	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
@@ -527,6 +561,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	of_property_read_u32(node, "mediatek,u2p-dis-msk",
 			     &mtk->u2p_dis_msk);
 
+	of_property_read_u32(node, "rx-fifo-depth", &mtk->rxfifo_depth);
+
 	ret = usb_wakeup_of_property_parse(mtk, node);
 	if (ret) {
 		dev_err(dev, "failed to parse uwk property\n");
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 39f7ae7d3087..f5e2bd66bb1b 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -171,6 +171,8 @@ struct xhci_hcd_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	/* quirk */
+	u32 rxfifo_depth;
 };
 
 static inline struct xhci_hcd_mtk *hcd_to_mtk(struct usb_hcd *hcd)
-- 
2.18.0


