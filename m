Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B0C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QHOBR3x997bq7GuWmY4eZqnLP1TPNmd0eMe+1ENCkk=; b=u5WbWVJKUgv6X1oqaFbKqhJlTi
	jF/JqrUFyN88/fSIxtBtOs2YRYX/AXir0/W1VhKgTfB9vIyEgcVJFOMa00LWsECM7/d8/GTFClxcM
	p+aQfd37BzW7dxlsVy/YfWxygE5F2w+FZePeoG8+sdC0Ol2wjEnStuaNQeFZtdjEquKZKnhwnyTGB
	M2+KRV37zfdpDSY+R//4VBQ96NkUxtU5VMLcazdPAOWq/Zrdd6zjUKNlnKFX9NQHyDGU6hF8jS4Gp
	1EIL9PI6uMQctR50eOrqxY2iy6SOgTPbFWD9+XaXvdQwK9rXRXkvRDYaXammxIpLm4zx4MZvtH7m2
	LpzG0i4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYS5-000000060wn-2lgO;
	Fri, 22 Mar 2024 06:32:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSM-00000005qQ3-29yT;
	Fri, 22 Mar 2024 05:28:47 +0000
X-UUID: 0897749ce80d11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7QHOBR3x997bq7GuWmY4eZqnLP1TPNmd0eMe+1ENCkk=;
	b=eBnSzvDpqWQB14T/Nalr+P7Rh6oJvIIBE24CZKrKv4TWXNVjKT5UUlHrIxALExllQc3XqpoZT81WWHEgOZRiObfvUbIjqzvnKQ4dRJiPl5EZ4felfdv2keKlQuYHYEGl1Kv1MubisTM4FVknqvddqojf5g8i2ls5ymOvjmKdGv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c76565f1-5bbe-4a20-bc64-ae131ca78ad4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:c8cb4c85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0897749ce80d11ee9aa9374d6d45775a-20240321
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1416675576; Thu, 21 Mar 2024 22:28:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:32 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 14/14] drm/mediatek: Support CRC in OVL adaptor
Date: Fri, 22 Mar 2024 13:28:29 +0800
Message-ID: <20240322052829.9893-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322052829.9893-1-shawn.sung@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.980900-8.000000
X-TMASE-MatchedRID: FdGr4ZiGaEm/gdQC9NfM37dQIb8hCnY+Xru95hSuhjTi7ECA5q90ucCS
	2AMm1nQCbjMOm8SwCSYRNd8KRmWUzeVM9fuANPF9A9lly13c/gEraL2mh8ZVKwqiCYa6w8tv7fK
	xaM2xqkB3h9ijPpALVnm3rlWwtGYxgZi/ORh+nqAMH4SsGvRsA66JG5H2YJq6u6qThyrnanOuvq
	nb77eCoD2ixCH7D+gZqYdJomSPWScR3RjJbq0tuRIRh9wkXSlFfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTteLhcSg9d5zHs+KOLzCLdqD8m0bof1K6cOm2WQ3zZszeJ0xsEvoeCdg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.980900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E7EDFD187C6AB98E283390F8E9E9CEF19D458D3CC50B512E6E3F943B9334ADBF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222842_833700_4DDB5EB8 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

We choose Mixer as CRC generator in OVL adaptor since
its frame done event will trigger vblanks, we can know
when is safe to retrieve CRC of the frame.

In OVL adaptor, there's no image procession after Mixer,
unlike the OVL in VDOSYS0, Mixer's CRC will include all
the effects that are applied to the frame.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  3 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 21 +++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 61 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  5 ++
 5 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index cb71effda9c2a..8aab373ce67c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -406,6 +406,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
+	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
+	.crc_entry = mtk_ovl_adaptor_crc_entry,
+	.crc_read = mtk_ovl_adaptor_crc_read,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
 	.layer_nr = mtk_ovl_adaptor_layer_nr,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c476056a5cbb5..24af08b1c86d6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -138,6 +138,9 @@ const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
 enum drm_mode_status mtk_ovl_adaptor_mode_valid(struct device *dev,
 						const struct drm_display_mode *mode);
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev);
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev);
+void mtk_ovl_adaptor_crc_read(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 494f7bf4a7881..9c5e565e6ef92 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -207,6 +207,27 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
 }
 
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_cnt(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_entry(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+void mtk_ovl_adaptor_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_crc_read(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 951e3e82a6a1a..52caf75052d98 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -24,6 +24,9 @@
 #define MIX_FME_CPL_INTEN			BIT(1)
 #define MIX_INTSTA			0x8
 #define MIX_EN				0xc
+#define MIX_TRIG			0x10
+#define MIX_TRIG_CRC_EN				BIT(8)
+#define MIX_TRIG_CRC_RST			BIT(9)
 #define MIX_RST				0x14
 #define MIX_ROI_SIZE			0x18
 #define MIX_DATAPATH_CON		0x1c
@@ -39,6 +42,11 @@
 #define PREMULTI_SOURCE				(3 << 12)
 #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
 #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
+
+/* CRC register offsets for odd and even lines */
+#define MIX_CRC_ODD			0x110
+#define MIX_CRC_EVEN			0x114
+
 #define MIX_FUNC_DCM0			0x120
 #define MIX_FUNC_DCM1			0x124
 #define MIX_FUNC_DCM_ENABLE			0xffffffff
@@ -82,6 +90,7 @@ struct mtk_ethdr {
 	void			*vblank_cb_data;
 	int			irq;
 	struct reset_control	*reset_ctl;
+	struct mtk_crtc_crc	crc;
 };
 
 static const char * const ethdr_clk_str[] = {
@@ -100,6 +109,32 @@ static const char * const ethdr_clk_str[] = {
 	"vdo_be_async",
 };
 
+static const u32 ethdr_crc_ofs[] = {
+	MIX_CRC_ODD,
+	MIX_CRC_EVEN,
+};
+
+size_t mtk_ethdr_crc_cnt(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.cnt;
+}
+
+u32 *mtk_ethdr_crc_entry(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.va;
+}
+
+void mtk_ethdr_crc_read(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_crtc_read_crc(&priv->crc, priv->ethdr_comp[ETHDR_MIXER].regs);
+}
+
 void mtk_ethdr_register_vblank_cb(struct device *dev,
 				  void (*vblank_cb)(void *),
 				  void *vblank_cb_data)
@@ -256,6 +291,13 @@ void mtk_ethdr_start(struct device *dev)
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
 	writel(1, mixer->regs + MIX_EN);
+
+	if (priv->crc.cnt) {
+		writel(MIX_TRIG_CRC_EN, mixer->regs + MIX_TRIG);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		mtk_crtc_start_crc_cmdq(&priv->crc);
+#endif
+	}
 }
 
 void mtk_ethdr_stop(struct device *dev)
@@ -263,6 +305,9 @@ void mtk_ethdr_stop(struct device *dev)
 	struct mtk_ethdr *priv = dev_get_drvdata(dev);
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc_stop_crc_cmdq(&priv->crc);
+#endif
 	writel(0, mixer->regs + MIX_EN);
 	writel(1, mixer->regs + MIX_RST);
 	reset_control_reset(priv->reset_ctl);
@@ -317,6 +362,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	mtk_crtc_init_crc(&priv->crc, ethdr_crc_ofs, ARRAY_SIZE(ethdr_crc_ofs),
+			  MIX_TRIG, MIX_TRIG_CRC_RST);
+
 	for (i = 0; i < ETHDR_ID_MAX; i++) {
 		priv->ethdr_comp[i].dev = dev;
 		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
@@ -325,6 +373,16 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 					      &priv->ethdr_comp[i].cmdq_base, i);
 		if (ret)
 			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+
+		if (i == ETHDR_MIXER) {
+			if (of_property_read_u32_index(dev->of_node,
+						       "mediatek,gce-events", i,
+						       &priv->crc.cmdq_event)) {
+				dev_warn(dev, "failed to get gce-events for crc\n");
+			}
+			priv->crc.cmdq_reg = &priv->ethdr_comp[i].cmdq_base;
+			mtk_crtc_create_crc_cmdq(dev, &priv->crc);
+		}
 #endif
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
@@ -365,6 +423,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 
 static int mtk_ethdr_remove(struct platform_device *pdev)
 {
+	struct mtk_ethdr *priv = dev_get_drvdata(&pdev->dev);
+
+	mtk_crtc_destroy_crc(&priv->crc);
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
index 81af9edea3f74..d17d7256bd120 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.h
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
@@ -22,4 +22,9 @@ void mtk_ethdr_register_vblank_cb(struct device *dev,
 void mtk_ethdr_unregister_vblank_cb(struct device *dev);
 void mtk_ethdr_enable_vblank(struct device *dev);
 void mtk_ethdr_disable_vblank(struct device *dev);
+
+size_t mtk_ethdr_crc_cnt(struct device *dev);
+u32 *mtk_ethdr_crc_entry(struct device *dev);
+void mtk_ethdr_crc_read(struct device *dev);
+
 #endif
-- 
2.18.0


