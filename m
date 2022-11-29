Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=; b=YMlpk3vo6VafMS3BU1u0RTZjx7
	LLI6+U/f4piO66SBnzmVlRrLv2VI22KYRCSLdoafyHdJULHXmUmcS+WwQWi4n7BbGAGt4Lm4xuZL0
	vSaCGMSXF4wWrIQVRQNgkjJQX+266wXhC7Xbd0SzYp8hxvAhHJGv5GKiqSfjMT8mrmChj9L029eUv
	Pmxm03Xc+XbaGmW+fw+kQZx+L+0sDFFkA3B7EKXeJcv+XklmmIvOsGjivvN3ZBG0R4hKeWK4snVrn
	6hutcuaCNMQgmAadg9dto2yWay0uCO/YIuKByMVoqAlaYpYbs87sOEugcJ/B33hPzlYk/Qdi+Z4vb
	cBz+zEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqTb-005LAP-N6; Tue, 29 Nov 2022 02:36:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRm-005KBv-Lc
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 02:34:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id ho10so30549063ejc.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 18:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
        b=Qi76vhF9q8A9ALrP1+nc4tr5vlTzbIx+o5acojEYZAQkcuANvn184hZhGaE/aDUxUI
         xrW0IIdoQ7vGR63MoGSAIbqf8hB9Ou3g8KXNqTfRTi4T33aeuefIDhOax+tou03onUVf
         F7m7RWHYie6X+A2J0bUnRxxjVl2WqlWZZipS4uh9ymC/LPhm2tU6rzAxnALilhxm7JAS
         W9bL6ZdYxCgtwG9Z2BksBP3BvrDKtYYc5Mn/XicFYlYN4U7ld0I9CVPZqitM5agMTH2K
         RJlPeGjVkh8sHAorzQG7u72wfSg+OigOzB1Q5pTMk5itN7Rni9aW7ij1OK8Z3b+lwr1w
         7U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
        b=NgomWL0xuoz2MyupBcSWTOL2WG5jQBIjEfZBS+MH22cckE/2gJUXrL5IDNUOVIvmK1
         ukzpgb7TCAgKUumWwecLOy/CXQXgQ9rYFkr9tDyhx277JHCEEPGLmT7HSGTejvdcgR5c
         Ch6AvtyiyjJ0wKzpYi0JMHF5fuO4OaX6oumRB+azgMXVgbjNbBH7D5vkVPAMNuoInOX4
         bFN0dmInt6HAQRJnRXwF/9KSgTzl/oU0loO8zCUuxoyajd4NbE4IN7SQPKRooyuQPQsh
         ZwjdxPGmV9yCd5MV5hOHbPBmQzzQ98BFHLGtM3/h0y5HLtD15gAYFdG2IzKYaw/MeXwI
         eMag==
X-Gm-Message-State: ANoB5pm+rkrnRq+PFrYEQqjOv3GLt7wffCjEPbY11RbB+Zf+aA4xfnnp
	goehAqijF9HJyY2AOjIofdJ9vw==
X-Google-Smtp-Source: AA0mqf6Lf3AT2mq69lc2sJzPEUfGRFH+/ZCr1QgpSmG6gf71FTbd3ODAM1B5nKyNTERJ7d+muhccug==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id vb2-20020a170907d04200b0078cc8931965mr44638929ejc.247.1669689247159;
        Mon, 28 Nov 2022 18:34:07 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:06 -0800 (PST)
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
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: [PATCH v3 4/7] dt-bindings: pinctrl: st,stm32: Deprecate pins-are-numbered
Date: Tue, 29 Nov 2022 03:33:58 +0100
Message-Id: <20221129023401.278780-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_183410_728094_41C054BB 
X-CRM114-Status: UNSURE (   8.75  )
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

Deprecate the pins-are-numbered property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 9d59208d83c18..eeb29b4ad4d1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -34,7 +34,9 @@ properties:
     const: 1
 
   ranges: true
-  pins-are-numbered: true
+  pins-are-numbered:
+    $ref: /schemas/types.yaml#/definitions/flag
+    deprecated: true
   hwlocks: true
 
   interrupts:
@@ -206,7 +208,6 @@ required:
   - '#address-cells'
   - '#size-cells'
   - ranges
-  - pins-are-numbered
 
 additionalProperties: false
 
@@ -220,7 +221,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x40020000 0x3000>;
-              pins-are-numbered;
 
               gpioa: gpio@0 {
                       gpio-controller;
@@ -238,7 +238,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x50020000 0x3000>;
-              pins-are-numbered;
 
               gpiob: gpio@1000 {
                       gpio-controller;
-- 
2.38.1


