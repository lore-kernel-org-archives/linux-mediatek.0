Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8577CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRhQyVKcgRlVjIYoZT+41pIKZJrgjINAhed1beNUQXI=; b=k8tw3/qyV07If+vPuM6YeP4o2D
	Lkh2EtzwWyxuOz1F81lbP3WuC6h03lQ0ltd2uVnsL/hqPcjte8+d+KmYjtPUO7OCY0c6gq0cVqyGH
	Ge7z+7sVnNMmjAJ2TbA/t37PRkGOUcStPuRs0CWXErNs0nf+9zzgYy8XhnNqQS4/NceddGKI5yrJ1
	zyRZ9XExwggUMDetlQYtfnMJrGWszOiOLAc8BtgAU//AfnwrdfrrC36ZUhGrABxSeaMgRX1iPCRrh
	mDQMcWMBpqIPanZrpnulEonnIWboSbo0ENrNm0ZQWg9Nu2kv/i/D8f9nktTtMgRGpuJdxMIscdmQn
	LSuY4r6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxr0-00000009Zxk-3kPZ;
	Thu, 26 Sep 2024 23:24:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnX-00000009YsD-3pCD;
	Thu, 26 Sep 2024 23:21:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so1905548a12.2;
        Thu, 26 Sep 2024 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392882; x=1727997682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRhQyVKcgRlVjIYoZT+41pIKZJrgjINAhed1beNUQXI=;
        b=EDLf70HBrXNElX2K3DSXwqPkY7Ol9vq+UYY1U6XDOInYVAVSyt0OSchzNF8H2xDTUb
         R8I/l/JPv/oS3XK9xMMdr8jLc5EZKbqoAsJ4W3KB2e1Q6k6K/dh8T2fBaFAzVOfehrs6
         H4yI5uWTXPy68xq0SE7qWqaBie+g/5iupOk7ZS4wiult0l4l0DqnafGJEXX8D8f47+eV
         ooFYkGZqVQ+tdWanAtGnpJPT51wjalGVnN3Cn6QTLaEdq946LIE6eBWRHyrhlOGvF88X
         k1jwsr/x89xk9yvl4HCwNODelFWRTyYqTzHGFOM5d7XSCVoolU6AEh4fWMC0NFvOtsNu
         9NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392882; x=1727997682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRhQyVKcgRlVjIYoZT+41pIKZJrgjINAhed1beNUQXI=;
        b=mIAbb8PBYi0QS+ItITBQyv2ubBDc/oBFsPy/kcvmcgnSatYiU6xi87WXIPX+Nn8z24
         slJjI+gDlTXfFRob0d/SxgqxxxzdW2morMh1A4JWTveNd+z7tlV1z0YLO+XvSjsBLdjK
         LL8FHA1TzWAV1II3L79rhBtyCXWW7qhvokAUpaQrLKtCfRMMXpLI1/aLu1tsa8a9VVZb
         BczvJ5kBE2uFOmioiWP3YIdtquxfveuldHiue+JojrigO969KJrtIGrET8uv2Hyg4gcI
         0Kt9eQB0fYKaFvVeEB/k5HqHDNGWgOnvg+HD1iz9ECauehk0DBQ6SXKL9BXrr1Lilk/i
         eC9w==
X-Forwarded-Encrypted: i=1; AJvYcCU+L0l2PoE3Y4MC0TCJIvf3Eo49xf88p4Idh0Kg3ppVm975f/jRFzU/e9J+RCvx+qMBkg5KAJUnnvrNW/B4uVWJ@lists.infradead.org, AJvYcCW3vAikN1SY/ewcimPzVYyC6g8WiE52NCUAZzUPLMF8OXsYhRGmt+u9AtTagpAq7Qk3X+bFpgvB8OjiTfu+8gI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQsUr/SvylunnphwjC2/3ERdVQi+2oFzFzJ/x89Cc80hbUgJw4
	JUqRqRUP8MsQEAMLcl7z/HRvXq6/N2HcUL5w7f+9x3DfgpBzjTCxe+Gs7fBF
X-Google-Smtp-Source: AGHT+IGd2PJRYpLODXkVXKvFBOHOE+/1R0umomGP/eN5VLC0TMztnCr42izK4H4rLnfkXKxJDXG3EA==
X-Received: by 2002:a17:907:2d90:b0:a8d:510b:4f48 with SMTP id a640c23a62f3a-a93c491952fmr82476866b.22.1727392881724;
        Thu, 26 Sep 2024 16:21:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:53 +0200
Subject: [PATCH 02/18] leds: flash: mt6370: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-2-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1546;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=da+yiLrVSVhzxfXeLXUvwNG1cBTZv5IPC9inOzFUOgI=;
 b=+HkfaGOfTwfbLA3hl6LrR4cqzOrg7pu6sEXSeJ1n0Dv/N3Wgj5+SYNtD9fefjVYJnlMGIaRy1
 uy9KHs3e49mDqhgLOoZkQSYwrgF26sZfTIiULhEDZkfR2xEXsDOl9l8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162124_026875_753CC1CE 
X-CRM114-Status: GOOD (  13.75  )
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

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-mt6370-flash.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
index 912d9d622320..dbdbe92309db 100644
--- a/drivers/leds/flash/leds-mt6370-flash.c
+++ b/drivers/leds/flash/leds-mt6370-flash.c
@@ -509,7 +509,6 @@ static int mt6370_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mt6370_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	int i = 0, ret;
 
@@ -529,22 +528,18 @@ static int mt6370_led_probe(struct platform_device *pdev)
 	if (!priv->regmap)
 		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct mt6370_led *led = priv->leds + i;
 
 		led->priv = priv;
 
 		ret = mt6370_init_flash_properties(dev, led, child);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 
 		ret = mt6370_led_register(dev, led, child);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 
 		i++;
 	}

-- 
2.43.0


