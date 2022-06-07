Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9A5C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spmChpnkhSCMQqC7MB2zU8kBfupWNo8y9kktcYeQYBk=; b=GTkqaqo7vCJlXe
	m9cr4WjBbLREJgWsQkQ5rhS2O5zWoQ6fRAaK7/30kvZa4gQn2P2G0GDYGCeiBK/S587RpTGCEmm5b
	uKCq3tAxZibrYPb0hglmqilQRkGPqJg3rXnEiYHkXk0Ff84X9Sim9knOYOUl8X9HA2E8tO8Zdjcg/
	3raZ4+6Z5SQ98Ul46CUfUI+e0ftM4RIF1eR6aI/imUVTyiAVpVbXCMYb0OXXLQzsqHk++NJQzgNei
	8Tx9KwKzUaFlpaUNI3TifOJvXAJYpWkpfJkw+Hn+321SG+UEqx4jxWLlgEBb011wurioRHNUyXeAu
	9DjJtg9hoD2flnXfssjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVGG-0066fa-Gs; Tue, 07 Jun 2022 09:12:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVA8-00639w-D1
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id j7so15105021pjn.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FkC4wQn3+nXU7dST9FaxB+QRGREtiwsJHA3bRU8iD1Q=;
        b=KBM2BBQMMLkgUMsyR9jAjWANoeklgbSZu54h1hNjBmSk+dJ8U+LkBMOQU9IEslajqr
         IMWKVu3kPIKAiCJEzAlwxvBzAZUNCr9GzM0AXvUMoGO3F/K9fF3Irci+SpskTJtYvYsm
         XH6CtIIBAipgd4VblS3HvTpbYCYgpm9EN69YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkC4wQn3+nXU7dST9FaxB+QRGREtiwsJHA3bRU8iD1Q=;
        b=xHHTmYYqNtjO8mpdj/TgpF3vAU+q1pUnlZoerrfguc1lL8QMkWnGbxWTyLK8zYkwEJ
         8M1L44fhGif0K0D6BfPHSPdz3YZjzAvpTxh15UKxHxICJkg0JbosBs/Lmk8/4xM/HkC9
         R0exk/YMwRxQ/tNi+42uv5i5tZX9gV2Kw72I0CdMDBnkNbPK5d6geBL/Qj87HU/Uw6D/
         UhUAEj8KJuZcuX5DlNVxcT5DRf3/4UX97ufHGOM2nZXpNvZUM6QYT4E14rX7VAIJtYL8
         DOkx92xqO/Js+sExj2DPHXYq6dh3jHraUoTDVY7i9zPLlggswrmgs38ccVneb8YcmfEU
         abCw==
X-Gm-Message-State: AOAM532x6JGQa8xg087gF5txwTuzl9VN0LY9xZvvgrdM6H4Sxp7WOe9M
	p3utit7n29eeXVKwpGwrgcknGA==
X-Google-Smtp-Source: ABdhPJxtMveNapxOscHpOj1UN38se05kULc+7JDGp1azNMKPpid/CV/xKFokwk5MP3Wyrs0aUn69hA==
X-Received: by 2002:a17:902:6a85:b0:163:d764:e1a9 with SMTP id n5-20020a1709026a8500b00163d764e1a9mr28522297plk.50.1654592762305;
        Tue, 07 Jun 2022 02:06:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:43 +0800
Message-Id: <20220607090549.2345795-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020608_459420_5CC31065 
X-CRM114-Status: GOOD (  11.95  )
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

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v4->v5:
Move the usage text from caller to function doc. Leave todo instead.
Same for other panel patches.
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..07f722f33fc5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1511,16 +1511,28 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+
+	return boe->orientation;
+}
+
 static const struct drm_panel_funcs boe_panel_funcs = {
 	.unprepare = boe_panel_unprepare,
 	.prepare = boe_panel_prepare,
 	.enable = boe_panel_enable,
 	.get_modes = boe_panel_get_modes,
+	.get_orientation = boe_panel_get_orientation,
 };
 
 static int boe_panel_add(struct boe_panel *boe)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
