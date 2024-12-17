Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC2CE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=; b=4RU1jTS2HyYg3ZIFyn7o1TVQ1d
	oa6BjOwd4NuFgiNJsFGmx+XEBwxXoYPxXRZx6ql4jLPX2UCBCDWqn8fGwOW2eUY1Km/5Y6un19Zd2
	Ur3fOQzUl9MT+5VRmdz76pT2UzRpau+OT7Kfs1J6XMTOte3rFqZG++DFFUb+IHyvhUts2jkCW1nvh
	vh79SmU11ZQ8H9/tFVHNSP+aISvPXP5KqVZ3f9DfKD2E5hAehe1Il08s1OVMKN7k6NusYD48NMNq4
	NZ+WKCGxxweobPOPnOk+543+qoJyBPniP8pB0XuFJVhyR0ovd/s7CQrbcn52hgI5REsnW1E4DPCET
	efPaK6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLpI-0000000Bo5e-35id;
	Tue, 17 Dec 2024 00:52:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLdv-0000000Bktw-0Ri9
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-540218726d5so5016634e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396054; x=1735000854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=I4Aza/jMNaRKTnAj2hjkfuV3ENogjxXiAtzXdSJL0Wzhql6OIlz5hgz9CC6K94axUX
         oWJMEuBf6dpHxmu70pDGZ/1+0WJdghlLYFLMYhimfw+gVEZtzEhmIqRN1CDNhcRJdqKB
         KRxDINmNWVi8Kz6Mde5SDR17XJYOqyNPl8XCRGX1j+EZW8zyOyAe7zj8ciX1Me4Q3YpZ
         modz82WR4xI668wKaUmjzo9+iM2s43fwHPVVuK3NDFZPuFMi+0TF3tdC04S6Cc2zSKL/
         gwLjipI0aCT0Hmyrd8pKOrWivhwmKU5hFq/lNdQ0VBr6FaX64saDRJhB41/97fEkaivd
         Qbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396054; x=1735000854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=Eb8/UFN/jT24OmIqU9K5X4HKYJ85EHtmxRvy4GTAzvir43tEM90bFrzYEysFDwMy2A
         k70D6xESN/zLGS5/Tz5NDP4dhRyhjLrI8Cf08EuOhs8H/Ap1hW9LfiHtg6aRV6s2HMYX
         m46xjqggDI7C3QK3srP+He3xGT375ablf6ddTNca2nBwo/TwnjU34tsgSjyu+Dzy5Zt3
         XoqDebkgeQpgcQHVmlwEGIktO5YzO+2U8fldX2yBGmtNBaBSAEIK1SOY+Kw9vHfCOEGE
         KTZ1KDBsaodXHMIjiABpkt9YxHVlUQOYJzP19Bd9zlZbFyTQRwS9o+JcSf0UO1DQUDSs
         wgdA==
X-Forwarded-Encrypted: i=1; AJvYcCW6bWhdkqYjgZnWAEVzvSqzTSymzfoD9vYUwQqRGAfb00DBg/WBNJFm3IvCU398dx0MqlbIy0V4Nk9EAJ/Ojw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJKVSD9iHgwIIos4Ze37LGWPaV6aesGjYsbCq97DkD2tbxGhi8
	AAYrTFfv2f/W56ugveenqUdIVcilRS4IcWRW/Q/gBlWTauwKHDfdQk2ExezsvpI=
X-Gm-Gg: ASbGncvxgS25g8buQJHIkHnEBQ2aEOtLNnIdsasbh0f/AmXi6yiQPwzLnwQxDF14qyM
	Z+9ocPnoR/OlCN2437E17NCZIrWhWaiokwt1v+WSnBPB/2VOmSZM6Qg2y3aZGrc6p/RrBglKZ9W
	ZI/YWESMvjhr2PdeR7v3g494npOzlSTyyqd4pOBbmiqtOrSaP+MItKqIrW8rEA3+P/5H6U6QPJc
	lV7Jkc3z/w7pc/rU6aySEuAWsBAuThFu4AjnYU0lOrcvfLNtjFyj2ouLoYsy9bY
X-Google-Smtp-Source: AGHT+IGe0QdLZY73JsApHksPxAww/oxjVlJdjygOnTwbgrdsohY4NxxLR2cwt2MC32di//BAmFafkQ==
X-Received: by 2002:a05:6512:b06:b0:540:17ac:b371 with SMTP id 2adb3069b0e04-54099b6ecdcmr4290758e87.56.1734396053589;
        Mon, 16 Dec 2024 16:40:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:32 +0200
Subject: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh66KurD/so/4BhoqlDVPuK2xAohhbIWN/EG
 x67827EyE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIegAKCRCLPIo+Aiko
 1ZsiCACZHuxK0m8L9MH1NhE2yPwWUTbzhXV2jMuyyQcJBcJKvwYMEAdKnau9ASgbjUyjrS0EqxK
 PG9HYh7v6OQuoktgWtwxcZgo8DyLPYPsH3ep2lhRl3cz3v19tta06Uegl+D5MxWNoOployl5pF4
 LYT81VevjzV55DOYBg/jYXMGpIZF+9d3Umz+KLMKQZ5DXC85lct2mD6XBUBijzLjKir8Yn92L2b
 o6p48mzqad3L+E2Mxe5QGYoLg5IvVV+ouFScCpgfmP28rZL9PzfgkdmP0ahbxw/xtzK1kfWSxSI
 2DH1/dpfUzApuoHsTjp/y0HbjKkiH/BbrYduZ4L2RBFNDDAi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164055_173017_B7BBBE88 
X-CRM114-Status: GOOD (  13.18  )
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb5e8738845c74d975c1e0e1262ced46e4ef8fde..328a845ce0c4168b5463d344b3ad1f77a5437cff 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5


