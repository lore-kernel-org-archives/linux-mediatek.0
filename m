Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0307EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GACv54yXEuUrke/8EFi/oqH7vLCC/PDExthXQzVuyRA=; b=Ku66TgjS7ofMLE
	pny/SqP7CW4iXYSyGUZspa8q+9tDzBYccND3UpacwqJDWcYUDZl+fgoMTfwl1agIYy8IPlDxhVtDj
	Y++c+ZlecMVZjZq8+2qgfyijVHW+SVKxYPv7KzJKSqfslukk+Yl0ahCfVm1+gbz8OFU6ZTJc3Qulf
	HWT07bOd6debHid/goinvkHqokKCg+Pwv4t+1SLNhrrOJXdOep947i9g2FlBJwOkNC7QwfoE35bvW
	jmWW6GPed+AqJnUM0Yv/XPo4vSCBDa3WlO1LFaI1e8uDBWzpD1IUdcf7mo7JPgq44KSAsjgGY7j5S
	/GQqKCYI2Lp3/BKzeArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4gQ-00GiNu-Q6; Mon, 06 Jun 2022 04:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4et-00GhQZ-9e
	for linux-mediatek@bombadil.infradead.org; Mon, 06 Jun 2022 04:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WQSi4k5+DH2NNzeThmAR4iQ0/H0TraV3Wr+JMjHmwJQ=; b=jp6VUFnhFNZ5CZmxeRrXo/iI62
	AFDu+4amLWiI7oKEOtrRtPCP2vGaU9lmXMLCw8qlN9tjraEGuyqHJlVZmpQKatulE86QaaV9vVsuP
	Ha1uLhWee6eDS72lxzmbCmt9IR9xADXdhJWiEv3MHcgzPYf8UV/askw83cfqKgPtq1IfOKuIIsLfC
	CP/Eh3AXEuv/04Vs73qyk2SFoCWDHe3k3I/yXd/eth2AzIs+yWgT8ggblxB5N6qJD757glQXnP9fA
	mdnyz7KTAynQbW8dNV83BgRW98hg04mx5IJu4UyZkg5ykVAoMOsuvMp9EmHRbW5zAE5zTmft03FC3
	Fu2Kix5g==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4em-005JVP-FZ
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:48:03 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso17862928fac.8
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WQSi4k5+DH2NNzeThmAR4iQ0/H0TraV3Wr+JMjHmwJQ=;
        b=FAtsRXTGQSRmHF3KZa8qcRDi7ZgeV0IHUdd6bGueBBcGZLOnTBmR2RxZuazS+y9q7o
         OjsxgIujdZ2ZNgJQ78+1g6rHMvJ+klHfBwJQ4oMAZXFks8cmh/P7/ooETatdAdTB3Byg
         4eII/roHshTB7nk8UYbDpl+zs1uOsVrtysWCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQSi4k5+DH2NNzeThmAR4iQ0/H0TraV3Wr+JMjHmwJQ=;
        b=rjeIkW4HQaX7Ox7ixksaDcua1nZNVu40NGw8kUZ+TZX0SzLIrcA9/VKlfjQJ1ZgiYR
         mWdWG68zuALiEfvXieJkcciGDuNaBLqI69/tsR5ld9WMOexBcmUZ51+tsK1bJHTZ3C6c
         Pziw/qQuMP0HqRna5KK1hjJuKMakeIStav5Il25qjWsa3C2fTCKiZNFvsQbnVOjgZXSf
         F64dAw6HUEmUdbw8aenGwxHvGtT8YS7MMjckT9hu7VTE85eQkyIkVmf5inGvtEC1ewyW
         Gd7r6dT3rc7gqHFiVtFYKnnwYqtaLg8oBM8+zSWmajQ8PGqL36aYNG6yamyW79iiN6Tg
         GPsw==
X-Gm-Message-State: AOAM530WLEKYCnio7MrQyH0BjEqzTb4vj11aOOSlFH7ruXl05ue2lIsW
	ctLnzbntYBvHl6WDQJJYwl+oJKk2+O9DsA==
X-Google-Smtp-Source: ABdhPJw+hjmyVd5Y3lxE71x0n/iIpqeWNV6iXQ9+/Kki/UAwcLC1/X8EJwlXese7X56/wWt85lzakA==
X-Received: by 2002:a17:90a:4282:b0:1de:c783:4e79 with SMTP id p2-20020a17090a428200b001dec7834e79mr24215753pjg.235.1654490864436;
        Sun, 05 Jun 2022 21:47:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:44 -0700 (PDT)
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
Subject: [PATCH v3 5/8] drm/panel: panel-simple: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:17 +0800
Message-Id: <20220606044720.945964-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_054801_068840_BF69CDFD 
X-CRM114-Status: GOOD (  14.55  )
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
v2->v3: add comments for notice.
---
 drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..82041cdb5478 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
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
@@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
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
