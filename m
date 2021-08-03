Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01063C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:09:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A5560F70
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A5560F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP07V39yIL6QgYVkkwt5jx9Z1TPmVI2h5Yn8aHKSRb0=; b=25ObFPtNN4n9LQ
	38cRhPioXmTjU11FwsM6pGe/9bBtzpU3mBda3UAeoWu1AKKVPG8LLYfuGZAf8T2SfrfnU3XMTTchi
	R0LzNOY2es3G4DQCDQjWawYYu4tl2MFxbAKG1BRGlg0B2PYlQmyQEMb32fxZaCWESJ/CXqwaeGCx9
	r38e9y8EgsNkbW49P1MlOCri8ywjArRdXagcH9P9z1l7Z35Xo0xnisS+4pKEC++ff+400TjnWjhlk
	ZRsYLnx61jZIq17XzHjJCtGqBxzEdx4d6cubtfQhvr42Myqc5k9g52FLTZ13Kx/zSSgj5PY9dvr+B
	+IS1qf2J73miodfpcqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAoXs-001NQi-Mc; Tue, 03 Aug 2021 07:09:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAoXq-001NOB-4L; Tue, 03 Aug 2021 07:08:59 +0000
X-UUID: 6f3778999c8343f492ae4f7fba064147-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SuxWoDfPK4mo/SUPJ3dcrNzNR4M1QtNtnuHkqb61Qfs=; 
 b=by0Ps/qS4PDvkuBQXMrHgDRIocMcnaFxAup5EZnL9FsUJn8RjaJcLm/TJm7Sz70HMyPkzQ8QJvTrDBNBLmZFbsUbRoUpR3YzSpkGoXNvYMeuHXn7ZSceBstPBkr6tEIO4wiSbN7mnVBDGdiMYSkIcO32rTQZ2RRObdG3vbkOmyA=;
X-UUID: 6f3778999c8343f492ae4f7fba064147-20210803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325843658; Tue, 03 Aug 2021 00:08:53 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 00:08:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:08:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 15:08:42 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, Jonathan Corbet
 <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Viresh Kumar
 <viresh.kumar@linaro.org>, Peter Zijlstra <peterz@infradead.org>, "Vlastimil
 Babka" <vbabka@suse.cz>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 "Hector Martin" <marcan@marcan.st>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Amit Daniel Kachhap <amit.kachhap@arm.com>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "David Brazdil" <dbrazdil@google.com>, Fuad Tabba <tabba@google.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "moderated list:ARM64 PORT
 (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 1/1] arm64/cpufeature: Optionally disable MTE via
 command-line
Date: Tue, 3 Aug 2021 15:08:22 +0800
Message-ID: <20210803070824.7586-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210803070824.7586-1-yee.lee@mediatek.com>
References: <20210803070824.7586-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_000858_234770_CBEC75D2 
X-CRM114-Status: GOOD (  17.81  )
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

From: Yee Lee <yee.lee@mediatek.com>

MTE support needs to be optionally disabled in runtime 
for HW issue workaround, FW development and some 
evaluation works on system resource and performance.

This patch makes two changes:
(1) moves init of tag-allocation bits(ATA/ATA0) to
cpu_enable_mte() as not cached in TLB.

(2) allows ID_AA64PFR1_EL1.MTE to be overridden on
its shadow value by giving "arm64.nomte" on cmdline.

When the feature value is off, ATA and TCF will not set 
and the related functionalities are accordingly suppressed.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/sysreg.h                 | 3 +--
 arch/arm64/kernel/cpufeature.c                  | 3 +++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdb22006f713..6f257e39d89e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -380,6 +380,9 @@
 	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
 			support
 
+	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
+			support
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7b9c3acba684..e3e2c93b35f4 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -698,8 +698,7 @@
 	(SCTLR_ELx_M    | SCTLR_ELx_C    | SCTLR_ELx_SA   | SCTLR_EL1_SA0   | \
 	 SCTLR_EL1_SED  | SCTLR_ELx_I    | SCTLR_EL1_DZE  | SCTLR_EL1_UCT   | \
 	 SCTLR_EL1_NTWE | SCTLR_ELx_IESB | SCTLR_EL1_SPAN | SCTLR_ELx_ITFSB | \
-	 SCTLR_ELx_ATA  | SCTLR_EL1_ATA0 | ENDIAN_SET_EL1 | SCTLR_EL1_UCI   | \
-	 SCTLR_EL1_EPAN | SCTLR_EL1_RES1)
+	 ENDIAN_SET_EL1 | SCTLR_EL1_UCI  | SCTLR_EL1_EPAN | SCTLR_EL1_RES1)
 
 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 0ead8bfedf20..51e6bf4bb7b5 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1843,6 +1843,9 @@ static void bti_enable(const struct arm64_cpu_capabilities *__unused)
 #ifdef CONFIG_ARM64_MTE
 static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 {
+	sysreg_clear_set(sctlr_el1, 0, SCTLR_ELx_ATA | SCTLR_EL1_ATA0);
+	isb();
+
 	/*
 	 * Clear the tags in the zero page. This needs to be done via the
 	 * linear map which has the Tagged attribute.
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 53a381a7f65d..d8e606fe3c21 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -54,6 +54,7 @@ static const struct ftr_set_desc pfr1 __initconst = {
 	.override	= &id_aa64pfr1_override,
 	.fields		= {
 	        { "bt", ID_AA64PFR1_BT_SHIFT },
+		{ "mte", ID_AA64PFR1_MTE_SHIFT},
 		{}
 	},
 };
@@ -100,6 +101,7 @@ static const struct {
 	{ "arm64.nopauth",
 	  "id_aa64isar1.gpi=0 id_aa64isar1.gpa=0 "
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0"	   },
+	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"kaslr.disabled=1" },
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
