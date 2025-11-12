Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922BCCFA1E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=; b=H2E68UwGJEfU1gXXOK5clyEXyu
	+3hS/Hkike0OzPmqO3XRxCFqv9sf7vE871/2SIPR2GNjTopA3C5u+zXnKJRUsnv7nP5VjqWaRHEnZ
	ZvZyKWuIcUD1IorUBJz1PiMuXQDpwtoH6oAGZKHmNzRgGTHZn2dkydy0xplQG5Ix1Sk6PZB89FJgw
	ahL5XOL++4k7uV6OIZeTjdiwyDm6p42wPBpTdYpHqDUmcCcOpm+vTzKi7npjKD7N4atKsB3fRbkA6
	cA6xwIMT2UEBnKyla1Gxph/AYpWuPaLSI1Xb3DOeBGYtAuuK4ycvM/Dgxur6n/JI7ufkNZi50d2Id
	FAZfpcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86K-00000008Z8h-3OVJ;
	Wed, 12 Nov 2025 10:29:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86G-00000008Z1L-2PQy
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42b4c7b2c8bso86913f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943355; x=1763548155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=omit6v4sJ6hkhG+0TNc+1JwWmEGloU5YT6eiNP6UP+zJ2gkpL1vpBMtw5zaZayAn44
         uq16VKnUjFjBTMxvzU+J23oXbBtYjRPhj1lbodQDqjQXGfetvZNhOdioKtHZlR0FR6Ey
         rb1Ar2pyHK98zUUO/h8LcXmN4gb/2gzlxXC4XYrH7hm52ja+wi4u5G8xnAQLWXWelX5y
         kvOC38jx/21aatph2YowVAK8sbnF2LiovgaEe1gM929Wgr0hkwPEAHucwG+/YSDWZ1N9
         P2bXmiWhOvG7HOoLOtPOpFjDXVNr72Yu8HyhWmPKkd2Z4UKL+kHs/BIjs82hZQJMwlNZ
         8E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943355; x=1763548155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=EYrZau/BK4HqpdU4T9fifA7T7Jdf0UijvPNKfJITXlcGsUYUgWaFxae23gPlrPbxdO
         2N00+d8QGXjEJKWs5LDN7eL6Vpyo79Utqr0vZpXeX+AooIm2JTAPtkSyBZ0zNi5Ye8Ye
         hlhhLO0VGJvDxuNQXNfzz1SM/N1ldvXdC4A9Nzb5nf2teIGzZ+sq3Gmak6xz8mWXJU/D
         g7D+qFE/XdPxYGO8TduKjvn6DCOMWwXIB1a0Mq6i0/8TMc3+vQMFPyKi17xL9qYlVmcH
         nA96ggwjed/Vd9hZtxwLei4UhoKjhuyxKJZAD4UZAgjHC4W110OKjxG1vLH5xUehddtL
         Kgcw==
X-Forwarded-Encrypted: i=1; AJvYcCXyhWduHgJ0umXRJF946pIHmdHnPqRizPiMv0mTk6ZlV8dtiiY1Sc/rtIPDak5tenwe7YzdsXFFl0McTkU1YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHv6R1hiyyfDRC2mQewGNgHLm4/tPjgXz4F2ZLmaU5V8LaCdCL
	HRtVQQDnevc5LhiMqKaSVYSosU/Vsq2NG0H78I2s/rl2MCslnhkyal32pWAzZ4qL6OI=
X-Gm-Gg: ASbGncveUtopbQ593F3tpBKk4IHt6ibXzJLB1yTiL4kJhWRKje42tox9mXsW85cs3mf
	Phwu/ZkhXwPT/RkgdlLLyMVWd4JqBpbnPjlJo/L8Rew6OLI/z4KbF20iS3kV+pXDquUYH8Ug4RW
	uOq7+S4WZfd13Csn1plDeZPlFpDe/fJql63K//3dNyH2kVCoVD6dvWlMexmqcTEsCsIqzUS+nMX
	GxupmSJg019x4zLghV3BHxohcXcNVAwqnBTGhw46U0ooywmTlcuaCuXuSxNQalvTQ9C550Sjrp1
	NzDpTCYaXSJ5t6q5oXQUcn4aexRWTkHl94mjmLn9KCC1MJ11kdIA3UEDhA6H7axV2cIQOELHgfG
	fj5oRfcJrp+fzqIzt6EG9nG8BWR0ppJVLONJAAGRIYiD7KNHw6rY8ePq4/N2QzBIFUDpDU8Igvb
	rt3t4yGZuB59B4/dbp
X-Google-Smtp-Source: AGHT+IGrKXMvZPgqQESuBAhxDftEhNsnWrEuywC4iLSQ8rVCnZlglSobGl6lS0FycwtWDDujVctuoA==
X-Received: by 2002:a05:600c:138f:b0:477:79a0:515 with SMTP id 5b1f17b1804b1-477871eedfemr12412855e9.8.1762943354825;
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:50 +0100
Subject: [PATCH v2 05/11] cpuidle: big_little: Simplify with
 of_machine_device_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-5-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFnyTG8g3Dv3wVreirAjpYs3pAX3qJ3UXkuT
 K35vq/FMbKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 17JZD/981Aty8LTyqThGaZ2jPZnQRqILA4jQLUdlyGHSD3o1JOkc/OejeGBa2XG43Vs68nAkJAD
 joLQtVvcic7O5R3bHLdubIg/nwmSiJf4E3lzP/egNMDXmQGhpjFr+JbWrafzPx5AkJOcZkYqz6N
 YUgS2cJxbZYonK2umjv++lLOLQnSeIo2E+KprbWM0yjX6kUbPE4epGQaM065McRy0AIwdI4fxoW
 T6NV0F+1HAANoi65DBqfvOzIdaeldH2t1qyaOaX3hEtYzvDDKNjh/Ut1AmmH7gSnlsU7EfG0AwF
 O/P4RyK/k0twGUZr83j3MngPkzj6XIIc800HONG4zXqQcRu5Wl+UDmvPMfhu+G8hCTlD7pTKc7B
 3yRo8XhIdgJZL4BIBD3ZMaD/sfeWkS5N2HQce+sfgszMJWRCRiAIdL4jq2lZ87zhxw3NaR7MQUI
 LnKOqV7KTzrZndBUoFckzLoGxG9iwlS/Q2z/F/FzJK9Wcw7CYIjpNYhIrVxg8XbNbtfnvevBGif
 fIEC9fmM1ZsBP88jyZMpC/z4Jsfhbfv33/tx+L/MkGKxM47rhKd3kvDjANqxXGKWFhO2FB6auwC
 +Cv6k4NIK1sSTmE+jFxF9lSfYVoaZadbNr4XM6w+OP766Lilq7Fe1l29ZMNe+NsXwsVo4jys4VG
 Bx3+BfE9uyjqLNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022916_642239_359EE0B1 
X-CRM114-Status: GOOD (  11.83  )
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
 drivers/cpuidle/cpuidle-big_little.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
index 4abba42fcc31..08f6bf2f6409 100644
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -166,20 +166,11 @@ static const struct of_device_id compatible_machine_match[] = {
 static int __init bl_idle_init(void)
 {
 	int ret;
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match_id;
-
-	if (!root)
-		return -ENODEV;
 
 	/*
 	 * Initialize the driver just for a compliant set of machines
 	 */
-	match_id = of_match_node(compatible_machine_match, root);
-
-	of_node_put(root);
-
-	if (!match_id)
+	if (!of_machine_device_match(compatible_machine_match))
 		return -ENODEV;
 
 	if (!mcpm_is_available())

-- 
2.48.1


