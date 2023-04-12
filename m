Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1779DC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kp+fjc7avXOotm3nToR3PPyjWkETKK8uV2f+MPCOpD8=; b=Xgdv5Kqr4oON5suxXQtU7peP7z
	c+sSxe4nKIV6hUq7hZwwFjOVIRdU7qXDd4E79GO3GEl0CXKEkdo+HbVPY4groSYM4rRsSmiO/LmDN
	qvHWjiH6wRID8DLeVcaeltfVlpwynm+ng/1BM4jgJlEGm6ls6f26bO2NVV2jAINBTNRFRWJEWmf7j
	eAOI6ZpKwEEEH4XJe3KA2RnAU54z8ofk1N88tD08X8NY+3vPf6g+7ATdBgAkuKYgnlowOPpUd9BaJ
	bqL4+mQZwBaDZvLwRjd3/zlqKa3HQN6ZQ5JRDwiTBIYpmkIJc3kBNQ7Nrs022Iqp0TBhHHuKv//XN
	N6oGNc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTX-003eNh-1m;
	Wed, 12 Apr 2023 15:33:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTJ-003eBe-1y;
	Wed, 12 Apr 2023 15:33:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD8056603219;
	Wed, 12 Apr 2023 16:33:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681313600;
	bh=+DBOozEV6zvFq6sDBHu5yAuL64S2LBrToRv6x5AB1z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GhXRdUVZPffRyg7uD1DEgcLRjFL6IxRvV3oEFJuAiz3BaEoLSFIghKCJYD0lc0XZT
	 /ycIY0UWHL+U+OuRW1xxGjW713R7e32O/VxUPbQ64imudADIDSedOvhopFvvAH9+fI
	 53dSVZUcPn8WAECnzdaUzEAAYdoSkzleHEY+tWBjsTwsdQJd+J2+CScdjo2ci8JMnE
	 MoAV1iRcq2ZgqouJHgfU9rjBojjA5bSvCYDQga0+ymZQeVulbvBHtCBxtZI5YDzCfp
	 pdvB/ya2RqKugj5fqP6dVJ5HqZ3RC04khDqWSC/gmRWcoEZoMrEr7eJCYZ+5Sg3XM5
	 O9RQCGkVfjK3w==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/7] leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
Date: Wed, 12 Apr 2023 17:33:07 +0200
Message-Id: <20230412153310.241046-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_083321_779938_6E4D11BC 
X-CRM114-Status: GOOD (  11.02  )
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
---
 drivers/leds/leds-mt6323.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index a5b2d06e9d63..dc604c187cb2 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -62,8 +62,6 @@
 #define MT6323_ISINK_CH_EN(i)		BIT(i)
 
 #define MAX_SUPPORTED_LEDS		8
-#define MT6323_CAL_HW_DUTY(o, p, u)	DIV_ROUND_CLOSEST((o) * 100000ul,\
-					(p) * (u))
 
 struct mt6323_leds;
 
@@ -321,7 +319,7 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
 	 */
-	duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period, spec->unit_duty);
+	duty_hw = DIV_ROUND_CLOSEST(*delay_on * 100000ul, period * spec->unit_duty);
 
 	/* hardware doesn't support zero duty cycle. */
 	if (!duty_hw)
-- 
2.40.0


