Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93C0CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=; b=3kzeIoSVq0EAQrXlJ9gTLHHrZ5
	atjQPwDaAwqryTw1fNSQo2Y/dUfW0uC8+OxJCCm6YcfXW5mbcSrdvXJqkKl4XBJQyYEdC3d8lJ/5m
	1HfWOgMRQ9gc+OAlMEYJdN5fTNjZRqt3Yy6zwTlIKUMUyQyM5mQ+8QtZwF4wz9bafdC6PyFqixCvw
	78o19RQK6AjlGxsHNR8ixM8kuto494VeLBs27zJnlaohs+hTpcy1L7LofVlHz0UN3o6U2o/PuJGRg
	PwruaYyYoa/Yf/BbWji1WUKjZXTPf8sr4ftaQbiyBuMjcUZEVHSR3lAQ7j/cavw6YNzwlpoxRn/YQ
	u7xA/4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86Y-00000008ZQt-1eEt;
	Wed, 12 Nov 2025 10:29:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86O-00000008ZCs-3zdB
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-471d83da4d1so169305e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943363; x=1763548163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=p1ZJZpeQrHBEcTI/tiSVzXtdWZsvKEFYnrrSSTFT72B+5bzDIXzONqikjb3jgeJNdt
         fqK2AqMm9CHs/Sfk4RhQ7JtF8pDRruHaFRjGWycW0DepY4gEr/KuYz4TPXB/UvXq+HoH
         iivqLAC6ft7QOa/0KJwLK+ZOdYtOGNwTVR6j77C9KOC8l+5YryCipA0SFcRF+6UTxz0z
         bTUiHV+spO6IRyO1HQ+/HvD/+r0TQAkGeNpkQ2BiEH5KAh6mcocpv4YpDSehD1XLgZXF
         oBOKUhDI8uKDaKYVGcXxZxUaXFcmJWRyM+whLcK1ts5PV53aFRYIEq+RanIq6vYmlbyA
         qS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943363; x=1763548163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=RyEqf97P32WukTsoeqqTmtZTl3dV3i8/W+u4KiaIeQgV1pcSj/HZQsM2WbeF6cgyD0
         U1qGNBXDJRIm1oWFj0zgTT7rObQWDC0sI5/Fce6OUX5kMGw2Fb5tOwjnL+cXR2xjjw/A
         aOJwt7rHIQsJ6ZLYolm1OfoI3FLlBe0yJpIINMD4/E5b6WzUxDcyowE7DRbPKRDA6WKR
         +2slaLK7G/zcgq96XVkUb5ReGDnKivt959vFuKgOWfQyRgNo8Q79JjPwgQD2h+RxlEMY
         /9h4691lrq1Q0mMPdFlDcXvNtGWtAWEfHcV96mFu8u2q5Bc2qXdfZhiksFAdzOhcMuwo
         Ux7A==
X-Forwarded-Encrypted: i=1; AJvYcCWk6CdXxvT/0YAjsRL29aK9MQClkjLLIcSML8MznfJpLSFUZD49org5RtXDb2peGfI10jm7O8mvpQcc1ga2rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBwkGYYCg1O6Ph6ToLMkcs0/QRewywt8J+g1HJMuBM62rJ//bU
	avgLPNBB6QqgUr8usDwjrkTXJIEDDkdCUNcqyNQQrv3Fhknab9NDaGiGyYQiHtENDSU=
X-Gm-Gg: ASbGncvOHnDzNFrgl0KmUIHwZe9k3wP6BLOGt+egpAXNaedQXiYj7iOV+OnBm3kuWbe
	F77uZY7SdRmPBXK9LCRH0xSw0m/K8aQH9nEie3igMDhkbR0Y92JUDhs5EIcOOW9SphMBQKnwOtp
	/m0kq5bJmXhA4vYxXY10FM1ICfv7u6/oHWiMBp2k8zNnfMo+10tvxXbVQm6XDOTpy5NKaQ24E92
	bnvqxZAiPOUHqk3T9G5zNsUGw/nokxyAeGbSxIYuzs01hDytbKHj4roHKK/zJC7pKIQ/4eEoHOP
	6m4ajivkYfkDTUCoIOPaTuRy/Zk45oCq+WFy42rb09gCUoMh5XOFnMbUUrdJcolSv2CfY9Mf3c7
	51Naz1IXBxvpQkM8uLpjEHoBcsob4AaERp/LFdfeZSsW0CuH1GyKrRrEL6KAVl8OGx3c8hzaaPm
	ab9O2VvTVnMUungMoYRqyckqCTKMU=
X-Google-Smtp-Source: AGHT+IG4PYkMnNw0ODvtXOUL94VjBv1SVm7gv9pdwxJVf+TJ17wVy2egXepWnzI6OYpTuU2LqPLsAQ==
X-Received: by 2002:a05:600c:3b99:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-47786ffa240mr13184865e9.0.1762943362906;
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:54 +0100
Subject: [PATCH v2 09/11] powercap: dtpm: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-9-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFr1tYOKM8LvWVApmUF795FPE3v7DdzNxeRs
 sD8X/1CFaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhawAKCRDBN2bmhouD
 17C6D/9Gk7S57LO4NXNBYYNtibDL8ljONOe8Ig0TRx0qtjvLyrRWtyTVEodm+FhIyH5crFSibku
 khWIr85eaZnyI7DZmi9EEFVE4TwF2EuzXUHW8BfsvL7GRGYpX14S1sHSR8EleDgvDqMR9NTL6V0
 jNIwfovhLn7VP+62qwBkcAlM/2T+zgdVrn1DzN5L7mfWJoxKIEyDNH6m/+NJZXFUpV8HAOSggLF
 aFaSy/KjIdyDDmdGdCwFyzya7/r4WobRUj2kgaeARLZL89D8+WH9h28f/7hCc/hAfW4Ii4hbv91
 ImiE/Pyo//QGhxgZOOxCC7SdAgA3h0gKzFE0Mgg0fENxJH3ErQLNax2+sn8jNbPg4xi/IW20mCb
 2t3DHlPLJLbhonIQc/3zosje4H2HU5cCZ8aqRjTNCRsbwSOVm0Szz99U91i8FgFfFR/laV42FcG
 Nei3Qs4ZfN50R0C9Dh4TaDOeeBx8nKNoE3EzI2l5AY7zjvVe8CkMAl7LjCpfWFxFj9v9bhYmsoV
 L/k42dG7HJvL4TkMRdbp6cOYV+0MPV7QY9nt7Fb1vu14PeCkZlFCr9Px35eZypnM018TUFkKaCU
 8PQcNvW9cis67Ie9IKba4R0f1wkpZVuHgWxJeR4dLwWs8Upggvlxq5bhVrL2wWCvymS1SWwmlnp
 ZVHhvRQqrTykRYA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022925_153653_C8EF715B 
X-CRM114-Status: GOOD (  11.37  )
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
 drivers/powercap/dtpm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index f390665743c4..129d55bc705c 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -548,9 +548,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  */
 int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 {
-	const struct of_device_id *match;
 	const struct dtpm_node *hierarchy;
-	struct device_node *np;
 	int i, ret;
 
 	mutex_lock(&dtpm_lock);
@@ -567,19 +565,7 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 		goto out_pct;
 	}
 
-	ret = -ENODEV;
-	np = of_find_node_by_path("/");
-	if (!np)
-		goto out_err;
-
-	match = of_match_node(dtpm_match_table, np);
-
-	of_node_put(np);
-
-	if (!match)
-		goto out_err;
-
-	hierarchy = match->data;
+	hierarchy = of_machine_get_match_data(dtpm_match_table);
 	if (!hierarchy) {
 		ret = -EFAULT;
 		goto out_err;

-- 
2.48.1


