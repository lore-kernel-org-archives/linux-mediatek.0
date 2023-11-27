Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56697C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bckHyNJG5IsDCmEKDwalIObMqsZcNV3+pMVYGOWkZA=; b=uvYeIDZtwSpmdWZP75Us6GfWxE
	di1DP/0e7SDzQqS4RL9AigOESGICSJbX4MAxVemUsaLp7Q39MDKB6cqXvmSgOcSrS4dqpca4h9Ry6
	HSK1+1UtG6p+LWy43k2UT6x+MgKMESw+HzkuC5SJ+RGvx8oixZ9kz+lB3NBc/dVwAZsv54N45tj6Q
	NkSuoOvPs5IXXFvfUp8NPP+mYM5zPJJHnft3kJTFCJGchNfRRIMCet5b3prkmGCqiDCVz2iSco0B/
	SgppllkevXuqXWqEIiTMjS8zLi9JL4227ZTQ0kaaOfHclnAGXiuJaGetNzFdtTL3h7Ve3F6+9b3yD
	pUEZ0kgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7W0G-001jAG-3C;
	Mon, 27 Nov 2023 07:26:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7W0D-001j9Y-0V;
	Mon, 27 Nov 2023 07:25:58 +0000
X-UUID: 31f8b57a8cf611ee9b7791016c24628a-20231127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9bckHyNJG5IsDCmEKDwalIObMqsZcNV3+pMVYGOWkZA=;
	b=Ir7dyl8PjdmMjC+E7j7WJKdu7+hMtFfdIN58H9s//k+s7NSqJSzGhW86Vxfc6zWzeQVyThe33zlJ/oSxxEjzKQ2OFFg2OSgpkYT7+DXd9XHueqj4wspARvc+3LBdMRyIG6JfYuYsPX8AUS7ktTJTrce9aa9tdw9wQCbf/D1+z48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:a6da6c24-a2f3-4301-b28e-f6fee4f9b537,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:60011c73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 31f8b57a8cf611ee9b7791016c24628a-20231127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2026218972; Mon, 27 Nov 2023 00:25:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 Nov 2023 15:05:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 27 Nov 2023 15:05:16 +0800
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
Subject: [PATCH 1/3] scripts/gdb/tasks: Fix lx-ps command error
Date: Mon, 27 Nov 2023 15:04:01 +0800
Message-ID: <20231127070404.4192-2-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
References: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.762900-8.000000
X-TMASE-MatchedRID: TCPSmmY0AVNXKLar1IWcqhIRh9wkXSlFBdebOqawiLujC1E/zCEIr8Rk
	oeJ3OFRc3k+CPiKHMcLBSaBGgOy3GNEdmUPXI8FxWd1vvclMcXUUqWKocoJo6WrVm7PW4m4IaUX
	s6FguVy2veSUy9VcQXIAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGmKd6TrD/tOxJTyu087Bl/3dU/
	0piiw/KVY8fik7GhBq/WJMB7lBUBeC/0zoitWvtG59So5u9ctjsIj++Y58d/rqkfDrTAOo86CjN
	WMcfCKKdATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.762900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 29868F287BE6268FBBD8E35727CAA5215BC88AFF032D54227874052E0B4452B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_232557_203770_85D4ABD5 
X-CRM114-Status: UNSURE (   8.97  )
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
 scripts/gdb/linux/tasks.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/gdb/linux/tasks.py b/scripts/gdb/linux/tasks.py
index 17ec19e9b5bf..7c32f4c8284b 100644
--- a/scripts/gdb/linux/tasks.py
+++ b/scripts/gdb/linux/tasks.py
@@ -13,7 +13,7 @@
 
 import gdb
 
-from linux import utils
+from linux import utils, lists
 
 
 task_type = utils.CachedType("struct task_struct")
@@ -25,13 +25,9 @@ def task_lists():
     t = g = init_task
 
     while True:
-        while True:
-            yield t
-
-            t = utils.container_of(t['thread_group']['next'],
-                                   task_ptr_type, "thread_group")
-            if t == g:
-                break
+        thread_head = t['signal']['thread_head']
+        for thread in lists.list_for_each_entry(thread_head, task_ptr_type, 'thread_node'):
+            yield thread
 
         t = g = utils.container_of(g['tasks']['next'],
                                    task_ptr_type, "tasks")
-- 
2.18.0


