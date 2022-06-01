Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi1bA+0lqWyFecmdnw8pEWr2k0Q5Lo36UhmJMJTzl+s=; b=MjZcswa5nRfA+q
	uIuoZEG1x6sWXwDwp4WsdZVGn+E4C9T2MgJFu2md3MnHgPdBS2i++/QJEiB8C0MSlL8iycZNblAeK
	/TcAZX2mc2I4zIQZOFtiFv9cRQV44AwM5hZ/dlanbcWjhx1jIxoptHzaejwHI0+Qvj+nf073+Dh4q
	woWg31aDquxASIso9LM1ZZvtl/WyGqSwPbWDSkewmfA5aGTLz6xK2ElE2kRHSjEn+sClgkJnzSoHb
	gNj1scQ6iogQ2qAZdeFFA7vuHN9ER6Bp27tQCjFBCGuXzmv9NxO2a9LhXabRPOwKW2lzeTaFWOYGI
	z7TNxB27+u1/GP9m9JdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL7m-00F5hZ-PD; Wed, 01 Jun 2022 09:58:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwQ-00F1IS-Vq
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n8so1316253plh.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=INHYjrtzuqTmW29J42HX48K917nNuhGdGFIMxI84h6U=;
        b=LvoSbn8q477RrYSibfBveWnjpFmVPUg2kyylSMS3U9WKUzvZCOaAlljYZnNmB8h3IH
         KUfDjgnk6qR2j0EyxzpkDV27Lrn/h0xLPVTM/K48nLP97GkQUIcK/5Xj12qxQ980Pg5A
         F2Kp0FCwVJ89GKq2sYlijKOfjGgViTwvxvTj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INHYjrtzuqTmW29J42HX48K917nNuhGdGFIMxI84h6U=;
        b=pSvABqpWQrlhVGtnQjde+fsaHBv4+BbJ7zSFzsR1qm9djjfOB/I4viROU6oXg3Bf/H
         jPJmzR1oBdXufrsw8WIt9r6eX/rFVKTOfsGVc75cAVxPZW5Ze9g7EvhwmTLv9YugtwmT
         svHj6uw/frhsp/HUy6h+fWGaFLK3vYaO+WVfLsQHKT+Mr/TJlJ1CQNz3fRyLAs7UJwei
         6AjXAAuPcD9Z/6qVmC9etwKivjCfolwiFfOzkTD52ldgdLTSysgaiYd1AMvazZEs+6OT
         DqAFnW2gazRv2NPvMODDCd/9+W6/Zy76s/Y/CemMH1dJGnYdPHzLB/ZqS+kXu8TiS88v
         ht3g==
X-Gm-Message-State: AOAM531TNaY1FbQZ+yQClXgMadug0sjOn0vqf9NBnh8PYSkKSNMm5HjW
	MnnPq3BsPhHPSkfzHkMrPtfcsg==
X-Google-Smtp-Source: ABdhPJzmCwkp/oP9bNtMxaNhr0RDu6E+1BWrnv69WtPiA4cmKqDHhI/gba5a1xxURUe2vVmGy8TPkQ==
X-Received: by 2002:a17:903:22ce:b0:163:f186:f3f6 with SMTP id y14-20020a17090322ce00b00163f186f3f6mr11348483plg.59.1654076811040;
        Wed, 01 Jun 2022 02:46:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:50 -0700 (PDT)
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
Subject: [PATCH v2 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:31 +0800
Message-Id: <20220601094637.1200634-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024703_137681_D8A614C2 
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
