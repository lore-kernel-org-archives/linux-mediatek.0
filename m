Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B526606EE95
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhFlsJCx;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qt6h6JHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=; b=FhFlsJCxpu6JjEI5hjgakRWW0k
	8f5f82yT+WFHsVA+b+g7LUSwq8bhaFVLNE5OhpaHwII18HgE/KKYenyfQwbukeAj5+P3VVEP4Lczp
	hdxwEtQWWZ2vYqqHkmUbL9id3PJQpalfdjRJkQAnZYz7tccjPxrQnPS89uQdzHhz43mBdHrPlDHHa
	mlrC0t4+mqErv9896BbnHAyQHjiCURQkUvqzLzWnJicm9MaWt+DTAiocW/3KcCQ9J7mArWQgA788y
	brUSjP3YpxlrM9+L5dEaE8ZeXGUNtGDMr86p+RuAGqFXTt/dr2MOe/28aSVVlMMg1LgmgDeLIwO2+
	2c5oH4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuwG-00000008URd-3o2x;
	Thu, 05 Nov 2026 10:43:24 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuwE-00000008UQ5-3ujJ
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 10:43:24 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6b49684d3c3so1943195a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793875400; x=1794480200; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=;
        b=Qt6h6JHUrED/Q+PBXGyz43zUh03xlUuvr8cAhYb3lKBby+6pivi44in4MmAb9mpmeA
         mjBggnqjVzwqiA3AnWoQgF8WPd7v+02XZQ1V9/mabb7Jb9oFtZ4piG8sb9ncdPQjJnqn
         iKn3NAihNDrNGhd+qr8OG8MeU3nu33QLM9Nuyz7otfEAH2ETmsNhmsfNS0ZhcObQ8oDA
         /HpuANThO9H3raaScHg0EisNxDmgoNyKukZ8QfTqWYWkMfQqyU1vW+zBpy/07Kvyi9xv
         KGpc/efZPMe3SCvf60lwF9HA+2gG1XdssN6VMHt+IMoMtRKy9MAcw2Wb8lpKBa28RfwP
         4e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875400; x=1794480200;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=;
        b=EzNVSJBsiQw0WdMBI1NKbxyL3mc85KPK7UOHDXZEyDgsk7bfq7AOSF66adFymSM8qV
         5dBfCgZjExK8IzmYGcXw3s2nj9S0QfA5Y55pDuG2n8qUJ5fNXiHfJSuxDKqTQ40c3r+V
         hIFJRyOtlebd+peMlUyM9/kxprw6Ef26P5xtanf0RgXK43qQtmIOv4zfbfKFkl8GnxOw
         htawfa6Qq6k84L/mBA20wRzhiVe2ChJ0tfNmMuSuJMoO3eBjE+WFF5WJIw3eTcEFWBHD
         5oUZfq7qjQjzTuq6M7PGEYyCp48FJNS/X8+zKa69mCWblHEBKsAhy0zPtpwW3md00ajJ
         lxQA==
X-Forwarded-Encrypted: i=1; AKwUvBwQryy0X19nRi1TmB5d8GTcvS8Pxx+FJnRMJ1o9wql4dr614r/tfE7/YfqEQBh8no4m+E6tEJ0qYKJHbdbPTA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/F4Gdx4eByA1hSwY7PfvK8Zt7PFSIvUyYg6xuqu0JOZhMgu7No
	HcdbVf3xPKygxarS1lFFOQAM5E2gUNyTJJwZ3SeoIaEYSPRxzv1CcTj7z1Q/kmZAsm1tAPIz7g=
	=
X-Received: from edtr26.prod.google.com ([2002:aa7:cb9a:0:b0:6b4:1882:2675])
 (user=zyta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c4d2:20b0:6b4:16be:4fa
 with SMTP id 4fb4d7f45d1cf-6b4d467583fmr11096477a12.15.1793875399815; Thu, 05
 Nov 2026 02:43:19 -0800 (PST)
Date: Thu,  5 Nov 2026 10:42:34 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105104234.2734199-1-zyta@google.com>
Subject: [PATCH] irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ
From: Zyta Szpak <zyta@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Zyta Szpak <zyta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_024322_981151_CFAD2631 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, the MediaTek SYSIRQ (irq-mtk-sysirq) and CIRQ (irq-mtk-cirq)
interrupt controller drivers are unconditionally built whenever
CONFIG_ARCH_MEDIATEK is enabled, without a dedicated Kconfig symbol.

Not all MediaTek SoCs require SYSIRQ or CIRQ (for example, newer ARMv8
SoCs and platforms using the MStar interrupt controller), so building
these drivers unconditionally prevents disabling them in tailored kernel
configurations. Tying the build rule directly to CONFIG_ARCH_MEDIATEK in
the Makefile also prevents compile-testing these drivers on non-MediaTek
architectures via CONFIG_COMPILE_TEST.

Introduce the CONFIG_MTK_IRQ Kconfig option to control building
irq-mtk-sysirq.o and irq-mtk-cirq.o. Make it depend on ARCH_MEDIATEK ||
COMPILE_TEST, default to ARCH_MEDIATEK to preserve existing behavior for
all MediaTek configurations, and select IRQ_DOMAIN and
IRQ_DOMAIN_HIERARCHY as required by both drivers.

Signed-off-by: Zyta Szpak <zyta@google.com>
---
 drivers/irqchip/Kconfig  | 14 ++++++++++++++
 drivers/irqchip/Makefile |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..2edf121c7841 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -793,6 +793,20 @@ config MST_IRQ
 	help
 	  Support MStar Interrupt Controller.
 
+config MTK_IRQ
+	bool "MediaTek Interrupt Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default ARCH_MEDIATEK
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support for the MediaTek System Interrupt Controller (SYSIRQ) and
+	  Core Interrupt Controller (CIRQ) found on various MediaTek SoCs.
+	  SYSIRQ provides interrupt polarity configuration in front of the
+	  GIC, while CIRQ records and flushes external interrupts during
+	  system suspend and resume when the primary interrupt controller
+	  is powered down.
+
 config WPCM450_AIC
 	bool "Nuvoton WPCM450 Advanced Interrupt Controller"
 	depends on ARCH_WPCM450
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..eb539d41251e 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -72,7 +72,7 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
-obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_IRQ)			+= irq-mtk-sysirq.o irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.56.0.398.g882cbad275-goog


