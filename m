Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4FC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpSzvs+nYkevHrGD0uZRXPPuCA8pLPFmiuPfAoAZn4g=; b=cpS5t+WrW65Gm16ZC5Si0lAelu
	bhRhYDzZSozEvNDpityQ/W69g5ARriXgusSw3a6GslqwsxB2QytsGv4lzwvv/b5rBu/kOk1JyC3kF
	eI7GbySFkzhA++Ph0fEewGduY0yZ4k2Izeg42KZZ13yZf38vmLiQiC1SUqGW5nzaskJj6giIa5EtW
	RBL+IM4G9uo/qYFcNY0v+NOxUM6lrP/47O4efwv5bvbh9kic01V9Jrfp1k2knTG/cjySryCnzGp1j
	OYaF116HP7xYgWYmVaK6YxgBsNDX9hTdhasSVQOCa5M8q+/jO+WDhRP11dum0OmDvgmeDjsdJ7oBN
	M2FQeY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyzf-0000000DPtO-3mQQ;
	Fri, 16 Aug 2024 15:35:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvu-0000000DObe-1JH5
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428e1915e18so14753115e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822325; x=1724427125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpSzvs+nYkevHrGD0uZRXPPuCA8pLPFmiuPfAoAZn4g=;
        b=TQcU6EaD6pk2SY6oC6R7TsdSKhButPVlNMzbvLElpIqzdm1mM9tLGtNrBNjTmmdae0
         qYwIgGYAEGq3VlMEyC2LsSKzAD6ut9Pr/OgPXojbFr9A+Mnw/A4912eVhmcJC6KmcRdA
         Y657zzxU+zxyk7ajeG2IUGjL6bYn7NgC+kOGLPv2IuwBWlKEIW4/10QEgMDjK9+O8Sy8
         u11lZjFtxCaVAB6EhCmEAE3I+X6rC9N4UewFSpXSQQelJZs80cxdUycLuBQmmxu8WSUK
         pTAV/wwakgJ/uCpm2XIy8UgB6yBQI3bzNtOPCYVNa0E6+TuE3IWIOGcbI20I+fflpddT
         uFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822325; x=1724427125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpSzvs+nYkevHrGD0uZRXPPuCA8pLPFmiuPfAoAZn4g=;
        b=XsDFxThFdkolrWFxvZX6nd9UmbcDM5VEzxvZzZn+h70OE9WmAasKrS5seRdiP66oOK
         NHS6PkXFYqfHCIjhkvTpEd5/qs4po9QYaEz67pOooJjnH6JyUVHCw+ekyBW8eCy8+ESU
         cv8cvketeVkywb4JgOqJmeDu+mXbl+kFttssnhoDtQ+mLz4IsmJMtVVLlKh+fYiRKTQG
         1RH+pi4dKjnYSjb5LLPbXdaEEBPhYLriPTzkXQed7pb1sA5uSGug64Z9Q13jpOsKH4lU
         xHqFu2DNI48huXlGemSS9184SoIFSISV5vuugIq2VYemqRIJXGYV9mjSmu5t3oH6j7u6
         FWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm5ueto971y1nUiI0G3FNPAmAYUUdJTc7WcLZiLl3UGhuRUMOXK5r/as0/2/0MfwkdURv3gL/tvajqCFFN0lLcowdMSOXtOvo+p1CRiQ9J/YJf
X-Gm-Message-State: AOJu0Yy2VzHBtKXb/AHVPGbUgesENP79z6c6glG0wR86HPhMDneS6SR6
	dRoCeWBOccFsilOMnoccI6y/vZVYjgpfDp7OAUHP5oBsq/O09sx7UUj0icQj+BA=
X-Google-Smtp-Source: AGHT+IFIM8SM/oUAoIoij6/+F29yCUYD7CkGrKL1zCzaVxOUpWq9yef5gSYP4cevO1RzYy6a3+hjag==
X-Received: by 2002:a05:600c:3143:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-429ed7e43femr20311845e9.30.1723822324872;
        Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:39 +0200
Subject: [PATCH 07/17] leds: bcm6328: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-7-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m6Hk8gKMX1w5RtMdLACIAQ5rXDRi8vsYTQoqOdYtge4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dfttu0MwP3EZEIzlwWVIzETU/wM+a6ZdT+U
 j6PqUtmWHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3wAKCRDBN2bmhouD
 147yD/9gLAyT7CaUKu376rhokAa5nBq87hnVOfCdhHEcAQUegVx3PHvtzhd1qXPs+duPUC0yuV7
 Do3NvZOVUcUJRIHkBt/UXC6hUR1sJBk6WXUjJOkMj46EOuhLuwpwzLoQt/oVR4u2EO5i1FPOoTG
 D0Dl3i1+iWU8Fp6BAqYuZhd+e0lDEfaAkO9dSIEli4r45FXW2ljOBOky5fHTOUzPo4GoPRatKCN
 OrSd7SNZQ+CiOMREI6sEwJ2HVPu3xmcMAXas9HoDQKcVDdf7zHek0y+kxMU3cRX3tg0ApwR6kcL
 xJqDIBG2fUDG1RyLrMwaSe5nd6+NjEfzjRUQz/BuVkLV7WLafu1R23us2RtQlVzaQfzrnKou4hC
 6jGSuH5a2I9OqFbVh2AwwM79Mfl8xHFEqwPrn0OaC2kKNOLrYTatVf199VGOzrcLbB218zt9LwR
 BRVxtpUk4zm56QgpLS6AW9O0DRGBFsSptO1UFHbsMQK170y6mJaNERN8RnkRLnN14EPw+y/acbL
 VQ5Ok6Ek8WU/LdX4ct0HkFJfcfaV72fBxQ2HSJpQoV+cXp2AKyaznPx9WMLwOfgT1NkS3j+Oo9M
 5CTDWkCmklwcwRPvtNc5/dwJlXbY2Z/WdKS0zlQ6LOniVJx+yMLFFPzOL8+9HuAg+8jbU9MByx/
 5SnE2hJywDwR/8g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083206_391635_0CB5C69C 
X-CRM114-Status: GOOD (  12.67  )
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
 drivers/leds/leds-bcm6328.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 246f1296ab09..29f5bad61796 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -392,7 +392,6 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(&pdev->dev);
-	struct device_node *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val, *blink_leds, *blink_delay;
@@ -435,7 +434,7 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 		val |= BCM6328_SERIAL_LED_SHIFT_DIR;
 	bcm6328_led_write(mem + BCM6328_REG_INIT, val);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int rc;
 		u32 reg;
 
@@ -454,10 +453,8 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 			rc = bcm6328_led(dev, child, reg, mem, lock,
 					 blink_leds, blink_delay);
 
-		if (rc < 0) {
-			of_node_put(child);
+		if (rc < 0)
 			return rc;
-		}
 	}
 
 	return 0;

-- 
2.43.0


