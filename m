Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87E8C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGC3IFZ/oom3zrH/a0wgqeE8uO1zX5ZJOHTOF5Wa8AY=; b=UnuZrjk8cdv+qOUubrz5PL0DVq
	r4EHj7BFrhSvhBdRXq2Ok05bbgjYcOoSSp5alv3pH5S/G9dzylxrXJ8keKmXuNdk+ZNaM7GPjasPN
	lstW2FtmDjR7YeGkMLRbenxetxG9RO9YhWW43uKLJp8BwytAfDTZHMdJbOqZUia6tzW9LM5P6H4/n
	pW+L7/LhJsy/dz3noKLCZdEmc7WvWYTt0dWRum6f1/wCulfhsYksYw3REpy9evEkmC3pSf1LrGfAI
	/bimv+ZNl6SLe40RWoM0h2h6WiNGJtCqg3yXIR+kRGnpcx5kBs6frBIS4xAzj7XokXWuNr+qg+CuF
	aVvkpZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAX-003B57-12;
	Thu, 01 Jun 2023 11:08:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAM-003Atb-2W;
	Thu, 01 Jun 2023 11:08:29 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1D156606ECB;
	Thu,  1 Jun 2023 12:08:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617704;
	bh=x0Qr5LahDfyZYZmRkn9rv/gKpzoGdsqrT9tCKkLWPyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jkQIaAMQWxdMtJ2Y2UqHFh9nVHlXD+9iuuCazccKhNJRxHaM69XgsHkg5W+8ECBOr
	 utYhND6GBl/pA+BOzweDtrDNt0I5cBj4mRUIBgezE8viQLkKY7I/+952tcuPh6IPEH
	 Fp2T/8eJrte8iJ3m/cJmZ4DYp4DGK6g0x5W+ECg/Y9qmsIf4HziJZ2HfGuiwii8yDL
	 1d2ssJvYZLlHmhOz2fwr/2p1ExYKQ/gAHBZGWT4b1HhrX7pBbPYYDiNWgQIcUm2AO1
	 EnbJr0vl0LYZW1NK5qOY0fs1nXzGFlULA/ht0TvCjZIjLt5S2CtNM/XKnFVzp0uHID
	 0IleZnRS1Y8EQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 6/8] leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
Date: Thu,  1 Jun 2023 13:08:11 +0200
Message-Id: <20230601110813.2373764-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040826_955291_DAB0A4F4 
X-CRM114-Status: GOOD (  10.57  )
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

There is only one instance of using this macro and it's anyway not
simplifying the flow, or increasing the readability of this driver.

Drop this macro by open coding it in mt6323_led_set_blink().

No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/leds/leds-mt6323.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index dae782de09c4..f8bd9f17e89c 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -57,8 +57,6 @@
 #define ISINK_CH_EN(i)		BIT(i)
 
 #define MAX_SUPPORTED_LEDS		8
-#define MT6323_CAL_HW_DUTY(o, p, u)	DIV_ROUND_CLOSEST((o) * 100000ul,\
-					(p) * (u))
 
 struct mt6323_leds;
 
@@ -316,7 +314,7 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
 	 */
-	duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period, spec->unit_duty);
+	duty_hw = DIV_ROUND_CLOSEST(*delay_on * 100000ul, period * spec->unit_duty);
 
 	/* hardware doesn't support zero duty cycle. */
 	if (!duty_hw)
-- 
2.40.1


