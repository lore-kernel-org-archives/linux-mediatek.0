Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C1EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 06:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH+KmYBBMxX8TYTKLHrDBrlZ4+6mHA01DkZGc0as06w=; b=mQFn76aYSY5xT+NS1DTradMqAg
	iQAMYNwKK8lssRrsXSEYt3XjLHiJ42iPPwVZGjRJdA1flwawnVRIz1JRwkVNK7vOhvk2RDiUJuZAP
	t6YaS0w6FhENDvPxUyyyFaB+0R5c2azFmunNFtQ/GK0AMzrslKdnpzeUg2b2eTXN8/vClcD6vrg05
	/QZqsF4+xb6bbdkXLI2THAVnmH29dSWQVoQ3SFSJuGQ0TT2DiRP+VbtG35uPArbg3qYPdVOZt/Z5h
	drlPomzjrep0R2MLXGIQjjB4pWdCE6OP3d0yzr00OBMAh3CJf4UJ+edLtA+BinQiHGeYDYaR6x2GN
	qB3Ax2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIr9-00Do2Q-0n;
	Wed, 13 Dec 2023 06:36:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIr7-00Do0S-0R;
	Wed, 13 Dec 2023 06:36:30 +0000
X-UUID: eddd953e998111ee958cff29c719f35b-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pH+KmYBBMxX8TYTKLHrDBrlZ4+6mHA01DkZGc0as06w=;
	b=JfgP7AU8Ouav2FDp6WZjPkja7t2rFQc/m+ew4CjGdBOJb4qHRHlF2fzVTErl+wERVvjsna2ZTxokFTNAhgvPzizJghRJyaycwreh9ljT03p8K9OWO4ykmRDkL13UJ2GAsZzQHx/yEM33iymx1MtlR+UEfPOX+j5yn91ysMGelBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:2a05879f-4a2a-4947-80a3-55009d648240,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:c9eb9cfd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eddd953e998111ee958cff29c719f35b-20231212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 756065109; Tue, 12 Dec 2023 23:36:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Dec 2023 14:35:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Dec 2023 14:35:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 2/3] usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
Date: Wed, 13 Dec 2023 14:35:42 +0800
Message-ID: <20231213063543.12435-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_223629_182082_609A6DD4 
X-CRM114-Status: GOOD (  18.40  )
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
It can be fixed by setting rxfifo depth less than 3, prefer to use 2 here,
the side-effect is that may cause performance drop about 10%, including
bulk transfer.

Fixes: 926d60ae64a6 ("usb: xhci-mtk: modify the SOF/ITP interval for mt8195")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 35 +++++++++++++++++++++++++++++++++--
 drivers/usb/host/xhci-mtk.h |  1 +
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index bbdf1b0b7be1..a54535877e90 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -73,6 +73,9 @@
 #define FRMCNT_LEV1_RANG	(0x12b << 8)
 #define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
 
+#define HSCH_CFG1		0x960
+#define SCH3_RXFIFO_DEPTH_MASK	GENMASK(21, 20)
+
 #define SS_GEN2_EOF_CFG		0x990
 #define SSG2EOF_OFFSET		0x3c
 
@@ -165,6 +168,33 @@ static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
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
+	if (mtk->rxfifo_depth_quirk) {
+		value = readl(hcd->regs + HSCH_CFG1);
+		value &= ~SCH3_RXFIFO_DEPTH_MASK;
+		value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK, 2);
+		writel(value, hcd->regs + HSCH_CFG1);
+	}
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
@@ -448,8 +478,7 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 		if (ret)
 			return ret;
 
-		/* workaround only for mt8195 */
-		xhci_mtk_set_frame_interval(mtk);
+		xhci_mtk_init_quirk(mtk);
 	}
 
 	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
@@ -527,6 +556,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	of_property_read_u32(node, "mediatek,u2p-dis-msk",
 			     &mtk->u2p_dis_msk);
 
+	mtk->rxfifo_depth_quirk = of_property_read_bool(node, "mediatek,rxfifo-depth");
+
 	ret = usb_wakeup_of_property_parse(mtk, node);
 	if (ret) {
 		dev_err(dev, "failed to parse uwk property\n");
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 39f7ae7d3087..2443075530e3 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -166,6 +166,7 @@ struct xhci_hcd_mtk {
 	unsigned int has_ippc:1;
 	unsigned int lpm_support:1;
 	unsigned int u2_lpm_disable:1;
+	unsigned int rxfifo_depth_quirk:1;
 	/* usb remote wakeup */
 	unsigned int uwk_en:1;
 	struct regmap *uwk;
-- 
2.25.1


