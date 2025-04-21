Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD1C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=; b=YONnyecUxXKc3KMRQCApbhFDn8
	i0PQfJ88ByxXA+Wme93lLIf2Jfr6KCv7UQ6aqy/hLg3hqduSFk9oHZHagmP7UgxIoidRvKMTIm3wI
	D/Nq1NW8fRz8ymdNbxRUugDtb8w+4Zc5e3CebnVnPhxrvMYQq9YuXij5+7ZRZLgbAUkzw08nDuy7N
	Di+a8xYBhgV5CNQLqz7erdKTP0gzEpKajj7nX3ZOLwAKKl8jhIB1g9/RS0/0VKpgv+2afW6PRUTci
	MTXRCds/0xmF1jfKJCmc5zY9aPUt6MdruxtoPtx4NJFEJ1pO4TWA/V9h9z/9MgGmuiOP4ytYlnuC+
	lfK+eREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oPm-000000046FY-0FiZ;
	Mon, 21 Apr 2025 10:30:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9b-000000044DM-1LtY
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2240b4de12bso55715535ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230411; x=1745835211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=GIJ/Svha4Zr+vaQjx42Ifa2gDpeoKSFy6eWniTSiLZlmnu+uupYhpahkvxcbsK3tHJ
         cvkkNkVScdTORt+eBHckFq/C3tk7xPz9/3WVl0HhLyGUkp4UtwxASsimqjjTwcyJPz5l
         stxkdUCFQCjBnzVSPT2Iue3mCLMl9LqCaAQbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230411; x=1745835211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=oO8Q8G6hPP7vZRo6mdqo2XPNcV9zcG4/KmRSRqt3gDXGVIDJfWxORlziILIYArzjde
         pIBxT09bF9Y0giedgK2+3PlBShFmFca7CNwAbRcLBCUUsHYNkoOUy+b4o9vQoedZ3n+E
         OrIyIGkCKj4AjmPH0WeOwgZorRjuAnhpYWxrZVtQCKCrgrCL+TWRhvqYzOWA+zrsMXis
         PS5W2xHNvdTRW1n+oT0OHJGcDkOdfuKeGwjcgPUAnemv+EbXA3tbrFzUeI/IZxb8XwM2
         ywgq9gQNT28C7umbT+noobCvVlXm06v9HpW/CJ6+wXmi3X7wc2DbQgDpUhTRKylV96ak
         29Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUW4RXFrjCXKdcXWEdB1kEC2UB1syAy8aZz988X/la70IRV238DdEyj/IaQa6HgfO91Nwm54iLDWHPcZw7aWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxrZR6YhQeJ1AMtYSOmASqpn4ck+t/c/B/OQZ5T/wZBqt5h4gR
	i5bpUXj5ECzSxXBk9cQqUGZkqkInKWbA3HjRdzjzxeQ1YP//EcfPzB0iLam5Tg==
X-Gm-Gg: ASbGncvETfmBd8DmzqXvQm6CLCcXbkkmPR5vxcGihBlrI45DLScRcGyN3iXO8cGEHfk
	duagKdFdFhO4aQRTv7To69cldtMGd3xxVM496ac74wdjf6RYkOZbNUpGs/LPnxSiNArIHw5//vA
	tS1tm/ZE2qEEdkrcHL8r857mHlqpivs/DkdcntaZzBk9dI0TxAKVMSiEQjoGJBValn/RFBpt8qV
	VCEKqKYGy39sfQBshEJxq5n6Y1rfxY5YAUP9+havnu3cvdUK8mO/ZiXaWWvz6Swq3f2D3ajPD3F
	fbszauyfMgn9Co0aO/8NvD/Ok0kU3fcr97WwKaxRJqzpmIH2b9u6J3dgkoU=
X-Google-Smtp-Source: AGHT+IGaSj2NjUkLJYtvrXbaniU4ZUkVXBRJQywqY5KHy1I4U9ywfY/tOoiirvNsMeMMe1Zel8Bsug==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr159468475ad.24.1745230410702;
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
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
Subject: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Mon, 21 Apr 2025 18:12:46 +0800
Message-ID: <20250421101248.426929-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031331_360014_BC96F03D 
X-CRM114-Status: GOOD (  11.47  )
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
index 10dbaede0541..f3cd612e5584 100644
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
@@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
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
2.49.0.805.g082f7c87e0-goog


