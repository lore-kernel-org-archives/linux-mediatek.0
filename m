Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0BBC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2179260E76
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2179260E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLBMWF4/3Osay/wjgaQxtjrG8m0yKwFuY634Irptve0=; b=bsGNhKoVHVVCNu
	ZI0fQfmBzZb9FyhqSs6odzlPp1UWAC8fNH+nGAXcSdEYb8GR++pgxAJoVGOSeSCUf4R7DghqiDp5B
	OTuHq+Wk3XJkY6sKwG9el2Lm9iE82Nk/cHRbg0JyplH1M2U946RrHxsK4uDsBpG8oTdd6i1EjpHlb
	8Tfk+S+N2BM6luwHJSVH2b6lrvp0Dh3rZ38P8/u0orG9Dz9ghvcXnfPUh2LgGnOYL63DNh9Pn9SUF
	V6TFL5Nab9x+TVhmG5x+35TK9AmjQrhDAZrNSJLLk0omILpZgVCe8UGzmtW58uUawKeBL9yQM8M+i
	Rt1F3QcvtJBwATuXohaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9U0J-0096rc-6u; Fri, 30 Jul 2021 15:00:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Tq8-0092Y8-A7; Fri, 30 Jul 2021 14:50:22 +0000
X-UUID: 8498741433d8438c94539744db9214c0-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wTJIuIEQJCWCFqGSxaQbwV76yvEYaRng2FjLHNQzEfQ=; 
 b=sPIp/wwzoHnfFvKWTN24XxBhOmrnImItLvpx/xcxdiPVex5/CFwkXHeSuCYLL8EnZ1QdsZQkdmjs02vbaell+Qy0a44BZKk7kzp38D7ld/u6tmOk61kikMq0ypkrXKFQPLGrixS2hOxcWHdiVhiXIEKle1gy+bUqz3+1sIESt+4=;
X-UUID: 8498741433d8438c94539744db9214c0-20210730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1846036298; Fri, 30 Jul 2021 07:50:14 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 07:50:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 22:50:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Jul 2021 22:50:10 +0800
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
 Babka" <vbabka@suse.cz>, Marc Zyngier <maz@kernel.org>, David Brazdil
 <dbrazdil@google.com>, Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba
 <tabba@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 1/1] arm64/cpufeature: Optionally disable MTE via
 command-line
Date: Fri, 30 Jul 2021 22:49:53 +0800
Message-ID: <20210730144957.30938-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730144957.30938-1-yee.lee@mediatek.com>
References: <20210730144957.30938-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_075020_419337_BD358024 
X-CRM114-Status: GOOD (  12.39  )
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

For some low-end devices with limited resources,
MTE needs to be optionally disabled to save system
costs such as tag memory and firmware controls.

This allows ID_AA64PFR1_EL1.MTE to be overridden on 
its shadow value by giving "arm64.nomte" on cmdline,
and to suppress MTE feature.

Suggested-by: Marc Zyngier <maz@kernel.org>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 2 files changed, 5 insertions(+)

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
