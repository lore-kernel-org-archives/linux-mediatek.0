Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF01C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X9QsV9/LyrqNbg7T/d+xDRVkLo4KEmI/Lt+kJ3J8UQ=; b=pmNiVjJnJsmaEHfznUytHEjA/K
	PfpK/yf7u0MuRns9d0dpngoBAS+RxVf6fJfQj19qOk/PBD1rnSnJRvCRT6H7uvY7gz/D0E7O0oB+H
	1/5aVaSDmZ3mF0by0iSqZ2RAweEisDeXqIC67FTNj1hLQKOrBd8CRRAbZTaYR+QP383MfPr2xlqqO
	hfG8Hi/GhVUFha8oxZJ6BNIC2JIjmTZw1dOQambtCa0EtnkEkbsR+Fx8jweiGjGNabV98op8n1ezd
	CVPCC9S36oqs0DH+VKWQg8IFodtUJsuk8PNzP6ZD3DteNr851rZVGnjrJKiDpd6wUrDwK9kg7SGp0
	k3gUFkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIya-008Mio-1O;
	Fri, 31 Mar 2023 17:55:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyS-008Maw-14
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id s13so13353306wmr.4
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X9QsV9/LyrqNbg7T/d+xDRVkLo4KEmI/Lt+kJ3J8UQ=;
        b=WQgrqRggpUC2NAvpGwIZ+aVzYzjpU65hI38zU68+ESLBi3LeZLy7MqzISwJWs2tKeH
         v+Kynr2DBRR4dl/s27O7yozU9FIuoFe+6T4hP866340Pg7qVoisM0D/Rfpaw7/ZzCe/8
         QLD5+UhFLyv0tVy89VSnBvTyXIBj/UmTK4moZzWcWZWVjWwuYCgrwLHgi2fXKYv8TiA9
         cjHGi8O4lHk3LYSsUdXmUKptE5DgglSWPW5VE+fC4lcD/ReIrEAIjg4F+WVF5UkBx4Ia
         Rsx6z4UZf6pabewb7baz/BuH305id47jPgY8kqyjBrJibHyTHx1i8I0FhaVQPjPXyF/Z
         hUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6X9QsV9/LyrqNbg7T/d+xDRVkLo4KEmI/Lt+kJ3J8UQ=;
        b=Wj++6oahuzv8xuHERhEwfKdMUHk0uYzWOVr/jViLb/EPvFv+amP9LOSpCIlWZERlvP
         QGVZcCFPvLq/o5SoBWol03C6Cw6bGbyf/uqN25eFGeM4z0IV3326kGfTAQgdZBDDr8pd
         TzNtkmS0Eg+SKlpMgyNAeJWqozCAuwVOVrWi5wiYbmsBxbIXSMfPKObEyPBzCIhk4ehT
         duSK+tbkwt9RpgKcFnoTLKi14ZZqvulBRU7gezXmutUWbiyntqqbzHLwCI5K9IQB+t4x
         UxYVmFdOPM0KLArGYN+zi6n9ET74E23YEhQJfg/xpmHhvqmLxipHjIYkPsWiIvMCq0St
         WtDg==
X-Gm-Message-State: AO0yUKWIOPjAr2jAb4ceQ8dbbRcnV/2EBW7Kw/4Bo++st+CVZ4xUuf2b
	rk+D2d5p2Ee7ATQgNdMozMuVnw==
X-Google-Smtp-Source: AK7set8LXk8MGcZxkHFo/cUpFNkBaTHtM3PNM2BZD8vGkKaYKAXxnw5lu6FxBcIN6ciVOkC2542xoQ==
X-Received: by 2002:a1c:6a13:0:b0:3ea:e834:d0d1 with SMTP id f19-20020a1c6a13000000b003eae834d0d1mr22112353wmc.36.1680285335909;
        Fri, 31 Mar 2023 10:55:35 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:46 +0200
Subject: [PATCH v4 02/11] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xlWHZhxtm0yXUQxDn68Sgf/MoHrbwggc8aGclOBYQIw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6T99FfMtpFkuU48Et3y/qOSZvfZnpPnVu0aq5L
 pHHO68iJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcekwAKCRArRkmdfjHURTeHEA
 Cj+We5q8HnBwf3AGOj3djXUpNInuJoYFw6juyY4xlR4yKWMZdkoTG8mViEkRgMTdIyaUu+aD4SCpd/
 2b5azbeBwLyBZlIUa/n91u4j8mq8SoTvOpfKzohQfbFw71l/H5djaxf/ewkaeqNYz4MJhXquv1ZxML
 Yhs9Oz8SCM4uGtg3Ah0UasSMnbzLacOC3iI/yYb5Pv4pjsEQVwOaWAgQt9znDf056YnZrVHf5I5gPv
 ynQ4YQsCqYRoHq/buFGCbwOhJMVmuAhAtluiwSDlAx7eyhBQkWOcU+xsVcy2aTVvONB4QfPLFUljkF
 kGSNSUSTopoHBNIhPe4FdSZDpDxVl8eeb/rhaPONeGqFPFG/4qkvh5hbNE5LQpQP1Q3EVbeckH6wo/
 qbx1Vfne4DdktBTt9jHEx20Nkq7fyqB90M+3Ee51WRNq86b7gYibDr8/fDd2MWnym3HYmzkPSr1ICo
 PVxtecCmcuQBhjCcknuhtcQ2k3P/aYy2aSvuxoKiQZLR2SgM+L0n4Q8bnCeIvGgI1An8/dxNawgR3a
 RmJ6SAeHjy1nXdrCIUIqBhlanKHfHNuuUNno8UQ2ZZ/3tEeESrQBy5/r7X9P2c8ARNFeMFBweodh1O
 2gpmV/NwRMv4/vMUWDyQjwpabIwm0W+vvxG4GU+K1Lav2GB7mMhjFmDmayBQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105542_436311_3C34B73A 
X-CRM114-Status: UNSURE (   9.50  )
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

This SoC is able to drive the following output current:
- 2 mA
- 4 mA
- 6 mA
- 8 mA
- 10 mA
- 12 mA
- 14 mA
- 16 mA

Then drive-strength property is set with enum to reflect its HW capability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 4ebc7f1caf55..df8e9b32ac2c 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -99,6 +99,9 @@ patternProperties:
               2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
               3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
           input-enable: true
 
           input-disable: true

-- 
2.25.1


