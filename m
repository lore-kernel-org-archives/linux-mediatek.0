Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C6C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:05:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26236143A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26236143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oypGYgx2sL0+5cxSs1Hb2onhGl1YT4VFCDYNv+xX6aI=; b=cBkPUa57bJnJ4HYgMkObsEzi8
	tcguJDmiKYaM+Fvwm+9xf6YNvZTFCTh58II5qbFYAQ4Qesrhji1pnuNmz+dnq1++dZMHuhqHjPt4E
	JD3AsfgDboLUNUnO6Mk8ambkiMHvEheRmbL3Q04GGk8lRKx0TyiuEHNKE8QsyJ/p/A8cgNivMKfpR
	dValswrq/VIXfaJz/kPJ3dgHqId+EmvmD3nzrF78DinrMi9O+AV9Q9YcL41E2xawYE8YwYrCpD09U
	t8D9NOo/9QLakFbYzZ665MBDUJH8iNPoBt0aYmnyBOSwJIIna2mCRqozWJCg/5XrXjEe83BbcIY55
	9wd01tESw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbncY-003xAO-B9; Wed, 28 Apr 2021 17:05:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnby-003x3b-EJ
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 17:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fUBR0WopHj0WR6JMHf2d83zcvjlEdxgAs9fymIBITzo=; b=v4lJZSqm+9FK91AbfJ6Di6v1ej
 k10QszqSWCFaZaiVW1rxfvfwuNjLgn5XJu7sxy1xEQQdHeElCBfQlG6Q1SSQkKp2SFmqTsBj/Meo/
 UHSBZUb/DO+71aNmjiJjiiH29CuNdTqn0qdm4xwkAVioLZvXncx6K17FQgcGQIUyNhCbWJf2G3BBw
 VdUY2Mn+nUTFd98uzwvS2Qg46Ck1OlRJjkC0HFjaRd6hKmNXRlFAn7Pr8fY/wvEzFkb7LVaLqsdW9
 eQ6KcmbTwlD+av5txVr5cU8IX7rzhgNKKQIRJEfTyh1Qh+1oDFb5AHe39195vGkr7iG/Rd1R6eb34
 KzkVu83w==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnbv-0002ts-Th
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 17:04:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id p17so5244427pjz.3
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUBR0WopHj0WR6JMHf2d83zcvjlEdxgAs9fymIBITzo=;
 b=CZh4ewpebCFcAjzU4EibSFFnrvhXZVPNRc4wOzEuTvrh0wTnh9QHrTxtcPEp03msf7
 p7qFTJYHHFvKYz9uDrzBQ+Qy+3fq16YM4Kqd8u0m6gWqZLA9Q5vHC5ZZ5f6tWNAMjifU
 mPdOOxsXHBf119G0QvEHwNweX9sC3c6CawxkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUBR0WopHj0WR6JMHf2d83zcvjlEdxgAs9fymIBITzo=;
 b=KCK1g/benOzyEXvSolaWTxxEinR7AKnuuhzIbFzcG/Y5WwJyhNGU5Vev+KKbUHvPTB
 EQrq4R5ypWYCwrW9j7MbPdD7A/K8VP8KFtXW9cLdSS1iJTYRAmvVvhUedxenIcytGn63
 pVXFaEBJDEGl2epCODtzTZWVX5B3nwgp6Kgawcw6gWCZ/Ff0Q2S6+aw61K8uNewB153U
 QAeVFU0Xt3iMLsGierJrHeXjWqKy9ef5nmGZXmahH6wicCyk+oXIxTH8LylwYOnnYbCo
 TbHQakGIQClCxLf/QbLf7df3d3ccaTI/bSOSE7+IoLccIYKyq5Uu3O8jbX5sLLwTyI0G
 rTZg==
X-Gm-Message-State: AOAM5332pcISBRe0Tvq0YLVqZJYOlnmkCL5Xx9Hk9vorkKRIGk0JSluC
 CjsZ43RNgGDuXSqdEqhStvGKRw==
X-Google-Smtp-Source: ABdhPJxVuaBy5Crg4238Rnf+mjDK9f2leKWDPf3f+mhW2AoCjVsaiScJhXB+4Y2JkeULZDYrLebEmA==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr10097975pjz.144.1619629466765; 
 Wed, 28 Apr 2021 10:04:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v5 3/4] drm/i915: init panel orientation property
Date: Thu, 29 Apr 2021 01:04:15 +0800
Message-Id: <20210428170416.1027484-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_100427_965795_B3A6947B 
X-CRM114-Status: GOOD (  10.58  )
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

Creating the panel orientation property first since we separate the
property creating and value setting.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/i915/display/icl_dsi.c  | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c | 1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 9282978060b0..162fb3cf0f5a 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
 
 	connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+	drm_connector_attach_scaling_mode_property(&connector->base);
 	drm_connector_set_panel_orientation_with_quirk(&connector->base,
 				intel_dsi_get_panel_orientation(connector),
 				connector->panel.fixed_mode->hdisplay,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a5231ac3443a..f1d664e5abb2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_panel_setup_backlight(connector, pipe);
 
 	if (fixed_mode) {
+		drm_connector_init_panel_orientation_property(connector);
 		drm_connector_set_panel_orientation_with_quirk(connector,
 				dev_priv->vbt.orientation,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 9bee99fe5495..853855482af1 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
 
 		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+		drm_connector_init_panel_orientation_property(&connector->base);
 		drm_connector_set_panel_orientation_with_quirk(
 				&connector->base,
 				intel_dsi_get_panel_orientation(connector),
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
