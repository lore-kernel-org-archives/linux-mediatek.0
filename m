Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE1CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8426109E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B8426109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpLV5vGT7VVy8Exg46DnsIW6nVUeJTkKoVYT+1WRmo0=; b=jB5kpkBiU+KfvI
	kHCSIRI9om5pXml8Z4Y+H2jDMUbZJcdFTQGko22q5avAhX2NWLco9Hmfe9cPsFAC8Oku1mXyS08VW
	z7ZI53AP5jsDwkf5eX5FDF0DU5+m6CA1+JWqrm/n0ciHDFfoAgVgxNVfblTHzy17D5AbGxQPMJfAw
	R3AR9B2X0TMwvwQdne3tPq0FhK6NSakI00n3OUdwBAWA+fLG4xKO6liO4aiJYa5CoGHZmT7jYMVS8
	RLfNI08LOvbpeYm9ES1+n8Pd0jxq3ju7LQAUIxt37+aJKkJiLl04ayJDaBJxD4ssEfV+mUEHiiaSN
	ogBBVUidpBVhiND++5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhB2-004j4p-BG; Wed, 27 Oct 2021 11:33:04 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhAN-004ioX-N3; Wed, 27 Oct 2021 11:32:25 +0000
Received: by mail-oi1-x22b.google.com with SMTP id t4so3003206oie.5;
 Wed, 27 Oct 2021 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxnEh8qDpD3iOItAOuA1sNXr05vu5xRHywG7hStSzyY=;
 b=et5L9NEnejyIEGEiArFB9FLsIUGc9E6M2ykMKP8cUHxmtWWzQi8HPIaUhGmPly3ekg
 qPq2V/CPTW6nlwXzJTMjpkWHZIEfW9GO98NyOuEk9hTQvXfd2AH/rEEacXionCwTbIns
 2wPxeLfhPiW7p96jDtMBAd/6ArqoPxPXOFP94j++YUjq9EICFvurwVGNPxUue4GQepeb
 XdqfClaaQoQHaWsCeR7TQtSzrpJgq6kNcdY8KmyjhD2GwehmjJj9i1HIiLTKwDiav4Xu
 BNkeRCqT99mRfLSn/8Pn7Fqzg2bN/vu4XfmHAIeTrtne9d7Zb3EuUIZM76u2VIbDB7BM
 WQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxnEh8qDpD3iOItAOuA1sNXr05vu5xRHywG7hStSzyY=;
 b=UNJpsIXNRg5bUhlQKCsErU1QL75SUaDqHTwInIPj4toZCU19obmO4F0+7raGKQNGHg
 eH543IO8WFSyePGN77fpU5NC2T0kaM9rvgXtpPwN+TaudXvnYYw2UDe4Prprp6LVpSKW
 E2dPI2Rg3mt/y0YV6YMPPuztjZtedfcZYN3eThPQIqBRY/ocSWXyBsuWw4CnlvMbyGyW
 lKhZgeH56L+CosnMBnyjJKprpaYKcKuCySWhzCT2Zk2ol6sPlLNZbznHhHC0ka3m4utU
 AJc2C+Obd3kxY8NoAjn4HDa1OeRupxY3Txca5/l+NnaZP5G80fyjyaHUD5jeZlHNMEYJ
 L9yg==
X-Gm-Message-State: AOAM533/5FgagpDpkxP+8cXdGi61GwgFVTl5gjqAmvTov23tfYNvcY0b
 3g9osaeE2whfLMvVwEnPH+Q=
X-Google-Smtp-Source: ABdhPJz7y8144DGSg9tx87fxTtRWoMAHMm0FTUttcN539FMIs7jp7wK8pUrJKxA9JIdJZseZMkX37g==
X-Received: by 2002:a05:6808:21a1:: with SMTP id
 be33mr3107402oib.161.1635334342419; 
 Wed, 27 Oct 2021 04:32:22 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.170])
 by smtp.gmail.com with ESMTPSA id e23sm5430106oih.40.2021.10.27.04.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 04:32:22 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: sergio.paracuellos@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, bhelgaas@google.com, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com
Subject: [PATCH 2/2] PCI: mt7621: Export mips_cm/cpc/gcr_* to modules
Date: Wed, 27 Oct 2021 19:31:40 +0800
Message-Id: <abead7ae64e1a0cc96a09647a5facf30d03381aa.1635333327.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635333327.git.siyanteng@loongson.cn>
References: <cover.1635333327.git.siyanteng@loongson.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_043223_778338_0EA6EF9E 
X-CRM114-Status: UNSURE (   9.96  )
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

modpost complains once these drivers become modules.

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
index 90f1c3df1f0e..b07f20323132 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -12,8 +12,11 @@
 #include <asm/mipsregs.h>
 
 void __iomem *mips_gcr_base;
+EXPORT_SYMBOL(mips_gcr_base);
+
 void __iomem *mips_cm_l2sync_base;
 int mips_cm_is64;
+EXPORT_SYMBOL(mips_cm_is64);
 
 static char *cm2_tr[8] = {
 	"mem",	"gcr",	"gic",	"mmio",
@@ -353,6 +356,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 	 */
 	mb();
 }
+EXPORT_SYMBOL(mips_cm_lock_other);
 
 void mips_cm_unlock_other(void)
 {
@@ -369,6 +373,7 @@ void mips_cm_unlock_other(void)
 
 	preempt_enable();
 }
+EXPORT_SYMBOL(mips_cm_unlock_other);
 
 void mips_cm_error_report(void)
 {
diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 8d2535123f11..dfd3d58fd412 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -13,6 +13,7 @@
 #include <asm/mips-cps.h>
 
 void __iomem *mips_cpc_base;
+EXPORT_SYMBOL(mips_cpc_base);
 
 static DEFINE_PER_CPU_ALIGNED(spinlock_t, cpc_core_lock);
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
