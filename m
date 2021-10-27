Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67C6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 16:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706A360EB4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 16:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 706A360EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3HXBU6mp09i37J6yIxhGUTC9DnXFDfFGbPcTZS4rRWo=; b=htzwdEfzRTSvGK
	XhqF+/fkcr0rhhww/6N01bq8kfHDc52AZb1FQQxOM9t1hInjcTbykg3vwuS2ota6Izo3M4EbXqI+8
	m1M+4Vvv46sMJzvHFhd/D9cyfk5zTKcX+JKc+8HTQZJx3KS1HVB0Fl2evDjx/Ge0edTWrmHPkXKWT
	33zigkC64xluabu/keHh77BRnW2tNQrYg3nCoevii17quDKue/XFpBC93oRdSkpG9y1oPXUcsgL1n
	2WFCilNH/TVWNXA8c37FRwI+KUCipkWcIa87FQozMrBBdB9bj5n73hPC9HOCEmcppd3HJowV/hJQF
	20IZnXM0IGW2XDoTE4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflmj-005TWx-1d; Wed, 27 Oct 2021 16:28:17 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflmg-005TWE-L8
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 16:28:15 +0000
Received: by mail-qk1-x734.google.com with SMTP id bi29so2976918qkb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcaw11fIjDklEqqCtjykwfsrJvW1LW9AxQoWbgSjC4M=;
 b=Ua/sCb/y9VDGpUgeNnsC/TY1iozBS8HSs8sB4TzNnEPa+6427LOWQi6WL9uSP+9r0f
 KGOwJodnrSB2fiQhxLQFuuW8O4HKPNi3pVV1x8cV2XHk8wFzt0Z2GsjSi96dOsDPs1pd
 jAq2oO9A9mstmfyKZ9gWU7sZY5Lj5IMLSkyfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcaw11fIjDklEqqCtjykwfsrJvW1LW9AxQoWbgSjC4M=;
 b=eUQyU9H9y7/wVComVHZUGIDBcr21gxImQ5KTi1/uXYRVNNmq4HU43pHNHYA/Tlzmsw
 RbpgfwqxtQxrIGsgaZ2XkLH44jXX5E2OVsM2GFfA8Ow48lWm7inIMAYRk7qNnY0GXgcK
 Xt0NY+xf3yKO4j0MlozxOxuP6MGPw/7wcZxhUbXRVcY7q0ryf1gKsmwWpG011awsWymo
 /ZygD6sogqI+VrOQqf+PP+/JwVv/2CzDsxp7eo5Ds0mlDXbTTq6o3LrHLbqB1ug0tBvl
 vf4dnQsbZrFQ083/UT3X3GZDeU8zl1tEI5gerQjQbMZDNu5q9kuHTVS2vnrA5rfNmjcX
 tqOQ==
X-Gm-Message-State: AOAM530JKUeMJ4JHhnHSGeEOFqAvVdA0gMu4LIHvTuWaeZog1RYy8j2p
 VKCeSt+L9Lf5jMN0Fp80Q7c5oQ==
X-Google-Smtp-Source: ABdhPJzvDL/hbW8x3WlZ9XGRkGRqMyNVExMy38ru/QmkZqYlZSlc0XaIiKT5o4RWmWJvhzMO0AsrYA==
X-Received: by 2002:a05:620a:1035:: with SMTP id
 a21mr8908441qkk.354.1635352093630; 
 Wed, 27 Oct 2021 09:28:13 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:121e:94ae:f1a6:940c])
 by smtp.gmail.com with ESMTPSA id i22sm311589qkn.80.2021.10.27.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:28:13 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
Date: Wed, 27 Oct 2021 12:27:51 -0400
Message-Id: <20211027162806.2014022-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_092814_740633_B93BBEAC 
X-CRM114-Status: GOOD (  10.93  )
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

From: Mark Yacoub <markyacoub@google.com>

At the reset hook, call __drm_atomic_helper_plane_reset which is
called at the initialization of the plane and sets the default value of
rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.

Tested on Jacuzzi (MTK).
Resolves IGT@kms_properties@plane-properties-{legacy,atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index e6dcb34d30522..accd26481b9fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
 		state = kzalloc(sizeof(*state), GFP_KERNEL);
 		if (!state)
 			return;
-		plane->state = &state->base;
 	}
 
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+
 	state->base.plane = plane;
 	state->pending.format = DRM_FORMAT_RGB565;
 }
-- 
2.33.0.1079.g6e70778dc9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
