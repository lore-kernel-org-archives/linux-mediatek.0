Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C18C7EE30
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKy0/EJpfLjoekqVRMjvk2kg/XF7h2p24q53aPNe7AU=; b=YIuUPysElSVQuY
	pWomWazlCvZejFgt/If6S2uFA3QC71SKsHJojt1xHi+BG0JYvZ2lcbKRpVmUfJ0G93meKtbcuTm+X
	N4RsW6poxy8wHWt3TmJoaLXNRFTwdNmm3sFRB/t75wTOPcPK4BPhhknrjjUrV6fY+jEr/aaiBUaVp
	KdFBc8g1OXPCwA3m181tW5yHu7Tgwq9p3GwIQVlv2aArwYjE+P1JMC6z59oV8oSa6MVDYezRkmTV4
	jMlts+QekIfV3tnQsxeZOa7xUwuF2rb9uPEXp9DkXLnnOu8QmoMeprjs7rjtF9mVF5iG9gBuWxEwz
	YvO+f9nn7LUMZYWG2ZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtKE-003rM5-Ls; Fri, 03 Mar 2023 00:31:06 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJH-003qkM-MY; Fri, 03 Mar 2023 00:30:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id b13so755937ljf.6;
        Thu, 02 Mar 2023 16:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKy0/EJpfLjoekqVRMjvk2kg/XF7h2p24q53aPNe7AU=;
        b=acK4qqSKf20QVJyPIbAhfQyTqip4UmKrLYAgN/Ll7dD7jOyu1/lXP8SccQHw0azBhP
         /AEH9ueSYSKarCeZJfROCDNy3lL+zcHi4Ow6B5n0ukSo07DO5s2N9JSvcpQcFSG+xAhZ
         pW8+HcLwln5AXAZRuCdOPn1I43dIPtnlrAsheGFyxmI/mnzn5hEXtPAlJskQV1kUFX+b
         nzRtDyKuRRhRWw6n0OziglaNQFh8ytUrhoKU1bm46cOTblV41MTMQ9XjLXpUWrt7SMUU
         gjCLoZliXavRi3lqGhjQSqsjkTotuyCxSmJR9krDcjq+2Gp+Ik2MbA7g6wdipbgl3jaI
         ZIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKy0/EJpfLjoekqVRMjvk2kg/XF7h2p24q53aPNe7AU=;
        b=p5/4SMXgTjs5j6Y2OOSKwt+FUoWp1GrgOovwlSRaXwyw/+K4lr7nvwnx41p3r5aZ3+
         HjR2+qxuH7tozIWDFe74AddSsP+98co6zOltHdPWnRzvqtbQJkUs8PCQTzwzjhSchuEK
         dDQrsH2NdpsjRvK3NHmFy5dpognJCsAX4ORr6Fnr647lrimDGaFeYcaL+vGTLZWwF28L
         1OBZtF2kVCUBTP/+ynhXhmUg9rRHmGzOJIg1pNMgh09dRDUOV8Yuk5Byx0jIlmD0CFXK
         QtLSH5Au2iVij11LoT+7jSWHL2E5nhRAOQjHaiNaLSdPpcPJTKMQFREyQqxa05kS9PhH
         IJ3g==
X-Gm-Message-State: AO0yUKVoqteWWUSAK2KOgZx8Xopnxa8+uTcHxsmF4cigui6zhF5KaSpN
	t3POF0aI/OAWXGe10Xf+wVo=
X-Google-Smtp-Source: AK7set8tavXUlxbw0lEjlPRImcDRr9AOHEPmhatXmmtIizKc5CCyFfRLT40arWAn3qXv6wOUz+8WVA==
X-Received: by 2002:a2e:7e07:0:b0:294:6ef3:c2bc with SMTP id z7-20020a2e7e07000000b002946ef3c2bcmr2914567ljc.53.1677803406207;
        Thu, 02 Mar 2023 16:30:06 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:05 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 06/20] pinctrl: mediatek: remove OF_GPIO as reverse dependency
Date: Fri,  3 Mar 2023 03:28:35 +0300
Message-Id: <20230303002850.51858-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163007_825104_66BCEF62 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index 2eeb55010563..7af287252834 100644
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


