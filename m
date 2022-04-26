Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ob/ovWm5fS6xWigXB6ZjNAPObMbM3X3QZNmZI8EHUK4=; b=iRqLwOzQRwCTbh
	cm4dQF9Mv3TotaLBzIdKeKKAynW0Afk9z748It9kX9J9i7K4F729RfOn/zHBoa6n+lKPvnikZMtpl
	E62UJBXeLgklY+4yPojczqbaQs0ZepuX6gswz+iRW9mmLtwbteOTlZRlZztI3WifqpMzQ42j7Eab1
	RgjVnppoVZPiB5wBxpUCmCEal3DEBy75wP07BJM0Czv80F01g65xnoepArIk/hORDh/MntjEwfBpB
	S+nYNUlCgb5RXBiKcm8lfJur+GnCVonC2mmy+N6/9t+TaYSBfSnGbIJ6rmtZ0lTbR4z3vurx1OxW6
	4o6aCY3xDOj78CU6ulBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLMG-00EeMg-Tu; Tue, 26 Apr 2022 13:36:00 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLLk-00Ee5u-OB; Tue, 26 Apr 2022 13:35:30 +0000
Received: by mail-oi1-f177.google.com with SMTP id z8so20666046oix.3;
 Tue, 26 Apr 2022 06:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OygyeH4rfmUuZsXmWAEGnr/ZlA2kUw1LkTJEURaNg9M=;
 b=1xiK2SxDzO4ZiLBa5/ZxwGVYh/A4jfQb7ZEp5yOEr6rOUxkBxNQk2bacg+i8T5Y7fZ
 uMdzejepel1FPvjwaO1aAcd4jK507wZjIZ6a53CMGyRZqeWtI+ZDpGyIN6OalY+cnj7V
 9oeAagAlxN3/nz6aCs/M7H8QaseY/5VImaerJbQxH+GY7Ol9pd+5Wl4dqxxa7zaVZDvj
 z/j4X8/AtavVyl1ylNHYhqHlmZPMFbofaNNuyZNpVuiseiqaXhgNLM89x06E7MVa1iyp
 YYsFiITpmCxmOnt61NNRxpSodDErkeFRln7SbC2SPhbZfCC+dZgt7YwIN4zH40qF24D6
 t6/w==
X-Gm-Message-State: AOAM531YznnEgI8QCiy9MPrZplH/sFnz67EFZWz1O62HGgGf+d38WoIC
 p/LjthM4VvfW9k1a4TSO5Q==
X-Google-Smtp-Source: ABdhPJxh7Jprs4lrGBymoDiRReBL7R7uytG+LGnCHdclTxGBoQgU9QJ18XdD5KDldb2alZ+K9kVR2w==
X-Received: by 2002:a05:6808:124a:b0:2da:3588:6d35 with SMTP id
 o10-20020a056808124a00b002da35886d35mr10804716oiv.269.1650980126381; 
 Tue, 26 Apr 2022 06:35:26 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 65-20020aca0544000000b002f980b50140sm4891611oif.18.2022.04.26.06.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:35:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds-mt6360: Drop redundant
 'unevaluateProperties'
Date: Tue, 26 Apr 2022 08:35:08 -0500
Message-Id: <20220426133508.1849580-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_063528_838297_F9CDAECE 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The binding has both 'unevaluateProperties: false' and
'additionalProperties: false' which is redundant. 'additionalProperties'
is the stricter of the two, so drop 'unevaluateProperties'.

Fixes: e05cab34e417 ("dt-bindings: leds: Add bindings for MT6360 LED")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index b2fe6eb89389..10f95bf1d666 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -43,8 +43,6 @@ patternProperties:
           - 4 # LED output FLASH1
           - 5 # LED output FLASH2
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - "#address-cells"
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
