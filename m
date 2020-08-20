Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D67C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B083F2075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrRkGUUE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l9h582S3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B083F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tttk7JbW+6mRty9zDJ+CBC6Lvg7+zWMqXwCZUSdB/CY=; b=hrRkGUUErKV7VuuuRYkCxTef2
	56LWIxzy1hrDuEfS4OSqV+KYmEHVsnKifG8SkfmYjBeeBZdJOkWVH5QH7ajpIVc6MbTANncfoIfDh
	K0VhnLzMms8u0jNsyhukWjWJV4k6FEnPU34f2d0dQVN+zBpw67LDutCikJ6UpRAA12SOSd479/gEZ
	30UWIs48jpViu8fs8xp7S2drqRoUpsXRBYcydmdnB56/X2kNUg2ZKVacivqwUGxAyEvqJw8J0J7Cz
	b985iiOtnIpcSxHeij7nYhq2AOAXL3yNnxMeBkr+207doMGHybuv58Knr8q3iwPm2yb74RTgtug9u
	/n1SoOhOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8drj-00083t-Ry; Thu, 20 Aug 2020 06:15:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drS-0007vu-Mw; Thu, 20 Aug 2020 06:15:43 +0000
X-UUID: aedf130d84814ce3aee28b8a30b4e741-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ldbB1FMWbsV9yN9EbgJIgNPCJqsEbBR2TEb+4qx1VRU=; 
 b=l9h582S32TZ1ZhOwID2+WCdezsLtmioVKUAQLkfU+MHOsQmxo4rIUgTPnKaSk91o/hyHNBbT69RqBl+D3se6IJLepfhFm/qDaplOdfFp+2PvY6UwTZAWsYU7ldtgkm2uTDySKsDXGjfJFhez5+L5pytbJn0pRUUMnoTRUMqmxVE=;
X-UUID: aedf130d84814ce3aee28b8a30b4e741-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1115323332; Wed, 19 Aug 2020 22:15:38 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:57 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:56 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 19/21] drm/mediatek: add aal bypass shadow register function
Date: Thu, 20 Aug 2020 14:04:16 +0800
Message-ID: <1597903458-8055-20-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021542_897645_5D0A5CDF 
X-CRM114-Status: GOOD (  15.64  )
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

add aal bypass shadow register function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 315bd3a..b4a6df5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -38,7 +38,8 @@
 #define AAL_RELAY_MODE					BIT(0)
 #define AAL_ENGINE_EN					BIT(1)
 #define DISP_AAL_SIZE				0x0030
-
+#define DISP_AAL_SHADOW_CTRL			0x00f0
+#define AAL_BYPASS_SHADOW				BIT(0)
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
 
 #define DISP_CCORR_EN				0x0000
@@ -207,6 +208,13 @@ static void mtk_aal_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_AAL_EN);
 }
 
+static void mtk_aal_bypass_shadow(struct mtk_ddp_comp *comp)
+{
+	mtk_ddp_write_mask(NULL, AAL_BYPASS_SHADOW, comp,
+			   DISP_AAL_SHADOW_CTRL,
+			   AAL_BYPASS_SHADOW);
+}
+
 static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -365,6 +373,7 @@ static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
 	.stop = mtk_aal_stop,
+	.bypass_shadow = mtk_aal_bypass_shadow,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ccorr = {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
