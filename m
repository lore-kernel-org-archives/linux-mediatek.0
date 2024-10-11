Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7518BCFD36B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niurVMnhr9XQkx+PBYP1+4uvh9hBDDKJ30fbJM9HVYQ=; b=pSmqQk+zRriiT2l+zBvD5o/+Zg
	UVKbor+MMeg44fYXzsamqRtvNn9agYlkiLJWzrO+mE9lJllsL25Wwq1YRD6fTKc6Yu/PTJuXdIA1z
	AiyMJZ0LjTWtUHAtMblW5cFSPTlDaLGjwaH9wIw3TYCPSYyNIRhPvBbYPsqbK9I42HM1oHO4KwHBb
	dBQfzRqoS2g3fhSyId3rAyxfwXcMYP92Dlibqppjdjb2eW6yoSpsGmB53F5VzBe/IapUwoHjsD1s3
	dNy8r20yAYWcvKAgGVj23eny9bBqttlPry7pOW27pcJsYC4TP4lgto53OSoPs962FwOFjTHDXe5gh
	BJyaeVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szERh-0000000GEW8-1TIb;
	Fri, 11 Oct 2024 12:08:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPA-0000000GDpp-0wDa;
	Fri, 11 Oct 2024 12:06:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c87c7d6ad4so2701062a12.3;
        Fri, 11 Oct 2024 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648358; x=1729253158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niurVMnhr9XQkx+PBYP1+4uvh9hBDDKJ30fbJM9HVYQ=;
        b=JhT+cW1OcLIQZcBRA38bWI8UATZ1ZLeN0VIVFsswYfd7ByTLNFJD1Nu9LqYl21xFK2
         8fEyATymBk12/g0nDUQZdhDOIzSCTSM2KejoTXYyxQr4l2mOPbl4HhdT2/TEe870ykya
         kl36drZkfmlnkiaCPaG54pgItXjlUdtaCij65wyNf18NzqkcpgcmvJDeGg5KZAAQ5r1H
         4VPy+19h+GsdxrYTVSuUab8rjCAjvBsH2tqpynaijP3ytn0M0Pmm0wqtCPxovjSvnjao
         tyQ1ogDHNjLhBJRI5TjH3xNMbDNKY1aHfD6MuK4FMenIottbBI6NvDFIaDKbegdgnu90
         NTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648358; x=1729253158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niurVMnhr9XQkx+PBYP1+4uvh9hBDDKJ30fbJM9HVYQ=;
        b=FC2ZsPGjsU1gOt16EaLrIXsP18cLgEg+3zI8rwyLJimAIH4rMParMdkpbiJWPg96Mi
         Xt6AFNmWzksljN2Kf2Hoazoyv+dcnbGeBLqu4medMhwJR2jzesfl0606bZHWqmL4zPSS
         Weu0Xk1c/eOW26u9RHTScpeDV+lOcGmkDAUf+s1xk2upDAMBcNBmVX0MBgjIUWy67igr
         dfkxAJIKl4HYlPRDkR7Z38+GudMQSIUensxTI4SnmB5T43+fIXhUY7bTowb0WkpPNpvI
         3R8rbXAqvuf17QvHU7SRg0OM5h/pcScIG0K+NPXGgy8FpZHxTuUSVgjrlApP14pIXp52
         oXfA==
X-Forwarded-Encrypted: i=1; AJvYcCWP0LVCaA6cYXtvKHJP60ZqgNiR0T7d/hhe12UxPFcgXJvKyuADd28Z7CSwRjFknHr3+VxIH7FsBd5DRyNWyAM=@lists.infradead.org, AJvYcCXlb8hciTkENwGe36DCNebHz10s1i55/PTGCUPdjCnqIkRLBX2XL59XD0P3fXqthoB7P2IHu/0gTCfc+gd13GBD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeum9RjaNoA0tqXZLPQillcAGkl62xBIOZG+HtPsh/7Yd01xqt
	RmZNy25viV8a2f8gf9MRSwYLmzsKgR2yJ15NNwc8EGEfKJua1CPL
X-Google-Smtp-Source: AGHT+IGD/a5c4Tuo6e0RDCCx2Z/cj2KzFlEdqqvp/Scq3W0O0NLRN4KERK8jOfQwZ6WVmXN5mNx3vg==
X-Received: by 2002:a17:907:f1a8:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a99b9583966mr212820466b.47.1728648357702;
        Fri, 11 Oct 2024 05:05:57 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:57 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Fri, 11 Oct 2024 15:03:47 +0300
Message-ID: <20241011120520.140318-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050600_339901_1EEC9F11 
X-CRM114-Status: GOOD (  10.35  )
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

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, capitalize pinmux description, wrap all descriptions
at 80 characters, and remove literal style indicators from descriptions
that don't need their new lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 352a88d7b135e..bf8dc176553c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing the
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
 
           bias-disable: true
 
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.46.2


