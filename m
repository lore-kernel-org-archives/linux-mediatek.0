Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC46ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgYNVZjB4Pn2lQCC1oj39Mw6qa+vt4omi29gCwBD9XA=; b=H1n/TGjI7FppW7ksz/X7r+MAMm
	087ibNHI4xFJsusX4bb6jCKVJ04GXRGVi++I60ZqlgIsDZilC6Gp9bG2UiDTW57ZCNl1cjeI9AwmA
	bxEPtpia1yp5Hg4UWa3v62RLwGoZ9o3KluQt59NGVaWe7xHatFMD9/fqKH1WTeE09TOY3DvEs4dO/
	tb34io8AIHk3+8Y1ybcvueDbl9q3yd18nmUl+vyDUkKAqCw+bUDQo7hkIG9loq4aPD9LziVY8Df/+
	ZcijJ/5GTs9+m9qQ1Nsx5tmkYAZbvxCAmzj7CmUQwGlZjy4jVa2aTc6AgYax/v83lf/9gGD65r8wb
	5qQKWsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkvu-004uII-Kt; Thu, 15 Sep 2022 09:13:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkv3-004t2W-Iu; Thu, 15 Sep 2022 09:12:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F6F56601FC3;
	Thu, 15 Sep 2022 10:12:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663233144;
	bh=8fx/KPlLmnPAbcJz0uLlLUOKmFnlLf43xmpaEp+yAcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q16pttDvcRQRFWuV4vPBcLX2poT3NPfuKpYd9y0U0aIuiP9vu6l4v8GAQmiJYfl8z
	 gp3iAlSF1rNimwF0N/Go5jJ91DMfMykMlimY4C46WfM0urELFIBpTcC23CebyrOZHV
	 JzMkTSQEc8C1EYWnoJTTe0QhfjD2QUyuvRlMbfoeFzIeMMT8411p8GQp5rQVLjnXcL
	 HPKPwt2gswWCOgIHwjKTPaMZfzdDKwKUr3tf4FEQliiKNJpbHxLGibopowUQh147vJ
	 xuzhp3ZaZ1PusfBLpJfEemg1GYWo0sFlY9B7ijk7r41zDuXRqORvRFH/rpxDggikft
	 7nYs1/0lXlQow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/7] leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
Date: Thu, 15 Sep 2022 11:12:09 +0200
Message-Id: <20220915091214.59673-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021225_774931_159E7B5F 
X-CRM114-Status: GOOD (  10.67  )
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
index a7d1ed370969..fa9d251e9efa 100644
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
2.37.2


