Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E213C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:22:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF96F61350
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF96F61350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FJ6Ukwqh0XIDiHYZG3hkrjY5XZ0jrPpJsiRRz0/5zHQ=; b=ZxYO4TyE6izLYNm7Rwfwio/m5
	RYICq0xIyeNL+iSKwJiuALY3IzTS//bwG2RfjmFC9gQK6HDDD0nND42DMbmgUKZbw7K12JBjwywxs
	mxQ3/kwvPF81B2vK+3Ct2BDudoFP/h10U75godvwRTWCwkg5H8PF/nRXGjnnwgghyUwaseJgqpzCZ
	Vc72d2KheJWtnnXl3rP1dTRnl7S/jIJh11222/x2NTB17Yhc6Vieo31PWWR45xhMXOAYzymN/GY38
	VzNxndvZwccwKrrDPwQrOBedZBYSWeQvQbjfx2H9V2qb7lN3LaOXGAiwT+b6OjtRvtkhq2LzABTon
	zKWLPpCrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxSN-006x6l-K2; Mon, 12 Apr 2021 14:22:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRx-006x3b-By; Mon, 12 Apr 2021 14:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=rD6lTSe95v07XH3Pb+PkJZ6S9/B8qxnWwwayNlO0h9w=; b=BV9tjM3zsoOlP5syrS9i3KH6ZP
 qfMSXksmJk8lGwXcoGbcK+VUpxeV5XmtwRIXx9HnHD/ts9qh/xZVlphnsmrcBNZ9W3GZXfoeCbOy/
 JpxCszEPcG+d4RxnCTHdRrtXqAXDQDlk7A1qAW2IVfA1y5O4xmY2TVVZ4shNwLMFTzLXhTtL1nTM3
 jLvL2JWi4R8bHrg/5EgjfPkaD1yXZl3Iipq3E/364II4kEsEiOBE9qSj4P/DuXYUb33yCuNz474Ne
 UHcPFyZN7sNsvWn25AYRcOZIadDgb8kp41lRDIts5buKbHhEPY1TmrQCSmmt9uzA44H0moJlxXm20
 ep2t9FFg==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxRt-006IjA-3t; Mon, 12 Apr 2021 14:21:59 +0000
X-UUID: 6262928d1fc14c0788e823d05a16a517-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rD6lTSe95v07XH3Pb+PkJZ6S9/B8qxnWwwayNlO0h9w=; 
 b=jI23BhRFFESNE9rGY/+czNxXuRyF5f6Ukqfax8oakNaIV4eZehmEs7RJfUFbdO/ENim4kuj0s0lsYpcLTn0tV6bssY7U1vZMzJDeinvuV/Uj34VejYHeJ7ajsaDk/m2EjRsASkcjmfX4A5y3v8fRU7hat/0QctIeG0XXMN9LvAo=;
X-UUID: 6262928d1fc14c0788e823d05a16a517-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1663483883; Mon, 12 Apr 2021 07:21:53 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:21:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:21:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:21:48 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v7, 1/5] drm/mediatek: add component OVL_2L2
Date: Mon, 12 Apr 2021 22:21:42 +0800
Message-ID: <1618237306-17670-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618237306-17670-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618237306-17670-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_072157_196139_674A2ADD 
X-CRM114-Status: GOOD (  11.06  )
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

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 75bc00e..b564513 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -385,6 +385,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
