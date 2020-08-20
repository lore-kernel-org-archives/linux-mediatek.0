Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DA1C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926362075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aO6JvnQo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZBeNSOvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926362075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RqOlSsSnQcGWEHQWQ+a4ei3wUc2jaXJBK3qL4xTNXMU=; b=aO6JvnQoNE/1ySO4KdOn4r1gt
	8seWEdrfwsIEiBdYnBp4y0poIeqheQtzdFGgs+sH49+P5dkE5uKNYJrrhHAQZZWOPthVwfXZ2OJGV
	yytzJ7jty2rjeM/cGRuhclR036Qg3h0n+l6WTn975FH8/hGpCU4DVd88rlKwgyMLPH1FukdBvoRmT
	7pX8Ftc2JHQyNR2nvwhEAhMMC/7HompHPDDtw9/rlw5tgUl8HZp2YvrHvcyBWt5EYhDz+mfy3wLeJ
	NVeDRm/ECjmYk+oPoPj9CiZ3SS27FxxSSIBpoh9Rlglb+lIMawj/g69nYq+kbZP/h8VrOt2VxAv7V
	rg9Zy7C5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dtY-0000Qa-Na; Thu, 20 Aug 2020 06:17:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drd-00081Z-Je; Thu, 20 Aug 2020 06:16:01 +0000
X-UUID: aff2ad5c8b144593aedfa3ef54780f30-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2KcvHK1Jr9oJkknwRko3J/Skm+3J8NuMuW2fpqtgTDE=; 
 b=ZBeNSOvdbyFdD63D2ZXJxiawTCj6lAV5GZWv4DPmLcWFH5ZwRyb9Q+uifIqETQLqkN1FmU2ys9hOdZ1tHHkRv978CdP+gp2rT7YuudIHNTMkmdp3pMkNiU4IUbIonHAM8RVWGSN0eiLsD5+JOW3XCaVl15ayqzZ0PadU25xXU/I=;
X-UUID: aff2ad5c8b144593aedfa3ef54780f30-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1547247250; Wed, 19 Aug 2020 22:15:48 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:06:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:57 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 20/21] drm/mediatek: add ccorr bypass shadow register
 function
Date: Thu, 20 Aug 2020 14:04:17 +0800
Message-ID: <1597903458-8055-21-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021553_883674_0F8255FA 
X-CRM114-Status: GOOD (  15.31  )
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

add ccorr bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b4a6df5..ff23a94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -55,6 +55,8 @@
 #define DISP_CCORR_COEF_2			0x0088
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
+#define DISP_CCORR_SHADOW			0x00A0
+#define CCORR_BYPASS_SHADOW				BIT(2)
 
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
@@ -284,6 +286,13 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		      comp, DISP_CCORR_COEF_4);
 }
 
+static void mtk_ccorr_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	mtk_ddp_write_mask(NULL, CCORR_BYPASS_SHADOW, comp,
+			   DISP_CCORR_SHADOW,
+			   CCORR_BYPASS_SHADOW);
+}
+
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -381,6 +390,7 @@ static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
 	.ctm_set = mtk_ccorr_ctm_set,
+	.bypass_shadow = mtk_ccorr_bypass_shadow
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dither = {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
