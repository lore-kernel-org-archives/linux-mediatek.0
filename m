Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B398DC54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=; b=3RXEhg6ixfVTKpGbiamsEJYg9w
	mFV5P2fQ8KaVjScuC7GOXtjd/qYx/W+EeIJjQJ7keh7OJS7f2kDE7KqBJ0HDLp+3PPUxqlFzuxbOC
	QIIm7SAOXRjf+8GUr1KvB0sE00ClNu7MygwpcwQxTBMMxEoX8bkqNzMB3ykVjfB2W/s2hZ+EeHa8X
	mrjmKeoz2rOUaRKNm58znirYIYFH2kDstoe+ZDn745g7G/e5ZFdFNIQD67RrP1DGWQxyZVTS3i+pY
	Z7nMB3OaG4eImM7FTAKvIMbBzoQJlsrmxVfjHFa1ClGx8d+QSvUyHhIUoc32FE9/EAyheRkO4NZf6
	m5a/IVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3N-00000006eYh-3Gu0;
	Sun, 17 Mar 2024 22:32:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3E-00000006eT8-37NY;
	Sun, 17 Mar 2024 22:32:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-513e4dd6ca4so737094e87.0;
        Sun, 17 Mar 2024 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710714738; x=1711319538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=;
        b=mFKPV3jlb9Slyz/YlhBCVEZm8HobIppdLuPPUEa9UlCusi+rOUGMUUZ11E6YVrghcm
         JsjOeJjLOT4+yYshwu/kTRCO6eF2BWU9FHy8WaUh0j2oIzh3W4KG8rtmj1OA8KfEL5sL
         Tb+oMh3jdqOsZZibaEgz+y6dY0XLLKBUVUHq0GPy3hbVbhsBZTI+Ew1lnh1L/Z91lMIa
         xtDFrvOoxCFNP+a0Gyl7W8uvO868zkrKRVrvAvN9ddim3O0j1botl3yfvmIuNGkOyMwN
         UR/XNURRlzhD+wjk7jpjofmtSiP404/X3Yf9MrvE7zrgpRoBLHHOzE30T60TPBKlh1ph
         RPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710714738; x=1711319538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcJb7bj0vF5Nl8yAX54/kA3qijtSrrqL2OLIzgs28DQ=;
        b=CP0lPZRhz6w45U8mH0lp0NkM+0bcimdnM2w1y6LhB/VfSO6JtSvCjsV/bbR4MBQRsR
         NLlhKenqY9vevkD29iYJ0zraIhzyMr4yzdEJrL/TjR/K5WsB9rQPrBuvppioXnZSUThS
         EAsDxu/DMHuYuZAObeY+nwWTfAGkb3PZGe9klwkGHHpuvFQm9Kfy41yfJJ0ulxfyM5Q+
         xeiwZOyAc8EAja8WG1Tc8qKGOQ2wPCGToxQIRtz73pT+DnWW0yrpjNpefPGnpDxrd22o
         7u97abYKtJJJpsqTc8zKmOAlETsn5DYR2/lE7e2VzSUZ0ztilptjXmxuq+ya/FvsC3+f
         I+zw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6FP8dME/NFNo4j5TGtSXBq/4gjGqznJSGsWh/EJR7QdT+rL1QNWt8+OimrouXyhNHS+3c3VMALDSsQ4VF5MmmaH9VfESlzfzxTDpvgIhEMMB4Y1+P5/3e32WqU/RBheYiia2wnPcV8VgBRINuxASQoHUmYJKFEU=
X-Gm-Message-State: AOJu0YyTVwZBIkHSrF0nX9VXB7j8FmH+MrgGowEOuZJQ6pKPoFv0WC75
	MEoA+R/ZEvApt3V6F3Klin6oSerz7GIdoP7GbKyv5tvNEBzRkaJp
X-Google-Smtp-Source: AGHT+IEEH1HCri2jgaEj2lmkHvpY4OJN9Rt4WUseuSkpkZzIe0tbV3kDqycBsohBoHJp9rcz/JDoMA==
X-Received: by 2002:a05:6512:3134:b0:513:d1d9:9eda with SMTP id p20-20020a056512313400b00513d1d99edamr3571987lfd.27.1710714737896;
        Sun, 17 Mar 2024 15:32:17 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x5-20020ac259c5000000b0051322c11100sm1366981lfn.221.2024.03.17.15.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:32:17 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 2/4] dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
Date: Sun, 17 Mar 2024 23:32:04 +0100
Message-Id: <20240317223206.22033-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317223206.22033-1-zajec5@gmail.com>
References: <20240317223206.22033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_153220_817508_3559C23E 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..1cf47db94c57 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -85,6 +85,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - cudy,wr3000-v1
               - xiaomi,ax3000t
           - const: mediatek,mt7981b
       - items:
-- 
2.35.3


