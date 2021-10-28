Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A5761073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86A5761073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSbaMTu5nTho0JaQTRiuAfYpVAUBrGt14T07DeRNK2U=; b=U53wV4q+q9hpwb
	X1CJGEmXhqsHwVEGXmZ9Ugs73Ae7hxiLjfiMZAgqgf82KEvwBij2ANuzq53jssSXrQMhEEr4J49To
	noZysA8mz2LUrPeQQQcAuHaqdT6BMimLoCe4UeB/NPHvWlxO0mQCvoXAxajEoR6WVrMhD084SPG/V
	cr0NXkERRhuTUTZOqS0a8zbUCEv2+IzCo9h7L825lipBJceIlgyrO33x7o0hpAms5DcBPaxC8QCUE
	DXhD52mbCOKOGjWzUUb5rJq+kXcCrTr5UB1HjuGvmCFy4fth+haT3VdfmeJCNcoM3uag8OZ6U20ym
	IAz+mj75pc4h98p8HmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwg0-006oBr-Is; Thu, 28 Oct 2021 04:06:04 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwfa-006o40-U5; Thu, 28 Oct 2021 04:05:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 x135-20020a4a418d000000b002b961605657so1011952ooa.10; 
 Wed, 27 Oct 2021 21:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6FpxS9c54/M2hbJ4gBGI81tkUflwGxgqjonrkZ/Miw=;
 b=RB8Wv5J0MEh+omOWxA361i9lMRUw0w2BBNk4W4cNisr/OmEzYLCv704F7OjKh92tNg
 /cCkEDgpEaW0HEKSxxtKzx801K4VfnTWBhgWpzRyL16O9A+5jrmETYLU6Q+noZ+LjUoh
 w682UuyzjdUsI3Bza9zI5G/h6CfN7qFfWQwlbyaXh3dcxvOKdDuQC/q5F7eEDfvqcxwj
 WpZtZ5kahKRER0E4hxowGE7G5CDr/rQ9AWVhlEkEnMjtkfSxrBswI/eyoiJd0Oarzn4l
 j13H3jC+Oyh2Oq+LN1nSHbt2qL3HGII+xNhFzhCIVkn3qabENuOSHHgouZcwjF1RetIX
 5+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6FpxS9c54/M2hbJ4gBGI81tkUflwGxgqjonrkZ/Miw=;
 b=kCRg8N/cK4UPjlfb5kQHZUUBXfsXptG4U2S44kfHAgrA/k8wV0xC4bCzC05/WiZwvY
 Ky2qhBxb5QYOH5cQ1TLm8g2dhuQas7Lm+4Wu4CWRDdHymp+N2/rFajdgAnmvBImITq4o
 nf6vwGkjaLKqlVb8DyvOk/tK+kVBNI3MX7P43SEMxpj4oPqI2y+QazGSTDib4M4iuKws
 6MsB+1JASF2KiNhGDBlIv/l77Xw7uXb2QCncavqT6JcBSvbUwTIiGjiXaryAREq9A/SG
 LNTCw75uEO+8wFkPpBKednBOW6DVIna33xZcxrhQfSLsUkZMe3oaDjPT1zc5fA5Ougjb
 PauA==
X-Gm-Message-State: AOAM5325m0YJOfc4wo3iKTtwWqpP/DafUVCzUQFSnUfTsKqwgGBsPZad
 gkAbNrDFYypKPX/z+By+orM=
X-Google-Smtp-Source: ABdhPJx4NETM+KKu/LTnM/+SJMhfnAvqGLqcWBLQvtfeJodq4O1EuBPAxy3c3qqjf8NHoQErspcDZw==
X-Received: by 2002:a4a:c80d:: with SMTP id s13mr96122ooq.4.1635393937516;
 Wed, 27 Oct 2021 21:05:37 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
 by smtp.gmail.com with ESMTPSA id v13sm720310otn.41.2021.10.27.21.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 21:05:37 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: tsbogend@alpha.franken.de, sergio.paracuellos@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Cc: Yanteng Si <siyanteng@loongson.cn>, sfr@canb.auug.org.au,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com, linux-next@vger.kernel.org
Subject: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be able
 to use them from driver code
Date: Thu, 28 Oct 2021 12:04:53 +0800
Message-Id: <112fea0c8c1b65a762ac98412216239160721263.1635390750.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635390750.git.siyanteng@loongson.cn>
References: <cover.1635390750.git.siyanteng@loongson.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_210538_996750_2C31AFFC 
X-CRM114-Status: GOOD (  11.28  )
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

Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
the MT7621 PCIe host controller driver is built as a module but modpost complains once these
drivers become modules.

ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!

Let's just export them.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/kernel/mips-cm.c  | 5 +++++
 arch/mips/kernel/mips-cpc.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 90f1c3df1f0e..892258760bf3 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -12,8 +12,11 @@
 #include <asm/mipsregs.h>
 
 void __iomem *mips_gcr_base;
+EXPORT_SYMBOL_GPL(mips_gcr_base);
+
 void __iomem *mips_cm_l2sync_base;
 int mips_cm_is64;
+EXPORT_SYMBOL_GPL(mips_cm_is64);
 
 static char *cm2_tr[8] = {
 	"mem",	"gcr",	"gic",	"mmio",
@@ -353,6 +356,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 	 */
 	mb();
 }
+EXPORT_SYMBOL_GPL(mips_cm_lock_other);
 
 void mips_cm_unlock_other(void)
 {
@@ -369,6 +373,7 @@ void mips_cm_unlock_other(void)
 
 	preempt_enable();
 }
+EXPORT_SYMBOL_GPL(mips_cm_unlock_other);
 
 void mips_cm_error_report(void)
 {
diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 8d2535123f11..26392d18729c 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -13,6 +13,7 @@
 #include <asm/mips-cps.h>
 
 void __iomem *mips_cpc_base;
+EXPORT_SYMBOL_GPL(mips_cpc_base);
 
 static DEFINE_PER_CPU_ALIGNED(spinlock_t, cpc_core_lock);
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
