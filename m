Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71960C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqqwUQLNWVGfcZ0hFDDMp8J9rvsub7RBdHWoMZUelWE=; b=EusqAob0uT2wWH
	/ZLgJraxakHLpj1FJJmweM2+VToV2uauqF6TBDGMyW6RloudY+4Sq8gRGesV1AxEB1/qsMd/djds8
	1g1hJASYe7CqV1hCSvUZkSmlSVZXiWISoZq8eCar3XZ05pSaicjxw6cl9WbJSFTQ4OPxXfHnp7qgj
	IPvlJnNQad439DickoBmVDldMsx+ff0u+CSY8Z3bPS3X2o4vMFDAwkeWQFwi2oDPTeEyGxKtP4POc
	d5IxS6DInjV5pbLha7t8smy0IE026tYUsFjFOn+dlQg+wu+8NGIuI6HkZ9cB6QmeHEk30mKMT93PS
	UwtIZY6hEWS+lfT+NcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEeV-001oHO-CW; Mon, 06 Jun 2022 15:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbf-001md4-8S
	for linux-mediatek@bombadil.infradead.org; Mon, 06 Jun 2022 15:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i0tXsXMGjaecgqX3jWpPhbYuXc4NjomTM5fJCVscSk0=; b=d6rrRN9EtO2z6kmuqwexmmhZnX
	c3znpvsY9g2+MUSsumuuQ74Gyl8MfebC1ZTtOneu6BA1Snbo/jHQTYIUuHIno5S0LWJgdvr19nuBu
	heSqtmFpm6aN7GGuQFAtKn/fZ2T5YhI4+0oCU+7q56cck8iYU1ezPzGKEecNECK9GLTQN39Pvnbip
	XEOUpNkaD7I7azK2Qgrf90iAzV8cSThTneijVQEW/PfQC35coKGkY9d9rAdVcr2szi+rfir89Czww
	BGBHJ7lpMXIXI+Ff4XWFi7jkvE+UydlkpwYaFKm8yxnaihT15n+OA+2mrJrNgBw7DsI4nGeHGsTGX
	YTGpdnvA==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbM-005TpW-BZ
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:25:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id y187so13180260pgd.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0tXsXMGjaecgqX3jWpPhbYuXc4NjomTM5fJCVscSk0=;
        b=a/ZhaRa9zo0Z+8UTqr4oxABM0QmsWfKwzfWfEdvvhnN7Kt79x0XsK9jl0J5IM9yQgp
         b7jru9uewrcIzSerXlyuYqTRy1pNQeDmmpu5FQRcXa3YM8E55k+kbzDJQHWPunqxd7vA
         uWSj9XuO4JXDZUEQ94DhrV+B3k8FRVN8nJIUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0tXsXMGjaecgqX3jWpPhbYuXc4NjomTM5fJCVscSk0=;
        b=QASImxg+5SSaZZx25bL7DcU5VUiPTtJi3uEWVy1bxz4wYDJ2ovBIPI8CvMZN4KPWzm
         jCq9fv3fqsK9JO+I6sX5eIw+ZUn2v8MHVoBRKIToW6DlvHSYfh29EPyz1W5nAGSKqnRO
         GkWUs+JquqZB/8H+xfyUBA9L71C8UIqetJRbPYy0UaleZcKESPWRuUpKQebxDmv1DCgE
         Sfu8KZyhfZW1D2ngKOJ1mMxJFgT+47KQLx4tXgJDFmzzur2juE6699qcrl2RiNvNQnhP
         zp3WhYa/47WRDxg8+pEdEnNyfJlNTq5VToKuofOu930LEKk0nDWkJrWwd/tU7Khcup6f
         jNvw==
X-Gm-Message-State: AOAM533FeIvMGoJs+ev7IKxcOTVCtbCmk2sMblfAsHcIcp/r4zPyuLrK
	NczszBjhWIavJwli/bA0qreLnw==
X-Google-Smtp-Source: ABdhPJwqPPpmDUkcXjmB6V/bMm8g+iVPCzngOYGUAR97PXSflEMdb1TJJvgiKirHO/VjPQebLdJxnw==
X-Received: by 2002:a62:d101:0:b0:51b:eed5:8c91 with SMTP id z1-20020a62d101000000b0051beed58c91mr14876270pfg.32.1654529104777;
        Mon, 06 Jun 2022 08:25:04 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:25:04 -0700 (PDT)
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
Subject: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel provides it
Date: Mon,  6 Jun 2022 23:24:31 +0800
Message-Id: <20220606152431.1889185-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_162522_393661_A17E145F 
X-CRM114-Status: GOOD (  16.80  )
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

Panel orientation property should be set before drm_dev_register().
Mediatek drm driver calls drm_dev_register() in .bind(). However, most
panels sets orientation property relatively late, mostly in .get_modes()
callback, since this is when they are able to get the connector and
binds the orientation property to it, though the value should be known
when the panel is probed.

Let the drm driver check if the remote end point is a panel and if it
contains the orientation property. If it does, set it before
drm_dev_register() is called.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9f10a33e6fa..c56282412bfa 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	if (dsi->panel)
+		drm_connector_set_panel_orientation(dsi->connector,
+				drm_panel_get_orientation(dsi->panel));
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	/* Get panel if existed */
+	drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
+
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
 		return ret;
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
