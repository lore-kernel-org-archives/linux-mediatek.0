Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A821CCFA05
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0wRqNZjDhxKoGJXV0usfDeV7Mj3Zg6leQf7T0uY07Y=; b=LKU0vctWHkOk5CX/b2h/clCAPO
	AjcseL+5vJOAx4kyuLfw79PzDNDulbMA4siYVY7ffDieJM7s0oYSNFPWX8jve8ybTL/r7wF6ut6ot
	eXxPJeTTcuL+3Wk5Zfvp7G2KuhGCdioAplffTvm8lT44cqvDsAXBnEJtng676I9UE5BrflQaIrhNN
	Wja4sa92NwEWGnk12n8ojH9EY4+kXZ9P3LtY4gKdeVL+SyFt6jNne97eR7pPYC1N58iBGIl9DjkGr
	MdFlUUoxwUHx0RjwhclbrnBTP4DFDJ7+ci5T4GDWU/fUCPdwJMD8rvsF17p83/vxevtR4OMzrXIRW
	3SKI6xOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5La-0000000G8Qt-0nPI;
	Thu, 06 Nov 2025 19:08:38 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LT-0000000G8G3-1OT1
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b70acf7fa58so17405666b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456109; x=1763060909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0wRqNZjDhxKoGJXV0usfDeV7Mj3Zg6leQf7T0uY07Y=;
        b=mITMAiSBTFv2HWeaIWLVM5I3ZTVE/iL5WHwHgiuuCSShPTepbyyIvDibzOZkTLMIvO
         F9KymhWyL6JIz4RF4YDnbrpw+2gSsOWwqhHwf7W8uWaiMdg3NmwWjmULp82Oz9p7788J
         QIMKV1RjEukMTsQ334wKIVl+yGD6iEh8bkF3xqe88XYeJgGb+Nf8SE7kCR1ZhBLqArp/
         1YyPxEy/jDLItvLUKJ+7zF1FZq+fcG0dmRjBMrLqlduKN/v7LBUkgqGsxCQOrf6LHvYj
         IUKOFdXbYavbWOi4NolJZIHiZ3JnRMMpBmVszqxuSAxrujmRASt4P1b5WK3qU+HhVzbQ
         ANfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456109; x=1763060909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0wRqNZjDhxKoGJXV0usfDeV7Mj3Zg6leQf7T0uY07Y=;
        b=bkbWBDo+KhqC+d/Kjl7UVJWnZsr0tjQHi0CP0CAuWAsltKGqAwCbWmlXKhTZoYCxQg
         D920ZgJuzFSNO99HFtJBBtvmkxISbBKkgKfAaeBHyOLysQ4zGwsMxWRlL0HNorJxKBbv
         +jMHyRGOexWg9ikRo2mErJBOvsdhFQWEtniKwAg9q/3b667nh3tiR3cJv7eAmQNuMhgm
         edLa2seKIqAiUw7gcL0dZmq4DLYZVtXNeEWHJ8bnIsD1yZO9mck/UF91kfsWZSEQOh7C
         WJNbQSWy44xWacF7hiJQsmGDpJXVL25uOJ/3cuG1VBbx1xqbDnVtIoNSIaI6yGJ0btWZ
         vWlg==
X-Forwarded-Encrypted: i=1; AJvYcCXeH7xq2KX8T+hjcUdcd/vTdxkecCgZIs44vYz/QzlTstUH5w2djmRpjErIF4niFuVPQYgeNzhHDK1nH9s2zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDM4mOslgYbDv9dWNuTm31sVBPGcJqfeWnuilLinYMcEgm6RZ6
	5zIq/WPOSbCbrEWNih88sYuRvWdy7UeZJK36YCZz+sXnxmR57Uc0OIR70MlL+mnH34fQ4rn8G1E
	QUt3s
X-Gm-Gg: ASbGncuU1C8OZrnTkK0AAjP8fWx5w63CtUFmvnKj3uUJLZxQRpd9vwyIZEM0ve4llum
	bUvcKypZDXP9wEVqnlngaEMWoPOAv4B6aLjDlRBA+CYaalCKyUJ3a8ecnuprCVszKfWSd6CACBE
	OTzY2H96k5lkB9iJ3kbO2NmxFYyEcnCXalsIQDyxTU2az1Wsxoit7U7Em2OuYyT/y1h2483UlQb
	XVUOzv/N0jtsbNNciS7fS6HRQBcu+FJlVMsXkQd5QKNJl2X48MeeHsW8vdNjQRL6lvC35Ge8JSJ
	tk6KqbknCeajB2H/tbSuz0e0KE0hfrHb2ASBzN9nj7zb7pNqi/JYXbhO0xmTtrg0vInAitY9/9u
	FSUT9Pu95cBA6AoaKJS/Q7WrBVjABUddz7YszLae2T5ZfrU8r3nL06mqnT0Ogw9jxHysmVkHrrY
	XdF/PI+m87XcvoxMx6c+syeSsLR28=
X-Google-Smtp-Source: AGHT+IH4c9+FBzEsbksRLPluAEN5Q7bHrM/fI2f7vZ+JiCnXsA9u+zTGILggtvCf5W5Ec2dC2M2+Eg==
X-Received: by 2002:a17:907:7b83:b0:b71:a627:3d9f with SMTP id a640c23a62f3a-b72c05a79b9mr18769266b.0.1762456109330;
        Thu, 06 Nov 2025 11:08:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:16 +0100
Subject: [PATCH 09/13] platform: surface: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-9-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u7YvQdbfgeK3r2KrWjEjECrNLAFFKQw+0JuX/tEQ9/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIQS0NKG5M8Y9dtPEfNKTnde+xk+nLbIiL/5
 gZmzZeeBqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEAAKCRDBN2bmhouD
 18IuD/485ZrsWmmctVDH8SJy+QlRAB9G6pjgkgZCsJfoEU8YNLRcSo+N5QfbZ8vq7xgBZM6GfME
 Xk34JS9iLYYgEgfFMRtA3/uM3M1U37fJyzng1fw3aPcRICCnY6Vz2mwVL5Q8MVqIof24NgdWpu9
 0SLyBUs7Py1HicjE3zHaYTsvDbZIjYGwdRam+QhhmCh5aUy3k0ee6ws2AZMGaf9jTS4N2bq0ZN5
 PAIqqjwEBcxYj80H8KlJJrvtqn2lZ8EJribf1wlTg8Tn4m0kSlpjnTWcnsDmC2WqDwlvFnBtQK4
 oy655q6F8f98COg+E2qETR7V1oUJFhMU6p25zR0eRvR5zF5ccdp7DhYlmkMrvJCagkv+8On8AjD
 plSomWDS/IUkuqmiarbHjxcG004xbozEA8J2Y0cUaQHmh3KKva+BETKxo/0StI2jpz3mHwHv3+E
 KCCYZUNAiCgbSi5vr+KWoQvUvpQfkKQpk/d1H+uNE5TxYVfj0b6dgkqxsleWst1GxTh8zfFvvn8
 W/PBbn70TH1kE8i2VP3s6UcRZAHkxmBgc4TOF3bAVQGPOhn44A2631dukvOLGyQILOlJ+3Or4JG
 SQphnIWjT7wfgFxy1m3Y8OO6FQEos0eUYYJEERoDgaUdbPafYH1GPSzBjWNn39LWsQUT6Phfa9q
 jiVezEzJwysuNMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110831_424941_16891C18 
X-CRM114-Status: GOOD (  13.11  )
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


