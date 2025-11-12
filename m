Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57CBCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=; b=X32tx9RMUgatxOWo6Eu7lzejaV
	uXrF4/W9F2v4Jjf33w9wMsZz2msumA+KNU5TcxM5sKp1W+MdSrwsgTJEDLzbt7dn9q6jWwbn9eHOk
	x0T1RToXSBwJODVdpbrnqoKdFuXhVoN4oiLLetDTOsBaUMWj30Kwvzi9JSsYwWax4yEk4ePUgSRmV
	Xi4YFzw/LtFpTE3llpcDfk5XKZeueeYgXF4l6VVqkNvU5hlhzopysK4WjQvuHQrMrWAzvh2EjqrYL
	twBuWb+0EYBlBtFoHTKbzfebx5YoPQMwD+AeosBvwBL0aqpvJfY1ZHEghQ5ui5PP61RLgKPdgSDUV
	cel3KSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86V-00000008ZMv-0IIf;
	Wed, 12 Nov 2025 10:29:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86M-00000008ZAI-2lBV
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-471d83da4d1so169245e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943361; x=1763548161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=Na2fqi79RPOQe4Jbx4Qk2JnffZITmfvmDQyPjVxKPSdcUa7e/SR/w7+pdGzCC6HqqY
         HhXlFIRKVaONrjm1EZrTl9uHtr21rnsj1TlheNkWkMzg5yEG3+nYoBEXR/K/gLDx8cDh
         ch5MF5arbtM8XowhQaZKZ/y4q/vSQcZtOyiDZkT9UU2xAhYzwt/6f1xf9HtYzIuAyI5i
         U49tdagPeWE+mzUNw/L+3n1qKBib812otC90Mpfpt1JGRvypHVNYIoJAf7Ula84TlF0d
         0qygZh+/NS6tVqeNHiwpEDcovzgjybQmOwFK/lQl+1VhlAkjW9XiqE0VNdtx55hR3BOh
         abgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943361; x=1763548161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=qKxh2GZOr7IeaRwDF4LIlVgc76d6k8gNIHLAelCdZWK0ggpiQUB5hkwRObATa+MydV
         5/sqSr58nNBshkHrFoFksvxN2rCeSJX8934yDPfJ7Mg2mLa1JqUNZusFsiQX94Vq8sbO
         jGy2jkr0OTL8DZh480WO5QhdzzZIuOmoAIl5PTrstb1LhLdT8QAarlD4ntF0bROsV/F9
         vd0PwwMle99n52BMm1jFFC589Lf5cRHAxQ8pBvIi75gSFHUUAq6Af+LX6dYOR/d8i3yf
         JFYHVdI9kTqk3a7c+T0xMQfOaQQvUN/FVtW9PczfiRVbsMleNOEtyDMzbgNSHH4VOote
         T5sA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WcEgk0HSRvAUVHR7FYDAjHQaAeYtGkCo6D6vibTNwcBOaSE/Zaic5XyARkeAA4oOucRCUYVRncmpCCfN+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwETXSuuCWefxUCUKZ8Lh3L1JNxyoT5liy7MRBNwwc5jTvwNrU3
	REoAmkQv0s45bnt3sDFwNqCxVrlvxbnLlZColzdHms6fK1KN8sA17ePKIXlDyrXdm10=
X-Gm-Gg: ASbGncsbweusXeB2oqA2ANkoJfP8MrcogMqezsR0LBhjkTMbCvFsDIvRifUgeXCzosS
	BZD9recObEi33unKiaRvDbMnrarRAbV3B/9l1afF75yma7Id466txVJssQs30/KuUM6RpphPlq+
	zHdDEkxp4vAa8YIEDCl/U2Feet8JHtbl9ac+HRX/zTXJPwNM3TesvojEzA5CDklbeuK+DaBGV2Z
	PPpU7xrZtC4RZRd9SQ4hK84VdkE2GLyfZVc8McnctB+YK4n/+5iysurVTXBIN4bBSUuQzeleewg
	DvtdNZo2jI556rxKlYjAH58wv6Cul51WnzrqOKlmYYkhws6oWV2caIBIt9gySFqAD0zzvpfB8ap
	mwjj48/kSX49W9jBQldlUyR8gQuM1fQEj0g7CbQ6WtxuLmOcQj1vf8KaHDpzB5rnmuWs8Gx0b7Z
	Ec//DQKafnjONanJBvfzJ4h2O4AFU=
X-Google-Smtp-Source: AGHT+IHAInGs1fY6MhYk+BOaIQN6jWgnuAcNUMCj8asWuYpXZLP7gT6bSs36V8+DqD/oHKzLuMjE9A==
X-Received: by 2002:a05:600c:458d:b0:468:7a5a:14cc with SMTP id 5b1f17b1804b1-477870a634fmr13473095e9.3.1762943360967;
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:53 +0100
Subject: [PATCH v2 08/11] platform: surface: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-8-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFqdZoAVmnIlbNdcg1Y+7nkfxGC6i0n15Upq
 K4jKAztwCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhagAKCRDBN2bmhouD
 16TrD/9AMI5SrOqJWRLQ7jKUbUsOysXBLyuiMqQn38xIXkce16vSkar8aQIikXJi255w8BCbJN5
 XpoXeQslytCRS2CvSCYzSnwLKm2jyAZ/UJ1eYLlbnFgA+bS/tLQ+ZxexHjt9zLRFy5y/asoQ9P5
 T9ql1bh7o1gtWYg/4FFEWUimNr9blWrvDirnEFXFokhYDjS3gC7o+PuR2zOwO1cDK1KeZJJNkxN
 4siZTPlGWjvimJMhb9MFFIaD1FGMjk8Oo9RuC38wtEQu+3Qnfv/pidmsMkt9EOEP0qyuk39qX97
 K0bF8PhZ0HlmSGHSqBDDnZ7h6TT47NdxsBFm6VztA4UBwafUt0laGgFVTbdjsPh9eLldIzc6gX4
 qd98n+HB0L0CRvu5lEA4fuApN250SBVNphKHTRCHH4rvm+c92d9Rviz27WVVP6aXK0lXrLRvuSQ
 a/h5NgHZvUsRgGR6F+KsWkKyMqs82BCAQMm3hAXYKGAHaMWvvL+CBlqoakEF16kOlukPZ2PeyBx
 +LBG4qy8sQRRamg1wPYLUZkGifRetG7z45hjdPYQwpEltgLy0irZZM9ct+2IGITcZjmMnULegw4
 nTMQ+fbC0RPtlIJPjVmVA3X+PhxBpo1um9dL60Lwd6bft0tS+sEppobeeBlN0d0Kr9qBJ5OTrXg
 yG81W0MnFMi2LXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022922_776025_74A13C6D 
X-CRM114-Status: GOOD (  12.85  )
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

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index a594d5fcfcfd..78ac3a8fbb73 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -491,24 +491,13 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 static int ssam_platform_hub_probe(struct platform_device *pdev)
 {
 	const struct software_node **nodes;
-	const struct of_device_id *match;
-	struct device_node *fdt_root;
 	struct ssam_controller *ctrl;
 	struct fwnode_handle *root;
 	int status;
 
 	nodes = (const struct software_node **)acpi_device_get_match_data(&pdev->dev);
 	if (!nodes) {
-		fdt_root = of_find_node_by_path("/");
-		if (!fdt_root)
-			return -ENODEV;
-
-		match = of_match_node(ssam_platform_hub_of_match, fdt_root);
-		of_node_put(fdt_root);
-		if (!match)
-			return -ENODEV;
-
-		nodes = (const struct software_node **)match->data;
+		nodes = (const struct software_node **)of_machine_get_match_data(ssam_platform_hub_of_match);
 		if (!nodes)
 			return -ENODEV;
 	}

-- 
2.48.1


