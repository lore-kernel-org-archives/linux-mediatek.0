Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6435C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hNXhHc2nPstMQdIDwzXuqG5j2z3rXayYEAAH7j0fgc=; b=Nrfk7qYnofr9eJ
	oTd82UwJzBVLtaPr0+UmPwfTa0QgBa9cqxj1oDj8S0o72hb5lxgbo1FhyKuu0PdSWZgMZc0pS1JQc
	7J2CZ/J4D7YAsp8w5glRaXuV+EbW7PsXYUfJLxAUzCPB8MIsSQXKw8l6YHWgevGlrLj4Zm9Kxgh6A
	fWJwHoFCtIXDKs+uf/qJ3PH9TkoEw4QmyW/bulFQlQ2PhBglUWB5pXMMcpTKZ0uIZVYOzGnSmX0TG
	mRLdFkibgJOcj69WN5ZEokkuUk878qFl6cRPMQ+kUFuZvlTbzbo6lZOC3Hemp+bbaQpALrvBjazQs
	TLUFed2RdZ3oHKVXJhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLCP-00F7js-Vw; Wed, 01 Jun 2022 10:03:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwW-00F1RZ-26
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id x12so1414204pgj.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/72CEn/8tEBsrCbwpSKpFCIgi9sYAXiNEhikH0IRpA=;
        b=OS+nvMctRYsuTwiXTJRqbgZKnlvrlKjvQu63bS3tE+z2ocwPpH+8Be8ETuIRFu1Bpm
         lzFSCn4cLpLN4zoriukqzBwgN/EobgeDfPFSG3Zm2uEEqlCB8YTCxRZ92yS+SNWZeqPD
         ZWiz7cFBMmKJ8XT1LNNfAPpMY17jnT59h3r1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/72CEn/8tEBsrCbwpSKpFCIgi9sYAXiNEhikH0IRpA=;
        b=b9QSiAq8e90iljt6JMwPQm9cn95KveNqKYIyJzVCDVBrICiVj2IwWkbMzsMzXygXV0
         tGvltEBI01SZVzx2foXOrCzohnSmvZL2F98fnF5Ua1XstRSfBa+hxiPUSd31FQp7ift3
         A7jONfWb2DCtaMX3246bP6YUjaUITs6eC64AbrmH5G4dYrTgIaqQCYoa5Lt20aIijQXf
         DhfnUDjx3U5lyWRJHI/L3z+aMXQ5ce2WovQMR6Cp4U5vSzZymYaL+roMNs8Gy/mZnOfO
         DcbMVR4gSzVyB0PLJBxrcSJko6ZlwCWXMIGbiwppi90Y9OkSlXw5eO8oD8IBUuvYq++u
         wmOQ==
X-Gm-Message-State: AOAM532FQbiTyFUS238031zIStb238bSpXaQmrtZQnpMVd2o9qIH33KE
	wq2pwpjedN9bIV6m2H+PoeRPQA==
X-Google-Smtp-Source: ABdhPJyQ5pLVueYfHXGuwinz70Ri9IG7lJaHjQY79NIVs7H7BxNtxvVzpvSC7OIOWWsYFbqCZuKYlw==
X-Received: by 2002:a63:341:0:b0:3fc:824e:86bf with SMTP id 62-20020a630341000000b003fc824e86bfmr4498754pgd.140.1654076824594;
        Wed, 01 Jun 2022 02:47:04 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:47:04 -0700 (PDT)
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
Subject: [PATCH v2 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:35 +0800
Message-Id: <20220601094637.1200634-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024708_124161_9CD545E6 
X-CRM114-Status: GOOD (  11.66  )
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
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..238b6a75d2ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -858,12 +858,20 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
