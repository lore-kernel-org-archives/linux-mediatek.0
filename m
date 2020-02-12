Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8056AC352A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 09:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563E620714
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 09:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUrT4PIg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o4z8ZeqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563E620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KJHFn6EwTfEC250sUiZ2aqcZ9k70JdXGpADvyoywD0=; b=RUrT4PIgldCn6u
	pE5DisNfYb1Xgf+B4H7NCMPszLlWY6v/+FbY5VeCwOOOtZTjJ2yBL2e5FFS+gZptKL7DTi3orsL5A
	xLNkNoORKNJSXXnwiJaj1M9TspiEvH4vrshu79UO89uSbun6d2AeJBLT0rjKDDPTe2UKqKWjjyqol
	x4SCd8VfA4U3J5yW3GmCDmt6x9AYk24NLPxIIATejiVXN1sSsOtSv7w60iLZJw6tDdkWF+puWVUAA
	7F7nij85WnL22906KK8eF6FMaC0my8MqsDVGWJZgLvZ3m2KRxs0KkdjnoiYyDOKdX6d9l/BnI4dtZ
	0uR889AHzIbqkQkHPL4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1ojr-0003bF-O0; Wed, 12 Feb 2020 09:55:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1ojj-0003TX-Qj; Wed, 12 Feb 2020 09:55:17 +0000
X-UUID: 8d4d578b7dde4484be187255f49697f2-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Vr1pHkQVOl3JW4Dfr5vCs2HYOfLXE6nj+3u5wfIpXq4=; 
 b=o4z8ZeqJWm49Rh9nJxQ30LLooRuKQ5JAS1tzIbEjKZ5cY3AOtA0CXNYqijJEXuBLLtzNm0TV7B10vpqGK0HYuzHi4f9/9LBXwZFZYidwKCRc8S8a5jrAnEdGWZg8nXRuUNEFnBMKHiU8y+vJic8iqaXxHkXkwvpU2qe1Iq8y/9E=;
X-UUID: 8d4d578b7dde4484be187255f49697f2-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 226696564; Wed, 12 Feb 2020 01:55:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 01:55:05 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 17:54:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 12 Feb 2020 17:55:10 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] drm/mediatek: move gce event property to mutex device node
Date: Wed, 12 Feb 2020 17:55:01 +0800
Message-ID: <20200212095501.12124-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
References: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_015515_874012_BA4A84F4 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According mtk hardware design, stream_done0 and stream_done1 are
generated by mutex, so we move gce event property to mutex device mode.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3c53ea22208c..8a31e5b983db 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -819,7 +819,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			drm_crtc_index(&mtk_crtc->base));
 		mtk_crtc->cmdq_client = NULL;
 	}
-	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
+	ret = of_property_read_u32_index(priv->mutex_node, "mediatek,gce-events",
 					 drm_crtc_index(&mtk_crtc->base),
 					 &mtk_crtc->cmdq_event);
 	if (ret)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
