Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E9C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JgxLZXaOT7jTL6qyBA9SLrwZQeJRHeBJE8R6L3hV10=; b=NCkmRDPaqxaneMgwA+Xn/Fku2G
	1vs3mYoAXDO1d52LoekkrlOwK441uf7P1WmPkyfetDABM0vbbtRiMF9y/+cbURPRLdGk0pHoA6Tr2
	2yWUyRNeVJ3/OIuBPqHxPPJ5RrrDq1gFcsk52rqD8FR4SiIxc0Gn0LFMd2g1Fi2jtiGOTmYidt2Qf
	sw5AYZRgyz1SLUp+DuQIQoGw/96IJcxPsx4Pr8c7s40R7UKSjvBEZnVCYotpUpcOAntpdQ9aqp25Y
	bcuCRnfpHxULN/SRbUUNpPk/GuUMfQvWpbN2cWXN1kEYde02PH1CZjkxWDjjPkjiuF7F9ztE1D2UF
	u7R8ovkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez3v-0000000DQsG-2cpd;
	Fri, 16 Aug 2024 15:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw6-0000000DOjj-1Vbs
	for linux-mediatek@bombadil.infradead.org;
	Fri, 16 Aug 2024 15:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0JgxLZXaOT7jTL6qyBA9SLrwZQeJRHeBJE8R6L3hV10=; b=WVGMwX6sLcHsLsd67NQBYTzLLY
	h/3plkYCPQ1LN5ROAd8n/aPPHqpgvwcVIv5nSpeaMVYlZVwQOptmFbXGtdan/YSd5nYf8eDsE26C4
	FGocK0fcdW8YvDs4qFwHROiNXUeaOseD0IIWvQfHV8HCx4gZTIenQ1o5fhxRvpasPwp2fcOckKs5g
	0CxkeAYYhkmbCrEH8PIFhrUygJioXivIuEd+Y4j6wwRvrk2OK48B7JrzK1KXpONtXnGfKgABjYhua
	QXrUKkVYzAE6YwbRWtkuJE9eRk4fIaYWdvvM//NtUS9JtNZf1+6of51qOSGl0Wz89kdrCFpa2/kCG
	G2urogUQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw2-00000008hYD-3zoL
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-428e0d18666so14812665e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822333; x=1724427133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JgxLZXaOT7jTL6qyBA9SLrwZQeJRHeBJE8R6L3hV10=;
        b=boGzt4ZY0pZIMLdB93uz0Z9n6UsATCTVFuHA3/bnqf3WVfxb69DtEcTcC9hF8N+L+4
         Cpk8etbmENLgP1ImT1nac9FdMVU0Fl4+PZYfrB/NKxOlKH89srHMvA/EvGDwxZf/Vr8z
         9Okj1GRhniKh8TbG9na1oP8BjU7J15LRbaq0ismRm0X/P4DAQsvLc/z2fOmsLU6JSyto
         6eZVkJpJRrCiWP17i+8oTMTDquCo1BYitoPEuprT/aedV1kKmKldAjMXXPnTgoULArnF
         K7c+AKFHKLa5X5y14Cr+W5TVYLaqgnVNWijHPyKVu40EcjsgBmrnwl2sbh72O6doEv73
         cUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822333; x=1724427133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JgxLZXaOT7jTL6qyBA9SLrwZQeJRHeBJE8R6L3hV10=;
        b=Y+TuMQg6yXgNFrRAkk07ClnTup9edk63IIoOEsffTQ1BVO3Br9/0FvyuE58ZJ5iglP
         Yb2QSicft8AqMMcfX4I3BsmO3Lm9Uy6Fn/B7YsmZv3droVQilmIY+vqdobep7Cvi1ZF7
         0rQg3VN3Sa+kGBAtunKMa7uQHgYwWly86yn2E5NEqbx/MRBD77o9H2u6Ty7yauG41pPx
         KCs1o4JMMAg+p6rQh+DX9el2j3QKlyrufVBJfdGP8mYsu9YJPCYOUmS0/7qSaTz7prcK
         ZWr9AikZcqOsXNip+/ccTQhXC7GrGTel2S5XhnE6nXSbXor/hQGmnhGGLGb1oA+deSjv
         qsCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBiRmPloonzxe51E4c0iEwVIC1df2b2TzwA4Ib2WwYf30TtLf06dDVUUNyfBuK8gMjjIyteGmlDpAQHry3zjcWI8R5+Ybv8hhX5iYWeaXNkeV+
X-Gm-Message-State: AOJu0Yx6HUCJAuktBUi4VZoysm83wzn3x8VywdvHQJ4Y1N2r/ZoXaa0I
	WZ+R1iYqDoYGFpPlzBXBnX7vSgyiaaJkSTQ4rw6B4EtmhFUh9tjiWZdZGqDC7Ps=
X-Google-Smtp-Source: AGHT+IGEXRtSKYqMHdRXL9A0IVWYnjdiaFA3vVmWXlDDw3F+xS7fwXoLMur4GHVC1AGF3Jdg085/ig==
X-Received: by 2002:a05:600c:3b1e:b0:428:1fa1:7b92 with SMTP id 5b1f17b1804b1-429ed7ae3ecmr20377775e9.19.1723822333456;
        Fri, 16 Aug 2024 08:32:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:45 +0200
Subject: [PATCH 13/17] leds: netxbig: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-13-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2775;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZbpwvH2ustjiwLvVNFB7gNYO6vZKL2oVpGeN6mWbO44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DkDqyZck82XNzSXwocQQY4b+BjTR2I/skAe
 /0iaxSnekWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5AAKCRDBN2bmhouD
 1zT7D/9LA9styAbhhWAgbwLixcjU5nsbijFUo4i2fJCjHsFr6OI5L9kYopu/4IqvUkdsFfIoLoi
 Am8mhH37EL2J7Wqaa4UyyyDhl828FW+J5WWGorkvyeZub68/URCiLwlvw754aiqAlZvXBcUW/wq
 DBvZUCDT2I93vgdlaK8T+jaeqXFh/ZiPBGOopvru4O/IHC8Q3T/uKoAKcF/IlmDptsz/l127ml3
 Wj1RmTgWTFJ1fnpxd4gFo9bEMZ8NcmHpidcBQY8G8A82hJlKNJ3qqz5RXVPaySGdGSv/9YUF7bw
 rdOrzSpRB3vBzgAt9HuRDAdzaCZJRYlbW7g4/mDP71dpVRnDebllQX/BJhobp4h+MA+4ZLGFfET
 /fCp//41B8J4LrjD14f7Z/j3HXXGthuMBpi+WTQRXiS5QSRwzAjIYV13D+dmbCuzGPD8aMwAWLZ
 Vii9spzKcwv3Y20GxPQuHXVeIIY8Fp3lyhfwCO7HBJbzmUi9sKfcWPvjKzFIpJHodgEt/L34942
 8qp2LY/qUq2KqrGKhePZtJW8D5tfXBrpDWpVZPb2zByLex/FttuvcKtjzvwP1q6pf2J/MzD8ba9
 QJbWLFhD1zPgxo6X+YG9IePLDsz6HLk1vH8xbfu8ppnwbToivodXMGG9k78U7yqj6vG2S4ZjsC+
 neKFv1FiAciy6/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_163215_181063_57B65088 
X-CRM114-Status: GOOD (  12.70  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-netxbig.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 77213b79f84d..af5a908b8d9e 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -423,7 +423,6 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	struct device_node *gpio_ext_np;
 	struct platform_device *gpio_ext_pdev;
 	struct device *gpio_ext_dev;
-	struct device_node *child;
 	struct netxbig_gpio_ext *gpio_ext;
 	struct netxbig_led_timer *timers;
 	struct netxbig_led *leds, *led;
@@ -507,7 +506,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	}
 
 	led = leds;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		const char *string;
 		int *mode_val;
 		int num_modes;
@@ -515,17 +514,17 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 		ret = of_property_read_u32(child, "mode-addr",
 					   &led->mode_addr);
 		if (ret)
-			goto err_node_put;
+			goto put_device;
 
 		ret = of_property_read_u32(child, "bright-addr",
 					   &led->bright_addr);
 		if (ret)
-			goto err_node_put;
+			goto put_device;
 
 		ret = of_property_read_u32(child, "max-brightness",
 					   &led->bright_max);
 		if (ret)
-			goto err_node_put;
+			goto put_device;
 
 		mode_val =
 			devm_kcalloc(dev,
@@ -533,7 +532,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 				     GFP_KERNEL);
 		if (!mode_val) {
 			ret = -ENOMEM;
-			goto err_node_put;
+			goto put_device;
 		}
 
 		for (i = 0; i < NETXBIG_LED_MODE_NUM; i++)
@@ -542,12 +541,12 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 		ret = of_property_count_u32_elems(child, "mode-val");
 		if (ret < 0 || ret % 2) {
 			ret = -EINVAL;
-			goto err_node_put;
+			goto put_device;
 		}
 		num_modes = ret / 2;
 		if (num_modes > NETXBIG_LED_MODE_NUM) {
 			ret = -EINVAL;
-			goto err_node_put;
+			goto put_device;
 		}
 
 		for (i = 0; i < num_modes; i++) {
@@ -560,7 +559,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 						   "mode-val", 2 * i + 1, &val);
 			if (mode >= NETXBIG_LED_MODE_NUM) {
 				ret = -EINVAL;
-				goto err_node_put;
+				goto put_device;
 			}
 			mode_val[mode] = val;
 		}
@@ -583,8 +582,6 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 
 	return 0;
 
-err_node_put:
-	of_node_put(child);
 put_device:
 	put_device(gpio_ext_dev);
 	return ret;

-- 
2.43.0


