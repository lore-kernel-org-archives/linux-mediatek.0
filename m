Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C595C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8/U7l5Rf/C05Y/3ecjWR0LqavZDg5bF1ylohHGl3og=; b=T0fKJd9aehWZzp
	zrxTGoJaagQlOa7Pys/oyeeVtV3EOga0H7P5ljxuvRdRTjR7vdLRuup/aJ6KwDuJ3MlVRyy3ERy+B
	kM8H5h5wQQsjyupPjNQqAW7pS4P6esoOBN1cnRsphV8Ws1qNxhf1s53U5nTJq6TC1R5JOCLWyawJM
	rdG4STDWDuM+DvR0FFfq4esN9XwpeR5+7z/BXDWYFTngMhTPtBvCvFSmWa3YIPaWjZO7oOIxrFJFc
	Gka6BHf52inJOD59CtOr0MVOI7dP5ySukT83GWSnJ9TD8z6TBgydylW6DYfpqfut2LQ3rXdhKrNbG
	TDRJi75JXZACEEz2vyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9KB9-00DQ2j-SQ; Mon, 17 Jan 2022 05:03:39 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9KAx-00DQ13-DV; Mon, 17 Jan 2022 05:03:28 +0000
Received: by mail-ua1-x931.google.com with SMTP id c36so28250612uae.13;
 Sun, 16 Jan 2022 21:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiX6saUHa8tVXRR2pHw4nDfUBFLj+hL82kG5LF2eBdE=;
 b=Pe8h9X12WGtdQqLsjvkYCgh9YwVwNQuiyWCD+D2ElDyMJEpxjbgr+/kWvuhVCNuBSd
 lCwAseOQfu1D7csJyUCRDAFi3oWkZ+40OCZTXmHZ0zlm/8LRQJ5Azerhk43bixsiq+ND
 eRDh0lAxFiQvOT1siqzq+AP472Sr+UMTMpAVWUlczMTRqZk9JOxp6Ad9R6HLJeE8i2IK
 ON4rwGJc3vUyue1cZwO2b6nYWD1xrObw2ydur/Zcn/e9UzlSPOs8c4oS4fKbJSP8ut4J
 b5j4Jn43pvSZ/Y55Qj6o4ujfNItonT+WjEKYL5qrTmiywCLAW1C8+oylFsQAx9l6P0E2
 Bn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FiX6saUHa8tVXRR2pHw4nDfUBFLj+hL82kG5LF2eBdE=;
 b=eJBHvO9Cg6F3gXJEPYVVDmvikkcB036nIcMm06e9U1DNSubbR3MrBQgEffKl252+ZC
 sJrn4VZljP66avtLl6O7CB8OcTxZwicRpEcz0z5OvzD5SBE1EZUqflDCPh1l4ucY6aEX
 R1ImkMdIa+QQhzadHmP+TQ2q49EMHBeb8wqzdj+N/ACEkkO3cze7/JNFPRmsEfzqBcgF
 SqjUONP3V59Hn0sDWTZ0IvUnBPEidOT565U0I4BNYDKtdAxGJYBOyBbAhbPFWMdBgh0D
 BUicWNAo3RRd20ywE16/b8ZXdkXMlHnUEnrdN6wiQ562+Uk6bR8MsdZlVV27F/ENFSAA
 mA5g==
X-Gm-Message-State: AOAM530NPv9oW3BtxJ1mECrJJSvymujSsgZ5yBRyAUKCumqBhIheDjlD
 6NhI0HiI1bHyHHCw9knISu0=
X-Google-Smtp-Source: ABdhPJz76tG0q0wKXnD43AKOEaEGErm27DJnaqkJ7NI14WMk3UwR/gAtlSgheL3vdfuM0t+KzW6FhA==
X-Received: by 2002:a9f:25b6:: with SMTP id 51mr7935322uaf.111.1642395806522; 
 Sun, 16 Jan 2022 21:03:26 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id k77sm1012686vka.20.2022.01.16.21.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:03:26 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, tzungbi@google.com,
 geert+renesas@glider.be
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fazilyildiran@gmail.com
Subject: [PATCH] ASoC: mediatek: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Date: Mon, 17 Jan 2022 00:03:24 -0500
Message-Id: <20220117050324.68371-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_210327_484443_6BEBBB3D 
X-CRM114-Status: GOOD (  11.62  )
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

When SND_SOC_MT8195_MT6359_RT1011_RT5682 is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8195_MT6359_RT1011_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y] && MTK_PMIC_WRAP [=y]

This is because SND_SOC_MT8195_MT6359_RT1011_RT5682
selects SND_SOC_DMIC without selecting or depending on
GPIOLIB, depsite SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 9306b7ca2644..0d154350f180 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -216,7 +216,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 
 config SND_SOC_MT8195_MT6359_RT1011_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1011
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
