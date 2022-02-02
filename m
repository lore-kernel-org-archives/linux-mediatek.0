Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O9SoDnMebacqd4av4GuUiBGSv2GC87gkdtYN9r3Jtik=; b=Drw3l7FUyLqbaw
	Gr00tft1BL6gJHJVpM51lzhNrijU2sQ6wZVW+n1qrJZaJav8IsZmgPUwCGDhs1ancLALIQwx5gJ5z
	s4VqMyfVOjLFwnzLypi2yZR+naDFDUC/OrB0Qh2G6DAzMBR73jhFsU7RMWOhgGveV17ouL/MbR2pI
	7MO9RVePaGbx7ICjdzkR3DnScvsP1npwwTasOLvOdi3Ssh0ZKYyqmmhaRVUFH2rxjMyAcaWZB4j0B
	j95dRMu6mN3JmcxDlGeM5nuixybDLrzEP0mGbvPDlIxCV2u80sgpMbKqKOeUcRaWYuJxzQr+BMgNG
	mk+oSsQ1IIs2gEcop55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHsb-00G4Jv-7H; Wed, 02 Feb 2022 15:49:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFHfV-00G0te-F4
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 15:35:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d18so18665286plg.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 07:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kL1KkyIWXceE/tVaN24Ly31VYKQD4vVNlo5DAeEyfY=;
 b=b5YKAAMv5vUBLFWQo7/svxf4uW9c4jQdCBlNf+YEv43MWbabtbkORAN1zwYdD3Q9ZQ
 qjb1pqvxN+woMw8Eqk6kW+KZs2VAKtXnsh1q8TCzqeJyDfj0vbZxe1YvqMo4pONZtFtN
 M4tZ+iGO4UvOMRmV8zwFLcJbtGJ+XdytpGBi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kL1KkyIWXceE/tVaN24Ly31VYKQD4vVNlo5DAeEyfY=;
 b=lslyB+Zfuw2sxCqcrBfQzeqONPBQ0M4bqEPJb2aqc9TCkZyqpghw6gVO22A6Lp5sE/
 U6ENBKcB0NbI8NROvfiQo/Dzx6xTE2qmdQhhslYoTtb8Nneh9H9WbjA/quuTFg6Zg2jO
 JfNi0Lh2hbCCMXa2843RrcC+IEoasgejLhfnBXaxb9GbQj3GBFAy9TCCuNG+lHApkYDg
 LDBGlWOgAMmBu0CazoS9+jK5arn7C7Lo846Wd5uOKbK9JcU/b/7Hdf0IAimRQFSRySSe
 4EYzR1TslftP1LRmBhErpfvDEO/Jg4X2r/XC1p9JGjdF7yjWJvNQua9qmsuhfmL+fd3A
 SZhA==
X-Gm-Message-State: AOAM530Y2sixLoS/AVA6jFTPSCV66q5Sn34JjZiW6VDYM4cyTkn+O5c4
 75Eo2Bv+RPergSbjgOh8n6TZvw==
X-Google-Smtp-Source: ABdhPJxDqqgJegVyPTA9BanZUtQtEA08JWZcOpDX3pVHOZSHFBzCbRoHQptLSCpYdHmg86Z5HQ0NUQ==
X-Received: by 2002:a17:903:230f:: with SMTP id
 d15mr32346742plh.8.1643816135351; 
 Wed, 02 Feb 2022 07:35:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id q2sm11096617pfj.94.2022.02.02.07.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 07:35:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Guodong Liu <guodong.liu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: mt8195: fix bias-pull-{up,down} checks
Date: Wed,  2 Feb 2022 23:35:28 +0800
Message-Id: <20220202153528.707185-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_073537_572270_A807CD51 
X-CRM114-Status: UNSURE (   8.03  )
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

When the constraints and description for bias-pull-{up,down} were added,
the constraints were not indented correctly, resulting in them being
parsed as part of the description. This effectively nullified their
purpose.

Move the constraints out of the description block, make each description
part of the same associative array as the enum its describing, and
reindent them correctly so they take effect.

Also add "type: boolean" to the list of valid values. This corresponds
to having bias-pull-{up,down} without any arguments.

Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 30 ++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 328ea59c5466..8299662c2c09 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -99,6 +99,14 @@ patternProperties:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
           bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8195 pull down PUPD/R0/R1 type define value.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: mt8195 pull down RSEL type define value.
+              - enum: [75000, 5000]
+                description: mt8195 pull down RSEL type si unit value(ohm).
             description: |
               For pull down type is normal, it don't need add RSEL & R1R0 define
               and resistance value.
@@ -115,13 +123,6 @@ patternProperties:
               & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
               define in mt8195. It can also support resistance value(ohm)
               "75000" & "5000" in mt8195.
-              oneOf:
-                - enum: [100, 101, 102, 103]
-                - description: mt8195 pull down PUPD/R0/R1 type define value.
-                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
-                - description: mt8195 pull down RSEL type define value.
-                - enum: [75000, 5000]
-                - description: mt8195 pull down RSEL type si unit value(ohm).
 
               An example of using RSEL define:
               pincontroller {
@@ -146,6 +147,14 @@ patternProperties:
               };
 
           bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8195 pull up PUPD/R0/R1 type define value.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: mt8195 pull up RSEL type define value.
+              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
+                description: mt8195 pull up RSEL type si unit value(ohm).
             description: |
               For pull up type is normal, it don't need add RSEL & R1R0 define
               and resistance value.
@@ -163,13 +172,6 @@ patternProperties:
               define in mt8195. It can also support resistance value(ohm)
               "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" &
               "75000" in mt8195.
-              oneOf:
-                - enum: [100, 101, 102, 103]
-                - description: mt8195 pull up PUPD/R0/R1 type define value.
-                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
-                - description: mt8195 pull up RSEL type define value.
-                - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
-                - description: mt8195 pull up RSEL type si unit value(ohm).
               An example of using RSEL define:
               pincontroller {
                 i2c0-pins {
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
