Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E913C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYTFCuKSSv3i23Fc7KaZkBlWCB2D/YjJzm4pmF5c+ds=; b=ZRFHNensr2SmPC
	/DFiClvcU6LQ0pgfb8HbJS6DI+f7godvu+xDu4uOH16LT5a2P2qX6mP4nl0imAnQxA9viVhY4dTUB
	ZsA+r4Ym576owhkhb3fxL+dUB6OP9imQW0fTqqIw3eWT7iSNHysgwMi+zSHlegQce1taOaO+mZVig
	yFkRDVkae0N2KaBQh7MWNFUrcQlmkAKSYjRERPeAwaU4Xty2pFWRFFmF2YRo+qryeArYY6PgTZ4eK
	hQfKPZnQbAhaxFIzhoSDGARAhfJJTX3cUdWVoool5Scd4prRUSvL0sRtgwDTf+5pKk1CwrGt45MpT
	cnQ4mA8KQYZLrEkU5LzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVK9-0068KX-UF; Tue, 07 Jun 2022 09:16:30 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVAN-0063MK-Rf
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:26 +0000
Received: by mail-pg1-x52b.google.com with SMTP id h192so8489751pgc.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
        b=oSqdlpz/+1EVr71yB5JJSZiahSwMJDpQSfi0wg1oZhrGuVUcVGy+jjbo99bnZ670g4
         YuHEr+1VVs1fkdFx3qoAXUrtK4owpH0jzwPZtKVMjcUqYFTRSKP1dszaqK07o7LDBheh
         UmjUb4CHeVsjZ4zgrxSOiVJT9dGJ/kSflLBM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
        b=bondEJFx8dQUgskcuJsgeT1Q86M1O6vIO+GuWPmbXGwvV0M++fN4L5oF3Brk/uj1M5
         M+iSxUteVc3c6qVtMt+Pyfz8cdn5hsSOaC/wyaUVTuEs7mw4U0qVh8ff8a3rqbcd7kP3
         uqAL2J/kPhp6SaZAaIOXm2gMaD0PCwwG7WENux8VaHc1iPyng9udNlvPHNyJxFF9mt8+
         UECSqYe0pbFXUHYdJgYAeBAh8iUjHUNYkeLuIen/xqrzNLKpmxRJwaKMd240hP37PMZX
         Frk3sylsV4I00Q7hd01FXToV5ggPrqdCQRTT0bTKtEJaBAkM21x2NFg+OLG7VvZaoTol
         IOSw==
X-Gm-Message-State: AOAM531fATdIFVRYbqfRzDWLP8Xwoo4XRUlvbVHjGwAqs8qlH/ql2yOn
	BJ3pQUp5R2wfmMJZTnj7SEXn1A==
X-Google-Smtp-Source: ABdhPJx4/R3wgiPjf10Tc6Ix6ehs1YFuhLKxv4LZf8DhLrSrjuaQEmxY4+09E9Xrn4CO2l/wwZLFbQ==
X-Received: by 2002:a62:ce4f:0:b0:51b:ac5c:4e49 with SMTP id y76-20020a62ce4f000000b0051bac5c4e49mr28557254pfg.81.1654592780106;
        Tue, 07 Jun 2022 02:06:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:19 -0700 (PDT)
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
Subject: [PATCH v5 7/8] drm/panel: elida-kd35t133: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:48 +0800
Message-Id: <20220607090549.2345795-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020624_075103_2C79D643 
X-CRM114-Status: GOOD (  11.75  )
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
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..fa613d1d7a8f 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,27 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
