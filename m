Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GIxUPgpQ9w66yddwo4RND/m+H42YXDOA74jmIX9Ato=; b=XqC6D4LTX1gLwF
	v5yP5bkli1kZ1zE2+4UIO1s6MaT+U/WwBP8pReuAdZ72qYXkvuaIYN1EiaepHD5qW/YLQjbI5X39x
	lOuQ3EKtR8Lmtw9Yd51T3qmF6AEyHtAhg/2t0N3cX4fqGOfjyBaVD5Z8YDO+MilKiKgUErfur2M+6
	CK+hyk+19Tq0XMXSR9ctDKXvbjNZ3PSRKI88gLsINQ69IXAZezk8ad1rXj7cSn6A2TNh5liTgIySs
	+a8D+fnnm4VptBZSrkcR/hmU1pmp3IMYnSqpRdKq1DhMztfd2JBNVfMeXr4oiNeUQObxqulexs+uJ
	9BSRNES3/Gzy5HqE2/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBIy-009rBd-3k; Wed, 04 May 2022 09:28:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmB8A-009klS-74; Wed, 04 May 2022 09:17:11 +0000
X-UUID: f0c203b192604c329565e6bb724e6d41-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0dfb399c-88f1-4294-9179-6b4f9193e068, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:f4a174c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f0c203b192604c329565e6bb724e6d41-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2088992478; Wed, 04 May 2022 02:17:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 02:14:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 17:14:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 17:14:43 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v20 07/25] soc: mediatek: add mtk-mmsys config API for mt8195
 vdosys1
Date: Wed, 4 May 2022 17:14:22 +0800
Message-ID: <20220504091440.2052-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504091440.2052-1-nancy.lin@mediatek.com>
References: <20220504091440.2052-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_021710_296138_AC83B8E8 
X-CRM114-Status: GOOD (  13.07  )
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

Add four mmsys config APIs. The config APIs are used for config
mmsys reg. Some mmsys regs need to be set according to the
HW engine binding to the mmsys simultaneously.

1. mtk_mmsys_merge_async_config: config merge async width/height.
   async is used for cross-clock domain synchronization.
2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
   config mixer related settings.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    |  6 +++++
 drivers/soc/mediatek/mtk-mmsys.c       | 35 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  9 +++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index fd7b455bd675..454944a9409c 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,12 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
+#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
+#define MT8195_VDO1_HDR_TOP_CFG					0xd00
+#define MT8195_VDO1_MIXER_IN1_ALPHA				0xd30
+#define MT8195_VDO1_MIXER_IN1_PAD				0xd40
+
 #define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
 #define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 21fb4e91bf70..1b9b44e0d9d9 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -229,6 +229,41 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
+			      ~0, height << 16 | width);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
+
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
+			      be_height << 16 | be_width);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
+
+void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
+			       u8 mode, u32 biwidth)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
+			      alpha << 16 | alpha);
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
+			      alpha_sel << (19 + idx));
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
+			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
+
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
+			      BIT(4), channel_swap << 4);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index b4388ba43341..fe620929b0f9 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -73,4 +73,13 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
+
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
+
+void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
+			       u8 mode, u32 biwidth);
+
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
