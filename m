Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5466FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kl57FEQrnIh/AXkY5Cjcm2dGi3Sh+7H1G8FNx2NYMA8=; b=DsCsMAIjFZ8oZb
	aF8jWS3Y/tueaF6FRf7W+g6J1rxsx78fExDuL855DeJvZhsDwduPMWrShLBVbxTpdXJgNDMZQj3Mu
	UxX26RrKcshV93Gb33w32SDMvqQRLVXO16NWyxc4mQpGmgylaMpIqhB9fvBziBeYTW6QzSpQA09/H
	zmTXT7a/gCx/srCDCemnueBYmG8d/hVubcB/BgjyfvbxLbb1QWoBaxQPlb7PKDAd1uoAzgHUJNfYp
	3fMlTFQuoUgCXz91b+Dj6plYUVBPjYoNDueTkTd59LxEI6ypMgtEm0HKuFURoUE9qjMRYlq8wBEb3
	IbSlEIWt/9wPWsZRFDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkq6p-00EepC-Ta; Sat, 30 Apr 2022 16:38:15 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkq6e-00Eemj-MF; Sat, 30 Apr 2022 16:38:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id i62so8728226pgd.6;
 Sat, 30 Apr 2022 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cssUa1PptnyyXporPlZQKRCVmt+ClJJZuzi2xpbVVcI=;
 b=J+Nbr3JRIVsU/+U6MPAtC49b20a/h6yK4g3Dpm6zrofx/5SsBlQFlY9Gxc/7IoniK/
 I2aD7lm0ONzBpztp26rBtggbHS5/Jbbsnt0QbkZa0wZCkOP+S8fZ747I1azDDyiVyY3n
 9xbsmLWiQO9pLWoh9putbKm51RfgA8SevSBHbZtyg2Zft9LctTPGDCQ308bV0hOwBig+
 yLlDTsANqrbz6rvzealINFxlO6GjpVxwHIlqxeAx6/AZW6Li22WGKGeV0FKkCKyEzYFb
 ZbEhvzi+C0dd1DHoHA229ZCttMeY/wwzyQol+L3XQ4nu/koAEtHpRQXKLyl2WXFNniu6
 AhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cssUa1PptnyyXporPlZQKRCVmt+ClJJZuzi2xpbVVcI=;
 b=qtfHslhu+EiRJSfvZdyq5NMlwuGEybS2wsJgY8ZsEePIuDllf8vr9wBj0rzB4J6x06
 v11TcLZb7LS3BMw5xlYOJBhFBjRRX6/+CK+XtYEcDe1EiCEH3EDJlkF/9wWnAq0/UFbF
 TouhA4Hw6XumD34lh6917j8ES/HI8c2uHtz0c8ttSI4wNbgX2M47I9WaRoJLRawtyFAA
 Ed9AyyNEFaM/CQQ+CXlrNTy9eai71pbilDHz/LzmtsheCeMcFGgom4EXxJaXe+OU1A1R
 hpWAexT/bQX9Ccu0Ehr5/O8SR7o8aPUdTeqV5x6sOHx6Yp1tnRSCp6ehhRHDDOUaiCeW
 bl6A==
X-Gm-Message-State: AOAM533TbTYAbMV5HpQ8blBAkw5V8MQPNI8YLE8HPM88m/Qr4CaM5qXc
 82A0XTmyqJJWgpFTyNXG427ayA11T2Mm/A==
X-Google-Smtp-Source: ABdhPJy/1gYg0IFB0niA3JnP20KZZyd0X5GyA2UCrV+0iC8AkydGJJrvAKPaMA02jDPFxdAacRjZTw==
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id
 k10-20020a056a00168a00b004f7e16183cdmr4406653pfc.56.1651336682606; 
 Sat, 30 Apr 2022 09:38:02 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:c0f1:53a1:ea79:5d2f])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b0015e8d4eb27asm1715352ple.196.2022.04.30.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 09:38:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, John Crispin <blogic@openwrt.org>,
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] arm: mediatek: select arch timer for mt7623
Date: Sun,  1 May 2022 00:37:41 +0800
Message-Id: <20220430163742.537420-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_093804_767719_A213C459 
X-CRM114-Status: UNSURE (   8.88  )
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

armv7 arch timer is required on this platform for a functional system
clock. Select HAVE_ARM_ARCH_TIMER for MT7623.

Fixes: 31ac0d69a1d4 ("ARM: dts: mediatek: add MT7623 basic support")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
Change since v1:
 fix typo in commit message

 arch/arm/mach-mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 35a3430c7942..8a8d9142260a 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -26,6 +26,7 @@ config MACH_MT6592
 config MACH_MT7623
 	bool "MediaTek MT7623 SoCs support"
 	default ARCH_MEDIATEK
+	select HAVE_ARM_ARCH_TIMER
 
 config MACH_MT7629
 	bool "MediaTek MT7629 SoCs support"
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
