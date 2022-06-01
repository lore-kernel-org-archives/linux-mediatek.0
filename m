Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7883C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgP7Osv0o3qqqFN1heapl2/UvJXYg5VewQHEpMDK/6w=; b=CRQu9YFozb64uH
	MzNotfNrrh6fXypCA6P2i42RuwyyFRWJt96t1o+xes8mzFaShXz20vF7ipNll7Rie/WaXNFgVHgYB
	5Hvm1cBSsmJdFT8IioXOOgI6hobH1kNwDA9r/5UO8whl/WUev3o8DR/1+Zrtf1Y5sSz7AXzay1Qwk
	TW0HjXmVqJJUlxQ2N7fjC6/5xdcB1zTyDMO2MfSlDFm0IdbKtbZk7jnrqzvahxIdkH1BxRoR9+Vm4
	fTtB4DXRdra4DzKibruCwEYU/KBrD2XVmHvbvqy96Ut8XYHVOYP9/ImA9PyJluOmf9b+zcGQj2Gfk
	SXRi9wrCqzzcY5Zuf8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJbA-00EbWF-Ja; Wed, 01 Jun 2022 08:21:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZ3-00EaQU-Tz
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id u18so1111545plb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8d1zMyQL8ZiF08W1HsnKeLAzP5rqfEzV2IbS5Izuy0=;
        b=ksf8bG7XN7niA4y9qzTxWIPlIOFWTcLTSarHP02vVmoXUREl/ysj2VMRvOMzVquSZp
         74rYEsAYHeD9oNsiY+Xk9dezvNSEy8kQ9/ge4tXgXhzEPSugxwLbmLq5cKfe5XNIvu2k
         xkG1RIDytD/qALPSRIQ2XcJksj/Vu4jDPblQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8d1zMyQL8ZiF08W1HsnKeLAzP5rqfEzV2IbS5Izuy0=;
        b=MgJ2VanCGSXggNJnXB/KPGlcvR6IqSqTqVLpDRVgt0rdtC3P+DXibG+V5sVmpLUsgo
         MLWNfpPQr8S2s8G6StwYgoxMwab1uU6nfxUSWmqByQ5HnwJWrB+ojYI0eXdPajF/gJcG
         S54O3gbAgBocjtAH+ksf0Ry4CyymkF4BHc5iXdVr3SjeB7b++qSrx8wGw2mZbBDoukNb
         Z0VzB3uNAprX1D1hEg04Vy73HWbJW30a663WcmVo9ZXy2MRyPMBb4v7RYTzezyEHyZje
         cGEAElL187Mlm4IBauT+WnZ41nrLBL0F5bOkKZz58mDorAYUKvZeU8FvHHTuGJeHLLSM
         dtBw==
X-Gm-Message-State: AOAM530Jls/4L07p2xICK4HWSXiN+n5DSt68zhatWY5270rdwnL9Csur
	MAQpk267SDsp4uw7tPBd+gb5pg==
X-Google-Smtp-Source: ABdhPJzu2dskjcB1Tt4UKMFKzdt9KMOK3CIoubeiISeLw+ntZYQQClm4pmYrRg1PPV6+tb9enszBDA==
X-Received: by 2002:a17:90a:14a6:b0:1dc:f64f:ff2c with SMTP id k35-20020a17090a14a600b001dcf64fff2cmr33347670pja.161.1654071528928;
        Wed, 01 Jun 2022 01:18:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:48 -0700 (PDT)
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
Subject: [PATCH 5/8] drm/panel: panel-simple: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:20 +0800
Message-Id: <20220601081823.1038797-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011850_033281_74257A11 
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
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..54e78d978dcb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -434,6 +434,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -441,6 +449,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
