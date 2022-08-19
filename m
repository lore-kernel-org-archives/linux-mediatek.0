Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34073C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J4zWTa6k2OYUdXIUN/pzfZteKeSataU/oZwLNCWEBQ=; b=KoZNW8zsR72r8LDyWVYaAkUVMf
	LRCPTvmloeXLre11eDhohCR5CCMvW+wkqAJq2gZVQDek8BFWrDzLOjXLH6MSuoCdG4lpbCOxKZJaY
	gtx77O3oq9pPGT70otKnJmON5OWR3e/sxyadkDfGup0M/aFHH5aqZjLy2l0VGXHCShwdjq0CsgXK0
	UtGV5czyCGTq/80EVeSW4pfUBki+tFizpm2QEMHwxz+M8W1F1fpkiTEeeIFkGfy1F0w7jdxEThIWB
	c0pAR1hnsidbN+FTIueQf9RSj4pWTqicwzquhV42cQusr/E/p9h26h8D/7pAqAgkFKhZRuR6xhemk
	Vm4XRhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvGT-002HJA-8l; Fri, 19 Aug 2022 06:13:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOvEf-002FEi-SC; Fri, 19 Aug 2022 06:12:05 +0000
X-UUID: b72e4115fdb94ecd90078e9e29b39ed1-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5J4zWTa6k2OYUdXIUN/pzfZteKeSataU/oZwLNCWEBQ=;
	b=EyfTVigE+FptaXUt5PwKAWB4VrN9tUEDDSfLVCdCGuII6dGnWWXz8alK/UBRfuYvFJTYnouTwoje+Dbh3WB2/8qTvcG++p2cFEJpqGW9U2gzwineS0dFhJckJm2+dCGUF1sgmhRBQBEXd2qsBP16KMy8Hs70AQxIAMsB9d5STIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:763f6773-8722-4cca-9dde-58dc21c13265,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9df5c3fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b72e4115fdb94ecd90078e9e29b39ed1-20220818
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1008516264; Thu, 18 Aug 2022 23:11:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 14:10:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 14:10:14 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v26 06/10] soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195 vdosys1
Date: Fri, 19 Aug 2022 14:10:07 +0800
Message-ID: <20220819061011.7672-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220819061011.7672-1-nancy.lin@mediatek.com>
References: <20220819061011.7672-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_231201_995898_0015E1CE 
X-CRM114-Status: GOOD (  19.53  )
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

Add cmdq support for mtk-mmsys config API.
The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.

If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. The first command in the packet is "wait stream done",
and then following with all the HW settings. After the cmdq packet is
flush to GCE HW. The GCE waits for the "stream done event" to coming
and then starts flushing all the HW settings. This can guarantee all
the settings flush in the same vblanking.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 54 +++++++++++++++++++-------
 include/linux/soc/mediatek/mtk-mmsys.h | 15 +++++--
 2 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 48d5e5d1d0a1..999be064103b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -178,6 +178,7 @@ struct mtk_mmsys {
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
 	phys_addr_t io_start;
+	struct cmdq_client_reg cmdq_base;
 };
 
 static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
@@ -192,10 +193,24 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
 	return -EINVAL;
 }
 
-static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	u32 tmp;
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_pkt) {
+		if (mmsys->cmdq_base.size == 0) {
+			pr_err("mmsys lose gce property, failed to update mmsys bits with cmdq");
+			return;
+		}
+		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+				    mmsys->cmdq_base.offset + offset, val,
+				    mask);
+		return;
+	}
+#endif
+
 	tmp = readl_relaxed(mmsys->regs + offset);
 	tmp = (tmp & ~mask) | val;
 	writel_relaxed(tmp, mmsys->regs + offset);
@@ -212,7 +227,7 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
-					      routes[i].val);
+					      routes[i].val, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -226,42 +241,45 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
-			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
+			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
-			      ~0, height << 16 | width);
+			      ~0, height << 16 | width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
 
-void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
+			   struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
-			      be_height << 16 | be_width);
+			      be_height << 16 | be_width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth)
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
-			      alpha << 16 | alpha);
+			      alpha << 16 | alpha, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
-			      alpha_sel << (19 + idx));
+			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
+			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      BIT(4), channel_swap << 4);
+			      BIT(4), channel_swap << 4, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
 
@@ -274,9 +292,9 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 	spin_lock_irqsave(&mmsys->lock, flags);
 
 	if (assert)
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0, NULL);
 	else
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id), NULL);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -366,6 +384,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		mmsys->data = match_data->drv_data[0];
 	}
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+#endif
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 74aab1fc570d..343e093f0fc3 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -6,6 +6,10 @@
 #ifndef __MTK_MMSYS_H
 #define __MTK_MMSYS_H
 
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
 enum mtk_ddp_comp_id;
 struct device;
 
@@ -74,13 +78,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
+				  int height, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
+			   struct cmdq_pkt *cmdq_pkt);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth);
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt);
 
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


