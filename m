Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C5C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vDfXw8n+plfaogBjIL2pZ2EWfG8n/n4snUHtV8b5Viw=; b=x0I2KlzA2Q9UEFcmBK6/iN3D1n
	ZImYG50aWh0f9C68JO6ULzWJH95XFCMy+rVb6w/XxXg9n3CfROyC3emk3F3nV7mi3h+TucfNFZj+e
	YjjWLH2LAza0BtrVZIpGVvjYMgITzl/SAhKEOVHa/cv1d+f5GjDSenkBMOX/VbtaIJwo4Ghd6Y3/q
	jfJZdsS9iz+BgSO+4Ti/ZEzlNWFQFJEaKrdjnPGYdUnPaOw0gQ9nNgQFwVgOciVAect/QaDd+tmLW
	UPUJJ+xTda513oh5KpYX6rv9MpQpXelMkVeu/4tJNFsfeekfvvanS7zYEjkmtiQ5zLfRXEW4sfFIR
	m4X51YyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFX9-0099V6-07;
	Mon, 20 Mar 2023 13:26:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFX4-0099TY-2D;
	Mon, 20 Mar 2023 13:26:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so46644305edb.10;
        Mon, 20 Mar 2023 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679318797;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDfXw8n+plfaogBjIL2pZ2EWfG8n/n4snUHtV8b5Viw=;
        b=TK24hBgvtg6ItCpuhcywrfVa7qGcJHXRiQu+H4BC19kNZKV80fTwXzNZXYs/MGtsSL
         xidhfMRdQ3Ow/iOcTrVtdIRkil7Ie339b+l+4SQepJ89IPiS0i6ZWwGDtIADlUTEjqZ6
         1lnplEniFlBc1neWPlpkXoYwVSG91v+zR7GlmDjH/xe3bsSm40Mxh9cJND0Qc0HlFETe
         KE5zHnaSzvHAKC2WMpPwWKHwBuf2X3LcOV1bkP0d7aiZ2a90r02UbrwOubsO1YuOzz1I
         kLuFJE+OdglrKxyMYRdTVm9VR6QZyz08ShJOTHcTh5GL5koIapzUvqRdQ7yjQVrD0VVB
         9xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679318797;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDfXw8n+plfaogBjIL2pZ2EWfG8n/n4snUHtV8b5Viw=;
        b=LRnvrJGxe1tVqQYsFstvV3eedo9jum2+af9qD1Gpv/STwHcd5/s4hyi2dJVn+BDkWQ
         YFz8e3NIaEIbhAauKId8Yog1fFb70Q0dBzwquxYjG9uElRL3JMgnZjFGo8oFdSMNqsKJ
         h8ysjn4Y911D+45jRJZ6kVt7h4TBteqfUOdu4sGpHiYBHwN+tEbPFudQIrMZloIl7EDq
         /D1qoIIWcGRTdXRjUDFK2hDCtJHLDTd25ko/ESPnbhrTJFHBFq9Dvkb6WKfUDV0BS3zG
         cocIfyEqZMib5xel5aIORD7AnXeIW2+XvtpvuoeNlKPzCqV8ID68pOCvKJ6TXKwe5nAi
         zp5A==
X-Gm-Message-State: AO0yUKW16xEjQCws+QHsSoY9SIhOEWGL2StFjyJRTCzSxabqkanj6MDv
	KsRRcIIIDWUKhy+lgWjNuR4=
X-Google-Smtp-Source: AK7set9LYsrc6rSGVPOo2WixyVETc+tPy5GdWlw9Og9E8PmO2dLEFAp0dxhnAFPXzTX++ZwHvPz24g==
X-Received: by 2002:aa7:c1d6:0:b0:4fb:78a0:eac2 with SMTP id d22-20020aa7c1d6000000b004fb78a0eac2mr12517447edp.31.1679318796724;
        Mon, 20 Mar 2023 06:26:36 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:394b:6c53:31d8:7b18])
        by smtp.gmail.com with ESMTPSA id sd24-20020a170906ce3800b00931024e96c5sm4492691ejb.99.2023.03.20.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:26:36 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ARM: mediatek: Remove unused configs MACH_MT6592 and MACH_MT6592
Date: Mon, 20 Mar 2023 14:26:34 +0100
Message-Id: <20230320132634.17331-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_062638_744020_780FEC5A 
X-CRM114-Status: UNSURE (   9.78  )
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

Commit ad8a221e1f49 ("ARM: mediatek: Add config options for mediatek SoCs.")
adds four configs MACH_MT6592, MACH_MT6592, MACH_MT8127 and MACH_MT8127 for
foreseen future use in the MediaTek pinctrl driver. As of now, nine years
after that commit, the configs MACH_MT8127 and MACH_MT8127 are used for
that purpose, but tconfigs MACH_MT6592 and MACH_MT6592 have not been used.

Remove the unused configs MACH_MT6592 and MACH_MT6592.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-mediatek/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 35a3430c7942..521af13a79d8 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -15,14 +15,6 @@ config MACH_MT2701
 	bool "MediaTek MT2701 SoCs support"
 	default ARCH_MEDIATEK
 
-config MACH_MT6589
-	bool "MediaTek MT6589 SoCs support"
-	default ARCH_MEDIATEK
-
-config MACH_MT6592
-	bool "MediaTek MT6592 SoCs support"
-	default ARCH_MEDIATEK
-
 config MACH_MT7623
 	bool "MediaTek MT7623 SoCs support"
 	default ARCH_MEDIATEK
-- 
2.17.1


