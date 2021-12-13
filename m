Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54ACC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjA5xTFf3XpJlrM+3EtyyYluhbHOVsY81noVOjFS/Uo=; b=NxV2bp1Ro1XN1n
	ubM0Fcsmf2yXKzo5pydx1ss9G2ZN3n/bk5xkeFqJXtUmxDYvk9/kOsfnPdO1qGvWTUijjownlLagM
	pVjYZ0JPo6RFjChr9J5HSGODKoWdmsqCIk4Nn2RbrZcHajFeu2+lKQJfxLcWxa2V6vefkqVE58Imx
	o9RYHoaERE18Z3NRkB0rqtQlib2Oic6SKAcZkmdLLx1GpyRwXz7VEUtlQOw4SPcl1+Gkpd2w2XWuj
	/lyNPVkptyhqOtvLykKdx0Q6oY/LJsJqK4uyrI/7YIao4IEJBz8efrb+ZVRREQsp3Th85/RkBtv/9
	gFT++gr5Zhjoe3+6GvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwnsF-00AV66-MK; Mon, 13 Dec 2021 16:08:23 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwns2-00AV2W-OE
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:08:12 +0000
Received: by mail-qk1-x735.google.com with SMTP id t6so14340170qkg.1
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VPAU6dvYOzvsB1kyIfMQv3U9XrNMQlDiY7WbCBmBes=;
 b=aqwHs4+TE4DLSYVktWLA8eauGvZ1M5mb9cmFWB9dGS9HT8aI1sizuWcY2hhiH7yN1Z
 XBwpxbiE3gKBaxK02sOgWhToQa1yxkGCGb/WDUCYGP+Ps0LA4n9syrEqUWRfEUJxFyIM
 e17dClHwtHeJwNhWM6uak6lwCn+LwuB3upWF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VPAU6dvYOzvsB1kyIfMQv3U9XrNMQlDiY7WbCBmBes=;
 b=ll5I7Gk7ZrhZH8R9LU8eNlMo6C2wtmIlIplKFkcMSuV1lnMl9xQMzghWleykXEAq2e
 Rl2YYfikJLQQoWo9q6yTUMI3k+5e8vGMnUsHVkvLhVLt4+HKdzF8O4wLPwdvIw6JMzWK
 pzJOrUprRm7nR8hcMXFF3KtVFeprALduIMq09ZIMPqoAiCR9NQtz7LoC0gynbPelcNRu
 kYQIzKwmzWGi07GVIXnOovl/EcDivJU67SpEq9fisQ9pIZm4TUh68J3lfnbOb7nPQmLu
 jLfb6au6iiqiGESG/5XV4Lfhjy+tEQB/wUIcdfqkTpKS0h25pfB9BeXKpPC4RpPPEret
 aoXg==
X-Gm-Message-State: AOAM5333k1fkovthf0TxQdZR/Taxx1/ilBbiLt5q0UtgeSzU17HX9h8e
 CszHxyxyl3VSRmaqINaHiHbRA/SykCETsw==
X-Google-Smtp-Source: ABdhPJwVk+NpCyiYqBuxb8qXr1TTL8u2eezR/uX5Vhpcpw+L1CidoZGT5Lo5wmw1ZpnAXNALFjKJ1Q==
X-Received: by 2002:a37:a411:: with SMTP id n17mr33513759qke.722.1639411678428; 
 Mon, 13 Dec 2021 08:07:58 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:435a:1eff:4bc4:107d])
 by smtp.gmail.com with ESMTPSA id d23sm6054390qkl.70.2021.12.13.08.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:07:57 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, tzungbi@google.com,
 Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
Date: Mon, 13 Dec 2021 11:07:22 -0500
Message-Id: <20211213160742.744333-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211027162806.2014022-1-markyacoub@chromium.org>
References: <20211027162806.2014022-1-markyacoub@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_080810_794407_9CBDB14A 
X-CRM114-Status: GOOD (  10.89  )
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
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
