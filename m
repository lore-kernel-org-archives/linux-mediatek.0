Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqNQ7I22zU/W2gDz81UTNvoJPe71bfHQ1QDHeAijdOc=; b=Azlu0CKrI9oO39
	vSgwfAODARirppmHX5j+0JFmp1oPt8BM+bJkKTv01tVnT0H6+64gUIPqgt7AHpPVz920WCYi8DVRn
	wFDmKDlpaBff5ceF04eUo56AO41L7Gh+y+1cphQEnvrRDTzXn/i4mqGHIRw4votVrYH6fFMTGgV/u
	Y//6qu0RjcrGocPPFBd+rMWbTHbsAl71NGB3xVoPoq/FLbGFxKp7a2rfCBU7w6gOYkW+im0DDODFx
	8kEi5Iikl9ZqYCf2H5WVc6BSY5fTWqJYdwJc2xIGL1fP5dPkynnjufo3w+Up4d16wq3LxeKMBcRw9
	WyaqinwORCSbOIYY2luA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJbd-00Ebkc-J4; Wed, 01 Jun 2022 08:21:29 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZ7-00EaSm-0U
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id e11so1295099pfj.5
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M55jesM2/bLrZTqeLQbPue+qYepgHtq5DKFSuhycS2c=;
        b=aYfb6XQeGN+agxPiXMc5cMMCvRMycYKm3pjxf5IuRCdZkzxHVMNiMARTXTzWZUQPQG
         RTyI09JGjcklxzXAbDnf/Di/q40nfaQ7S4bgFQVenhFqddaJnUPtH0xkmzLf3rpgk7MS
         mME6bPb0/mloYpW/tF0wiOlWADxaQd/hVTSug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M55jesM2/bLrZTqeLQbPue+qYepgHtq5DKFSuhycS2c=;
        b=5lSms+nUaGniu/InOPCAw/2xW0FrFj06VQ3jPpvrD0YKUE+GSEomQ+D69XwKu+mufH
         z/DzTpr0jlmHDiUI5V4HDIKnuLxPvUOqOcZBe5rhjDqSjaIGT+l2iFAI/xZ0gmsTXCzT
         Yt1veipKdtoOTa/pHCoTAHkmDpg6OhtEDCxid9mhnxc+4qfPZhFNyE8dT7JNxHGjEazj
         hbasv56aL1xVCnG43bVKFbcWvFooBgKgF96Pbv9QB3lxrCZ063OR7OOX5TjcCyyKth4R
         xu83Bt/+YWmG+WoKfq//lKsSbxzlXc3+XP3lNYo3TCuRPGajtV9uE9uR3jHzi+rdBAFM
         jLag==
X-Gm-Message-State: AOAM530M4fCPNAXvgxq2+9klid7jqq+cXX1WHJrie60vX8MP+eNpetf4
	jKjSB2mBkIJQvRUdXSkbcCMCjw==
X-Google-Smtp-Source: ABdhPJw1updJCiw3Qsgmdq3tUxrZNaTrj9u2SGii7IU9H10RIUQW1QdPFu5jUXYEGA9RVz0ZD8Btpw==
X-Received: by 2002:a05:6a00:a03:b0:51b:5131:704e with SMTP id p3-20020a056a000a0300b0051b5131704emr13202436pfh.53.1654071532308;
        Wed, 01 Jun 2022 01:18:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:51 -0700 (PDT)
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
Subject: [PATCH 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:21 +0800
Message-Id: <20220601081823.1038797-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011853_111052_8F5EA30E 
X-CRM114-Status: GOOD (  11.76  )
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
