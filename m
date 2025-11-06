Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DDCCCFA19
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=; b=tFqjtGv0hGzkrT9b0Ot1WzuMcE
	eUObbgwpL6XfJduVIvbBshYz90vfuzuR9WEqNfOTlpqjiAX35IViO8IEEC1E2na5tKznX8o2gg/yh
	udTUouknC1S1EwgEdCQVnH/wTPELDPw6IDJTK7qa+FBaUjFJ8kf/b8CKqIL1qSZGpp1BiYpDNEvdT
	f3VyJz398j/HdtSNAoYmg0oOF2MSeC4s2vGpqUkbyPpKs2el1oM0Sx8YhnrI7JzeTXCrnV7Z+FA1b
	4xvDy01VpE7JnPZAdm4iOt2V2OyMAgAcEgqMlYcgUMOsyx2gZfnqy4enMGxTROdaCyX8nR/PHkOgu
	vZl/KbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lo-0000000G8jr-020O;
	Thu, 06 Nov 2025 19:08:52 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Lc-0000000G8TE-1gdS
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b70ca7d1e78so20575666b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456118; x=1763060918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=H7919c/MDvw4Mm6LXROoFnOHgpXsbfAgBaGJP18ocIyexZZyRrccUfE+a0lnnZPViO
         iUzqgQElZlNutDCm7GYHrIvk1Vfj1TV+y1anzNpReqtvU92zMeFqgKvOO8S4nvjC4lx0
         c8Rim0JVuO44G0rgN6tmBVh6RdHyfz1Lo3SbR5YgoSJ1Ealq7Yk/gwkbO/UST0UXPI5B
         Oi/7uuW+VVkxsay3IVW4g/RNjRwdpms09eJO9kzyvlHv6qeA+y8HyZu0WO2cFAiDkff+
         n+/VmXaMRZ0pQdVLm6A3Htri3GKR3GCPBrmgbgDm9tDSNlsym/xn+idCc09yMMvnIMoP
         oGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456118; x=1763060918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=OGJe+pgh772YAqGAkRQk0zEvY49oV6gTSHWAEfoe8UmMMA7R+JZlwY/lz5Fvq9e8I0
         6qREbYoI5BLpMxpU/wZM+xqhfasWPNhP8EAsWtk9YPDo5OAoslcAumvJLQZgO7G3CP0s
         Xl64Ox3ZKx6cK7xUNREkCQPLod3ytjsJpYsEy4H5nsqmdxwzYTjLFi05400BASxdnQQ4
         k4UL3V+VGYvH97oZ7JOO/KvUY4yPY5ipri3dK+Tu7u4FC3M7nDdYKzH9HwsIYom4QWui
         BpfcvrwUwREAUGMkdOuvTZyS7sUkzDkGLx5zGLoSKE7RU+aB4mg8arNJWjiT4RkEvy6F
         AShg==
X-Forwarded-Encrypted: i=1; AJvYcCXUALdwB6w3g1GeaqjoOfOoKmJ71rWwLpvX54soKmPccn4VLWfZnx330kmu4GTgEYwb8j92gO1cacbdwgelTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZD5qIf992onZCgizgKBUhQl02c5YClF6SOJKMGEmn21/VChy
	rs4DVbq+sNKKlWT6uLK+qh9lnkPJ62RVl8qOLNXg7SSoJaqesbBs3CK2dF/jqgwJfX0=
X-Gm-Gg: ASbGncsOBehGSDJVXHFZs38hi+eItlgATWwJnygV4BtTPt2mDeIj2apl/RkkGzVKZ+u
	yklZGeGFW7BTicOgPgV0T0wmYwdM8T0f3TbcFxu8TRU/1emzpQIFE89Y0T8pvHKAEJW2CKeBLDt
	FCpjPybuTYU5DMYkt7J9ieau1vhEQ7nWZkcmzLVQC7ZpdPk06raYJpK9n1UVJZYgFv0a1Qjxtcw
	JmhbcTNLzXoRCwhm+OxmaoFasIg96cI4mGGuTANPfzWGszGNfVPjaxF5kreZ1muaqwDl6wel74f
	cwNBaTSC1EIY7vMbPJ4IJwi6FiQw5mk84SQsQ2FmG384REUXVd8uzTLBDE0PIFqFaMZxKDh96pd
	NyFUA02WO64tlYqieiOWtNoNJyEiJTdZ5LufSrq74AtGKFPzvPlsDeqDlFQKYwcWM79N7W7p+Sm
	VOCtod3G/s7gFNzS7h2B+Z4e5tRyI=
X-Google-Smtp-Source: AGHT+IEG6JIHxsm0NSW77JVy6hqlVUyEbsXE+NHpA4hsr8vUkgMvS24h2IoWnZAH3XOZ5QWMzHmdwQ==
X-Received: by 2002:a17:907:3f24:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b72c0996c95mr16220166b.6.1762456118427;
        Thu, 06 Nov 2025 11:08:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:20 +0100
Subject: [PATCH 13/13] soc: tegra: Simplify with of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-13-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIU/bsdy2ckqomcJnNEJaYMWYw9A/Yk7qSg4
 /78uRfUhPeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyFAAKCRDBN2bmhouD
 1zSDD/0WA69UvlFQXYTOHuLcL+wvScWW8sP6X/fQsuharZFRRvPkmk5RKJ1H9q9haW5mFRgd8xZ
 kO4ELHeCytALDZhxzR3QwE4LgpseKDZSllt6k9bKnAGouD7wl63kISGTR95uVIILdEmQtH/OMYg
 9dplSgp+4dVxPa0TMzVjb0WV9RzYn9ubwlhRES5DFD5bkw7kpUYQY33eE2cmJlfu8p8On3ipNJy
 6bYBh7HG3mjy9NDDwKd81Dw7cMYRGCAV+Ce7NsEl5k92yn1B5nfokau0GlcFCUxhnsSZaUv36WN
 4TRVXpnSBeMhkM8HYEDdG/YqQFrTVm9ohoQrwVhSVRcjOU6I5YHA+OqDxvBRsjpV5YMXTa0JXi9
 GSoRXU2NxMxA8dXrc7ueXed+jGkJ2NNMBOTmQTjoOSU90vT6eQ0g+MQQl7/vUDIqba4kLTnLjsg
 qnj7S5s5q4cMGiqprqCXnP1Qei5JXuJtNsQzMlmH1GBncgQGLvI/8rwSqD8JGKZHVXHFXovLa7K
 O+juSa69kES3Y05oIwof7EKPSvvW+pOyi2uAXgt+v/ca2qUmbqicWLvSad49kbsc2SLlTGsBsxk
 dD6AtoUoZv3MGI7XcFgRReuI8yTr1b7oU3zSAcyqwA2aCLVxhUyBZr31EQaMVpQ9xST2iFnLrna
 O5LVFZW9cO0pqkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110840_557460_D1CC68CA 
X-CRM114-Status: GOOD (  10.79  )
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


