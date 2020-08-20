Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA6AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E602075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STRZtzFo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UZVHc8Ud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E602075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYA5/V4lBRhWJMlLD28ntO88jR2ULTENDsOQQpmoWpo=; b=STRZtzFoNFh360Rr/A+/EUHpc
	ox2yivc6Lhz/M5fUoklpJWXSv0q0AES6/t4WhZgicU4s1RB1KORk2aplENiXLGVCmUnPBbSmrYN9H
	46Ou7Jmq0y6swLt4/rSywe+0xtmucT0FnpVMtZbUBfzsQnjXKFcEQRzgXdKc5RpRq5LqzMUETIIzd
	UZeKjssRsmNonK/2YE7yFu38jtqU6uZebejLTjPHz7sq5YLWLN/hwGSdO4AeqtaMxL1xLpUffBBV5
	huxE5i2TYog2XjvQF+jhDpfebaMx17It1ntL9aVLN52G2IWLWwsu4EA8ihJr6knIpMOw0oTIwRU9a
	ahfgUjpZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dte-0000Up-I1; Thu, 20 Aug 2020 06:17:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drd-00081k-Je; Thu, 20 Aug 2020 06:16:05 +0000
X-UUID: 369bb9fc7925428aa90f8cbe9665eb88-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CYF0YG4gNVrjrfJ9U+B9+/FbeQsInObr+OBTOYnxpFo=; 
 b=UZVHc8UdE1sltNMo3ZCgmO3KcVSKi9jNwLOOCzpHVxgXau0qaJZWmMBc1fGHb4AXhASWbKlpO2oX4FrBJoNSG5FBZ+NtVgdDtlcilfbCmDJX0InT+YFD+6IhmDTI6JSmGrIJbsLKhLoWxflpb/22L4eJGfWKkoTaRTUtu6Plp4E=;
X-UUID: 369bb9fc7925428aa90f8cbe9665eb88-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 152239882; Wed, 19 Aug 2020 22:15:48 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:46 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:45 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 14/21] drm/mediatek: add bypass shadow register function
 call for ddp component
Date: Thu, 20 Aug 2020 14:04:11 +0800
Message-ID: <1597903458-8055-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021553_909564_D4BACF86 
X-CRM114-Status: GOOD (  16.15  )
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

the shadow register for mt8192 ddp component is enable,
we need disable it before enable ddp component

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 3 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index fe46c4b..16e9b88 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -299,6 +299,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		goto err_mutex_unprepare;
 	}
 
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
+		mtk_ddp_comp_bypass_shadow(mtk_crtc->ddp_comp[i]);
+
 	DRM_DEBUG_DRIVER("mediatek_ddp_ddp_path_setup\n");
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
 		mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ae11b46..1f25705 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -45,6 +45,7 @@ struct mtk_ddp_comp_funcs {
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 	void (*start)(struct mtk_ddp_comp *comp);
 	void (*stop)(struct mtk_ddp_comp *comp);
+	void (*bypass_shadow)(struct mtk_ddp_comp *comp);
 	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
 	void (*disable_vblank)(struct mtk_ddp_comp *comp);
 	unsigned int (*supported_rotations)(struct mtk_ddp_comp *comp);
@@ -169,6 +170,12 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 		comp->funcs->ctm_set(comp, state);
 }
 
+static inline void mtk_ddp_comp_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->bypass_shadow)
+		comp->funcs->bypass_shadow(comp);
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
