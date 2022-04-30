Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fig0F1qVP1bEIHkCVQEr393pqnr4lIaNeBWbFf9vp6M=; b=vI/4w7F0o/c245
	KSkFYCWZrUUP0Je5B6LHrIYFL7nJLcQL15bkvz7ur5nJkYITfuyoGrRsCJ+qYnjdpqHvYpG7GUMTN
	M/ozu7ki981wmAz5haqt5qH1HgUPsTuLQm9j/6JvfpwW8RcgCd94+8RXlRKR8aRD6adfziUFTi6f1
	X4zy9O5f3ernLP6QH+Bj+CXOYGUREzdSndldXq14VYBmPQVQHiT8cPxY3v9vkGK6qi2gGfNYODHNZ
	v31U879iM8ciSz9Gj/eufqkHUhwDvQGMFNZINjyQ0q8Lw4L8+siu+EMGKuexEaIU9BiThrv268ACF
	VXdBWwDI+hS62lNJWr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpxG-00Ed1Y-Ho; Sat, 30 Apr 2022 16:28:22 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpx5-00Eczo-8B; Sat, 30 Apr 2022 16:28:12 +0000
Received: by mail-pg1-x530.google.com with SMTP id r83so8728291pgr.2;
 Sat, 30 Apr 2022 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VtiesT3rNW8f1LKH0pEuQ9wbC6Gp2B9BkJ3EwQ8qLEA=;
 b=JwcjZEkIKuiM5zu6bMXRCkxaq3XQ73bGtDt2AJY08SOb1CdEGStySA3S55lcSvZD0i
 47d8ezB5hD51KVBDt5ivhnQ4D6CfKCNeCQmyudC005vEOTqVjMnnbDveTsL59TzLWD9d
 2Bgbf/AHKgNc+5tf6iJIAbAKNBu37MEF424+Dwd4dsGZTFzaGC2kmlVk+CGYmncYpDme
 D0dIAZZkV/oWL9lsbtnel8R0ve6g3iijH/vkh1A7swPvA6YD6AzEnMqkAdLsdpDKrGW2
 7ZmLy5MmjIklw3ovxWTMQz9/nrZrvoDfmEkXmYN4LasgAuTuHbptdYfeKvF7mtpHSPIi
 /LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VtiesT3rNW8f1LKH0pEuQ9wbC6Gp2B9BkJ3EwQ8qLEA=;
 b=K3xIVor9IyZK8253d4hY/AblpxQ1uQIgNWIjZzzcl/CRpfKUsPyEiijyVGXKlqnyXR
 DX4P+GJKf8rxNuTdNXyX4iueM5UOUu+KiKK1OMD77gYYRB5rrR1luwuvJzhpjPZRMrEZ
 Q/VZlVa5PBnCG4Di9lfPXcDEW9KfzrJq7ZG3MXsRvxkM2c/PTlmSym4opoF6fvmSbjQ+
 rXjyI1UXoxqOKYjRR8AminOs0rR11BsX5muwHjnP9t2U0qAnSfPkNEnXnxa+WMxki4Pq
 Zx0DpS7AKUvHlaYbAMHSMBnwD5pFHyibVreX7syztZeUF3shf2lrBbYAzswJ/yTlRnQ3
 i1zg==
X-Gm-Message-State: AOAM532TS/HjEN0lulD3fMocYpflz6BPiN90sbkyEG+ad0S4jlvLPKx8
 AS/x+xMsxId2v3GqKtHf/6rfi6wI3eqKdw==
X-Google-Smtp-Source: ABdhPJzuvodcVAmVH/HIe/UOubBc7yHfppAzyer41uKgAnnqbwJfiW8j3wwroPyQpAW8cTx/fPgCvQ==
X-Received: by 2002:a63:515:0:b0:3ab:84c3:3f37 with SMTP id
 21-20020a630515000000b003ab84c33f37mr3759690pgf.110.1651336089626; 
 Sat, 30 Apr 2022 09:28:09 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:c0f1:53a1:ea79:5d2f])
 by smtp.gmail.com with ESMTPSA id
 k2-20020aa78202000000b0050dc762816esm1715652pfi.72.2022.04.30.09.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 09:28:09 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, John Crispin <blogic@openwrt.org>,
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm: mediatek: select arch timer for mt7623
Date: Sun,  1 May 2022 00:27:48 +0800
Message-Id: <20220430162748.535317-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_092811_348066_B2E6FE89 
X-CRM114-Status: UNSURE (   7.95  )
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
clock. Select HAVA_ARM_ARCH_TIMER for MT7623.

Fixes: 31ac0d69a1d4 ("ARM: dts: mediatek: add MT7623 basic support")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
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
