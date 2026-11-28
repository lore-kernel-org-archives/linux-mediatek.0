Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED34606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQRmUpp0;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=KnUfKic3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E+173aj9W1CQUJ1n+dj88FblF5rxwIvl1pCcPl7OP8c=; b=PQRmUpp0jMnPe8uyR0cwLsd24n
	FXahrIUSI8o0yzMvIwV1qr/Cv6lvk3lCgr0PVFcsZ1UqGTds+B0hpLUGT9em9893EWgQPWM6gsQHI
	Kw36rckHhm14yhG1kGWNOetQ38wIfMTyDcznJcSw1rg/e/b/SCEGuH0zpuDXPc49DnY9yuqFejPYp
	dcWxiPMEIknMjWyuDbQCBi3zP7e+i77wgE9eXZcOv3G6R64/fLv42n1wecq7tK095NL6wZSLRKvtg
	xchuNy9Ns4jh9jTGLDMVel5LiOJo5vkSVzLOQ4cglaRALwCUjUp6I4GL2UHEvikNoo/Cvjxf5VqcO
	53zukzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDCS-00000000UvZ-40a3;
	Sat, 28 Nov 2026 07:50:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDAc-00000000U9H-1zms;
	Sat, 28 Nov 2026 07:48:38 +0000
X-UUID: 17f89418eb0011f1a36277631523a8d6-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E+173aj9W1CQUJ1n+dj88FblF5rxwIvl1pCcPl7OP8c=;
	b=KnUfKic3aIFcrmyjVOCietCgVaBSx//8CTLhKNWD95Fs8/zD2uCIl9mmWDEzkD9ram+XWoF8TBkIzJOz7zK+Tor+iSctiPrDuG2H8AQjzt8IEW2JCWfKf4LodupPQeZwWwDsAqVWn/wIfelvLscGdL443XPn1o8ORvdhpt2J6N4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dab1c593-9d5f-44ce-a039-73a36e214c72,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:81cd2c1a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17f89418eb0011f1a36277631523a8d6-20261128
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 546984313; Sat, 28 Nov 2026 00:48:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:23 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:21 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 12/14] media: mediatek: vcodec: clean xpc status
Date: Sat, 28 Nov 2026 15:47:58 +0800
Message-ID: <20261128074800.3108429-13-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_234830_534969_2948614B 
X-CRM114-Status: GOOD (  14.54  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver need to clean xpc status when receive decoder hardware
interrupt for mt8196 platform.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 31 +++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        | 13 ++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index fa0e13145..e75fe79d0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -61,6 +61,34 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec_dev *vdec_dev)
 	return 0;
 }
 
+static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_offset, u32 val, u32 mask)
+{
+	void __iomem *reg_addr = reg_base + reg_offset;
+	u32 reg_val;
+
+	reg_val =  readl(reg_addr);
+	reg_val &= ~mask;
+	reg_val |= (val & mask);
+	writel(reg_val, reg_addr);
+}
+
+static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
+{
+	unsigned long flags;
+	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
+
+	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+		return;
+
+	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
+	mask = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XPC_CORE_MASK;
+
+	spin_lock_irqsave(&dev->main_dev->irqlock, flags);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask);
+	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
+	spin_unlock_irqrestore(&dev->main_dev->irqlock, flags);
+}
+
 static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 {
 	struct mtk_vdec_hw_dev *dev = priv;
@@ -88,6 +116,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
+	mtk_vdec_hw_clean_xpc(dev);
+
 	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
 	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
@@ -166,6 +196,7 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->hw_idx = hw_idx;
 	subdev_dev->main_dev = main_dev;
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
+	subdev_dev->reg_base[VDEC_HW_XPC] = main_dev->reg_base[VDEC_HW_MISC];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
 	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
index 83fe8b942..5c906143c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
@@ -18,17 +18,26 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define VDEC_XPC_CLEAN_ADDR 0xc
+#define VDEC_XPC_LAT_VAL BIT(0)
+#define VDEC_XPC_LAT_MASK BIT(0)
+
+#define VDEC_XPC_CORE_VAL BIT(4)
+#define VDEC_XPC_CORE_MASK BIT(4)
+
 #define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) ((hw_idx) != MTK_VDEC_LAT_SOC)
 
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
- * @VDEC_HW_SYS : vdec soc register index
+ * @VDEC_HW_SYS:  vdec soc register index
  * @VDEC_HW_MISC: vdec misc register index
- * @VDEC_HW_MAX : vdec supported max register index
+ * @VDEC_HW_XPC:  vdec xpc register index
+ * @VDEC_HW_MAX:  vdec supported max register index
  */
 enum mtk_vdec_hw_reg_idx {
 	VDEC_HW_SYS,
 	VDEC_HW_MISC,
+	VDEC_HW_XPC,
 	VDEC_HW_MAX
 };
 
-- 
2.51.0.windows.2


