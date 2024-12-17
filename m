Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A8BE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 00:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=; b=emXGddtVo5sv/T05qClNliEfiE
	uhEOQGaPZMxi7o43lI7JE0/YTsQ5r5HVnNpd14qy0GwshjZAxa2xgsd8G7IUv+vtVGNuNMbxsZVmr
	M80D0lSUDRkn1t2CBTST0qlyEYjrFhrtZeAs4ADKqKy8gXrD3Bk/0HCAitcf2ImWEAREOynN5jALD
	apbvaeqvy9pxDttQOb55meCdARhVXHMaxBQ8Q6DEUaaLjRV5IAtk3DugD8NDwos6VZ0ebPoSfIbFx
	7K4afKJvrKNWkuaRJ0GSy7XiPqoxk4A+x38Z/hEaYM3VwaTkS0nLxiWRyrEgbt1W9i0n3ZrIcho2Z
	7+JPl5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLoE-0000000BnoB-25GM;
	Tue, 17 Dec 2024 00:51:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLds-0000000BkrZ-2Mso
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so4838249e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396051; x=1735000851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
        b=VoBSl0EuSozBVdoLFSXdiBaD6UxTjX0pO3hl+45vLc6DHUErSuDOl/SfTnT8D6xqNx
         h8K7qmK2nLCH0ZAengV+qbKe9lPEPWVLVY7lVk3tbM/NHXjNG35N8nqL5SXdDwsLBzou
         FeDcXKWBDpcpouxjUqEYMvXSrVWVeQlhjKSwvRCNcbCuEJ2+dklvZIMvkYpf1Y91SE2n
         6waTLloAgrxqLxkd0C4WNsgdD/f9Z7yPuGaqFF131q5gsnWdt/zUCnwlNR2k6F8TKG7k
         X1J4KygKKUl4hIRITG3ox/C7fnN/2bPV0IfeiJunre8C95gchdGvClwQ6l/GvbyIDmo1
         qT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396051; x=1735000851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
        b=kKeb85gQrRllEHjtlncTFZpFe1fesxtXgXwmmueaUGTV4pD8gifYNS7fh6//WpNOD+
         DxGx8yyGsZkGi9DX1pL1OpJZv/VCmjhwJ94Khtg0F+bzlm+f2BxIBgIr5d877pZh5S66
         PV0f6ZcdQWouRaCZyQeB+1iOQ6kDuRwZ0LHM/V55UyNSwGcsu3gsH2Un1yOUWCGaC9sX
         9L9HnizQm6dG6nqY6MLPMy3ifAOT1PShyOHovShgpl+y2A/JPOeHtXgXRTm4kxo3G1Sg
         9nvifiolbzg/mcL5tVvKbrZ2XYLxyJyj8V1beoK7ni7+P9EEa1nDXOneawQjdQlBk8Ck
         Ak+g==
X-Forwarded-Encrypted: i=1; AJvYcCWWNlYaUfBIUJwwmYWAvnhwdazhRZnhlZ97XCv506SuDt4bjb0OkJvWmFG3OpGTj2TmWFVY4L3Pe/eY6UfxFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9uZSPVCjGo5rVGsFaA/TifmT1Z/ZFOhWpQIOkBHhtaczNTA28
	V6XNEuerqnWc+/O297cbgt+VQlolBdFcHJEiM59aITQ1UcJfSWj11MCes+FKvUA=
X-Gm-Gg: ASbGncsLDeDcH5ZYg/brYP94Y5Fyw4Twjt3JwpFtlq7Qv6OAqnOPjklgHQSjOumIL4G
	S41Fij/VHDTj6yGjDlMM66EmT8s006UkLingdPeDYytFo7u7VWdkdW8k6fWlFahCWXQRdoSESM9
	joTEBWUbUZkSbHeujVfbjHdtUzRkV1zmypFBT3p18co3lhXfDFBzNOs5QeDs3Z1zxLO6OeJOejg
	jg240Oo/182nlhUlW8iz+5uJM3mR9tRbTTODKK5FDzWft8KuJrnvq2q4o+VlwPP
X-Google-Smtp-Source: AGHT+IHw7VXjrPeZhfVp33UgiptzZosNfvLSX3nNYvM2KHEjnFm3we6xTly89BdAPcurVBRYJ3TzIg==
X-Received: by 2002:a05:6512:3d8a:b0:540:75d3:95c0 with SMTP id 2adb3069b0e04-54099b6aeb9mr4716425e87.47.1734396050964;
        Mon, 16 Dec 2024 16:40:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:31 +0200
Subject: [PATCH v7 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-9-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pn3jlKOdfQqOhTgwlNovK0Mjhw+ujx5JcQ8ESvBRcTY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh5AcX6vqsmyTSEOah3v/NRfb59bBLsVA0Am
 5PF/UeNbMuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeQAKCRCLPIo+Aiko
 1UYkB/4nmHMFle4w74ujOB7redDUAjj366h2sS6n0SYJQS5bY63lKUrcybdCpnPcp6IQgM7zPJT
 KI3Zu9Z+K2ZvACjsEqw5/l2aXc0xEcmWTAKox52w1HpK+mxERTYSNrKnEpHylqTK2aOcQrkwpGb
 90JB3CO4lyUmqID7sOLHsfS3eqBnYJiWYmplzScjqHDslUzYcE6rjuZaD3MtRPP2RLHo2S1yGht
 YfwBKu2NZ6YKX0LN9PAhJb6RXOuJ0S37kgoycJB4XyXb/p3yPs0dM1IhItwoki1nGLfBOB3xKEY
 EjldH/ijsNmTlfSrYitzNGnCyz43NBBdHpkVVJnf44FwvI7z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164052_632507_C016DA4B 
X-CRM114-Status: GOOD (  13.21  )
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

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2a2aca7017994779a7163935df3fc87ca312d6dd..bb5e8738845c74d975c1e0e1262ced46e4ef8fde 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5


