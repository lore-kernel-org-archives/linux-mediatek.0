Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+7lF519TNw7DEedjha5cPKcDehMAz7Bv8bHQk6jEz4=; b=4WTRFyQzZh6ZCKIr1mSHC6u9Ko
	F3uIXC0JELog3ES9M2flNw+C/KAs82i01ifcYY1OBkyIW3yUj6kiSvdytPHJn+aDlzaya9HYyy/q1
	6/Ny2BZkCMo4YnvUTH3kOJnHS2Py8dEJtXmbMSOvdkc4R/T+7jMnXc5tVEqQ+ZaToOcrxIVH6JcPx
	bB62lzgQCS/k3cPKotciRMdOCsYV9tKLJPsRayBINh5GrsZcHCgRO3+6kx3r+3w/ZMBLPYZgVklWd
	gfueav8bpbfz5mJCJzX08E4jhz1JYR2ChKzpGOogoRGHYYGr5+wA/SX4qLsLUeZsJ8N4/jsmtlghZ
	WNcNsmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTH48-00GWdW-CO; Sat, 18 Feb 2023 06:51:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTH45-00GWcc-DQ; Sat, 18 Feb 2023 06:51:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id dm15so1716993edb.0;
        Fri, 17 Feb 2023 22:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+7lF519TNw7DEedjha5cPKcDehMAz7Bv8bHQk6jEz4=;
        b=Dy1NDiS2zWrTpyDfLkUhVZ19otqYOvNIptA058v62e0ANpW60H1SUSoQX+/+J9s25J
         icpFwasXPieGs8kPw/NxgHlxgBrwZHz0poumxNExqboqexXWj/DY2y5rGZaAvybgcnwO
         U4wfKDCbRElAOGYy5wAet6r+SuNTlM+cCGNIvWu/1+KeuYadkHj6yDipD6LeO3wxz2h/
         D/6AjlKO4UKRX6CphqxeozWnup0mKOW0CJC0Q5xoCgc8iJHiAW+jb+E+2IbYT3d1AOvj
         oUkfKZsOKm8FKbizjupIFPH96LfgDqv1GvVJQw0+Kw6aKMMu3cG0BcdhIsidR+KhElHO
         3vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+7lF519TNw7DEedjha5cPKcDehMAz7Bv8bHQk6jEz4=;
        b=YzpAyR18MXv329ueWhkYTkhhusT/kMEAlYmnW2/fHlXLT27DKggmzS5GRNH4KYYViZ
         cTt6ewRrz4VWpwE2f3f7nQtmORgHxUAp+AlR50LReEM6ks4fWyrpTaU1qh4ELC6cxCcR
         0udU/MzqxYjfCnp8d0eEJAjtZirtzZzAjFdVkrwFX0xrr6wBOwzbKxQCfsFp1HT17SDi
         jJ9YauqQ5+31HoR2fBCpSpvXk0ep8HWG2pCUl+XnPyx4/IivcnbzooK6G281eK3exBdw
         lXnbltZdFn9Su64yzKz7LHYl/6yMFDKk9Bt3OQ537P/uOAKVD43QmH6TEvAqJY/bHjEE
         1U3A==
X-Gm-Message-State: AO0yUKWhSIPwGyz4tMHZP8enVz01+P/Vfoptg9DBPgUvmCbJ2ZiCUPfy
	31g0RS7Y+IvAuTWbyNw5Q1E=
X-Google-Smtp-Source: AK7set/N25F8xcfjFi2RltkDno35yAF90bOUYEt+V4Pc7+D3K+722xn/kcgteRJXzhKnuN0U4y2vOg==
X-Received: by 2002:a05:6402:12ca:b0:4ad:7204:6968 with SMTP id k10-20020a05640212ca00b004ad72046968mr6459722edx.32.1676703077887;
        Fri, 17 Feb 2023 22:51:17 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id y19-20020a50ce13000000b004acc6c67089sm3156039edi.75.2023.02.17.22.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 22:51:17 -0800 (PST)
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
Subject: [PATCH 1/2] pinctrl: mediatek: add missing options to PINCTRL_MT7981
Date: Sat, 18 Feb 2023 09:51:06 +0300
Message-Id: <20230218065108.8958-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_225121_534509_538F1349 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There are options missing from PINCTRL_MT7981 whilst being on every other
pin controller. Add them.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/mediatek/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index f20c28334bcb..67818ba14d4e 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -130,6 +130,8 @@ config PINCTRL_MT7622
 config PINCTRL_MT7981
 	bool "Mediatek MT7981 pin control"
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
 config PINCTRL_MT7986
-- 
2.37.2


