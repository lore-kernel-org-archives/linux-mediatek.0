Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAF9CCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=; b=ofdKbX/+wdNx04z971E5PcXVE1
	RB5w1b6o4mIZMj4dxEbBo4RzT7VPEc+ryrZWeI9PNE5P9JoiBBOpkzES3Mfw6svFMM4PxzaNMQAeh
	9NF9UhtImomfIm//2G1q8D3+mYGSJbfZUHb+0s1VHDlHFDlafdeiPq+hu/TROfRESkTSDoIMV41T0
	vAxFQjMdII5VxtZBsQbwDX2ZkqgauAG4sY4UeXkmJbZ4WA8CWcXDwGgBJgac2cXNxQ8XfnxTss5gI
	uX/ym9iMZJVaPCZRtcjGJgx1D8JUECPbB2phYLSlwCNfaUiHLVryTw9UmXU5pW8PfW8lrgF0WEL44
	mlWN1MaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LL-0000000G86p-3Y5F;
	Thu, 06 Nov 2025 19:08:23 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LJ-0000000G82C-0WH1
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b70b40e0321so16685466b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456099; x=1763060899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=fjY9wUg32yRGJO7kFT/fNvyzFmzBPNvYDCNVwDc+QRF2+6v0NPNLmPPxH7DjEmcfxK
         UXOU6M3HIri1iOE4FlY8JBmg/G+iDVQXaU1bnkbwiCRch/PlC9oR1n91rLvM7e2ZDcb8
         qoJ4zBb7/2vXIa+YYXvMF7xxiIr5nBSoTggyJJ9Qr5yk92C/UbW8khlRLNG/hKlqgtuj
         rQBSmn9AO+7dmnSodopAwEwzeqiTHXRJ+zVgOlVu5tlyofQ2sUAQDa6J82nGaCb61O4N
         indRxtwPsMum4k+TpiogyDer8FlUHRhKFjh962CmMBmskPE8XTpSZ/jSLTpa4p7AdQEZ
         62dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456099; x=1763060899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=Uj90a29PBmdXjDCtroAukMzcuR7z0D3wQ0/gYXun7JOShg8TdV4WXI/zNu1EKDj8cd
         TSmQTUJcWR3eEPcxtvqHNk6o49FNsGJvCWbDZtwoax+zJIJ8jr20Yqkp3nQpxAgqkx6m
         3GEiqiocOC0nKOwoGxs8zy8odSZUw3RCFiDvqK7OX31XeyjXX8AlajO/8wFoogGIS7m9
         OWDHGJz739adWyL+1rEh6wH19osjEkNSDb8Fc1jX6NyvYNQmA+G0AcrrhNZQDvf8EYuJ
         2cBjUKbBJXEFWSwGo4aCKbkahhfrBMPMWisFX6glmEJmHjpIQ9yG9cycXn1Jaf88Vqun
         whYw==
X-Forwarded-Encrypted: i=1; AJvYcCUpbMLNFwa+aqhSJv8yTxs3avQpcosKvku9c/Hj+dXhx4mx91TxnC7ZgiVkxPATsKEqzF5ac79wHPn7d+J3Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcBz7MUcr7xe77g/p6BowcUgnTbDCNEJNPOe184gIgHOOcgfjg
	QTBTy/b9ywYzmBJWaaV385DGvRlBa0JDxUjMb8u/mdDUxjsk+Twy4jJRpNZ5N7fq+zY=
X-Gm-Gg: ASbGncuXBel7NU85qYV7QWPIA86/cBdUU72K8qQm6LBqdVqGdHfztOA5pgs2u/WWgVR
	xttsbEG3h8jaJR64dcyj6d/iPIgD/9t4Asod/w5wCBUqY2z0+hH/1IDEdR+WPzO2oSkDs1Zvrz3
	xif8hudwG1356dWTMdFlLL6Hl8mpJN4b9cH4DE5aA3fXVaV4xHKvH+tm7wSOhkAxTAnQ6A3KHDS
	ASjAqVYT30YtZeaBkoQV9esJ6vlzW5DA6GXYpWxzhRE4Tq61z1gLBnKdgVm83cBuO+VCWiQl6hQ
	Faldpvudcj3fBqeaOJZ0MAbIcy8y3D56GLSWHRYP7WSUzoAJAhG2x8fBVu/HE0c1Kh/IdeDRL/2
	qRw9pOt0T/N/+9Sd82As+jO18BmfXC2hcMHzsByKrAOmksp4m8ngGuvtbwn0FIMHNZuzt/ve7zf
	3uBpVaFFob0G/E34+5rWeRoQldzxk=
X-Google-Smtp-Source: AGHT+IHpy6g/ExB/tXdG9aK+X/w5cAOjpzKRGt7oFbCPlJ5xOgLfDQqFln7LmAaTDVmt8oPYZbetjw==
X-Received: by 2002:a17:906:c142:b0:b71:a627:3da5 with SMTP id a640c23a62f3a-b72c052b1acmr20747066b.0.1762456099430;
        Thu, 06 Nov 2025 11:08:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:12 +0100
Subject: [PATCH 05/13] cpufreq: ti: Simplify with of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TMccTrAY6jfews27rwbvbYNjT+D0HJWoublqLUUZsRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPINB2hcjM8CllrcU/oYMlxMVbOrIG9ZbKt4r
 J6A6ykHWZOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDQAKCRDBN2bmhouD
 18HqD/42Qwhh3/IZCwym1Z2urYA7CwYVB0JU2PVOoJidbH45aheJiAWatbUnTpQFaKg3s6UY/mG
 6YgQWLLLUEM44nIcAqUj1X7y/lJyx5tsfzotB0ZHdFOalzT89gwIBXCVg2sIEwjTV9snZYAfPDT
 1Pd3QZhFbWmTMmmyMFkX5dQGM4lnd0eRqml1TuEdr3MuhBaHqf5McFPM+YDg15hSXu8+hs4OkiT
 KEwlJCETrfYYWbNcQCHObHuiSUKqDazpYiNiiC5ETOrgjctCN0/aknRcm9lYgJIx0xflcJFT7RI
 mcodL8/DSE2FEc2chRC2iYMWb6ulfHrvkPPHZiIMaqLA589bwocGzqGvKin3kil8du8Z7goWk9a
 E4D9PHxlumE2TIwLlciKDQKo5ivphUdDLk6G4r8DdlPf49USQ7QowjNwn9pKh0zCM6c8fm7wmdT
 y/hISSHuivvUxDO7fSRLcA9sWKGCbviaEYXkqiUadw/4cgbM4jOmomFLhQ5NI+ED/Xv/HsrkxcL
 4MsQ8/PPH5X/DZe7hJGMzD/ib7ejn2sBTqeLBRqERrAYwKdlV+iGwk53skesHNPE29+S1daNwZ6
 gyB3Si51e0pvvHjEd/ZJg3rRwBbu+ySMPDMpSi6sxJxgCLs/rHlUkNzMV5SZRV1UVZNRzWmZVjv
 rdRauxzz0zz6+ZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110821_200235_EEC44101 
X-CRM114-Status: GOOD (  12.43  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/ti-cpufreq.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 6ee76f5fe9c5..b59c46a3cbd6 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -470,16 +470,6 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{},
 };
 
-static const struct of_device_id *ti_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-
-	match = of_match_node(ti_cpufreq_of_match, np);
-
-	return match;
-}
-
 static int ti_cpufreq_probe(struct platform_device *pdev)
 {
 	u32 version[VERSION_COUNT];
@@ -564,8 +554,7 @@ static int __init ti_cpufreq_init(void)
 	const struct of_device_id *match;
 
 	/* Check to ensure we are on a compatible platform */
-	match = ti_cpufreq_match_node();
-	if (match)
+	if (of_machine_device_match(ti_cpufreq_of_match))
 		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
 					      sizeof(*match));
 

-- 
2.48.1


