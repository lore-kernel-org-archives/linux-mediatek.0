Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6813EC46467
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6gNym63NgF+XTZH1xbf0NrIpXmryBatnYIRGs7yiA8=; b=2rDn2fQzQ7LuimvzDDKVydA6CU
	QacIyOGtVECp5l6lepZoYSvEDdkUi0miblUheOgqmov3OhfjVUedqZYlxSFtrzqMQkVVyQRISIR1s
	o9GQfyhm8p22Zf8/0SO02HeOWeD+148rR+WFni94oRmHVwF92DKp/5CfMOjgj7fQPOE4tcp0J+QM8
	O6638SqalU+knd/ZgxmYRIiaZrB2fFdFIBqGpz13UKtuP1E08szMbx0lPNChfuy6+R5A6ZoEddp3n
	/nQBDGX40+S8Irhg9O60M2rp2rWreIMvw/fkit6AL5KYH0rikbD0UXCtdbupUq2cSDikEcfh+Hf98
	dRlHnbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOTs-00DYZ2-Ls; Sun, 27 Nov 2022 20:42:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSc-00DXzK-3T
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p8so14528594lfu.11
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6gNym63NgF+XTZH1xbf0NrIpXmryBatnYIRGs7yiA8=;
        b=k8oaQKmaomgkAAn4gJZ6oz32ISeg+f7NDfvedrkcJke0EM6slwU20AqrWqz1Qz6RYK
         fIhTcalN17IvM4dsYhOaQ0fpwL9ECK9z/7la/ySHXY4lly8cV6FufBwEBdFmXxWQOtQb
         jPKe1cxmxY0r1cbtc12jE6NlqUOf1avSmAsYJJGWZzltlmoNFVaOJHtUthLVbYGZlMNx
         0pDYFPTG5la8qLXlRG6hTmvbA29MeVOOscMTetTzK0v23Sbc/sQUGGE4sJH4PfFMAfwu
         T2kurnS+tjWiwrgKn034hotN65ap0OkMKQxTzwG1RrmIL2FrLtspFa7gPjmJRE8HfE7Y
         aarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6gNym63NgF+XTZH1xbf0NrIpXmryBatnYIRGs7yiA8=;
        b=hHVqeECp9yj7PxcgZWy8BJd855m6LWiPQvDy3yAzrqpce/+dc9Phg9hx1CAYPJuOlC
         NfNPEfk7ZPzzl+VIMayRakvao/Uui3kPtAlUwjfhgSbioUsLZJSKBlVvXLjqIUuneo/7
         Qtl7NLkHCXyCv5IRHzO/CpAaGYfAbXMOIgT1lDkIAMN8Mhr/ziU7ljfKHQmQN+VXBwgi
         syRp4bvDUXHEsfeZFteXZQUXRfSQB/ziutrmaG6J5sbWj+Lc9Zz4BDZuW7n3WOQm8x2Q
         pApedVWT/RRtWIsSl+J6Qg9W5LmlzdUweJJdnv+Wp5wlSUUPtv+N+0MxIJhelTpd1oDb
         dmcw==
X-Gm-Message-State: ANoB5pl1KIZ3mj9sUYQJMDorNGgZt5DrcFoP2Czyt3fHFvxhR3Wh6Mwt
	mH9Yr2J4QaU42GkzMJPFl9eOCA==
X-Google-Smtp-Source: AA0mqf7XYe3dUPoZMSEuEg/TAgy3ISspZE7CBYTflFcarO7QXTtqRm76Xx4NbAeRKrEux9dBLHLiEg==
X-Received: by 2002:a19:6a14:0:b0:4b4:e24d:c617 with SMTP id u20-20020a196a14000000b004b4e24dc617mr8650030lfu.61.1669581669649;
        Sun, 27 Nov 2022 12:41:09 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Gene Chen <gene_chen@richtek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Neil Brown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/6] dt-bindings: leds: ti,tca6507: correct Neil's name
Date: Sun, 27 Nov 2022 21:40:58 +0100
Message-Id: <20221127204058.57111-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124110_168186_49C6C7F5 
X-CRM114-Status: GOOD (  10.84  )
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

scripts/get_maintainers.pl is confused when name and family name are
without space:

  $ scripts/get_maintainer.pl -f Documentation/devicetree/bindings/leds/ti,tca6507.yaml
  - NeilBrown <neilb@suse.de> (in file)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/ti,tca6507.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
index 9ce5c0f16e17..f2c4e94b33c3 100644
--- a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TCA6507 LED and GPIO controller
 
 maintainers:
-  - NeilBrown <neilb@suse.de>
+  - Neil Brown <neilb@suse.de>
 
 description:
   The TCA6507 is a programmable LED controller connected via I2C that can drive
-- 
2.34.1


