Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69674CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/lQB+Uh1RIExOYxBM20d7K/TgstG2S7aLzqMU+wPy0=; b=o94ZEoh0qkf3z9ZR2Ph/7A76Kx
	FdWcu2qPaKyMbThz3Zj1q+gB4uOtWA4h3TEhroSJo6hdRObUCm/OQLRkNrsVnv2bM3AhD2lh5CrzC
	mvPpUInm3+Xs/ocXzKzfZX9ndAYBKcctNf3ahew7H7cB70d+LTL+SiCKF6UcZpce66Y50RHbm2o5Q
	4S4Y+X9BQpJPTEimmC+S0fVMlJBsKyH/9OMZRiFe8MffHFQ1lWSX5uTu1a50bACTYgZuuyzCIo/F0
	QLSjKpCHckQYr9FwWFmlm94c5VAIRghL6jsERzQnoqkpvS1ZmJmMSlYhFBWrG8Zw9DcQdm0COgSOY
	j/k69KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86F-00000008Z1N-2fDC;
	Wed, 12 Nov 2025 10:29:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86C-00000008Yve-1kXA
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b32c5f285so82425f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943351; x=1763548151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/lQB+Uh1RIExOYxBM20d7K/TgstG2S7aLzqMU+wPy0=;
        b=ypkcpkLWD0P266Rd3Xc1sCIcEDGoMxrTCKmvnrhBb+3mTweb8ztfY1bArFDhXcG/xX
         n11QXnLDSVR03sVrcWt9cKRcKBuW3U59p/yOvRSJOhKFuejMmtiv23j5s4Tx6+9hssW1
         3YspFEvxPg8CE8RnFv0ZyooyYWD63JxAn2700wchZzi7InClAjrWemOE2JgtIGwlYJjh
         H716Q6h25Cj5B/OaxYSLiFQGwIA11uUqH7KgDCD9MIwRTWD70QPXiVDsbnKRUJrGnm5e
         AWqMtz7jciTWZAWPmSIht/evr4TwoLpym8b6EMg4yiDBwLQ5Y6dB1b6o1EuztxvLWAkX
         2T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943351; x=1763548151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5/lQB+Uh1RIExOYxBM20d7K/TgstG2S7aLzqMU+wPy0=;
        b=TmAYLutPcKkuMqTkePqmj9B5wiZRA65GCKXvIC4dG6oAj+BxvBRHZ8YZvL2F9W4gvQ
         2kq/H1zVVW+pK52OxEeVyh2dWi06FppXsLQlhJZSCash2ReBbPkubDXAiEA6TxErse8j
         boMSs20U1/bnHiNzn7+Mcp8Q3Aym5TFNNCxBWWvVzASr521ZPRRO4yK2oSQPkcIyWa3A
         w7DL1b7aeDxqPgx+Ulzt/CBxf2KdiQ6A6SHgXgOBrDhw/8FO7x6CyKMstWgMFGKxEmG2
         oFZwj4q3Uye6Z45TAdEqsX7ecqBiHIE5Xohi03xJAqj1XhpgPk1PlzZ1FimQRrUITX/g
         4gCw==
X-Forwarded-Encrypted: i=1; AJvYcCWKhMeJB8fxzBYMoHtdXs9hAslVwJlrB6SR+cFgn31EUDVkQxSGYVsmRcONVg8coEfZioPZCUUvcEXmtmFXvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cbb3uOvgsPcg2lwN+QD0hkK2Oxx+i+uTIf1Vvlt0nOKmw2y0
	RJphqnLvDOytWD+H3B//ZDnteEUfu8Pt6PK/2coLSMvOv0OZkrTRHaW7lTjjEs8wylA=
X-Gm-Gg: ASbGncsQtOoZ/UN4dLeXNms4LjSBtw21qbT5Jqa3NLm1U7j9t2jhy66oZPVkE4k31J+
	Si81nD4mOZ5IfO6wq7anm+dse2fpCqUF74TxYxewv2Bi3UNIRG8NMquOpr1mpaCVWXKIDcE0xOI
	rVv97i6VBH9sd08aj3GePAfzkRGjeAYtpXXU0IV5dFbzUPGyIiPAMDS+/ovCIjw1ok/jhAZbzL0
	oVt4HRNTdV/64u+mxwq7tPqWW5IABuil74fDjbAPWVnXmtnOp5Itdk+fatJ58d8ESWEu2IEj4mH
	qcvrls99IkEy6nSo1qeyzmjyc/LKB05bK5FZLOf334RKw7j7ReoAApt+6hNHUk7Z8SslOsgtEJy
	VrqohL3HD6vtWmswTz1dqe1mdI8Gtx0SIVr5tOWF4SckjQtnwLpVKwfILQGtp9mkwiKDr2Rmt8t
	IbvL6J1P2FtArVyhX0WdBykKsuM+M=
X-Google-Smtp-Source: AGHT+IHB6n2PoFLTKpvGtutCOV+YXAAXwZCON+pwRDKraH4emSs7ggR+Jr7wcSja/g8Qf6UCT0YvCQ==
X-Received: by 2002:a05:6000:288e:b0:425:6fb5:2ac8 with SMTP id ffacd0b85a97d-42b4bdd0bf3mr1171080f8f.9.1762943350716;
        Wed, 12 Nov 2025 02:29:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:48 +0100
Subject: [PATCH v2 03/11] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-3-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LNZVLd0eAq+BrnUkkpnNxcIGap0kv/bUjUexuvfEGXc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFmEH2DeB6xb4ZsqGIiZXyCKuaghi7tcHXuF
 IW0yheCS2+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZgAKCRDBN2bmhouD
 1z8uD/93hKK/EORiP0ZP33MBXOGFTWBhbf/7kPv1vUdNrOaOhPu+qdM5qudXfnS0028Qkp8N8Q0
 j5BYRsQSnrlxFw2Uzi8DVZWyW3kLmDHF4etZAeu2C1GJdClp9nkThAp4rYNKoY5yAQ7QQDATj1T
 y+21lzSQdWB9stCR7B5QQpOaYzlBfefo+ZsF+faalQ7B7L528JPO+Zd+UDwRJe8IRjy9xXuN1vA
 0t/XQoDfNAXIS4chQ+QlB73kfDsgNJVEyJjIGiW0+hBT9qGkKw6h1qYltWg2H/YOuX9lgZ7o2ne
 ws2ILzwsb/mTJiRIGaUjgeLIjoawH4vRMEtuim9SBFT5VOVYBiC7+QY7kxHTmpYDWJSAgconnF5
 H6m8yWbNnIvi05aPyR1wGY9Q+RJb8OQxpdJeIs96swv0EgvSp+nGCNTklo0TL5XI+SzJUL00WGG
 lmpgVGJK8oc5C2AYl3b29mKGu9R9RH82w8gE8TuQvWmg5VbGZESRWRSHf47W1OjuW9UKarGHVIU
 DDgjjdjor440n7ziUnnOycmB/nUZaIYE2yb9rFqNjg2N3nXgXx54XrI6zs7rZhypzRh0pK3Hh/V
 srAkeBC/7Nyj4qZfgaLfjnaKC1a5CwF87sC8+/W8jIH2Qq/BnmqyiW25fDIwD5WTvOjJdpm6EFE
 5nCBO8HP3QKMtLg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022912_520606_6CAC15DF 
X-CRM114-Status: GOOD (  11.73  )
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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/mediatek-cpufreq.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 5d50a231f944..052ca7cd2f4f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -764,22 +764,14 @@ MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
 
 static int __init mtk_cpufreq_driver_init(void)
 {
-	struct device_node *np;
-	const struct of_device_id *match;
 	const struct mtk_cpufreq_platform_data *data;
 	int err;
 
-	np = of_find_node_by_path("/");
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(mtk_cpufreq_machines, np);
-	of_node_put(np);
-	if (!match) {
+	data = of_machine_get_match_data(mtk_cpufreq_machines);
+	if (!data) {
 		pr_debug("Machine is not compatible with mtk-cpufreq\n");
 		return -ENODEV;
 	}
-	data = match->data;
 
 	err = platform_driver_register(&mtk_cpufreq_platdrv);
 	if (err)

-- 
2.48.1


