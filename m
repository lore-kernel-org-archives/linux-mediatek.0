Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665B9C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3139D2075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aesxnidm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="THDwiafz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3139D2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pz1AYDFB3Gdcm6dd0ynidB4ZVzmaB6jtz2qlayTrSZY=; b=aesxnidm8NHGqdimzP6mvN0go
	lAbZJMWUUHRE0s29UNO8Bqa4hj5RzqK31FE/MgkrpHhSi2YrgKW5/EMSZeXv60LE9PASXJ2HM8g/D
	vFLDBJademSXyMrqhKOg4xEAGwqYmmI97RUfXXhzxchJZzj7+4UHuLfiTEVxQGMqJKrd0IB0Ddp1r
	ZQ3KLRZmZWH37fsWY8aUNYDaRGGuMIPz8idCIllHQXPA4buMSq32nXW7VGH2xVrWLPspoRGlrZHmc
	cWHUuoUgjljVNzw3T2Ww1lSCbheAys++poVU/LjDqFWLRBPCohEFrd5hLAK8vK39fuxHTloirWy7n
	viTUgIBfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dtl-0000ba-4a; Thu, 20 Aug 2020 06:18:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drd-0007vz-Tj; Thu, 20 Aug 2020 06:16:09 +0000
X-UUID: 99f4463d7ae94ac5aca32c5ff541b2d7-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=81cl5lR8q9Xp2cMEda341JaElbb5a2VFUjfbX8XXRgM=; 
 b=THDwiafzM4oq6IttWxZzY6AUed3hl7v9JA8b1U58vOx8YZzm3zPFgKkbypdDXFBZgRw5rz+id9C7H+iCTFWAu9Sedt/XpWpvjugoeNcZ2OWxM/ydHP+tmL47T0T/+aeNxFP77zBfE0lRKfn93tJ4JGTv6+EV7xdm2RvslNwFpCw=;
X-UUID: 99f4463d7ae94ac5aca32c5ff541b2d7-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 805294627; Wed, 19 Aug 2020 22:15:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:46 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 15/21] drm/mediatek: add color bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:12 +0800
Message-ID: <1597903458-8055-16-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021554_177993_B106609A 
X-CRM114-Status: GOOD (  16.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add color bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 31918fa..83b075a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -17,6 +17,8 @@
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
 #define DISP_COLOR_START_MT8173			0x0c00
+#define DISP_COLOR_SHADOW_CTRL			0x0cb0
+#define COLOR_BYPASS_SHADOW				BIT(0)
 #define DISP_COLOR_START(comp)			((comp)->data->color_offset)
 #define DISP_COLOR_WIDTH(comp)			(DISP_COLOR_START(comp) + 0x50)
 #define DISP_COLOR_HEIGHT(comp)			(DISP_COLOR_START(comp) + 0x54)
@@ -26,6 +28,7 @@
 
 struct mtk_disp_color_data {
 	unsigned int color_offset;
+	bool has_shadow;
 };
 
 /**
@@ -63,9 +66,21 @@ static void mtk_color_start(struct mtk_ddp_comp *comp)
 	writel(0x1, comp->regs + DISP_COLOR_START(color));
 }
 
+static void mtk_color_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	struct mtk_disp_color *color = comp_to_color(comp);
+
+	if (color->data->has_shadow) {
+		mtk_ddp_write_mask(NULL, COLOR_BYPASS_SHADOW, comp,
+				   DISP_COLOR_SHADOW_CTRL,
+				   COLOR_BYPASS_SHADOW);
+	}
+}
+
 static const struct mtk_ddp_comp_funcs mtk_disp_color_funcs = {
 	.config = mtk_color_config,
 	.start = mtk_color_start,
+	.bypass_shadow = mtk_color_bypass_shadow,
 };
 
 static int mtk_disp_color_bind(struct device *dev, struct device *master,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
