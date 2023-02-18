Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C8DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNyW2BK8sxuue6VhlTFrxQ5TeKWpYlIJHuDiD6+cBR4=; b=X/K3E+TqrthEvaf5/7NISLRjLe
	XDJKyeaeInvkrdpSQ5Zu16wOl6dMtHXdkERIebJFrLQ18AMjLFeMt8n4kS/RfkMWpBabVGOFZ9Jlz
	p+WjjCqWcZbARe0MXk9fIHuzjzQ9D9AzufQ1msBAdmawsj3bogE5emzO7Mv5NaCE+3/ru5xBWXJsv
	WzGpGEhcp9FBwf1uMlGjMqbwConGrkHvsFElUFrfOAG6w3aZT047nbBP0d9Yyjm4kRhFKnAq8hHPF
	AprNu7bDZbGi5mWCOEwOdlQduxTlcte7lQt+omgDTYhlsxO7xlXM6UGaSJ6kSWGPCnNV7A0MUvn48
	SOQ+jT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTH4H-00GWeT-KF; Sat, 18 Feb 2023 06:51:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTH45-00GWcf-KO; Sat, 18 Feb 2023 06:51:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id ek11so870944edb.9;
        Fri, 17 Feb 2023 22:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNyW2BK8sxuue6VhlTFrxQ5TeKWpYlIJHuDiD6+cBR4=;
        b=gp6xiiqOqdlaU30pnKezCuCUjLBT7j3hxCkl3fMDkmDX2T3CcEPfMJOjPN/NS95lac
         e/p9bb7zWwabXQDokLHKBJXPn/bEVXVa0f3BLAhgEcNnndCLITy6sSFngo+S+3fwnWkb
         Sww657RMrzP4YyvOHB4Q9ZuXlrAcHPS6cy+GRyjPq1cTmOZWecZTzRleONZycGHYGk8j
         jofEXGD5y9Lwj8If/oQGk4yKX3A6Yq7ucHCr6sBlqiFbGB1pQt8HDmxjwDT/S7J5SE0b
         pbyaHDrHlprEZsDrLut+tnzUy12gRm6YdIX6iiS3jBA57o5YFwV9Pwa7L4HHE2Fw6JMa
         +H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNyW2BK8sxuue6VhlTFrxQ5TeKWpYlIJHuDiD6+cBR4=;
        b=pSvk2LJR6dS44/34HHOn3QMU7WL5og3yTQX58E74gLmCiLAzH+tSVO0nyqFMtU3RUR
         R/iiHRMcj4ihTgnQxoBd1OxOIZ42ZioH2FWnBVJDBTf+uABm8teun6o3PnYwq1OlYhIK
         ocs3QFJFGzJQvbvGJHBmhbz/TdF7a+OvthE66Yf9l4UEQcu63dxgi5dH5KoJRUne9KTb
         qASPAOmgxVKjkg4b9Yf7V41hDyR4CeAZWVev1hmPddzWJxekT9RToPWOv6Z/UQN0kpXO
         zPml4MR64kcfBpaTZGQeH6xKt62IABEF/UbgxMIjVzN/eg2T9wcszDttkpqrUQQgf1+J
         g+Rw==
X-Gm-Message-State: AO0yUKXgjldQxp/R5EbGk697evY3tr2C0k5hQrpVHDBUnJrVYt7KZELn
	jm4kYJ3rleaBY6wUJKESkzw=
X-Google-Smtp-Source: AK7set/rMYIdfBcyUwwWMGvji9Ty/itrUgwlS3CSvXHw+/l1R/x61+7S4ib+dh5IrMTL0MelF2F1dw==
X-Received: by 2002:a17:906:769a:b0:8b1:319c:c29e with SMTP id o26-20020a170906769a00b008b1319cc29emr2271770ejm.74.1676703079128;
        Fri, 17 Feb 2023 22:51:19 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id y19-20020a50ce13000000b004acc6c67089sm3156039edi.75.2023.02.17.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 22:51:18 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com
Subject: [PATCH 2/2] pinctrl: mediatek: fix naming inconsistency
Date: Sat, 18 Feb 2023 09:51:07 +0300
Message-Id: <20230218065108.8958-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230218065108.8958-1-arinc.unal@arinc9.com>
References: <20230218065108.8958-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_225121_745929_ED958B02 
X-CRM114-Status: GOOD (  10.00  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Some options include "MediaTek", some "Mediatek". Rename all to "MediaTek"
to address the naming inconsistency.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/mediatek/Kconfig | 42 ++++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 67818ba14d4e..a71874fed3d6 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -45,35 +45,35 @@ config PINCTRL_MTK_PARIS
 
 # For ARMv7 SoCs
 config PINCTRL_MT2701
-	bool "Mediatek MT2701 pin control"
+	bool "MediaTek MT2701 pin control"
 	depends on MACH_MT7623 || MACH_MT2701 || COMPILE_TEST
 	depends on OF
 	default MACH_MT2701
 	select PINCTRL_MTK
 
 config PINCTRL_MT7623
-	bool "Mediatek MT7623 pin control with generic binding"
+	bool "MediaTek MT7623 pin control with generic binding"
 	depends on MACH_MT7623 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7623
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7629
-	bool "Mediatek MT7629 pin control"
+	bool "MediaTek MT7629 pin control"
 	depends on MACH_MT7629 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7629
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8135
-	bool "Mediatek MT8135 pin control"
+	bool "MediaTek MT8135 pin control"
 	depends on MACH_MT8135 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8135
 	select PINCTRL_MTK
 
 config PINCTRL_MT8127
-	bool "Mediatek MT8127 pin control"
+	bool "MediaTek MT8127 pin control"
 	depends on MACH_MT8127 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8127
@@ -88,33 +88,33 @@ config PINCTRL_MT2712
 	select PINCTRL_MTK
 
 config PINCTRL_MT6765
-	tristate "Mediatek MT6765 pin control"
+	tristate "MediaTek MT6765 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT6779
-	tristate "Mediatek MT6779 pin control"
+	tristate "MediaTek MT6779 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 	help
 	  Say yes here to support pin controller and gpio driver
-	  on Mediatek MT6779 SoC.
+	  on MediaTek MT6779 SoC.
 	  In MTK platform, we support virtual gpio and use it to
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT6795
-	bool "Mediatek MT6795 pin control"
+	bool "MediaTek MT6795 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT6797
-	bool "Mediatek MT6797 pin control"
+	bool "MediaTek MT6797 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -128,42 +128,42 @@ config PINCTRL_MT7622
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7981
-	bool "Mediatek MT7981 pin control"
+	bool "MediaTek MT7981 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7986
-	bool "Mediatek MT7986 pin control"
+	bool "MediaTek MT7986 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT8167
-	bool "Mediatek MT8167 pin control"
+	bool "MediaTek MT8167 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8173
-	bool "Mediatek MT8173 pin control"
+	bool "MediaTek MT8173 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8183
-	bool "Mediatek MT8183 pin control"
+	bool "MediaTek MT8183 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8186
-	bool "Mediatek MT8186 pin control"
+	bool "MediaTek MT8186 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -182,28 +182,28 @@ config PINCTRL_MT8188
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8192
-	bool "Mediatek MT8192 pin control"
+	bool "MediaTek MT8192 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8195
-	bool "Mediatek MT8195 pin control"
+	bool "MediaTek MT8195 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8365
-	bool "Mediatek MT8365 pin control"
+	bool "MediaTek MT8365 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK
 
 config PINCTRL_MT8516
-	bool "Mediatek MT8516 pin control"
+	bool "MediaTek MT8516 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
@@ -211,7 +211,7 @@ config PINCTRL_MT8516
 
 # For PMIC
 config PINCTRL_MT6397
-	bool "Mediatek MT6397 pin control"
+	bool "MediaTek MT6397 pin control"
 	depends on MFD_MT6397 || COMPILE_TEST
 	depends on OF
 	default MFD_MT6397
-- 
2.37.2


