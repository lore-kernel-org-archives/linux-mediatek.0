Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51BAC28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=; b=ep3VIIBt5utWznxeunIsOGW9Iv
	jqtmnkhJqtpaY0VWmddhwvvXP8r1g3J5zziclTeNf1yshnxqJE6lOjadmFifWaT/Uaz5QX6hq8xcO
	CuMpUgG7WnGfo8Hz+MEty3Nnl07rM/aBAKFC7hzyKM3QlmnA6jSOTd7XzowL/6A3OwP1GMwmSQYnH
	19YAI4DGz+iLYoe91UV7c84TaKBLI1SFKrorHwJQU9ZEkTGi37RSL4oXJQsTHk90pRK9L0O8sJr7S
	RR8OX6JQlsmrf09Uz5oOQuJVbkHZh4dDo9nwid3ru02ry4CCQFhlK/rCqjsbBV4JmHJhMVb/VZ7kh
	9LXtRdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK1M-00000008DmU-0uCE;
	Wed, 12 Mar 2025 11:13:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZR-000000088ny-2aA1
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11214869a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776257; x=1742381057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=UJQodZo7jNfDZQyt0Mi0+vCZlxAFsrnr3FZlx1aiT2fI8o5dhYcEi+gcu+aTgq9SJU
         1bpXZ5WKfA1PQPHWnZGRrepfOrCrJF2h5oey9J39pPQ1PVBuhH+bj3NrawwoQ0SX48eH
         P/7jO68w1UEQGO14oYbJrWlu7AoGeDpbtZKhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776257; x=1742381057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=HGZgSvhFzZbXcXOmGuGuQTnT9niRgsU3r1k9I/fPI7AmJe359xXqc5/jbsXD9zEf8s
         G2hJhnQced2i+FAB2eeXB8rsqD3jViYEp5qfSrT4QIrs5+HtalkXJxhqu54NHf7UDP4G
         rdFBZuTefiTkP7Kk3Nbyd++DZUFL1GffMXE2X7p4W93N9m6fZD2FdneTvbxYrl8ipuJH
         TE8ryPSWPx3i09lyCP4qMSqCu041ll3mp/49AdUwK2KO14LExex92brrU4KGNaZoD7xB
         jDjvLDTp00kPYx1szVUQrM4Tuw10oU24cKTc+91bW8EQXhtMGsyhhkQ7MLrf2aHcAF6J
         LhLA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJtLRjJ2FvDmeF9RdKKzv+nFwFlfYsoenrqxUcN8wW4ZlGtME4qfup40euf8AgiXU7Cfw/CsJMqdvKkMGyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsO+gjq/bfLtAK5yyJwa8PNvpG5hUOBuk1qlfTwEnUzClXf39Q
	uvvN3d3MwBAYFoLtO8LzL8RoW1v5pkmWquA5PaFFS1d9VjKYxddngyH6Zhm7yg==
X-Gm-Gg: ASbGnctBOrZOuHoXPAyJEruUcIYoUxui5bV9DbfGgAYanGug75g6fb+Tpl+s5H8mxBY
	qEASDOZ98IZeB25fZ50Q84uTsHRv82j4VyLOwh4OcojON+ff1b+k9Ex1flBqUPN6cYN/qlHWtbg
	Q2ps9luxqxftrOCdG3O5ATv/k5pvNo2QVStM92bCPHnG312vo8w93qYL/ytvptS1yneC3CnGbCI
	Cs0IFeGdCtJqs3D6KnBuXOObcpCkzqlyZmI/0TNTRo3KKi18EWfTVVcdi2FMtEo9x25XSKm8O7W
	mp5CK35c7xpi3M2HINjFLPc2JTJvPali+FE0QFCpk3DuLTP+Y67RaaYiwl+DkWg=
X-Google-Smtp-Source: AGHT+IHnJ9RN+rcEBHk26VixrUf4szFNagmQDG8odQqs+oPATVUlo/6Tywg9lfAQyAwSqd1m1Il2tg==
X-Received: by 2002:a17:90b:1a86:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2ff7ce59755mr29857671a91.5.1741776256738;
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Wed, 12 Mar 2025 18:43:42 +0800
Message-ID: <20250312104344.3084425-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034417_648548_4F479F27 
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

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index eb01851e1cf5..a3ec583f316c 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -89,6 +101,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


