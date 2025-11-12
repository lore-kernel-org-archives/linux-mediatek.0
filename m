Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FDBCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=; b=GshVFrF1kC+Qn2SLMGlHDJgJs3
	2lJW5zBysuS7Lv4NAUJnKxn6MDSvVN8wK38bhMaurr+ZRRSz2vlgURsSTpBRtwANlJ7kN0MlffNOL
	6MccbRf0BroK4UaCJoWmJbO8WwfybgykcnYVAKOpBHKE0Yzx2ht/vsxbC29q9wrtOrZICJcg3rUwj
	zW593CV5qwwMFARdQpB6/8AXzCSLEGrEhuQQkisBWHL7HzFy/1CP/zhdPwNOHUTepr0cnogS4b2bz
	31nuEBskgQqawjk2ak7VHeP595zdvi3FA31fBVxCn3sETUKsOnsNWZKf1L91/eW0Y6EN7Dgn6Umad
	kCUok88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86H-00000008Z3q-0jbq;
	Wed, 12 Nov 2025 10:29:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86E-00000008Yyg-2D6C
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477774a878aso168845e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943353; x=1763548153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=NsLXBjzQywn7SUG5ke/GktyC5NwximRV9720ZII/PzgBt1gzr+a3oagKT93J8WV0Rz
         qildrcJcvazmm92MkTC3xbEgJPI52/4aaTc5oLimnWnnD9nESIKoKQY5VAUyuOax7q4j
         zTS6z8HQAZhdS8+PL696OMWmJePGcdAlQb7CMKeaqzNRYzcKyHAZ8PJiU/lB8tEhX5XB
         k7BweQTE71j5kBl/+W0nSeph2C/RwdYT6OslozUP18sfUQzieUHhqTWV3e4s0vfIKgJf
         7j0OLuaibkZepLdgHCxRG6oJ/DnMUR0s2bCleJxRXfNn7D+yETmMj8ZCqEG2+ESO8PHX
         ktmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943353; x=1763548153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=plTxRpcuVGlmSM32MYNHfQvN6rbnTzSui1LRH9tc0uWUlYrTvZIC6ZJsMi6t8fkoHZ
         GRv/jTiO210whEbsM1oUveHu6axfvhIKhgESx8eqnX5k4gRziVJ4CyjhYPtOHvo+O+EG
         e/Ac7rdTYruLaDTL4I7DzUX9sbokbqU4nyu0KxltZ6oR9sFvNrTb3eQrkJyquH/+S+zc
         vyBpINK0K7qrWU+N33FD6IMiY2diE+1flvzVKzxBCktsH73Qoa55HQdyvdVBGF/zXHhj
         BxygE0IzFYevndYWWLdWLjh9LZxrVa/v7MBnVLs0N9q5349vR4iPlaJwOFkqk9vC3NVw
         4CVA==
X-Forwarded-Encrypted: i=1; AJvYcCWzSdyVUmKKZvFx0329v6VX4Hk4Bro7jzQfxw6TvmNPLCHC/BUIzbxVh0SMSSPUl6dQSmt19QNjapOQMoxMAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX5kTLrU67zwiMj6TJMD/FqD470FrpYsbzRXI6PVLlZAGn7fco
	RbQjDbPmL+BuZJewppWa+GMSzOwrRaQjiSjgu/wthJHnQY+dBNJJ1Nrr+dBtxxT+YS0=
X-Gm-Gg: ASbGncvfVcd4I+JhIBIY3M/bhMTnH8W5p7qZsFTHA47khI2MBvwCtdARlbH2zdnZ+Yb
	t/0WmQT2Cp6uzuwy9YwtGoWzXXUJxm7FjJNk/7kp3xR9yMJtWjazUqGaDJuEd11LuUsi5hB2F4V
	AqqImoLCMqS8/P953hzUWt3ibRl8oFRjqImJJzLDjuhdoL/DNOg0Ngv9doCpZYxIDEazUYKzJHL
	PWt+QL14n+ty1qlfULIZR1ZEjHjw8vqrF8KtvMHQGkx1SHQ4qkfjGlNF3LMUosfpzhyB9NwpHBH
	dP1FDHNiXxR+xv6CKb8T4okRAsNQ2OyttBDtzjlaAG1rh1QZrYu2WT6yc1tPMthE2PpfqmLPXt8
	3CfMp5Qwoys6rzL1mau+T4ow5dZUC4OLbHkp2yyuDx6nMdYp28Yo1YzNpfCt1fCh4VjaI1m2Jna
	nbzELCNtb28OqevNyd
X-Google-Smtp-Source: AGHT+IEZxhWPWikCbrAnGfoelUubQn+zumXi8NTKXDPb/rrgk5SQKq+1ZC5MQQVGOw/Dnv2a3nat5w==
X-Received: by 2002:a05:600c:4fd2:b0:477:7ae0:cd93 with SMTP id 5b1f17b1804b1-477870b44b1mr12471145e9.5.1762943352640;
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:49 +0100
Subject: [PATCH v2 04/11] cpufreq: sun50i: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-4-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NtaVRn5fOdSnDL05sWEjwQYKJh+onKYC0wteYH9Ybhg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFn6/m9j+vXfhwgQcvMShnjjZfSHkT4opZZX
 DHqGi3TBpSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 1/86D/9xLSU8geMKbGZqQqq+gpYJEvoD+GGEeh6cjW5htbTvlWOfvwgeOsv7EMHmjZb4EAEHORs
 AFvbHIO29KrO50mOR6LWzHeEtoMbjKRxpPpeFHL0WAJ0zeaGgYFQkVDLFTHb+tcJKZNzaQcfTOr
 A/gX0qt9wWyZUy483xKQSHzNencn4A5qm2KeTLjezWyjKRMqOxNcCqFmbGX38K43Am3QmMZ3AL7
 YVFre1EJbT91zoN7MCGE2vUscm7rpE/mljuHR5i/gJ7Uj7Q23emhpxMeTD7QmdYvYP7F83LsCQ3
 unLQR73BO8Pgm/+aNS4AhAvH7IWEn7REYkZFdGDYLzeC/G/Vg42R0QVo8NUdZTWL7mXelmpdG9Z
 DjmAXvVA1Ymxjfo8gNJ6YeKeB2voZyM98mtlwcgr354wN8V9DFoAwZeRx3p6bzqQhucTooTlrrD
 vuLisnyvxIeghESp180iNmZsCzRaiVM1DxQhnA40Tqs88QUKVirgWolnf+3SF0XEwMmOieEsmRk
 XbUoyC0vCzl6+Niz43jJgm1/yNSkFfgG1QJySFurCg0aI7Xrc8Jmbn46/FHPTNSkiwFP7sqbyX1
 uqHFTQ1d+BsJkhEW5yJDhqAYf8W0lvrmTtejmDepIdVQovzVNtHxSFWyrfn2LltV3ysYc0VIw33
 YpwPc5aDBmI/CNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022914_602204_11DE4928 
X-CRM114-Status: GOOD (  12.04  )
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

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 744312a44279..4fffc8e83692 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -332,13 +332,6 @@ static const struct of_device_id sun50i_cpufreq_match_list[] = {
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
 
-static const struct of_device_id *sun50i_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	return of_match_node(sun50i_cpufreq_match_list, np);
-}
-
 /*
  * Since the driver depends on nvmem drivers, which may return EPROBE_DEFER,
  * all the real activity is done in the probe, which may be defered as well.
@@ -346,11 +339,9 @@ static const struct of_device_id *sun50i_cpufreq_match_node(void)
  */
 static int __init sun50i_cpufreq_init(void)
 {
-	const struct of_device_id *match;
 	int ret;
 
-	match = sun50i_cpufreq_match_node();
-	if (!match)
+	if (!of_machine_device_match(sun50i_cpufreq_match_list))
 		return -ENODEV;
 
 	ret = platform_driver_register(&sun50i_cpufreq_driver);

-- 
2.48.1


