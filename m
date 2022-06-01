Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ECBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfWw8S6kpW65OaRYkLAm8tSzhkpWl4Exv0C84AU+Jdk=; b=PHBPfGAagWH6iI
	nlVB2yUcBP7olhMpYfQBLsnz28emQmUmwg76OeJnCdSP0LU33dIH72t9DMv6Y1tI19ZNeH392oJ4o
	tMMfYnsTd4eezhPHQVp2zLytIX4k/JwQvt8iCdxnfGDgaxUwuFUrx8rvKppp0hG2HMSpv1cRkFQaC
	Ms5vHqOETbWXHE5RkkqON7kyrRPJtMMkN+zqwRiiDwLo6ezmRen2HF+NAmjjW8r0x8UCmPHPO/H2a
	NC9eYxgerhf8+1AH58pEDGz7bG364qtDjxtqNIigpg3OIzMZQ7XQahWXjeQRIRh3/kPSdCMvfLyWF
	39c5BAGqs4QW9hx73Fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJa3-00EavJ-3W; Wed, 01 Jun 2022 08:19:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJYv-00EaKv-Te
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so5488548pju.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wmbEut7AQ7/Bf3HWTLDsZtp4DOqAEomrHS3HpyZ9OO4=;
        b=igURx3teJeErCLwWW62RZUsTiA0yqJqs5g1N0ySEf7hYZ0aQu17UQuOLGN0K/bQkFv
         oIayxg9GbTmWrLSfdAVeYA/N/zIJ+CTzhRi6uQdSzkNPBbyiIFACjzza0SYrv17UUtQv
         aeGqsnM/aIpZfOz7ZST/lSBoAilfn+Kv/UZw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmbEut7AQ7/Bf3HWTLDsZtp4DOqAEomrHS3HpyZ9OO4=;
        b=eD6pJXDyK9oJJ3PFVEmOy7f/Tk5nDhTBXnHa+yp0uQVHhKiZMvuiP6rL2ZWVPC/hMR
         X7mo1bMyEAQ3+ncGTHzYLti5D28GmyWXyvZRypHqxzlWDWSWgpNF159ggkjNiKSV2PHC
         Rye+NV65LkteCCYQpM64htYlXX0vllD9Jz3P6DqyrYpX+ilaNB8O9UlgfLdCc3efOILD
         yeLfZWp9uiqz35cEau7nUx9DACM2+PAxoJCklFnv/lb/bJ5HadvvofOnUMmNXpK+2Ief
         3+PUA3IxCZtK5tUnKACqYEpATA9xpBDIrMc+fPNobaTuYXnJQJZa1WmUrIxZ7RTF4E0J
         jufw==
X-Gm-Message-State: AOAM533tzIE+PbxQhqmU7xwlerdNxiPODyZMq+8hhMbW6QOSE5JdbinN
	nl/kNzuudI9dbNMKuOfCjfadHm496ppX5g==
X-Google-Smtp-Source: ABdhPJzAOTg2fw10j7HFjvrblLTUzc60T5jBHgR4OhGqZldKydmmJeCI6jBogTpq8SWmmOAAjGhg6w==
X-Received: by 2002:a17:90b:4f44:b0:1e4:b161:f9f6 with SMTP id pj4-20020a17090b4f4400b001e4b161f9f6mr3465677pjb.43.1654071518643;
        Wed, 01 Jun 2022 01:18:38 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:38 -0700 (PDT)
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
Subject: [PATCH 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:17 +0800
Message-Id: <20220601081823.1038797-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011842_046962_9C588AC2 
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..0f1c9b685da3 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1516,11 +1516,19 @@ static int boe_panel_get_modes(struct drm_panel *panel,
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
