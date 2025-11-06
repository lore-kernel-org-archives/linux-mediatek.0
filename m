Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB1CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=; b=1696q4KXBHxRdqn7c1bDUho0+c
	WgoR2RU333w4TGFg984TBCJpL1RDzIugBf741lMNeNDKRVu8QxO0klH5qH8KZ1c2squGmfOXSc4do
	Bzw71qXVq7Ezyot0gKeqNRWiXv0mniE1x511nKwheEGPnp56i+g+Ee5Jb0M6YEkSFCFmlcZnmOHLw
	Uel58S1mphGsiwNKr8aFAI3A4e+JllSkNttLy6q+hSsYVjlFfKeLIcojyt6Ds8QK+efpRzZuTEJbH
	i1YvJOLhhGnqbMbBOowlPkz/cOUIDqG/T3iEuP5IwOsMV+pq/rzk4bdA44N9BMlIM3af+dj0GINkB
	sCR716Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lc-0000000G8UD-0VFI;
	Thu, 06 Nov 2025 19:08:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LV-0000000G8Iw-2OYq
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso159259a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456111; x=1763060911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=DbD3jmqyhoEFtmZ7egRPZc8YiOuL4LEYozYhHpqPxnhDbO3R91bWQxeLpfE857ICNP
         b070j9S6eD1tmHB9FaqEqFZ3yN50XMTMGVKYXFgox1JCv4dcFfHzmJFZUdI7fArdb4I9
         +u35WJq4pL1AtQvrHQqEY4jfBYNGkDQDXWMxevqBg5YKV22H3H5Wx9xnBRY1tGf1gjaU
         6hnqPz3GaZA+zOG+O+MUxoF5sdklxdDHCSKv62mQGcvRO+50IyRy10xnhWyaFaHURtNo
         45/FrIIZ5S7P54TuqgyTFut/xu9O964X7hFQcMccDNlLdOohmdRhf8BqaF8SE/rJV1sH
         M/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456111; x=1763060911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=TfNIX3kDXPMqoKuTUJZaW+AuGZAyEDIY+G4W+qFV0lGuiZIa+SKvW/wW59OelH82Vs
         iODq61IerD2GScC9SiMFa5yoVMZEHfRheaLII2wY21ZtsLXH3AC6Nn+pgkIn80txcPJJ
         ZGXJkVs/Rt5Bm8wEKc0N9yBvCbYbQdq5UfDFU1kvr59DHsksSihXBClsjkaYeqAhwSUe
         THiZeXl2C+MSqP8NCTs9x/rPUs6eiMduw6u8Hrlevi+UXR93etqmadpwZotm4NBj4+T/
         ziBklGwfwL3Q5vGLJzcbzkymyCwyzfCjNmQEHjL2Dftv+9QM7l+7y4d1Vtdas3k0Q/fR
         MHiA==
X-Forwarded-Encrypted: i=1; AJvYcCWEenSiqlna1QlVWWS4CxNjYq7I5rxI/FEZefNcK7xoe0srKPyVGmjlsl9lEXEMhdoiOW1FDFACOpMbGVmeGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3oS55gl9yEmHUeKvRu7zw31CD+DiVG9L1t2+zIIW+Q8XtwomT
	BHLUhleiBW+1uwbVOjZ1K0iNFMgsCYTsYVTyVa5YHy2mwrAxGroSl6wt7Vsy73RZ+us=
X-Gm-Gg: ASbGncvvFTMM7fzlWBq8kn5Of3E8pyzx+vjB9FmbpR0+0QYY0F0h6L5W6Y4gzXreKMK
	Ce1TBef0RjhzgGteJPV+5ifV+Tx3TbWRhqFUY8adofGnm2NQ5Af+Z/nif1gA2y3xR9tOza6gfaV
	EG0ZlDnkEpLvtu8LbxiTJyljzuu2tnrbkTkZPm6w5gy7l33ppjZ8pZKRVA4dsYoHUHRq/Tz1HQT
	EIfDavS8fRLBAzH//RumpdwRNNSt4t1TjYQ4+pklyfZ73W60vPZC8mcWxwDIlI1aWHlD1UhZ+G9
	MDglVZopK9Qh4j/As9yT7kkGVzM23wXdx7THqrYriqH2JcP9cSuinJbURiRTEJDOCyuf4pRPED8
	pKSoQZujGJTahkwAQAFTat6EIep93YoAWnt35r1gctgq9MEdkE+j4b/2HgmTGByiH9c+mI8MmtC
	XQld/4Ul07NPrWh2rf
X-Google-Smtp-Source: AGHT+IEGmqq9cm1Rvzfb24khZSYsFQ/PTegAXxlroACoBA1TR3Jjri85Sv8tMmwxWc3nu0kMo6BtTg==
X-Received: by 2002:a05:6402:3586:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6413f20751dmr291297a12.5.1762456111545;
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:17 +0100
Subject: [PATCH 10/13] powercap: dtpm: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-10-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIRDZSYvV0FBFCASolVOhNlK7njoQDy3PwX0
 i7RMv6QCVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEQAKCRDBN2bmhouD
 1wd5EACGaqsvVT3xObFDDX807YvuxJRMQZS0dyrF8dltJn/jHXr9MltK8ElySvuXxUPZVbULgd0
 le0nPfD5i+yDCZwLJWBEAZq8oTf6EHNCE3WgynJjTo4kFUGMXzSETGrx/kmGFxkBzQv1Dn39yxb
 vUWKEup8cvAG18aKjCULWPJ7aNkhz6kU0nHgpW66/doZbnzb6CqiEueH27bTlRCitUr3ep1Kuq5
 SuDr6N94nufPMfsdLhwTd12vj3PdSThfGyhNgaKf9HLXQn05wbhCI3BD7PoA0K89LaVpaOKa2rn
 DZxbnalo2fZ8Oeos8raJNEBXaIbomLAyUdLv4PNNcFRy2eScnYQ8W8RuChNnG/zq8i+qI5cFQaP
 6X3kIJ6Px5Emth9Y+nirUwVywykg7EijzEb2b5GTNElBqh1LyEz720BQvwNlJ7Wc09JThLyN+KT
 EpvtiQ/eUGsgDiS+iXiZ1Yv/bLr4x9nMh0SgD6IUrlAT3mrTozJV+Eibc2x/RSg9qpdQy0Cz2cb
 A/VqfFcyYGpOANT8Fz/xAH8Og2Qg7+WtHSgi4sTC07vITCQ5A/jtvoYERkc7BKZr6xmk4CRHmJm
 n4/r1xT3V8o33Zg5qyS5iv71pA04d89pkTmBVszpfDNqJgwVj9nH4c5hEyjkB4B2cxUd4vfgw1M
 WFbv0ljiRR0CwPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110833_698575_BE557CA6 
X-CRM114-Status: GOOD (  11.31  )
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


