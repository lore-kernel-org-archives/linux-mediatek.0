Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB820C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=; b=V7Mza1VBKxlA/x096Qnvbc7z87
	OoAfnuE4/QA+i9gmo2+s4N/OstKiVQxkxW+8vbBORHj8xZF0wI7cEnnozHddC9s9N5eCJA1JN4+ev
	i98Cul7mqaqsAffMbIhg52Y+5qT7SbJf+0N4AoTpKeWX+57plQvIjc0Rj39+aDzbGZV1XJD7YaN8x
	5LOL9U40JzMv8l0di3KsOMLTG/xbncXpw3C+UL0b+Ja1CaJPKLFuprkgQsWzZyR4Treo0EZSy0UwW
	33wbzq7TUvDl+TZReg9fqCOaw7SlEcHFE01610wkDuQc9aTUJSxsH7fC/iGm6s0idCS54Q9SIPuOC
	YxGjogGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pShrU-00BJIV-KL; Thu, 16 Feb 2023 17:16:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgru-00B6TB-My
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 16:12:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id h16so2326924wrz.12
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 08:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=uG6JP4J5s4VgCLeaaSMrrYpMUkz7e4/+QoqIn2zymNuW8AGZIWurM14kCbo0hv7w8C
         xiAFyM3gIPNHLY7UQRPNKfQpab5CBmhzgBs1147o4xL3s9XEebMW0/EW5HEqg3T4i5cw
         lcj5Qt0nvvUeJJACn73GWUboKFIVQZfcAlCLEY4oTgbUTDXVdKOPcDZeEc8VbAH4lCGj
         QMfEqX7nU10RTyrofs6XrHhFJXHYh9fNfeoH2bz5i42bZW2GC02X/OfNXNzz37faNxPs
         kWes3m0nHyJq9xgQNTXRNPOM3XiuefIl4RVcOy6E8COMZiQQHmKL7zTKPZKSPbow/hjk
         ycRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=COLpWf6ZjR8+QGZesGZJCS0iweKDpioxBhIsvtpT+Fmi8W3drTafJ7cU0jDulJkBxc
         UDPHr3qx8dhodaySfE9k2b3VocxSFceL3/5FasvcSGYnkLZD+6ru6qZ0sqKfRN+gFwes
         24NZG7lIKeNaz97y8rVVs0UI/9Lc1kGDWisxHZqgW0lxKeg31Zvj1L5kjZyljgRkSd+H
         4AIZVzuPkoj3F3xe8T/nPvGSAKH1njCn8qB90MUCcRmJaYnnhtw49DAbbr13bFTAwNzR
         vG7z2u7pepxEJ3zjByEfJbUfPEmTbWW8ruT5pqY1Bc3WI2A0N31B9PF/Ab60KFDt6efe
         ogOw==
X-Gm-Message-State: AO0yUKUggBEiWJpx8J/GIpijqrALkI4vhBY3289WjP5+Dp0H/O8Y6CoI
	LBSi21TNY/b/OjF1TXFSo5PJGw==
X-Google-Smtp-Source: AK7set/JKqI19u8VBblreToMVeV9IFpXFUeRASqKuwKNy3pTpYRD6UdiZmFXkRth/8vgC4ASzyhEgg==
X-Received: by 2002:a5d:688c:0:b0:2bf:1ec:a068 with SMTP id h12-20020a5d688c000000b002bf01eca068mr4816134wru.53.1676563936902;
        Thu, 16 Feb 2023 08:12:16 -0800 (PST)
Received: from [127.0.0.1] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id m16-20020adff390000000b002c56a1a5a95sm1845586wro.30.2023.02.16.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:12:16 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 16 Feb 2023 17:02:25 +0100
Subject: [PATCH v8 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v8-1-a84c80468fe9@baylibre.com>
References: <20220919-v8-0-a84c80468fe9@baylibre.com>
In-Reply-To: <20220919-v8-0-a84c80468fe9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_081222_831563_F0B10F38 
X-CRM114-Status: UNSURE (   8.20  )
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

Add a compatible for the HDMI PHY on MT8195

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 6cfdaadec085..f3a8b0b745d1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
2.39.0


