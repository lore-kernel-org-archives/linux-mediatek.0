Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D5EE7718B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 19:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=; b=zpJ8W4fNglRcfhCTIsy/mgtUxx
	/h9drZVIdwtusQjWuNYsKARcbyBCpbCX9I645F96iwryHBxkmwdW6wdJDQcJNe9wbEiq8T9MyVFn6
	4n6j8XjfeB4/i7uxHWQs8Y3ampFgix9qc+oQTPiaNMRka9py9sB8M4Vf9VYURxYIF1gueVve8UcTX
	KXJIXxocwkbFeGYq4NbFP+U+821NsT6rYdJ6IAW9s6CBIDrUlrlxAinJyEa1K0Wre4yIIPMCtw/0V
	GMNJsc/Y23KduHKuLt5Ix7JxSe9e7JIDjyj6uc7nHOBd/Wh2WArnkuG/wLqY5b05Zw6Qc8t4YSME7
	E3cG2J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOig5-00000005wU7-3wld;
	Fri, 20 Dec 2024 19:28:49 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiV5-00000005tfC-41qJ
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:30 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2313102e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2024 11:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722246; x=1735327046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=qjabkIvY7HOj47rlJ1pbN+Lpg+x65324hh0xa1llY1uVoaeaz6Ki16ZX8GV+J0YWgj
         Gr/gXEidr4FocQ1Xbi8xWr5mV3KgAgte7WHzF5C/pMLKKHV4joVu8RaW3RJ9kuGL8fcs
         ZXPaw45kNbLPiy6OnJFOpxu2i3nSQxpP3N1Cmrct7Fcgq06a1KKlJUjCbA5ajn3JsRKI
         Bs2y/r8neKfJWCOlLhUUf3ArGhIVqbq7lR0Ku6U8aXgJOGp0f2hczgS9MkaQ7DyU/duI
         eT6FPrr0u9pXM84B1MJvk6aNwThrhdq7ltOVNTQx2PkALyZrV+dJhnsU9oT2dEDN6RhZ
         x88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722246; x=1735327046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=oZAX+yaYanpW2ANCf2at7GS1Jht6bLRuDxsz1bwBPtUyE6AjGu4Ibc+pAqEJtzO8eg
         Cfm4Nc2Sk58zhP8ebNBXljeLWAIlNBTnRx3JLlVZhnZVOH1kiqFRI58sdYxi4T3cy6Bn
         1pYi4KKF5FlC1NDgLjyhKrV0CDuaA2cYTEf8pU8hKdggRWdnxDPgQB4BtC67LvX3FtOF
         mJSgwciT2umOO4AUHZ3Sh0O5CWlJDkzWibZ12q9vtO2duhEN0Zwe0a2PfW9IU8uHxm7u
         uE66vSVI9PHXLQQx27gbeEwA8WvYFxngZLzqIJY4HMrU+DqIvLb5AAPhn1Jkfai4Cm9T
         IGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIc4GG8XPnwckSABywnyQ/fPPQmV7GVMw67CgSmnezhINqxJaYg8MZ+HvuDN3oClhmAIapQGNCo5k2RrxDMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzISPSoFqvzEjQrM2VlPqLhddNY9Yv5Ycwmi/gKXyuhLgrlEqhj
	WEjCIJyrShM2AMH7V35hOb0TQoGah+iq6j6dweBmwAUwxNkgaih6vlIwUMwFjFk=
X-Gm-Gg: ASbGnctRdyCwmkiYuOJbWwqZjAIaddMLhK4NjTDouy4TM9Rl9d7dyoU2d8O1a0jK0rK
	3ODaZ2iUPyOCt1u9p1zferGtFlDzMBVm73ha/jNKSJ2em8bwZPeApt9kYLyPWdKqW9xloWzutly
	HV73Cod03+e/9Fld+jCH7cc0fmndYF/vNtxCQLuAnbWWSQDXOc34Gx5UUqOK8HqW1U/9oU7UTFn
	LYyQDJNqAJ+/lWqKAqKte73+QdT1tJMxtK6ddgjuEP62UCX5Zlj9mMCHhizJLJp
X-Google-Smtp-Source: AGHT+IG6IFV0Usn+06DX+/zaMrThIrt7paHBBkdwNJGqDNn/1W/onv1N2MVoOyFetqejTIcJnFPd6A==
X-Received: by 2002:a05:6512:398d:b0:542:23a9:bd44 with SMTP id 2adb3069b0e04-5422952e712mr1506321e87.17.1734722246359;
        Fri, 20 Dec 2024 11:17:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:06 +0200
Subject: [PATCH v8 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-9-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rqofWGWfG2miK9Nk/kt60LsekVXBu+uC1vw6n5PZ3JJ
 /mC567uZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE7E6y/w9W9tSe7sVjbvzR
 8FBbRt5itZZTS70/l66Un94pOkuWwdH5lK71svhJ7IVTW8v/1E+7um8Oq/SHghieD8s8E36nX22
 dYGtvPbPjkG758bt7Azk9c/X7bd+um6nE2PPeUjfWRN2Gr2P7Ce30e0Wr4+6KWfuXijlJxD0qzG
 gT5extinq5dKNmBvuX+iVXf9esOtz1siHufcyqFG19p2yZy68X5z4IvpRutuFxufLa2D/85/sCA
 7/nH2SZf2G25Ulhz2zR7KP7F0Y3i/VcX1Jt2vEozPjs6pcbPiy4kXkuZvpnPaknzj3r2nPNcl0t
 rX6qH1qxql3BNHpX5armvlVFP34LG4pxvVDZeeS+x+2ZAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111728_023904_5A9E4FB5 
X-CRM114-Status: GOOD (  12.95  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
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


