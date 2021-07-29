Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7D7C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 02:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2606103B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 02:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD2606103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqmZBzLt7QIOpIZ1pcG6PGOmrkASrH6D8VSSLuiFYEk=; b=nbzRZw1ptqhEry
	ygWLiVchLGGak9cJE/a1me9+viqS8X0CjhrrCrHOJ8j3x/rfCGcz9ffVISrpVFpdOq9ktMDW29jkf
	GD5GULQSLTH/HgLE6/qdFPsc2bpk56HVGjmh4mzkz6JUH9OqfZH0VU/6ojwQMDl8X6NZ1rHshLJ3u
	rZP0z7kNHgf3QhR8MElUatJ9NTroaLpskL6hx+7ZfR7eWfsNdnbImVZF3jTYcxRYREGKuEN3r3agb
	DxFPkfbp5J6nR0YR7bY6h9fcj/tkvOOw513JSwf2albhSbX4lW51TrUbst8Ti5cm+csCMZr6cJzQH
	4wMXIuDwuLxgMheUbFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vSZ-002s14-Ld; Thu, 29 Jul 2021 02:07:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vSS-002rv3-PQ; Thu, 29 Jul 2021 02:07:38 +0000
X-UUID: 649694ec62134466a60a5ca42396c071-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bl/lNRQr1DHHQnddTvDXa7ZfXJG0SH1PVCRqIwJTXTc=; 
 b=o1od5nOeQPTYhgSc9O5PapSaCQ5q/phehE2CtYQ+Pow7tNr7YnntHoScNkXPmHR+jLiSpFro27H7kMBNw0C1IQKie/FVHEPsQgjORVPOwcHesczaexZi18U/WhyhWo1YvIfNvmLb/z87TJOLvgYuTP3omeVJmmlPNWTaXwaeCeQ=;
X-UUID: 649694ec62134466a60a5ca42396c071-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2041906155; Wed, 28 Jul 2021 19:07:33 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 19:07:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 10:07:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 10:07:29 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, David Brazdil
 <dbrazdil@google.com>, Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba
 <tabba@google.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] arm64/cpufeature: Add arm64.nomte to override id-reg
Date: Thu, 29 Jul 2021 10:07:12 +0800
Message-ID: <20210729020717.15142-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729020717.15142-1-yee.lee@mediatek.com>
References: <20210729020717.15142-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_190736_906728_596664F6 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Yee Lee <yee.lee@mediatek.com>

Add an alias, "arm64.nomte", to override id-reg and
suppress mte feature.

Suggested-by: Marc Zyngier <maz@kernel.org>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 arch/arm64/kernel/idreg-override.c | 2 ++
 1 file changed, 2 insertions(+)

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
