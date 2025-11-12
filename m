Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA316CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=; b=NiZjVuPjYTeETqszRpfREC1ZPA
	Q4HR7Z1rUIZ0pVholZI3hTo6PDfJml37nvent8UdL+ZyfxWcII2oEpYatPsgZZv7CHAkAdPIrWbfT
	ZYdlETF/Qta6uIkmiHZCZ7ULZEUw/RzptlV9Tw+sdKFpDLLaIDpS2d84rcY4GPPue/v6i3TDVFu/S
	TX6outAdJ9uX2TpZW4PzMieXbXzN8NKj/xRlzKrd3oxx4U3W36kJCcZTt3fewBhjhF9Ll35SzJ0Ei
	U9BU0gta/NLiY0ymLiKGH+CM/MHFk5ax7Qg3Fx2ciTyOia7hRLZ9QW04bz4k/XaHZcweLZiFCnbMn
	rqaNig/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86g-00000008ZcE-3f14;
	Wed, 12 Nov 2025 10:29:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86T-00000008ZIg-1Gpz
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429c8d1be2eso81286f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943367; x=1763548167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=j0jxivkKFhMcz1cP0v/gJVMo520356TF1b4IXj5Iqy/2Vy0zSQihDrFYyfSixd0o7p
         olp0oUaRXbugyF/Oq23UrZfBgiiX5gBhNmL0mYY6ZLEHxYC5R1Qe4aOk/GkAvk//QOBm
         jgnjEg4q24hBeAr1nLLXnsLGq+tSZj7X7DE4rBBOuFgV+Ox73v3ZzE4+NC0ErYb+JRBq
         3feobfTkpcg1iPtuXJRqjo5/S1V9Bz504I0WeVckaRESZjKvA5okfvZcYhq5kxIDXvj1
         racdc+RZ+d5pegY/jbyRYW5B/55XkmKA2SnBjSgm0hpvGtm7RSfWD25JJFAiMyITRVnD
         E0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943367; x=1763548167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=SfjeU2t8izfL/prscao5uwfnsdFFT2YbeVub33xTAjISRM7xMhTceJQcEy8179Pr1s
         0s6jHj+5/q8HHQ1IU4IzbaADWNLnsg2I1+dEbb++XPq1ULJgw7ofkLmndJXNDgsnPNp1
         MgqsVv+wyw8l1UkTxl7okkCFxedEkQTFPL+p+UxGTLqs/aPdPw8NUnBRc81IOmjqlFG8
         YCac1xwzli8OFzF5gHeF9zCGv5kuYZW5tYuGbfSHz7Kby3HyQApWcQLT7D/mYppdW5Jk
         xVwnmlv3qMdsRvACZVxdj81R28RuGnPsaDtKcSMXsnSaWrjdH/R6hwYpbli6lG6IbNMV
         D8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmU1d69V76DZ9nGQr0lC6QsyFvyDqc3zwcUN1+PuqaPY/raIwNzEBmGC6NSRC7APWeEg99r3dtrMl7m7rqeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVeKmqTejjaBm/As7wZxMH53aMNKAn/VwLdDT20G6hAvoy85WK
	R2jw+ZYUMXxMOf9YSS3p3OrplqFzb5vArihO1cyP6FQQiS79fDumuUAUeBxbdWagN64=
X-Gm-Gg: ASbGncv15GdklAIv8ZLHa4I14ba5jO/D1EPCqs6zLyozEMVuvO9WguPFYfYKFvo9S/r
	57CBa0JIwjZzS+MYjhDTjtfrGVGu/jmmfnwEHNR9jZ8o4Ky9f4jNrKGgXutHSKyEh7G1LdggsiV
	brtL4crcqMyZGURXtWI2d/CKixOPwA63F2DTwOMiJDL02Pb7alEl/CsIf8TDaoVHC9bz2VTGkD2
	hmbizwIhAmBGTQqZ0/TRRMKQCPJfkqM3zhcg+GdZyK83wzvwmaNHl3DH98rK2vcCOe5SBJFHixy
	IJ+xKUyv/k1PZTGIA27e1fAOmGWy2Xl4L8qv5d4uvpDx/vf5IUtbrFlOaVfjrYLH3gKd7CbaVPD
	mdJgViF5arph0MgZlyvcWGH7WDiTG5VojDIcZYr74tQ5i2ceaxg5+ZPncGqZKPTwTFvKnpxOoRK
	DS0thOU1Oyl46Mj2MR
X-Google-Smtp-Source: AGHT+IGy7b4A4+u/uGsBiLyOXS7Gsk6nxN9fGfA8X4fo9GU6bM3+pQFL29gZ0wTZR8WKoFNMAnOUPg==
X-Received: by 2002:a05:6000:2888:b0:429:ed57:d17f with SMTP id ffacd0b85a97d-42b4bdaf0ffmr1104643f8f.6.1762943366954;
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:56 +0100
Subject: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GB94KyWxhTOTJwckGHT/UMyyYTBhNHxn8zgXA+NUlbM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFtg/s4nNx0uYgFz0GOtpfIGABdMtbdQMANV
 +JRa/rp5UaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhbQAKCRDBN2bmhouD
 1w/fEACKMeFrgy5574qcsFru9xUr0YzMLGL2fJ86eoBrcMob9jAASCEdZ4D1Ej7bxnGW90YnM8p
 kQTuDSm0k1uWwm9FiVqJrUcnQf+MzR+X7U/gz94Kt90nLdBQV5YnPGcIsm3iHmIP4oVXHOpXokP
 x2OCQWPmfvbyFBjPZBy/1jGg6gNsMuRrWRfRLgz8jGcpoJMIafCEYZfKGZHHy3oWdOtwum/ndpN
 lJWa/sWwNglSxmB4Nu9YPiMgt1dJKy/7Tv6q+BiTDc81aEuRjfamh5IFFc9Urmb7O3UHiKtdokW
 b1zy3QDFK7/HNrHvi3T+16GKEVsHfU1sSG6d5jbbhEGoCC9GzPoirQLGKCjP2yaONa2vevaXN2G
 eCDpQZj58sVFngMltyb2r24bL9TAKWfw4nb7Z3kkOHAoRHS3yYZ9Jukr2BH4hKPGGItXAk845US
 AqAxHGs1G+QmXZZE0T6JjmUDUuPP8GFF0/gXiPr8oQLTQn/qjJCF2+svvkeWcT5zGvadb1pZvRz
 sS70yht/Xs4f0SAUjiukfj1ZmpBioU08dGxd6BUYbPY3gEBd6rQAqXDRnOfk62c+DVnksvKFMWc
 jrZSlC+mX8Y6PtbObKFPeYpzQQgx1xpwIgMl1zj9pilDXpDo8QxzUh4CwjnjvF+KeaSAVtnx/8E
 ZrNgwAuRB6iES6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022929_468559_5C9DBE0D 
X-CRM114-Status: GOOD (  10.84  )
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

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/soc/tegra/common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index dff6d5ef4e46..d82b7670abb7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -27,17 +27,7 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
-
-	match = of_match_node(tegra_machine_match, root);
-	of_node_put(root);
-
-	return match != NULL;
+	return of_machine_device_match(tegra_machine_match);
 }
 
 static int tegra_core_dev_init_opp_state(struct device *dev)

-- 
2.48.1


