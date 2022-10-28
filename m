Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650DBC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxvxwP13Oo8DvUfVqMfH08d+kvLAOGlAq8O3gsMECtE=; b=kXyZqpxhYAJ1q2MuGhbFd223GS
	lEqEkaKStAJDc9s/Ia07Vo1OZPrsuLiOwEpYyPa7BBXBlr3MavA1fGg+5uxx5w0fiAi71NiaElQRG
	PZK4VA3X/QwmDWMVq5HwzGLBX6joPnNBZzJpXIFVN8qfCQOlcw7YZWrKt2BT5QTnfRcuAD1nQOW/t
	RKh4LtD5ysdMQExdjeTFVmqBnr57KQ8tdruSUedbtY58Q/5dcsLYXnm+6toK/l1ZT/UMmHg6kSGwx
	I9v8Tzg9CQpMM1klmNFdjdUTCHqgvbOJGWajdsj0DkrW+BP7sWp5U8ozWwZHZQXfko3S4tO9Mbqyt
	nppujjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRS0-000Znh-En; Fri, 28 Oct 2022 15:39:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROW-000YAW-Mr; Fri, 28 Oct 2022 15:35:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bj12so13709001ejb.13;
        Fri, 28 Oct 2022 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxvxwP13Oo8DvUfVqMfH08d+kvLAOGlAq8O3gsMECtE=;
        b=ZNaMMNbeoUwH7+bPTsNzycGJur13H+wf6oDTAonavPrvZVvVTgRGSULUmKflQP2zDo
         6FPoolNweiUUzU2FecKF/PEgBdhYWHjdBHXVK8+pMrRuC3hlUp2CyYJEqhWa6ljafYHT
         S76Yn6n+5lpfUFwBlIG0i+RG+n0I/0Q1VNuJB8Fko6QXcElP7EMBY8REr7efSp68FRlY
         wf3mQbmmqAt+klXPwUV/PDOAk+3oT19MxZW959lfG7DDJ5YCIeFz5PAUPXQ4OyKghXQP
         L6BI9+0Hezn4DhNQ4t7SqFsmnea+kCbaWWpBlnaAdEx7+WOSm71kBNKWTGI7rL0vUj/d
         gn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxvxwP13Oo8DvUfVqMfH08d+kvLAOGlAq8O3gsMECtE=;
        b=n+ueRRvzhj1Q5uOslXR1xN8qNouKTSNcviCzCbKS9kR9dvOaADJA061GhLp/cTmBRt
         lZicluAq1XB8Yeq4fnKa9nkP4ft15BdNxQblWhyb+h5UAalePdE/g3vFsPtPNhbsOBTK
         JkLxVqUr3EcjMY9s+GNnBAZl45FA82uT9PHhMMTHm5jRNk5DRjTwxaMemHCRTlfdzHdI
         Jasm3XJlqbGHNxG/mOtLm+RA/U3rdX5EssqQZcoKlVUMtioh14dkegi3bz6BCp1Pin0f
         9qQpxXfa01B4gB14+Nj1Nk6XAqqnO0BY/mMK/m6dtjzzDP8yQJmFR7BczRXdMA8kixHt
         R+8A==
X-Gm-Message-State: ACrzQf0SARN+M3wcfhzg53E/pkyo9zkQYFTYnea+CxFuwlPiB3oYIpE/
	vd16nHVXQRR4QN7GiyWr200=
X-Google-Smtp-Source: AMsMyM4KKmE92ZXYz/QYmfOEna73upeg1C64cfq81I/bW1gxQcBebKnyCs1ojjIy0Uo+0Z6o8pUFng==
X-Received: by 2002:a17:907:728b:b0:7a1:b545:b39b with SMTP id dt11-20020a170907728b00b007a1b545b39bmr29446607ejc.661.1666971336984;
        Fri, 28 Oct 2022 08:35:36 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:36 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Fri, 28 Oct 2022 18:35:00 +0300
Message-Id: <20221028153505.23741-9-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083540_791962_8180BFDD 
X-CRM114-Status: GOOD (  11.91  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Change "subnodes" to "subnode" in subnode description for better grammatical
accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
and remove literal style indicators from descriptions that don't need their new
lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 23b1f7867afb..70e4ffa2d897 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -118,11 +118,12 @@ patternProperties:
     patternProperties:
       '^pins':
         type: object
-        description: |
-          A pinctrl node should contain at least one subnodes representing the
+        description:
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -130,9 +131,9 @@ patternProperties:
         properties:
           pinmux:
             description:
-              integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and are defined
-              as macros in boot/dts/<soc>-pinfunc.h directly.
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in boot/dts/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
@@ -141,7 +142,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -151,7 +152,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.38.1


