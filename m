Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0799FCCFA19
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=; b=TD/wlXSMDjqgBcyVBPMwxfjA0S
	XK6tAa9iVJboxRsy/qKhK/M8SEa+toGM18fRt67A5BCoR5CzNPkVJuc35PChsHVNO8SbpNu9jRsGF
	jFV+nYL/y5sZcYvs4RgGhiMIeZB3u029voZ2ATNiNN6kTmI3HLxuj/PZRe5vwVu6gRXs3TF9Y5q7i
	rRrO+dlseLo9LYoA0r38umqY74KELAJ+Sg+awrEiWPp/g5rsLPv6nQ7Jwa4jGvAi8wU63p4+cNd3I
	yuT1NTqlIafV1En0z0cJE7uzWrQZMEqz3mmpP4JRi6uZS/ttmNJT8h09isivjOXTJF7d21aiS2iw7
	rOLeFoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Ll-0000000G8fu-15a3;
	Thu, 06 Nov 2025 19:08:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LZ-0000000G8P7-3tge
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b725c6be585so19961666b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456116; x=1763060916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=dJ5AMzcxxPvYV9H9Y7GO/7epjP3xqOWkUD5iJQ99cU0lWq02MGZDErPSDLpY/rI5Oo
         kqXK512w8YF9fYOxYeAlnlnXTaEjnNU2OgV2t0ShbRKpDt35hgDqVowbHwol1tg/YdfF
         LyqP39aqN2V9sZmatJadkQSmVep6gHOWIY3ToDSnqqO/AY8vt/vSjdPho00SpJRGdQ2a
         h/0FELbobWrFWZhvU27nd0DvA7jKmKFrE2qd2iqYPyq7GZhF5ZlzFhuErByHWW3hIvH9
         1OEZvZHu8N9lU1qpg0e3PRsSuuR0j7cye1WIoY1pow0yIXnrH4vSQqHVWE1TPM+Q+W0M
         tZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456116; x=1763060916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=TAXW7V+1YLZMQ6BfusNZH8GQPnC+u9Q8oZqabobqv7wAnSosRRhbGoxy2PiWJUVA50
         l4AOIAIlkEYrGPRV3X9QLAexOwqznaQ6aIOLEyuCQYF+gLdLMxtYSnQNsZSzicOkKAbb
         rBc9egLCLdPP4buviXcD/IEhiwTSTiP3nedb2M3idn4HSUwHKsOkicy47f8DdDHK7Z0+
         ezngYgAh+c3auwI8x+AWH6OIysgRCPImJjobOAR0S4fYnkcfU9UvRMI426h+UQy2PK3x
         W0JF4vnR40X+xvbXpnPYATyfDm11QeVS+untIoSnX+SeZDCIty7aGwM8PEJADhVE8UWP
         7UFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGnJmgOFC/cUInTHsmxmxrEVfX/nY6WNYPbeuARLI5vQc5xU9wEvyAe3PX9FOFWQVRRfC8nYFDMwgahjAwAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4bfvTGznlxxLjHqTmT6k1ewPH8TG+wK9HUkYglxkkr6ph1udc
	CRVwDhtNEqWPyjrieFUwlYf3EZ/AvssrJWK7l+pHs1amWmx+d3q/62+zur6pJiubcMRY47cClGJ
	9Rdev
X-Gm-Gg: ASbGncsPHh5z/RgiFUyQ/24HoV+S9KDHpUmCq1+gCTdXYzh7HkyuoTcQE5EkQDAqHhV
	x5Ub3cS2k9EXaFqtNXkdvu2elmoeHXJswjH0M3mhJ/T4aRzBpFMAawAO1t9QB56g0+hylgtQISX
	Kw4fhlVcfWNtT5xDiU0fiEDKHabS57k2gUTrn4OKTikoE/fzrooDcCGAqnry1UAdD71kKfzfJcx
	Mtd9PvWiOklz0blU90ikL6p1XecpEkjjjBwlwrRJLoF7M6kSYfmVQd97z8gJjVrSKydF/svOt/3
	OJNoy3N/agSQQvCc9EXAA1QPqaB9ZK3MrdYvITYHLXGvv5hfZs/VRu5avXAxeb9/Apg9k93Y4Pe
	9phFRfeGl8hyCd5JHFMFFFWXcsfrSvdiyezUWnRzEJBYjjCoYKxFXKsRBtNDVUo4JlKB7sWi6OP
	ZdsXH69etpjCARL0E6
X-Google-Smtp-Source: AGHT+IGtACsnNdaWz105iCINoWr5n9UXht5NcROgRS6+92tcuuFFCVXa8Xeak1w/fHe1KKxJJQTUmQ==
X-Received: by 2002:a17:907:86a1:b0:b70:ab64:434f with SMTP id a640c23a62f3a-b72c0a8cb89mr17450666b.6.1762456116128;
        Thu, 06 Nov 2025 11:08:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:19 +0100
Subject: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=duU5u56PDy568nC9gTgD/sRRW1Kja+NAYhWyt8rAuUM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPITu0xcd1Xu7SDbTfboqrqtm0O8I5f3k4GxJ
 sb3DuVcYy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEwAKCRDBN2bmhouD
 13hVD/4nWu9gGWq6/LJwCrfVYOFlQ2hUn93EjQWiFRTwwmgC9sbS3NA9MR19W+gEIdKMVerKLcR
 qWz4RXbJ3AR8qwBVAgGhp5mP8v68fVp06zYEjKkmsDZd1zJYY6QRtlVK4l5h0J+my+9zwRl8O+Q
 YzKoXLBhxFNRiLPny1JxlIa1yaTC6CNYWDt04MnQmbnPJehWYg1NUbSWkF6HsEdtyFhqGcvc/+B
 9uZA72RelClKR8PfknzlUexnJVx/QyUbApsMuxODlLZaZAV7oL9xM4Zqgxolw1524IZe2eDPBgD
 KS1EquOwIM6NUJIbkQ0MTBy48To3g3jW7ssf0ktGE7EI1tPR3YvdCgq4R9h6yWDw3KaquxNvqRM
 JBcv1EnddNFIiMxi05AfKZ5xkuWv4dxzdVQqw8kgF6p9YpgE8ib3h3WM5JtHXptC3QswTi8sspr
 HocdHYB2mNKGLOKFSZ+4N+xnPr/oO49a15Nl0B1bNbdKTUmPBLfIn5f2jGjRubu6zmW6mF9m132
 6WsB6B1i6jZUXmWjgSvfn4pc092phlb0LULHZfbJSgzsN/y0xTkKM3TihUIYS0w34xthKyg8Zk3
 pRt3JEIKc/Qm4FALNBmlQN6hGotDxh4wfz1G2vFQhMROvMlxYyGvu+V0LTe0qSvGDwveKy11LUH
 1LudEj4LNSbfXzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110838_073514_C192C9BB 
X-CRM114-Status: GOOD (  11.88  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/qcom/ubwc_config.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c09796163b0..1c25aaf55e52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -301,21 +301,15 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
+	const struct qcom_ubwc_cfg_data *data;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_ubwc_configs, root);
-	of_node_put(root);
-	if (!match) {
+	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return match->data;
+	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);
 

-- 
2.48.1


