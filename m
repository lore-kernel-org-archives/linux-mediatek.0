Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496E9C07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSLnY3xqrwn+hgoTLGJH8USVe7mquDMPoI+jvrGs6a0=; b=G2zVNbyrd/hsPWZSQMXyFXXrV0
	1aP72v2bbqESVsWRTLWWcG8erRLTvIA/GAgeTnXUaFl81NI6zhLQm1szHsYpMCNEIKn/qsHFcUgY1
	vh4Ne4YAvDh3d+od6xqt0dEjhe0bhSkECxD8h7XheFVOZtO3AisfB7JCTNy6/JZ8iwu1chestFJPw
	DH4bs29cDWS4F8rETZwpJkLawMmIJw8gWCaWatJYYEkCaUEwGBo+q5T1jaV9bOT09sowtIb6kyXWO
	10FNewm9LcMjt19GhWC72hVbPH7DUibwVESyXjqLpnNlVHPglbU3f0JspGZoBTRJFkIqDuLyVZSXn
	yZF95LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQx-007H4O-0q;
	Wed, 29 Nov 2023 06:52:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EQt-007H2B-09;
	Wed, 29 Nov 2023 06:52:29 +0000
X-UUID: d75775c28e8311ee86758d4a7c00f3a0-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HSLnY3xqrwn+hgoTLGJH8USVe7mquDMPoI+jvrGs6a0=;
	b=InL70seds0n1y0DxEG1DBI/ltO8Nik7kro64Uc801Fy2mA5HsuAMVudxqWG+hwDSBVzRHgqgjmIKbVczTk/55G95Y4F6elc6ZcyW6Yg6mHClY8f8DDEI1BjVadRqcirKThfh9r7jkFkfvwgczW6t630GUdMPuWPIYz2EqFvvxVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:076c3bd7-49fb-4c1b-b832-904744867f2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:0c7bf095-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d75775c28e8311ee86758d4a7c00f3a0-20231128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1055065825; Tue, 28 Nov 2023 23:52:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 14:51:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 14:51:45 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Andrew Morton
	<akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <stable@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/3] scripts/gdb/tasks: Fix lx-ps command error
Date: Wed, 29 Nov 2023 14:51:38 +0800
Message-ID: <20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.095600-8.000000
X-TMASE-MatchedRID: TCPSmmY0AVNXKLar1IWcqhIRh9wkXSlFBdebOqawiLujC1E/zCEIr8Rk
	oeJ3OFRc3k+CPiKHMcLBSaBGgOy3GNEdmUPXI8FxWd1vvclMcXUUqWKocoJo6WrVm7PW4m4ILPJ
	tWpbJjY1VzwOWOJEzlnATsg8MODVIHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwgNwDygWeOSz4rz
	9LHo1WfqmfSlSAB+6ZRR6TlvCxdzkqKAHuRowG7g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.095600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1549B13AAC282B14084AFFAD7663CDDD84A55DADBFBB687B81633AF352EAF3E42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_225227_105295_E7EE4F81 
X-CRM114-Status: GOOD (  10.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since commit 8e1f385104ac ("kill task_struct->thread_group") remove
the thread_group, we will encounter below issue.

(gdb) lx-ps
      TASK          PID    COMM
0xffff800086503340   0   swapper/0
Python Exception <class 'gdb.error'>: There is no member named thread_group.
Error occurred in Python: There is no member named thread_group.

We use signal->thread_head to iterate all threads instead.

Fixes: 8e1f385104ac ("kill task_struct->thread_group")
Cc: stable@vger.kernel.org
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/gdb/linux/tasks.py | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/scripts/gdb/linux/tasks.py b/scripts/gdb/linux/tasks.py
index 17ec19e9b5bf..aa5ab6251f76 100644
--- a/scripts/gdb/linux/tasks.py
+++ b/scripts/gdb/linux/tasks.py
@@ -13,7 +13,7 @@
 
 import gdb
 
-from linux import utils
+from linux import utils, lists
 
 
 task_type = utils.CachedType("struct task_struct")
@@ -22,19 +22,15 @@ task_type = utils.CachedType("struct task_struct")
 def task_lists():
     task_ptr_type = task_type.get_type().pointer()
     init_task = gdb.parse_and_eval("init_task").address
-    t = g = init_task
+    t = init_task
 
     while True:
-        while True:
-            yield t
+        thread_head = t['signal']['thread_head']
+        for thread in lists.list_for_each_entry(thread_head, task_ptr_type, 'thread_node'):
+            yield thread
 
-            t = utils.container_of(t['thread_group']['next'],
-                                   task_ptr_type, "thread_group")
-            if t == g:
-                break
-
-        t = g = utils.container_of(g['tasks']['next'],
-                                   task_ptr_type, "tasks")
+        t = utils.container_of(t['tasks']['next'],
+                               task_ptr_type, "tasks")
         if t == init_task:
             return
 
-- 
2.18.0


