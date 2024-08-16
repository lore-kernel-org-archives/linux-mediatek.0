Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A1C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4o6NVK+5RxP9AE82dc0tQeAqHho4Q+RR5k5EOL8qCE=; b=gq6xe78TQFwSCEDGARWCV6Sdg3
	ur5hLIb8aiWzNQ85AJZHlu34+1kxTeCHPfeUt1GCswF8jM6QfmkgsJQnNmU0HZBwhhTqGpIrHU4TP
	Pt8LlXvBENtYk184cQUV4FxKme8WCLpHZLTIyzKdu0VSlYm/P3dyqzvquhUQUIXptqPzufDHfkSmz
	a9CVCPujrAO0RjSG8s6wJ0bFZF9AzpS4rBFFFeSLxT+qFDRZ64ouY9MJ6nb4M+6RHk+YsSR2x4HXT
	wSkiviRgfJ2KYQqSQ4Bddf1tCRpyc+pO2VGzgwC2AhWCnUJWSRm+ba6KnyQi40bx9O8J0Jz3uptKO
	bvBFY0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez5B-0000000DR7f-2CFN;
	Fri, 16 Aug 2024 15:41:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw7-0000000DOkB-1WYC
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52efd530a4eso3409263e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822338; x=1724427138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4o6NVK+5RxP9AE82dc0tQeAqHho4Q+RR5k5EOL8qCE=;
        b=zdNSQZPq+sg7oSjKetLbyXH+I98NHd0t2llUatFbrQvlwq9B/XN/IOdzrudTIHLXTs
         P+3ghVK357MIdImRhnFk/FHSJqxbw7s/Tk8HDZQzYm85vYB1SvRWcshpUldMO4SONS2e
         ALk/bLoERBb7Et0dBBVCrUbtVCkGc9TymEU30pyKLjb3MylyANoXQVgERFomSrO1gCfK
         v1oiB0hgbuqBIV9CAB8SgMfgrcqfRP2kSK7bIgPHcKcsEUzu1bYXG0j+4Lru/WMlGsgt
         s3Rk698cpvZGHOikMHFk74shbhYGwbEchXSuZVW4+0YW17tznQmincoeQ+N0sh6D26gU
         xPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822338; x=1724427138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4o6NVK+5RxP9AE82dc0tQeAqHho4Q+RR5k5EOL8qCE=;
        b=PFjYfKmtcZ+QtnDGrAuJpr91QVpafmGLEDOSnfA55S69rNWWnmrRgs2QueZWJuJNgs
         3MVlyUru06AYp8VJjfLwKYjRcectdfO8YtXewtFIdr4OokSbPiL/7CPO1aOdFmlws7ae
         /MRszkj8hsrEQDDdTmbgDk0wo/J6vfZxBZkK0YpIJJW2A5JKgj+WpWGBb6iiT4KguT5X
         D6RNrBunn2rP1MWZ8hiGVZHdD8z0qja8u2dVWaR20bFvdVWkxq1wTHBMU05O/FzC/RJD
         bioS5Ptpw/780mx0KIKnuRGPQEDtQ6zwor7cK+SU6jHEw3bvQuKSxtXtlFpq5SblLcHp
         FfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB4QtJtPb1Yk2oQhDP/rRkYTa4gWcHimrwOGhKVh9OlWa9J9MNyu2PHiCeP/50INOeLPpxsY53UR8ZD2icQsoF3mzFdZ/R2e0GWYbghToZL7wA
X-Gm-Message-State: AOJu0YwrcgNYDOjvmyjMR76qQmggGx5cfM+85BECo+Moe2dSzK8QRZab
	+ZiuHlcwW5w1bqBP5tEZG35zLSB/5TFLHJeso4GhFbwtzFGkNR7y/+xopDErK/U=
X-Google-Smtp-Source: AGHT+IET/CjplVHoqhJT1dgGbpnM7bOR/IOJJFLcUpaq7hdaaWtUXfMeQ9ArJ1WuxrwkKCsQRRpLyg==
X-Received: by 2002:a05:6512:3d1e:b0:533:d7d:a34e with SMTP id 2adb3069b0e04-5331c695987mr2342012e87.7.1723822337538;
        Fri, 16 Aug 2024 08:32:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:48 +0200
Subject: [PATCH 16/17] leds: turris-omnia: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-16-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HqurU8v6FoUuPIeHjxpMhqt9yfUTtSWFQuHadg1beqc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dn/4FodrZqZy9l8ymKC3RzvyZz5qUjuY2CL
 I8dXCHswfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5wAKCRDBN2bmhouD
 1/k9D/9UMNk7RM3WQGHAruhcdLJVhguE7sJuyHNKcv0JiIT7rLqrxgI0kl0TXtijoBLQifUtmXZ
 n35/z2TOA0jMGVqDPqGfeNVLVubMwH2nrI2Ni5HcdxRIcVmOI5Qx8hGIAXD8y0+OJYkM+e9+MMW
 09hTenPhrVmvb8M7YhycHH1JSDV9cQj5pWdYrcf9X259N9O2dQzVfpdI4UA9GtQqSNLEkbuW9Hp
 y74zqYk3zBvM3xAlvg43roVpp4MqjH45PtJ11CNOOpMNAVh4KO+73Sx7Y/Zxhc/iHv18ky49WfS
 lGjmWX7aYivBbwfKDQrc1uuJsio9CXHKui9IFVREXod3XAW8dFzQmBJhlmrhp2ppVcf3wqOCd/g
 v2zH8BG+SM+ulHja62+nlUfuD6B6vDBpNLRKLkHC0jKuhUb2yXe4OFT17v8Vwkzs6/t0vCbKIoW
 idbzDQf82L1WtL+yWv/brsico0O/8/FBiODTt15BMAZ4wYOG5YrOem6kGbv8kSxea9vP+S7vpdO
 9JpanPlCJQ8Z4xlCm3uumDcswywrJ9FhFvqonNLpVQfBwk6gcMt7q1GkAsIB0P6LjEgEHgdm3qD
 ZGlGjHkSWXHGIFYWFg5IYbAYfEzX3nOZJAkkSKxMA+DQOjYqzxql8WnOoHOeUfh0p5rdk1Os5pI
 C3oB8c3EPtY7V/g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083219_434278_3EA80841 
X-CRM114-Status: GOOD (  12.45  )
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
 drivers/leds/leds-turris-omnia.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 39f740be058f..1ef942b5cefa 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -452,7 +452,7 @@ static int omnia_mcu_get_features(const struct i2c_client *client)
 static int omnia_leds_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev_of_node(dev), *child;
+	struct device_node *np = dev_of_node(dev);
 	struct omnia_leds *leds;
 	struct omnia_led *led;
 	int ret, count;
@@ -497,12 +497,10 @@ static int omnia_leds_probe(struct i2c_client *client)
 	}
 
 	led = &leds->leds[0];
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = omnia_led_register(client, led, child);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 
 		led += ret;
 	}

-- 
2.43.0


