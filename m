Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B666EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 05:39:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2825F61984
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 05:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2825F61984
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZHq1Ahu32zbTLNtfY1HyHgdabVMOu/usu4FwQ1Mx7P0=; b=aagEOxD3pUbtr7WV/HQGfjpL+/
	kA5XYKd1NgreIbkvJLJoh0uqfQg7YCjyP5hoPOgInM6p0pPuY68I58lY+DAErX9+oxa+5FxLppeBA
	vFh//4+Zl4pEjahXIUXouuu3ck4icNf+jcYkpoSVHl5vm1P6D6u/moNRcCNTZynNYiZ/xWY3D0X85
	LsbCe0+h0cne/CvJZ9B9Y8CfdVWGAz2wQF/AhvbloBNs32meAXOOBobcH3kkWlpWx/O9odHgtsExc
	9qzUQuqkFzdOwMysbuORq414oh03kAqLsyqsJud4LVrpA8JY96NuXA+oZl8AsEUIGDk/8ohtYNaB9
	Uvc0+gPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ1f4-004kqs-Sx; Sat, 27 Mar 2021 05:39:03 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ1eu-004kpw-3s; Sat, 27 Mar 2021 05:38:53 +0000
Received: by mail-pg1-x534.google.com with SMTP id 33so110171pgy.4;
 Fri, 26 Mar 2021 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6elHr9wS3U+eOcpmBW2sX0scmKlp2BHQ2gfORMO1D9I=;
 b=Hx9qKJF2vlXl+JLiMrwH8TEugZ/+bawo8E1VhTfuOIAnl2SgJu9bmDvCTpBpLjjMF3
 iK7AVxvwn6djDc9oU9WA2OaxfvIIoiFFhNW07Ayeh7mwvywHkO57XYZebmYoc8rEfNDr
 nNNjQZiBXxYjEIUfXNpyRHegljFo+WKl1FTk1xYo3yJ2CYCUFvfSwTkaXrYU4P70Inku
 gX1iqlMficNvLuNr5sQFtXQcUJF9M7XXhkP0UOzNJ4Gy4894imHXMsbxc/YqU7C2pe1I
 XHJoOPy8wQoeWrvuU/aMaD/O2E838PoCiGYJB1IeO2w2NCj7klZsirsrQYiylAb4dLw0
 QCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6elHr9wS3U+eOcpmBW2sX0scmKlp2BHQ2gfORMO1D9I=;
 b=p+vV7JScCkvFVyhVxe2ssHqRMgppuauktnQSpCVradH6aeCL1ce4Sx9jiIFwVcEJei
 dyCJczx0LP2x+nBrLZRgTybsk7cY6jbfrJqp90Ya8Wm0l2HosVcc60znW/mhmmVw3vF+
 4OGYNkOLduYvB1mZcB2t/T3+R5xQW5ePfEyo/HXGyeKUsHV8PebQqhqTT5TljYoD36rl
 sVY8e1W5Pky0tkDWDf3WD7dbJbkKlyXQJbcxwIxxOWwv8LPJdevgsHYxyLC6qmDd0M9h
 F9ZrTgjexKfjxWyHj6rd00s6w6DSEusB0ZJ36DGT4kNA/vIcHObTJn3t1SH5X0RD6DJF
 qcMw==
X-Gm-Message-State: AOAM533oni2+wfdw3dIrmsoR3B5lAXh/01vb7U3l/vAa9wu5MZLA8JQr
 W9pnYhDkGGfxN9N10vypxpw=
X-Google-Smtp-Source: ABdhPJzU5qXpd/hIC+jISW+cbPtDA42XgPMp+ggAA33zGl/07esw8SwP/gORLOkJCLZI8jzpfaYASw==
X-Received: by 2002:a63:4c4:: with SMTP id 187mr15291676pge.187.1616823529541; 
 Fri, 26 Mar 2021 22:38:49 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id k128sm10701933pfd.137.2021.03.26.22.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 22:38:48 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: John Crispin <john@phrozen.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 1/2] MIPS: ralink: annotate prom_soc_init() with __init
Date: Fri, 26 Mar 2021 22:38:39 -0700
Message-Id: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_053852_266155_B95DCD6C 
X-CRM114-Status: GOOD (  10.95  )
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

prom_soc_init is only called from prom_init in arch/mips/ralink/prom.c,
which is already annotated with __init, so annotate prom_soc_init with
__init too.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/ralink/common.h | 2 +-
 arch/mips/ralink/mt7620.c | 2 +-
 arch/mips/ralink/mt7621.c | 2 +-
 arch/mips/ralink/rt288x.c | 2 +-
 arch/mips/ralink/rt305x.c | 2 +-
 arch/mips/ralink/rt3883.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/ralink/common.h b/arch/mips/ralink/common.h
index 4bc65b7a3241..49ae370d023d 100644
--- a/arch/mips/ralink/common.h
+++ b/arch/mips/ralink/common.h
@@ -27,7 +27,7 @@ extern void ralink_clk_add(const char *dev, unsigned long rate);
 
 extern void ralink_rst_init(void);
 
-extern void prom_soc_init(struct ralink_soc_info *soc_info);
+extern void __init prom_soc_init(struct ralink_soc_info *soc_info);
 
 __iomem void *plat_of_remap_node(const char *node);
 
diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
index fcf010038054..53a5969e61af 100644
--- a/arch/mips/ralink/mt7620.c
+++ b/arch/mips/ralink/mt7620.c
@@ -639,7 +639,7 @@ mt7628_dram_init(struct ralink_soc_info *soc_info)
 	}
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(MT7620_SYSC_BASE);
 	unsigned char *name = NULL;
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ca0ac607b0f3..ec87ce561049 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -146,7 +146,7 @@ static void soc_dev_init(struct ralink_soc_info *soc_info, u32 rev)
 	}
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(MT7621_SYSC_BASE);
 	unsigned char *name = NULL;
diff --git a/arch/mips/ralink/rt288x.c b/arch/mips/ralink/rt288x.c
index 3f096897858c..34083c70ec68 100644
--- a/arch/mips/ralink/rt288x.c
+++ b/arch/mips/ralink/rt288x.c
@@ -77,7 +77,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT2880_SYSC_BASE);
 	const char *name;
diff --git a/arch/mips/ralink/rt305x.c b/arch/mips/ralink/rt305x.c
index 496f966c05f9..c5b63c142705 100644
--- a/arch/mips/ralink/rt305x.c
+++ b/arch/mips/ralink/rt305x.c
@@ -214,7 +214,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT305X_SYSC_BASE);
 	unsigned char *name;
diff --git a/arch/mips/ralink/rt3883.c b/arch/mips/ralink/rt3883.c
index 8f3fe3106708..ff91f3531ad0 100644
--- a/arch/mips/ralink/rt3883.c
+++ b/arch/mips/ralink/rt3883.c
@@ -113,7 +113,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT3883_SYSC_BASE);
 	const char *name;
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
