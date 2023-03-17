Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11873C76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=; b=lwClaHOQJic8dY
	A7uoCuAVOUnlbswiHkHEiCuBQtDCHU/gQ9bkcG1AaqruVVYUJyItxBjeZUxaEYAedfgNpMfybJ8oz
	DDrbNS9of1GHlJ8edVLxOJolQyWhczr8yD6mZVKzpIrodYokniWc8+ObryRWspNute9rFHCzwcnNi
	ZfG7dBokmowIhx0YsBhvBpreO5LuhCZCayFuSoqMBMqKyCJpdJLHE756BTXXWtaeLpv+awzEbdnmx
	GKc4so4H3Es3nGPk4vSwMIHKTehFeTbe5vDgqAOeyF3YlFRyFM1Jvv5+ubzju9+FEK/AbzpkLNcQA
	ZQ5yxnblidY/NRutcqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHg2-003Spw-1f;
	Fri, 17 Mar 2023 21:31:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHez-003Ryq-2D;
	Fri, 17 Mar 2023 21:30:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id fd5so25401386edb.7;
        Fri, 17 Mar 2023 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=Nj/yv883NrbobitzXaKxcYWACXTNOv5IeesF3v8/SYibxX7Grd0zQqBqRo4aCNf69P
         qs7cv6Z2pLjSi7PElPIjTE4yFfkXsoSfNvHxfySPguyzaLHoH642t208C/4SVMfSeWF0
         oh9gqCBMXwmn9zU/HJae0O6YN1pLywu5otcUDIceCk6Xv/lmDfMeXwqOFhhVdwCo5Noy
         VoCNAgl5EY/ijB6idyAoam0qDGZl7K4riAk/4VQrja4PiHsvvcwYyMRom5cjQNHCpdfN
         x80AsQxCu1At9LqN3Z8sI9eig9SOocDcs8Nl8gK1CvesJeQvCKFNRX9CDsl4THoATuAs
         1NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=LWOh55TOWETMDFSLhHUkDTxrH3c/Dr0VYO9eYTMQceCQiP2X4xmNQmGYcAlCX9pWi8
         avftDbLrA+/KKhP0yCOQrP0lMmydbxUpUXvF6S0zRzX0oP1plQRKEbZVF+0b6VQi7xHm
         ZqbYdxAI6trMgd8nJ/JHRCeBtsoU0UolegK1Gw0Z2ElS/IDWVds97PwA/K7B3xyroLyI
         8fFWiRF4MNHS7J1jbXfOh7ggLrAXk/Eo7iAoz7dv6IcaJaQMKBy0f9T9bp2VjB054SUc
         y7zyUfgTiyJChHxCW2fXCevO22Olh7pU1CUEltmxqysywpIuvz2MdBDHZ+UItQHGS1Uc
         tKsA==
X-Gm-Message-State: AO0yUKVRCsJDP/77ZnydhQeWlKR98Awcy3pArZMezsmNP9wzwOdVuA6c
	+cXs4eGftZE4y9njvG1d0Ho=
X-Google-Smtp-Source: AK7set8exkSeTiGGFVcm4bMaCRqAh37sCsa47AQqZCcy7GGsu7JIZnViKmVXS1DpDenp0lpJfstl0A==
X-Received: by 2002:a05:6402:7c3:b0:4fa:4b1c:5ea3 with SMTP id u3-20020a05640207c300b004fa4b1c5ea3mr4692669edy.23.1679088649113;
        Fri, 17 Mar 2023 14:30:49 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:48 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 13/21] dt-bindings: pinctrl: mediatek: mt8195: rename to mediatek,mt8195-pinctrl
Date: Sat, 18 Mar 2023 00:30:03 +0300
Message-Id: <20230317213011.13656-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143049_740145_13F23F2E 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 66fe17e9e4d3..7b3dfc14eedc 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8195 Pin Controller
-- 
2.37.2


