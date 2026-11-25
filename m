Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D3606A323
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UugVmxBr;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ELcExiDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RZiARSrN+96IvgyLqqkIF8nWXtL4K1TCt2GqvlBqfE0=; b=UugVmxBrwpYADcm+c751P9CAND
	sxGAUP7AkG60TeZtQ80vTVxKEM0gi2OJoy6CzVTdlY7zCVmt8aDQe1r+XltusJsL3XndzqL0Xnwa6
	iGtLGi63Km2bBQjkzoqv7LPz8+KbVBrQXlgFXv6VKz30TCTxe1JWbONoM/DNFhts7VezPdnOuuZ1/
	RhT/xCvmAzsv9EA0tKlofJHrHA/PBmxNKlqlnvWlexez7UuhqmE3JclPQJnAC8B7PKHCQUmTEKSBB
	XPH12oMeRLuRvCQtkdq3HpIVH16I3rxD60zUawpHexEknEowb0Gm3phULNtvyZ0mSY7ehloZqbE9O
	uN/hmGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7zm-00000008yQ5-107I;
	Wed, 25 Nov 2026 08:04:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7zj-00000008yP8-0GVA;
	Wed, 25 Nov 2026 08:04:48 +0000
X-UUID: dddcfd56e8a611f1afed4741b24580c9-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RZiARSrN+96IvgyLqqkIF8nWXtL4K1TCt2GqvlBqfE0=;
	b=ELcExiDL0Ne3E53F2RevlQd77pggl5lTtOASPG18QJ450ZiO7xRlyhmowtdjVx8MUDvqMRUqa5eNnG4mNmolN5s8AlWO4z6u5+6Lj7qSwvJkg7PM3FfOR4USO9qlgfkuYpLAEM0792NvW+jqfpn1RHEHF8uB3B6lFmZPWiyak6w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0d68b6b3-33d4-42cc-aed6-0ecff2996ca3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e66cd541-fbfd-4797-8578-13f3307ed033,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dddcfd56e8a611f1afed4741b24580c9-20261125
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 935697690; Wed, 25 Nov 2026 01:04:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 16:04:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 16:04:38 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Martin Kaiser <martin@kaiser.cx>,
	Vinod Koul <vkoul@kernel.org>
CC: <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] tracing: Fix UBSAN shift-out-of-bounds in test_event_printk()
Date: Wed, 25 Nov 2026 16:03:56 +0800
Message-ID: <20261125080431.1612026-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_000447_107741_30C66031 
X-CRM114-Status: GOOD (  13.10  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") removed the early return when dereference_flags is zero
so that test_double_dereference() can check all event arguments.

As a result, trace events with more than 64 arguments in TP_printk() now
always reach the argument-parsing loop and evaluate (1ULL << arg) when
arg >= 64, triggering a UBSAN shift-out-of-bounds trap.

Additionally, in the format string parsing loop, the bounds check only
tested 'arg == 63'. If the first 64 specifiers are non-pointer and
non-string formats (e.g., %d) and a subsequent specifier (arg >= 64) is
%s or %p*, 'arg == 63' evaluates to false and '1ULL << arg' also shifts
out of bounds.

Fix both issues by changing the upper bound check to 'arg >= 63' and
guarding the '(1ULL << arg)' checks in the argument loop with
'arg < 64'.

Fixes: b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer in TP_printk()")
Cc: stable@vger.kernel.org
Signed-off-by: Kuyo Chang <kuyo.chang@mediatek.com>
---
 kernel/trace/trace_events.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 7f89160aeff3..5933fc92f786 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -526,7 +526,7 @@ static void test_event_printk(struct trace_event_call *call)
 				case 'a': case 'd': case 'D':
 				case 'g': case 't': case 'C':
 				case 'O': case 'f':
-					if (WARN_ONCE(arg == 63,
+					if (WARN_ONCE(arg >= 63,
 						      "Too many args for event: %s",
 						      trace_event_name(call)))
 						return;
@@ -556,7 +556,7 @@ static void test_event_printk(struct trace_event_call *call)
 					if ((fmt[i + j] == 's')) {
 						if (star)
 							arg++;
-						if (WARN_ONCE(arg == 63,
+						if (WARN_ONCE(arg >= 63,
 							      "Too many args for event: %s",
 							      trace_event_name(call)))
 							return;
@@ -610,7 +610,7 @@ static void test_event_printk(struct trace_event_call *call)
 
 			test_double_dereference(fmt + start_arg, e - start_arg, call);
 
-			if (dereference_flags & (1ULL << arg)) {
+			if (arg < 64 && (dereference_flags & (1ULL << arg))) {
 				handle_dereference_arg(fmt + start_arg, string_flags,
 						       e - start_arg,
 						       &dereference_flags, arg, call);
@@ -625,7 +625,7 @@ static void test_event_printk(struct trace_event_call *call)
 
 	test_double_dereference(fmt + start_arg, i - start_arg, call);
 
-	if (dereference_flags & (1ULL << arg)) {
+	if (arg < 64 && (dereference_flags & (1ULL << arg))) {
 		handle_dereference_arg(fmt + start_arg, string_flags,
 				       i - start_arg,
 				       &dereference_flags, arg, call);
-- 
2.45.2


