Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC9BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUGzP1t9Gta8AcQElPeRx7Ldl4ob+d0gDQH5kp4CXpA=; b=eImtvTpaOGnsXZbIg8JDxxT7rt
	SCz6jFusA3VYDF/uGw6Svv1Lx3uIK+7xtrZRn5oPplyDmBv4JfyOFga+3tV6DZ60b9nTVS0YUnK62
	k0M1ibPW3GXN70Cy9cX+zEA2Vbjglz0OhQtiAvDQ81hI9lgORXKL+OkZSPs7a9odBSu5M1OX6/1Kq
	dbhD+f18Im0Z5dpClZ5584ocVgWl/o9g4p7RkWM3vVvz4TYRR2Od1rYJFfNzNiqeZZZ8T0kj5LyIv
	reBepovidZiGK3FoRtQkIOKtHk4yIoNbUocg6HYzn0N4nHRr4EMB8VE0niYAH8AeHqwKQNhjsx3AG
	VQN6NkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez1P-0000000DQHp-30Ci;
	Fri, 16 Aug 2024 15:37:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvy-0000000DOeu-2jaT
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37172a83a4bso1039659f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822329; x=1724427129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUGzP1t9Gta8AcQElPeRx7Ldl4ob+d0gDQH5kp4CXpA=;
        b=ieCdHlPy7KbzDBYYeS+oTF9Js41VVVS+MZcxka4kTWekR9hjhrekGFMJnGAUp35QsV
         1VgMSrDGpQSLf5oDcyMrzrFMgprBLioAlW5R0UVauhWxm1jpDINFXe2Agmxdxh8OShAV
         5slxLwMuhqRqUkiSrc8i6IRAfdARhX5y7/WATrt3SG3pERrodpXg7pLNwiokyaEU0+xS
         HxMobDMml99owhblBzgxly135r20kYmcIwTjMhrJkiHJuLZSPka6R3gHgzG06xHlmoiw
         rTkMigKYSmeLcARdFARz6EVW9r85QSg/1SEiIlvaAbjbpALu64Xc52AeTer9286SyNG1
         j++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822329; x=1724427129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUGzP1t9Gta8AcQElPeRx7Ldl4ob+d0gDQH5kp4CXpA=;
        b=Zqh3sUMlm1Gka2PW/cMy+KAY/QpfTScjUSXn/QseDRKWn93T5E3YVfbvzwkwjmuUu1
         qRkjXyej5ydzeG+1x8yQeN1BvVpZw8cwmMGh2hB2uS9MUaehJYV3BLA1PxXxpawPDzch
         FNLMwu15xU7TgLGo+wiPwMHXpTA3fZlUSwltV+F8hB+0BHSZfnQdgcpipBKCTV3zU0Vu
         GbAXuxLXcmA0QRuXGIi504MXgH2iA9CuJs02tVhCol8SY/W8ZI1rrm5pQl14KHjHC/vS
         Q0nhhB3RFGy1DA4VJCv6WwP6HHpSY/goB2wTBKNZdqZPoCEN1RLMGnUv+nKgRar8a99W
         +4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXpwQVw5QztUMofnP5cGP8wl7MYZcbLZF52FICC113iLCsISJeQdoh9cC0zoVwnCjKtD+LkZMxFM365RsCBYtJRbaLrMH1G8ywV0fMCdUH3zjd
X-Gm-Message-State: AOJu0YxlRMy2gQzRwKrQyzstn2Wr5JXVCXVfskGAfHn5h7+IX/5IyqDY
	AF9xJYK4DYsF7O8Je1PbavZ8o17tJ+yv0x2QlbqriROJgJoqJaU3woRgXhDCHyU=
X-Google-Smtp-Source: AGHT+IGhEOtCAhmiEJzyM6rHhtwOV8c0tEKSFIqBbM2oY0Emu/CY0p4z+M30teYyAFMwJF8/lsh8kw==
X-Received: by 2002:adf:e907:0:b0:371:8f32:557e with SMTP id ffacd0b85a97d-371946a48bemr1879100f8f.39.1723822329270;
        Fri, 16 Aug 2024 08:32:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:42 +0200
Subject: [PATCH 10/17] leds: lp55xx: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-10-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pmrGUTEyc4+OdSgnYm2SLaaXl8kY77CCNdxnjrRu1fY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DhRHjXK+VVZ1wGfuTNvr54zgIfsr6GoeBrH
 1NeN/M93z2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4QAKCRDBN2bmhouD
 1/ByD/9j6wZL4arhQNjD+UFfZLKCUSB+07X+VLcSzVuP8NTqtzt9JdzpwATyKwe+8mx4uaDZxsb
 GyCQxZBMeiJ5WyJ0GIhCw2HIc3aA9GoNieEjdRCZvaDvuh22wl5qUf5h9TBXcWlOP8nuX12gTbW
 VO79LyvYiS6Wcwfr38fhMxmCImw6vRxdBXOPdyJkqaeR7LptXb1w+5/c1xXHnd2D3xDHZhLahod
 QGtHiwJrNTQSZxwK8V3o4Sp+GG7KRxXMfXxsXxC/0LP6LMxe8NvryP+/ILF99EkLvjFEb7cAI1o
 2Yy/dUh36Wnt2bPgvIFZjQDGPLcRSNGjvfe1XaIHeoq3dNte0b+umeva9edjpAGZw3IgKOe6R3D
 CEzVN2rDv/DbS8biy9Ru226n+ymrguhAn12JQSErEnQ/Suw9+3NnXjhNUtl2KeSXWhMTeKaVcl5
 bJ0cDPBAehRG+k+e3ERjKnM5USAn9Jfgv7mRXpjdRCKcFBvNQ/0lnEA0e93da9h/mbXGfCAsJHe
 rxMoQ3aGihwQ7gGOAce92nHK4uyVHPuOj3UPq1ZoAnPjup8U8p3xLhNBj0Rdhw6TnwiyHdfqluv
 aivLqNn/0d44N/vgtlMX69I0VOhGgC28XeI05p99ukmU8CUtzwlQUZKApdcBL3wVj3h63Y5NejQ
 9gCn501ogVJCjxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083210_791329_73A2EA7B 
X-CRM114-Status: GOOD (  10.36  )
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
 drivers/leds/leds-lp55xx-common.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 29e7142dca72..d493b31c215a 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1173,16 +1173,13 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 				  struct lp55xx_led_config *cfg,
 				  int child_number)
 {
-	struct device_node *child;
 	int num_colors = 0, ret;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
 						   num_colors);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		num_colors++;
 	}
 

-- 
2.43.0


