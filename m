Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 00:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0A2610F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 00:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA0A2610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R0MbNe5d3mGa8MudFr/1VbfDYhLBqo0FZOc+/+y5ERY=; b=DIwqF2bwuo1EME
	bQlgHByeDR3+cPBC+cptf80foYeZJuMOrJF+4u1ajQOwjvLwtMGezBpn8d80vKkL8hk2F39xbXnv2
	SdPAXcDD/dK6J9huQFm89pp+V7ydte+piTmqxKjQGvbhMmX1u9J0B08chBJZafAeN2xei2hdp087J
	HAXb7883viZPQCghNLrkL/II2V4Ao8wjNFiAv0S1LXPWZcyY5zQbQubscWfVGZIWH3u0xQgMs/lCy
	mx/+EYpOBdNL5ZyCzaiCQntwEbTCX/a0JlQbuXQ9ZiSmrADenNu6w+hfgAgRKUHZflqYFOOfgRBtH
	Kiqyk/2wK+xGilrey+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgFVk-009LLr-Ix; Fri, 29 Oct 2021 00:12:44 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgFVU-009LJW-VV; Fri, 29 Oct 2021 00:12:32 +0000
Received: by mail-qv1-xf30.google.com with SMTP id u25so5285529qve.2;
 Thu, 28 Oct 2021 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCdvHAMPb/U3XpOEmTJBvwKtKMr8OtCBU8SciZQYv0I=;
 b=Av48rDYAzVf/RSt+M91LSQcSgR2dMlUJhcAugutzpsobYfduotKLHEMV4fMB4NOqoQ
 igsM0xvRQUi9F+gcG9ys4/HsosHfBGwOl98gJV46c6r2eBGfHYJq3Qx30j0/GDPChDDH
 yPid3AaULXuqNR8PWnQcMUDcRbIfuMGGrKSWWsOAY2aaEdgfXJZ+N9F8NbyxJ+Y/k/iW
 jGZQwGDlIHk0a51qogNGras2lEkQgtyijMeaLvA2TtG0Nb5DHcopUknxgmhWmlAmfrRm
 b3xS5u569mFrUT3EEi7tQn2xj7dzlGqAv3g1sWoHVcBy2ENZArkKWaZUQpK4HpSHNeap
 KtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zCdvHAMPb/U3XpOEmTJBvwKtKMr8OtCBU8SciZQYv0I=;
 b=OKpS+nZbKCn5RQJFhtYbN9H7W3N3u9CSp6tP+VaKDcgFDrUJgsjI5d6XJGH1Vs2te8
 PAkaWLLtCW5LdTeTJo5+oWKVO3Wb0BvI9mn8NIHeHc6Yw4WpjflXnpYuD1DVdOnIjbUv
 UmyMFMdFqd9W+zNZl6xWMw4y/OFEs6w6wcD9eFdSKbaLWbAD1vpUjHdQrLGJmEhqzaU6
 pj//Iz2jorUZAXHfopITDdqzhnS7h8hy9o6POasACOgpx+ATER0TgeFFw/54eLQEyZWL
 hrgn/dlkhuMjCkkqUsSQRymYAlZRUrI2QX6UkH4NsF0MBTeSr++dy4AEUGeSRFr7fVtK
 k8zA==
X-Gm-Message-State: AOAM532Q7QzBr8X76oIhrEFpS/Z/PE8Hf50Zl8RgqCLw8tnrFrHIn7o8
 N006XOr0h06/xVGTTjM7syE=
X-Google-Smtp-Source: ABdhPJy5ntN/HUll1913v6EiH0jp0EXjSai/uspe5ux/XvPebuhBFbYgC/ThsqZ+6FFFGA8m5zfjMw==
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr7478426qvb.13.1635466346900; 
 Thu, 28 Oct 2021 17:12:26 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id f3sm514334qtf.55.2021.10.28.17.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:12:26 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, arnd@arndb.de
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fazilyildiran@gmail.com
Subject: [PATCH] ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_RT1015P
Date: Thu, 28 Oct 2021 20:12:25 -0400
Message-Id: <20211029001225.27218-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_171229_050299_428C11D3 
X-CRM114-Status: GOOD (  11.18  )
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

When SND_SOC_MT8192_MT6359_RT1015_RT5682,
SND_SOC_MT8192_MT6359_RT1015_RT5682,
SND_SOC_MT8183_DA7219_MAX98357A, or
SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A is selected,
and GPIOLIB is not selected, Kbuild gives the following
warnings, respectively:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y] && MTK_PMIC_WRAP [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y] && MTK_PMIC_WRAP [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8183_DA7219_MAX98357A [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8183 [=y] && I2C [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8183 [=y]

This is because these config options select SND_SOC_RT1015P
without selecting or depending on GPIOLIB, despite
SND_SOC_RT1015P depending on GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 81ad2dcee9eb..d10d6a3bf5eb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -120,7 +120,7 @@ config SND_SOC_MT8183
 
 config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with MT6358 TS3A227E MAX98357A RT1015 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8183
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
@@ -138,7 +138,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 
 config SND_SOC_MT8183_DA7219_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with DA7219 MAX98357A RT1015 codec"
-	depends on SND_SOC_MT8183 && I2C
+	depends on SND_SOC_MT8183 && I2C && GPIOLIB
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015
@@ -173,7 +173,7 @@ config SND_SOC_MT8192
 
 config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	tristate "ASoC Audio driver for MT8192 with MT6359 RT1015 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8192 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015
@@ -200,7 +200,7 @@ config SND_SOC_MT8195
 
 config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015P
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
