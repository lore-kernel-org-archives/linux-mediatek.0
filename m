Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D95C2D0ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 04:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C80A20772
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 04:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiNxBZTr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=flygoat.com header.i=jiaxun.yang@flygoat.com header.b="JktAJCvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C80A20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=flygoat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Message-ID:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6unLsrPvEKhGgJHJJAz+1PagzLtkJOORf3f2bm3YAkY=; b=MiNxBZTrNRfyVQ
	YShHK/FOsf5DAMMe7/pr8pcSQ/tsl1iVlcfauC9zJyzy+Dyr/eqko0EhmCyBa7DGB7YTwHklP4cc5
	rSeQRWIDq+6vVFEjbvvzBhgsKa3vUbp9rP4qJhGfPwFXEsGb23SUrABYM4D15ngu0tcHrhDtD/GVb
	VbfHQHWUyxPRA50HEXwhGdzFfkzdebWwcYFB3HHEubZFbV1+cw7Xw3bUOA4rraxtP9gp0JzANX6a2
	+vrnZyhfX39JzX2senvCsn+2AS7lpnoT+EGPgXysxL/op13YP8tzatuBJDGAkrGl1DaMBpSa0QI4V
	AX/4Bj+N7er/EdpnlOxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHKSY-0002Yu-SB; Thu, 26 Mar 2020 04:49:38 +0000
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHKSV-0002Xe-PA
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 04:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585198133; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=l2PNpR2Rc6LMbAWYXl8TckJ3AJ68KwDurPM44WgWOeQ=;
 b=JktAJCvfbErbaXFiovxaNBK1nkVnA/v8QmlERPL5f4nE/J0LBVIusx9+rYAecu7W
 mMZlfGsaO1mhB3nedStqoCwWyHD3gVrLomDwltPx09oTwa6Jjo6OAsc1nDQpo8zIraV
 wyR9z3b36PLOpiQOwSUG2uW92Sp0oZcL19WxDjiY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by
 mx.zoho.com.cn with SMTPS id 1585198130690885.1881599862174;
 Thu, 26 Mar 2020 12:48:50 +0800 (CST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Message-ID: <20200326044804.382981-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Kill MIPS_GIC_IRQ_BASE
Date: Thu, 26 Mar 2020 12:48:03 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_214936_295941_74BA2BC2 
X-CRM114-Status: UNSURE (   3.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, tsbogend@alpha.franken.de,
 gch981213@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It never got used by any driver.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-generic/irq.h   | 6 ------
 arch/mips/include/asm/mach-ralink/mt7621.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
index be546a0f65fa..72ac2c202c55 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -36,10 +36,4 @@
 
 #endif /* CONFIG_IRQ_MIPS_CPU */
 
-#ifdef CONFIG_MIPS_GIC
-#ifndef MIPS_GIC_IRQ_BASE
-#define MIPS_GIC_IRQ_BASE (MIPS_CPU_IRQ_BASE + 8)
-#endif
-#endif /* CONFIG_MIPS_GIC */
-
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include/asm/mach-ralink/mt7621.h
index 65483a4681ab..e1af1ba50bd8 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621.h
@@ -31,6 +31,4 @@
 #define MT7621_CHIP_NAME0		0x3637544D
 #define MT7621_CHIP_NAME1		0x20203132
 
-#define MIPS_GIC_IRQ_BASE           (MIPS_CPU_IRQ_BASE + 8)
-
 #endif
-- 
2.26.0.rc2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
