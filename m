Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKCF5P9PZ8opcxJP48nkYbK7t22zWpJmTzBYjJNCaME=; b=mYgS7Fs1xkIOKLCsjdUdceyzwz
	+koVFks6B/nKxeF71nuoW8gUyKDJe6Z5QdBw6ocjVwpdhpvxQ4STvb9vHGds4Z5sqxRgCBC6HpOlH
	xRnJdMLoOVEDUcYfS/ahOuHAiGs6/iDGXD69LYK3c4kstPxylbB1UNzpTv7FGvbo9zDe0Es1fFi/r
	19J4iHhWLA5XvIL3N040hk0tlIqrqyyDcBp6daFo2fEXsNE8amTeWtiXlmTLC/KnTtngPhPRGpTqD
	R1yueusjzDznXO/0tsIC9vTboUy8KjrxjCeclQQOpn08EbxvEfxPuaZXE4lVQ8gVL45znySbbXG+H
	KhZYtPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkzD-0050jM-HG; Thu, 15 Sep 2022 09:16:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkv6-004t7K-9k; Thu, 15 Sep 2022 09:12:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7586B6602024;
	Thu, 15 Sep 2022 10:12:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663233147;
	bh=4/Xh1ohuebKIvwC0AY9uFYUnkjduE8QIlQvHvl8T/XU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JEVh4ujoePpJ2IoUdJlXxb+O+ySGtNP5u+CNq05Y9IHbyLTKXwflYEnzmuP4N6lfK
	 Y8xs1XuQ5o/c6Yu7NHZjcyRMyKawU/OowkmJ4WdFnd9jeL5WF+FSJJYFAQX6+E17XO
	 688eoFUNi7LzLfw2NSgXjkE9l6fO20a/Nq4N22ADlJCrEwcxwBIFax2R3edtEjFbB3
	 CxcTIaV4zphisAzaT3HmJ1UjkFeWeMbzWqBAks76KpvalnulVAbKTuorq6eKkwn2tU
	 N7JCsFnoPTro7ZvDSB7ze0HcE6uXPzeuW/JYiREXBKC2tdQV2LnWhyA+Ey567/oklG
	 XA13kC4xeL8xg==
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
Subject: [PATCH 6/7] dt-bindings: leds: leds-mt6323: Document mt6332 compatible
Date: Thu, 15 Sep 2022 11:12:13 +0200
Message-Id: <20220915091214.59673-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021228_554248_2B901545 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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

Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 08dcb237a8c2..f33c2f391ad1 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -15,6 +15,7 @@ Required properties:
 - compatible : Must be one of
   - "mediatek,mt6323-led"
   - "mediatek,mt6331-led"
+  - "mediatek,mt6332-led"
 - address-cells : Must be 1
 - size-cells : Must be 0
 
-- 
2.37.2


