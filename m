Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B7DCD6E49
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=; b=aP8cHtggWgPX1NUJ9UK/8ZS5pI
	zyhxCxxcLdTydvAm5Gg7CTnaeeSnWLCPXSorhbiN5qX8h/PO5m/chJE35IFmXwXAxkN3ki2huHsF+
	tXi22eU8H/k14VIUAVRRbHx8Zh18VDGFmDcYeiONftMat/WYx2GQg8urhcStl/rRFaBz05oDi9ubf
	a0uAB9laAedUJ7TRVXXVCsPsfi5kh1ZdvComnsONna3WuWAqpSkWe1GxIM7WGADT3yZ9W8cmNaD6T
	kKtkVxpiHMFA7p5uRGtWnft3HFynGTGedKHGiUaBD6tqqnlRmrUdLtcNLZIvWduFfeurnmRwjpr5v
	VCO4ID1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8l-00000008r1Y-0MD6;
	Sat, 30 May 2026 14:58:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8f-00000008qv1-37LY
	for linux-mediatek@lists.infradead.org;
	Sat, 30 May 2026 14:58:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso91451045e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153092; x=1780757892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=Yl/SQXoJ43Wsub36gIcpFPJ8WSrproHZ/bPf1Ye6U/3TjjIKveENyq5oChV+zMcgnj
         FBXEpi4nGf1SBsTFjkJ5JhkcWIQWWjbcLljvyjS6VeEwvGimG7pTe3OC9Vec7OHnvwyL
         JqaOR2zfu5TWoPWzz+zZh6fDt/heyRcKd4rRM8waogVkoQjlPYcB/NYWfuG2sR9kJX+H
         y7hXIRKdnuhKzpWiFMmj4TLgR52Umc74q+xkM8gBFsSkGc7C7quikrC41XpOkhqccLCC
         KQpm4RIiGCpESKcZxqmcVNgMzuKuywRUjqIP5ECdKCgT55jIk6CSKZMkW0I0z9jbSx6S
         kIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153092; x=1780757892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=BYEmIAkm+11Z2Nqf/ObW0G54ThWCmc1L2YSw+qLQVjBRWEnXudbHv9qlxIOs1oo9Jz
         9OkwqA5Mvu0aDBNGVs4btXzP1HD1UOpGyLGVSNHSuzmwFugtPIcdB7ekNriDnxYtzYEe
         jc2s3OUYd4sLqQv0wFu6H1xoCsi42H35/7mPfYP4LmJx+8Ff5Vs3cO1jQOBWDhO37mf+
         EjhTkCu9oJDZNLHvUlB79ZO8h5BqVi/W6RPxpO2cFZ4WEW76Yx85m3RHLiDk8RArViOi
         +Qn56vAobeifSGBXUa43rtEg8Kc/IBqPj2madnanPE6k+xe1H+iqJWn+a5GPh19+Vq1b
         3l1g==
X-Forwarded-Encrypted: i=1; AFNElJ9vmU5ulgEEsxg889pU/1ZXiMTKqQnYBA6Pqf8OIbEIh8hTlkRHMr2qIA6ghOw3HPPtckQoO50iuaqsDb0mDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZiUq++WHNHxWyZtz2O9jA+TLjPd98dXgtRI5vRkAnX6nGWWb
	wL94V+BjV8RGUB66qzVkBzzQ2Ep6fuUt3vFZ5Ly0+I1g5eqQhKtiYkGK
X-Gm-Gg: Acq92OHB5fpGFypkh1hOuUT7iczGZM88aL2QXrWRYIF4HQT+ZOExooA4xYdeGRM3rgR
	hStYV64sM6a7Bpd349nxCgi1sZAkXpg1/+ufgHnf5KNorDl0J/HhK7jMnMyB5V/2IkzBvXCgRuf
	bsGuMBGHnOTNANv5RQr3ku3cbOQdJRuRJN1QKe5pXDGpY/ZD4Ryp4mANUy83ZrDAZUkESjJPKY9
	sW9yOp7IdFP0rez1BTrT7GdqlCftF85OOC/OQtNnCvBLePI4/OekiRgEi+iQHLWVQ6bdQgrCPPr
	Z+0QV6Bw1pQY9u2k5Wy48ss3rjHgncRMlY75+Sc7M3dFm1SE6aSmVj4FkgawSsq/Go1G25mAAg0
	G3XY0F8pxn7S9ieP+xcNUYqA1+LaEVAba9JOMshtNvIsftuQhVE0alzezwIbXUpCVlMmrDx0CIZ
	37yPvtOSjfhM3/IIGrxx//RzqR+Sr4XdY=
X-Received: by 2002:a05:600c:4f53:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490a2958dc4mr75086275e9.16.1780153091542;
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Sat, 30 May 2026 16:57:54 +0200
Message-ID: <20260530145800.1029920-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075813_789943_760AB391 
X-CRM114-Status: GOOD (  10.33  )
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
index 0dcbca5ca8f9..4dc9504e24ad 100644
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
2.54.0


