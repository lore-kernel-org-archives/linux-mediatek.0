Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C584BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByXWD0lCc2CI3sIWiOYpDZxY7pYbUTZWMwJ3VN18Hi0=; b=HeFoYSr90HSe33GUHA8XKAtjsH
	cQYdWntt84Qz7dOQwkdnATlSsTuhtFNrIoqw1fWFR7ku8eEoOBbRy4rXHLrXjGa7Vf+Z07+7j2tpH
	uhKuN6V2Ki+ATdXqL1GoQ/t62Ww3pJ7tDd7ajL2ayO4b5hnanQ7lN8VI34M76PzgOG96M2gqdNuqU
	6xcyU7wSy55HR5IFMV+A0acz6QSP9WtCfEfHKH+00LkXAWet7H1AfFEyvL8cp+mdyMY+jye+petwA
	8xwhdtU2mNYH3PJxPyZDf7WseIG5SQS/6cb8ja/hDpb8jRXKNIHKYMlOTiql7Y08NYvSkYfXjaKX6
	rorMk1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHd1-003RJb-5K; Wed, 16 Nov 2022 12:34:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbp-003Qbh-F7
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id w14so29667907wru.8
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByXWD0lCc2CI3sIWiOYpDZxY7pYbUTZWMwJ3VN18Hi0=;
        b=kLtCA6b4Gwx5KFILMSNS+Ogl0kqgvx0G2tZkgvanHcqxG8eSNPKtf+/cvwF5V/bUZi
         E5q/jgrvhlHeTyunIUTJkZL9qSL85zcjqiFp7CRENaHhUK2OF5kEgHqQo75h7ZyB2aT5
         kLUbUHDt025aUm4Adxe9b1l1kyHkDxiMDfn09WhwLk/dw68VCHCC564TP6Xzbz+7mnnm
         +w/PZeWQp7zbuCDOpc4zix4TvVAqmqhbCQ+M/A3BZme9/ESuq8YfrOV2Zlwb0cEQONYq
         F0RNdix0mC+9YRVCuo+kxchZ2SBk1dQO2qFHSkQVL4zfJfI3E+eCn24aD40W3N/CDS4Z
         NjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByXWD0lCc2CI3sIWiOYpDZxY7pYbUTZWMwJ3VN18Hi0=;
        b=qCmKz4iJkJe460tTMXfm100y8izjCol3EgrYC67n2dfbJBFC6cqxg5V4Jped98+867
         n25HYwzNopoDiQtRjOuoQjXp+UFoDl7IPzo2COK/dhckmc1g1ZOOVY7QBYE7tgu7Bsoc
         k+PSyiIwHnIzWZQfaOsKFIltV+yC/WCmqv6UBhOlhzRfLRsISau7kCXkCPfhyxdmcAsV
         ZZZMlmJeWv9kVcYKEhaxOCEqpYNPN3sHDUyFD3XMGSoOOIUiRmiHgy2UwMf42I0ZeGrV
         HcLtYosZ6I6VjYz95SsbBXKEc7Y7rrW7PkMJ2IwUTW7/QTOJfosb5vAh6WMDf3HA7AxP
         3MOA==
X-Gm-Message-State: ANoB5pkrIwCc03zdGrqwEuMiWpOJuGsouI0hALhmgUbiPzH2u/kfVna9
	WrSm1BY2ojn+qJwp7fSxcXd3Qw==
X-Google-Smtp-Source: AA0mqf7e0C2iFw5u+lBPjnnR0+qOl8YEMf9M6usMvRVDVDUgRnm7mjNz6NQVZUhWvBs3NYxWsoGanw==
X-Received: by 2002:a5d:6909:0:b0:23a:5a31:29eb with SMTP id t9-20020a5d6909000000b0023a5a3129ebmr13417655wru.679.1668602019299;
        Wed, 16 Nov 2022 04:33:39 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:38 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:32:57 +0100
Subject: [PATCH v5 03/10] dt-bindings: rtc: mediatek: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-3-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=1tXoH1HVwX4fN3Wncu6gs0AgFNOfACwfkAOrtJSJ/W4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNieDlBAVIL+/YAoYamy6vY7S/jXwIimB1VbYYQ8
 bCBYwGSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURQXdD/
 97gSKBpj/3J42WdqW7VkrkKAALxndbe+269SUwn37e6CzavlmF5PYXMN3WT5/xGn7pDOEeAbqC6Alm
 PtjLQ1jIlhkSyIWHpVrDKEIlgIKkwifgLoOLuu0o6R9cD2ydWbdHE8huQoQC8B1ofwB3SCDEqPmWvl
 Dm/s5u5BpCobk3kM7W4ED9NIXxNn4a9mkmTUcoEWT8vwsIXrdZvfGSjWQtW640PU5dqa5TzwbYUnRx
 TZmcTM67PRUeYlSKJOzy5S4hX7hMLIFmI38Jc0Qz+RSQl0aO9XaVTXv6OhezkbaNVDoG2gE+eOy9ql
 MwOdcgSNIJI0MHVh0MpuBvQurwKcMU8g+by7h7ayPrFifWDkW746XzprARQeUtt80FnYf7oBkBwGfe
 mUp9NLFrkz+ALMum0XpH1NSRW7NB0V0M422FlJyMl5I+nC8QerthOcixVRLC/lZKhddKNgLe/dG5ze
 KlKoHYuhW3L3M7ljbjkQBii1Uw1/vA9vR3sfyWUScmvokSQfrcLXgVWtasZasmeuw5dlCt0hbnp5eB
 UfWaVlnsSPr7bKWXx0HEI7inGVgICm5XAHk4xXT+yyEGXnJ3+jTIS15+2iCrpOM1N8DOjxJGlZ587e
 ci/8nWIg0l4udv4NKZu1rfwhtdnork73njIbaGf8uZ8MbXLLvmOtE0Lzraiw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_043341_541289_2D24D843 
X-CRM114-Status: GOOD (  10.30  )
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

Add binding documentation of mediatek,mt6397-rtc for mt6357 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
index f5a323597f1d..f4e861789d00 100644
--- a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek MT6397/MT6366/MT6358/MT6323 RTC
+title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
 
 maintainers:
   - Tianping Fang <tianping.fang@mediatek.com>
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6323-rtc
+      - mediatek,mt6357-rtc
       - mediatek,mt6358-rtc
       - mediatek,mt6366-rtc
       - mediatek,mt6397-rtc

-- 
b4 0.10.1

