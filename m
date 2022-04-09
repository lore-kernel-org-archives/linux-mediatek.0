Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE33C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w66TpRCaTiNSUoNShwAWvhZodtVmnm2xdbGXXgntR2s=; b=YtRy9jgQr2WacX
	j2RAqIX3j8M4YGcFNdp4f82XtwRwcUb3oZcXHyVM1BwNXPEbfMBI3AT7CR7euH3YQyqk+0LUvmDtI
	NWYii7+lmiJZuqPHxhRnkMs5IBhBLkK8hoTnshFOkZFHGN+Pvi+PkMUkXrI3MEbCh3KKjm6wfZ3Xr
	t9cQHn/YZh/9jIW4SHUJWG7uqG3harOnlcf/lMAsV1Z4ggzfk02Wm92AK8c3wAH9BAj7lD5PBHacL
	utvAKAj4vGc3hlDQcYiLKdQ2qey8a7VdDDKas4D23F0SmFWzomS7O/gtdSdxdhDeoQuwKtdSDZtb8
	2XyDCYwvFID8EI9N/QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd7Ap-002f96-69; Sat, 09 Apr 2022 09:14:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd7AT-002f0f-Qq; Sat, 09 Apr 2022 09:14:14 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso11862656pjh.3; 
 Sat, 09 Apr 2022 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jZAJ+JA6yywC1V20DY87yMWwfDYQMlsgax/CHNuUKA=;
 b=gHRySIv4B/vBxWneeIYEr4hwAFt8BhQtlbEwvvhzsrjOA2EHXSVI+oX5jmtCEHMvr/
 7wmRXtEcEd4uxqBCJ4oniLy30jBvcGr4/jk5D0dpv4tA2h05qmryi4LHcnoVOh+Hm00e
 MMGCYU1llGTM/sL4l7Yf5zkAwC+XcjOrXYofrAtFPMTfSTbeedSQe9hsrTcbl934Vqdf
 CLlGbZGTMNtNedGh7jT6YTmW32RmWV24WdDGnK/Nkg7uV6EP+KxzE1zVByScZfcnR/mn
 eVRBBpsoBkHYH2AeqctzfkwGBiNhu7H3ryLTx+jG5tZ5uH2ZnovJZZ7JH3SX+btz9ZWj
 pQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jZAJ+JA6yywC1V20DY87yMWwfDYQMlsgax/CHNuUKA=;
 b=VhBNWw4/4h8j8ijgbP/RHOvB6pkHgJmWiSbz0ALVeAMaOimSq9ExjFavLVurqj3Ncq
 /u0+SUaZU2mhiFHNxsucyko7mKoWfT7LMxL0740eC+Y8HCQyHBrpPiuPEzD2MZZXbNQe
 UAdaM4Of33YjnPekP0lHlbd7UKXtpdUyt6TA9r6j4wZGvlEeKbiVODzVEFp+ytDfyhuP
 e4kTI9lcHa6/E1DGCJF0x1kR6NMcDJsdGDX3JeUMNQkb0bv/FOUgyPz89xn6tDudYsRp
 o7hFkK8fyvA8pCscHfgSaUyfZqekpKPxZ00PqRLFc0ois/7vFlBYBxxtUr0d2lMSyM2m
 N0pw==
X-Gm-Message-State: AOAM531QmkudMLlNLkGMybQYI5zJCXNBQMxh3fj39NpoYF4bL62xS+xf
 t3avwB2qxrVxrJLi99V0xmUqMPU4hhcVUdRQPI4=
X-Google-Smtp-Source: ABdhPJwsbGx59samwR5vAj7S1DaqVuphUrywehVqnAhIN2MSzYcqKZuf12+M9uRcXBc+FRTGnuu73w==
X-Received: by 2002:a17:90a:c70f:b0:1bf:3e2d:6cfa with SMTP id
 o15-20020a17090ac70f00b001bf3e2d6cfamr26424465pjt.70.1649495645034; 
 Sat, 09 Apr 2022 02:14:05 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f7bd56cc08sm28351657pfv.123.2022.04.09.02.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 02:14:04 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm: mediatek: select arch timer for mt7629
Date: Sat,  9 Apr 2022 17:13:47 +0800
Message-Id: <20220409091347.2473449-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_021413_640407_826760A0 
X-CRM114-Status: UNSURE (   8.78  )
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

This chip has an armv7 arch timer according to the dts. Select it in
Kconfig to enforce the support for it.
Otherwise the system time is just completely wrong if user forget to
enable ARM_ARCH_TIMER in kernel config.

Fixes: a43379dddf1b ("arm: mediatek: add MT7629 smp bring up code")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm/mach-mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 9e0f592d87d8..35a3430c7942 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -30,6 +30,7 @@ config MACH_MT7623
 config MACH_MT7629
 	bool "MediaTek MT7629 SoCs support"
 	default ARCH_MEDIATEK
+	select HAVE_ARM_ARCH_TIMER
 
 config MACH_MT8127
 	bool "MediaTek MT8127 SoCs support"
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
