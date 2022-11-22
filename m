Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F2CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dAFpXKIv4puqT755UmrarGTxUh3Es/8fltMsnQhNuw=; b=RLTytE6SNa3lCWKkprSltw7iPC
	B2KeOjZk7wb8XIngyLveChmri4CWn3SbEV0pqi8IkDUGxqirEc27JgTC3/JYbYZLcqOgIVKFtvXQo
	7Pns8dz5HEIO6sLh///7VcJeaS5amNj8WNkKTUyk4zOkgWCBEw3T4h2LNRLAjEsbvRkuja2UwbiF9
	Vxj5ziQJMUz5CoShpVC6b2wSfdoyPK1/yh2KbL93CXn9B9oet6zz4RA4das04tMxEWPFjR7mBD6Pu
	zTFjXEvWpQ7J9NPsjOiUbEQwUc8DDRQKDVxmEoV2cclbedow17iU3RKi1AFBOChUQ4OREEypWR9dX
	cELfKB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHmo-001nhT-Ns; Tue, 22 Nov 2022 01:09:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nJu-FZ
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z18so18597359edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dAFpXKIv4puqT755UmrarGTxUh3Es/8fltMsnQhNuw=;
        b=OoAvwrY7aemhhCyOJ9zQyu3xRAr62IjaFsmbLb3fhhmH+xw8SG9fVcwZKDhk2dVyiH
         qGK0hUbZ1vbtWqMiU87Kl7du7cyN7qxXi+f5sMP+2tLCthMcvSqwIkIiUSF5r0aLyk9y
         P+rLandzlleGuR/xZ2MHheYFu+VH+3AcQrKEp+Tdr1yr0F7nrpo+py4BVMA/G5jy+kah
         rmjBihFvkwg9DaPgynNHvsj0DUvIA2WZ8vBalDIef7sOG2bdn0teap8OsSqCGfvrG8M5
         7z+vsuW83jb1yBrInRXoUWigvsJiVR46DnaRWoXyJSxV6KCFm8vPkuYvQ66zl4BvTerz
         o16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dAFpXKIv4puqT755UmrarGTxUh3Es/8fltMsnQhNuw=;
        b=FPw96XNsViGlFbtxUlpPRZBlVGBQFqdxWiw3/8G3JSJOdoETHJKsvcZntj8md/6Buh
         FsUvx5E1O0UxMKSWbzHmdUsh37ZwNAW4ekgFRBJmebDAKLnMQ0XUQfr5Z9WOh8eYh5SL
         Yu1RZoDSMIO/xlmStcdd+ipj76TxZ1q9jC1K5cvYbYB21Xp9woqm4HUVEXf3G+OfjEOH
         nicTvtNme3DHtdHLEpUR6H//58y9qbwDd1Y4J5Pyf5RLtdlE3Bp1oNOCNq0sQmon0YRp
         p8oinVFEYaTpq6Ik+OLvP74zlZUkjhSyUNEouLL+5jBvjIxto555LdUnvzFngRnOZoKn
         4Sww==
X-Gm-Message-State: ANoB5pn3ocIlQ7Ihk9CGPkYOeX7HwuwZZjnKyJrpuWp2u9u1I5qGwBjX
	vrXz5mEE5MvRSNFGoHIVOhMlqg==
X-Google-Smtp-Source: AA0mqf6g+E2Xe8Q5GHhLbNsGIt7qeLTBsdEBE9OD1a0hhvSG2woUFOOuUnVrId7WZa7SPT0HgCLPFg==
X-Received: by 2002:aa7:dc0c:0:b0:461:6f87:20bb with SMTP id b12-20020aa7dc0c000000b004616f8720bbmr18692156edu.300.1669079290461;
        Mon, 21 Nov 2022 17:08:10 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate pins-are-numbered
Date: Tue, 22 Nov 2022 02:07:49 +0100
Message-Id: <20221122010753.3126828-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_722952_B993FDAC 
X-CRM114-Status: UNSURE (   8.65  )
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

Make pins-are-numbered optional and deprecate it

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 33b5f79e741ab..1b44335b1e947 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -31,7 +31,8 @@ properties:
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-      Specify the subnodes are using numbered pinmux to specify pins.
+      Specify the subnodes are using numbered pinmux to specify pins. (UNUSED)
+    deprecated: true
 
   gpio-controller: true
 
@@ -62,7 +63,6 @@ properties:
 
 required:
   - compatible
-  - pins-are-numbered
   - gpio-controller
   - "#gpio-cells"
 
@@ -150,7 +150,6 @@ examples:
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
           mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-          pins-are-numbered;
           gpio-controller;
           #gpio-cells = <2>;
           interrupt-controller;
-- 
2.38.1


