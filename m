Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFFD7361B
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Dec 2024 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=; b=a3tlOX1XnqrsRvU2ZAm4OL1Iy0
	JcmWOV8sxAkFX7/CxzHkFNmtmKUpjJ6pF4ZDYwXkSc34+1HJ//kROjb27E6w2R5+EDdZXsk0SWoWQ
	xWi+MFbxiq6aSUP4Kj84BVqulPPzHVQfabYIV8o0ZXAXM8c/d47T5gK4/bauI1qlEfCfJa43adijm
	nGOMWKq+A+/L7ssdhP/DN2ss38Md4yKkMCauWkDBXGF2J5nB0nrf6S+xxXRd7BWDdbs8Sa/KNXdDC
	gWmWjrRehKW2lc4hXAA64c3g8STEJi9NMsPg0Zz3mq+ju7F6B0GOOjgK+tfibTmcd5cgbrg5FOxok
	Ux1zwG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHYDR-00000002qPM-2zGu;
	Sun, 01 Dec 2024 00:53:37 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHY4p-00000002oif-2oSB
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Dec 2024 00:44:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0b922a637so2237629a12.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Nov 2024 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013882; x=1733618682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
        b=wnGzsnm8LXXSnpAW58jmsUOJ4SMuSYcILYV69JhEPYr3krqOlGh/7LKw6G/+fvp9yo
         ym+sEAgB149Z7cBvFDc3f/LwIBjUAutQOtt7WVoGs/C1txRfYZrup2SAounaXHzCtgro
         m2Y0hbUIRqL8qgEafjy0o/VPgc5RYgbh050b/lxtrBBnTYLV30p/0lgZQtmmJvNqAtYo
         7XZpGdVBtSoeFORoK3eQIA7gkR1YC9yTiEVzvX61i1PXKyFu+FiOEXwdv3RSqe5tDlqC
         lomnzrVdLKcf/OPxQvle2qpWBMyCE0idUujLYfgLixc8HM3NQiqvFF3Q3pHlujZJR+pw
         m4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013882; x=1733618682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
        b=h97MFgcm2PdBUSi3lHsHg7jPXEenveLp7OXoER+pXh50/YV54aKjuDNm6vPoUqCLqP
         9395b/kTJNieYVYfbQtxdWroCGl4EA9ySgdCF5IiyUrdwGBBF+XHNeiyjWfzOCMawI6X
         orCKCSMQ2dNlpEZPrLUOnLerBPuyYPipKlY10GtrBjmuvjPQGamfPeFk4BxcYiyem0/i
         Jk16eyqRGzG3V4S8AIlKsDzTg2Vv/2F76vGi9oYkQ0FKYINJV7N/F6CLS6wYiAGwClje
         zyGHvcUoGagJk5ZQ84h9TEPra1e3ipybW1xldiWCAy8rOCp4QaBerKD+EGeC5NpYsawZ
         rwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7gzlHQz3nZ5vSN2fLVbSsx2nx2QiftYQbqcJIl/s3A/jtPIajV7LY+ZQWal4mEA5seu+/Ra/LJLkQM85p3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxPsy6DztbJeIKwfZwmXEw2ydXHnhJBe9DqOiYlwpJrgQUegl4
	PFjCcFdIohBde3zQoUDgp9/SBdi7/PIMjFunboNQO0MlVQ5RlJJp+RNyNqavsTo=
X-Gm-Gg: ASbGncvn5yHseWEuK5lc7CvvVVGk1l3BkbZ4W6V9uDblXPcT5dcmKic1lsdu+x9AeCY
	P0OUcYVbJ1ZHeF6z54dRVSCpDn+UBy7RrysydfC5ZIJ/HpM7+4mCjdkxiJlZKL9i5bJYcJBOHv/
	GU5ol0yHA3nqeVEMtTt22tK3lGCANFavzWVLfX7/HTFgZh9QN5R8whaAsLG/oP1oURzoKwrwrJk
	T+3NAb3in0yFf6b6UlYS60kKYrK0eEqPHyARD5dfHEn1UmkMIQ8UMCLSw==
X-Google-Smtp-Source: AGHT+IE5Iodta2UQP6qjtd0G2oZywxiR+z/FGF+U8cJWDKR8GZEI1K1wlfh9Q8JImD1VouVwulpc4Q==
X-Received: by 2002:a05:6402:26cf:b0:5d0:8f25:24ff with SMTP id 4fb4d7f45d1cf-5d08f252625mr12479352a12.14.1733013882366;
        Sat, 30 Nov 2024 16:44:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:13 +0200
Subject: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m9cAK5FN1NFJb6UQkn9k+gemX+2/diBeTweGL7F7R7w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FZMmMFV20DgQUuh8v5FF4nWRo8BcSipooZa
 EIAyUUoJziJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWQAKCRCLPIo+Aiko
 1dDwB/wJfW4xZABPDcU/eL/SukBx0cSr5TyqsC+NOU/8rIY3SPpHoNzt2tfD+tYhv2vKAqVGaT+
 Y0Pd3xmibwzv12VUOjFt+1ZbNthzF8qyG6keOs747UGZJQ69PhRds6t4Rw0KD2DFD1qgLnoX/w3
 NmWud73M/PrrwTQ2hUm3HuLVNhUfXRhEp/60uu1faJkCzG0RKUK8ibOREThgoBWt/fKvWDG+Ohf
 Vsyc20q84GR6TrucJQRzobBfpKYBr77Vpb3pn0XZ9hGN3YwhCtLPDipCwnoXnmPkM17bSL8dJW4
 kP1LucL4uQp1AahjZxJZFLIhzCNDNlresD4ccZFTjoNzadBW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_164443_716828_1654F352 
X-CRM114-Status: GOOD (  11.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 */
 
 	if (status == connector_status_disconnected) {
+		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
 
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
@@ -487,7 +490,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	 */
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 	if (!drm_edid)

-- 
2.39.5


