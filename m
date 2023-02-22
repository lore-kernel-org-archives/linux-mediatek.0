Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD91C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e/ZXnR3dtECd1NLYQLnE3pN49tDwVf5mdK22wA4HAI=; b=SJHCqk8Mk+eapG
	OB2+2Oo9f7eoyl2RWxTSoM+PFa7O34Ju+oEQwKOo7AvyaF6NECMT3Fsh1Wz2jb9JOfNrhS2Tj8Jtr
	Osd51ddIzc6ci/SiXH+cEEPU9nsX2evtvFo2nzuznifpoSlDAgnxNNwXJSo4K2T6PTeSgVEICC6U6
	RII86uvmurmVSdYO9YAeILu+xycDOCBaqzhVnG363T4nRL+kVwDAAJa26nFAGbNQSc2BrvwbXydcX
	uEdTGjPP2W9U4kqNsli4y8w3NJURqw2iYZW3y8hAcA7jU0Tz6TKn55jG1WmvWFc4VT8wYquykfQFA
	2CQ6W47Jv/f1YL6YVWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu4u-00DVHv-C0; Wed, 22 Feb 2023 18:42:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2Q-00DToh-6y; Wed, 22 Feb 2023 18:40:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bo30so8192048wrb.0;
        Wed, 22 Feb 2023 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e/ZXnR3dtECd1NLYQLnE3pN49tDwVf5mdK22wA4HAI=;
        b=e0L1GfVCQaNJwuNE7XclNZMlRZNRUbEPHBJfd0XncqutQGUyeH29zyH1a4dp3yp8ue
         2FPJ56gfS2drYpxkrIOaFPx1wEFXcX/dJxdpRZ01GwaJYdXbHgiyOTtFMlAuGw62AJf5
         sxctNZ3H+RjC1XDulEZ2dxOd+kFwAIfCHAvIU6SGnX2Y2L3x/Fi2U06YQbWxRi5kngAb
         NWwBFJCNZzrDFpfydVfRtYZBlzXrcdnqhjiEnFpR8Rhym7L2u9agpN6KJ1Knadw1wIS9
         GxI9UstKeSXnA0ao+IqVc8xn92gc+q9w9YY45GOYxf4PmitUzueaMTNTX7h+wjdNz08k
         PKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e/ZXnR3dtECd1NLYQLnE3pN49tDwVf5mdK22wA4HAI=;
        b=Gzl+ngvWVYbjq49cf2zJGRKzgs7DMBj1cUZaGGNpXd6iESDsMmr2EK3axKfq3iLYNJ
         /pWp5AxZd0jlCTqvWdTm01e/pUc1eXaOMlIj9oLlyGUe4cCJvjs6QC+qij5gLb5IboKB
         hc4VbRJYfnW8A2HMIxqFXqeKxH/zhUR44q+J3pI8tOOk0akJE8uqrlA9Nk7By40b9BXr
         8WMoWjQrDEycXk8P1oC4bBVkU4RLwdsP1deFTat/cRnRHsyMIaXodeqeEP1HywpkMXjI
         BGqDAUYYceE6vKHGkPfK4Ak5q3pA0/eKBstxuWQYrc8TF9C58+qJns9tuCyYhLsDpzhO
         hXDA==
X-Gm-Message-State: AO0yUKUAAp8xGuvbWjlLc4Yyp50Gt2ka+ZiKeSm05aoXRT1U7J4rSDkN
	6oryaKZNYcZ0fWfbA3QwYnY=
X-Google-Smtp-Source: AK7set8tOiP8tGMuQ3l6IstW96Nd9dQl0IaddFW3GsuMpCs2zDBluc4RNWftK0pXdEQZNEzjhGbM2g==
X-Received: by 2002:a05:6000:1246:b0:2c5:5ef8:fa36 with SMTP id j6-20020a056000124600b002c55ef8fa36mr8713882wrx.70.1677091218257;
        Wed, 22 Feb 2023 10:40:18 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:17 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 06/16] pinctrl: mediatek: remove OF_GPIO as reverse dependency
Date: Wed, 22 Feb 2023 21:39:22 +0300
Message-Id: <20230222183932.33267-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104022_325865_1FDFCDC4 
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The OF_GPIO option is enabled by default when GPIOLIB is enabled, and
cannot be disabled. Remove it as a reverse dependency where GPIOLIB is also
set as a reverse dependency.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/mediatek/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 3a6b99b23f35..809037b146a2 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -17,7 +17,6 @@ config PINCTRL_MTK
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
-	select OF_GPIO
 
 config PINCTRL_MTK_V2
 	tristate
@@ -35,7 +34,6 @@ config PINCTRL_MTK_MOORE
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GPIOLIB
-	select OF_GPIO
 	select EINT_MTK
 	select PINCTRL_MTK_V2
 
@@ -46,7 +44,6 @@ config PINCTRL_MTK_PARIS
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
-	select OF_GPIO
 	select PINCTRL_MTK_V2
 
 # For MIPS SoCs
-- 
2.37.2


