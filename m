Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DBAC83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=; b=NivBaqo7Hx2fwpwSkwosWKrcq4
	2SWZ51jcd1lHjbsOglvqXyvRIOWi7hoS2hdNopGMtVseyQnbkNa+cRn4bmY4/NBXF0KZ41G6D98jO
	xUty7foCovd/02SxHwKwWWTGSjnTwRS2akDhHpbKyQ9QiEEnF9mq3hjG2ECw6CHIFfb7Desq2bUon
	sXvsRLyqfeJ0coiHNP09cLAVZjrEqweHMln39eWejduLoRLN5bZimF467PBuCHUoveTHeEp360HFG
	dnw3Yd8VuNstowkxzWzyvbnNxO1d00mBUGU3Hkdgdy66qq4v2DrDZO2HrGhvCFnvS+cWaGBkqhoQG
	vwjef2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXsa-00000009L1P-3S6g;
	Wed, 09 Jul 2025 16:42:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx0-000000090co-2rMY
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so42728265e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071949; x=1752676749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=2myCz+W1+f5W8lKEIm8BqZG7JRGOotujkfPFlWHb+2R+rRZI4F4Wb61FT59+48CiOe
         fP35lCclVkAu57xhf/hqIXs1y1wMywM0cfKkkuYw0+9Auygm7cv7Jk5QMXnedq9D/9ep
         /5E/wPf5ijoZ2P/k6Hv+7XOEF0yJgQtwsu3VLcZzt92PHWL9zuKNG/rz2IjVrbNjvhuZ
         OD+1/KWwExFUi5cA8XvaBCtLtJpzzB2jvpaHnGZiyeK3WO1jc4Rz9ZXTEyx3RNt9duYh
         pEmze2jcVdfxNAFYfRnH5I49EhYzCPUflEe5UoA0SyY8rERuSpYZzBRz7t0DT3ARV3cf
         Sjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071949; x=1752676749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=EWk2BOVakFiJcQMS/Ykn72/cepDkW7hRz7vbvYJQs7p1XbFKx0v6/fmAs3pMyedV5M
         wxIXrU4ADQDEDGkbAXvrDIxuhDPuGme/EaBZfll4tAmZ5aGPUSBbN9/bCol6C4e1KUri
         CVP6j2dpskZeqnxbUO/N8B3TUb8egLoqy8g8+E3u5X2FTSFPSxrloysV6nQHddZvFizz
         3zgzcQN5Zzz31viJlsgKkCY5kJ6kezc6/BcC568iY5z/BoPTUx5i0p7/bQaeW3rYYeTm
         GTdtmApLgk71OVrEa0+KBU9lBPlO9DpSq/ymnyojM0XVlLRBzjsGCjy9O2sygfb620HA
         Re0g==
X-Forwarded-Encrypted: i=1; AJvYcCWGzpNEr24lb81D+P4KTQ70esQ/qeQYJ43hIgPzA5W1sCqAu5dNKGg/BKG6ru2FLAP+ghwdb1dXFyOZm3vfVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSGWLwrHnINz+7OfLTA6Ytq2Yna3cJo1KFvVUDOXsTdJQJKi+u
	vk/XkE8gDyOvDQsz3zmzbqw7CwjzUyuub6WBJqkSbFm8ZcYhtSvqePY8UFHAWzwfARs=
X-Gm-Gg: ASbGncuvVYGs42BRsTfXzfhi2bD1Olkw06G6G/ZmIAKAjdku4SRYir8LoCyuVdf6f3m
	7QUDcOR9GERhZGFgXGvl7z28tPxiLBqErLGW5gtTDQ4MWY0bYIJMV9teQhWW7HlfOAv6WjLTS4N
	4XUsIHMJKlw3tkUXlMWw6UqNRvqO4tm2UVlGvPslZZtwh5McOUYg/z7Dw9FxxlkYFBOtX3F/u6p
	3Xf0PLJhcLBNNjb52cDQGpDZju5m+gfqiyFsH48r0MIyNVN9kStP5NbE3gbd+ALTNnH1XwXDrrr
	3vthlA2rlIJqhAvEsKSNoz+YhxLWu69t6h7m0GDaH6+YzeaxvX0+dhI=
X-Google-Smtp-Source: AGHT+IE6NMT8AU0DhDolK/XWo53eQPrLka/DfBqPNyEAMgaeJcAfEF6E9CWaG3DlW1jsKrQJbwuC7w==
X-Received: by 2002:a05:600c:8283:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-454d531e30dmr28684405e9.11.1752071949388;
        Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:00 +0200
Subject: [PATCH v2 04/12] pinctrl: airoha: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-4-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rKcKJn1Qx0kHHaw1VaKCekJy/+IGPmyQ4RvXCS39j7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GdTl5YXFsCeDYLha4gAdNaEX6nu2Jc2+H3
 AtDWXgcKYSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 chDJD/4mFFQSQ3h3fx9FaKVrlxP9+ULMx1/F21EFQ4FbWcejHkUr+A27uUbvjD0SeVotV2hsEwl
 y5eIU18s7rqRwmHfv+ity7vh7q+f2/CsAOliBpxT/VulCk9hCOOXYfUAiu0T+FY+OzmHcrFljRc
 V9Xw7/3NElwuW9HnubydN6UfIjfTzl0hUTI5jWFEcZJa8D8/Aj2Whjyqxe+xADQ/nNsPgqv37hb
 4R4rUW5SrsT0GtwFWe4K0Qx63TvQaCaE7Nnr5X9KJEgz5T043avHKO8Ba0y5/3xzyLlay8anlOt
 ojnv+CFLjFLurfsNNsQh8g8hFPSMjCwsSO7N56kFi1zcMmnVp49VrX45Q5zpKEjj7NFZim7+Ijy
 PvjJBPnFKnqtQKIwHzjuD/5DgMq8/z++68wSKuQtNYpvd7qP1xXbzgYV8DMTpnhN2EpJUrfI8TY
 VU57SI29Gcg7uzB4RKWIpSNVccHWLQy4/a2/2br5LXlDiCb7psNrtfgFl3HUNNSViDYCP5PbuTg
 wJtJTmj52RnDKV3r3BigVIEWtIiHmmS+muBgJTekYUkNNELPCArpk8SWwrUOC4k4sG5VnXHZZL8
 pmTX4FU7AJ2XMg7cFQCCcD+00kOFH1Ptgyz8b9Kv67RhLqku7NPnmvE4SmywsiVG9GcyJxaScau
 jL8/WRSxmtcknhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073910_731236_7D630764 
X-CRM114-Status: GOOD (  11.17  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index ccd2b512e8365b3a5af0bb223329f39119bc7078..1737b88530c385644a360e8abe583416bd6d3fe9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2907,11 +2907,9 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 		const struct airoha_pinctrl_func *func;
 
 		func = &airoha_pinctrl_funcs[i];
-		err = pinmux_generic_add_function(pinctrl->ctrl,
-						  func->desc.func.name,
-						  func->desc.func.groups,
-						  func->desc.func.ngroups,
-						  (void *)func);
+		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
+						     &func->desc.func,
+						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				func->desc.func.name);

-- 
2.48.1


