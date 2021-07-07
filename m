Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9095FC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DEE060FDC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DEE060FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3OMzt4n+dxqVHrqvPQTAVe6MSz+Qs2Q1HEey2yvyNQ=; b=rE7byxRLjO7nsy
	OJJGl9BOy8ddWsGc/6bm1elBTfjVXNTnx0WQtGAqlbB1gnBVaRrvQazV5QbVLZgcFyUs10krU2TG9
	rgdhTjJuR9w+0+fhGofuGCPAG+Oaeq9/truAAyFdZWTovvboMishLc8bMoJJ3zS+9963LYQDH4ZQy
	dlVmlLpwVQl/nf8ns+GrnxidaGDSusVPEjzQVmNho4QRBuG5AkNdZJjNR2kzBGSMngLj7YXCRHH8a
	LPjJv2Ed2w4Mt0ReiX5Z7JTxxSpmHMTla46avo3OE1mYroQufoxMoEkHiISKPCi5joml0J1kmAdkl
	zDpOrBLE+mDrDGk342DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0yxc-00DJdG-GF; Wed, 07 Jul 2021 04:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0yvx-00DIt5-7u; Wed, 07 Jul 2021 04:13:15 +0000
X-UUID: 7595a55e505f484cb0384e5192bdf0d2-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lPaEZBoseFBoAinytl2riGpurUNvvvghzYKMeHziuG0=; 
 b=fkAyPovIINk4hul5Kh8KSjsuZnFGVQPjxJ9KiGU3NBofAm+kFnOGRHFEz1RZ50JjqScLv0PRhmg8UU/3yPnQ34gLQbycaTwNadTG1VCzUiw4QQUeKVt7uWW7yxLEeSdAOJnTJBr+u5+auTC1FemDO7zc8T5zCkVq7tOs/eiGf0s=;
X-UUID: 7595a55e505f484cb0384e5192bdf0d2-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1545184732; Tue, 06 Jul 2021 21:13:01 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:12:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 13/17] drm/mediatek: Add AAL support for MT8195
Date: Wed, 7 Jul 2021 12:12:45 +0800
Message-ID: <20210707041249.29816-14-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_211313_336760_8284A21C 
X-CRM114-Status: GOOD (  12.24  )
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

1. Add AAL support for MT8195.
2. Add AAL_OUTPUT_SIZE configuration.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 8 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 75bc00e17fc4..f154f7c0cd11 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -34,6 +34,7 @@
 
 #define DISP_AAL_EN				0x0000
 #define DISP_AAL_SIZE				0x0030
+#define DISP_AAL_OUTPUT_SIZE			0x04d8
 
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
@@ -196,7 +197,12 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h,
+				&priv->cmdq_reg, priv->regs,
+				DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h,
+				&priv->cmdq_reg, priv->regs,
+				DISP_AAL_OUTPUT_SIZE);
 }
 
 static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 058b50d0e64b..459bb1e53f2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -450,6 +450,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8195-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
