Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C825C19F4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VnSbfmRmPkE9Z6/xL87FEMZ2565KQXS7kXZBquQw44=; b=i2Tak/BQbOjC2SRCK/hsM+900i
	V8ZxZNxs7Z/vO+wQCiuKGQ9giV+eJyrjIC1AfCLy++wEb7h8QA8cPNvBrkPCnyQTk0wcBvTawKku1
	KvpzmygMJGYQ8zcoV6xJ5POXgebTcnAGuZ2hoGUOILjQhihMvn9qLgUv0HmdoD5m1aRhHD2TQXc5G
	df1rtvync92TESBjwB2naxV1rrXXbDqDOrKQiAEP7CwFEB2kHNvyFPNNO40g7cba8UtHRLnnRr72F
	rmQeUNB4wtH+QZIa/ddfqZql7BT1SXD6PWYU12aLEHXRkGSMdgmytWetkKYL8rdjFWMhl3wGchOtf
	eR1ZLE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G7X-0000000BURZ-24at;
	Fri, 26 Apr 2024 07:35:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G7U-0000000BUPx-0UR0;
	Fri, 26 Apr 2024 07:35:45 +0000
X-UUID: 922a02a8039f11ef9a78ddf43a9225dc-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0VnSbfmRmPkE9Z6/xL87FEMZ2565KQXS7kXZBquQw44=;
	b=KyPuNyGqJD8VkgPAo4mlBIWZoWzeSgaLMTnMYG8mc+B/aY+/P+zZLMCMpccL2wWplka0dGBrkTyenO2a8ZBX9XWo79Z0jJGRlIm+bC9hrzJv2K72dRX9stJ/RscQJ5DnCFQc2VwrmCsRZyanE5HNXLWm4LegkcPSdhhYf2qj73E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:ad57b157-1cf7-418a-a46a-7c67a5a2b839,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:b49a0b92-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 922a02a8039f11ef9a78ddf43a9225dc-20240426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 399784497; Fri, 26 Apr 2024 00:35:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 15:34:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 15:34:58 +0800
From: Tze-nan wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>, Tze-nan wu
	<Tze-nan.Wu@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Date: Fri, 26 Apr 2024 15:34:08 +0800
Message-ID: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.709200-8.000000
X-TMASE-MatchedRID: Oiwj9Z5zoYfBBfeYOfDzGeJmMZmLmwx5JNtuyL6mpIXnQ0faNr22ly2I
	ryQ4sy22PluEU8uk8U1hIqZMefvkMYHcC7KYYAdEt1AhvyEKdj4Bmf/gD11vZLeKIZi8OZjkOXf
	Z9OHyzWYYhA/yqU1gbudMv2hWHjOChrD3pNcSx1a4jAucHcCqnTGZtPrBBPZrYTBuC4I3GUdZcq
	G2bJBnY63QzRpYhGSscAVxZL8H4DMWcPQGe3P9BFVN8laWo90MvtVce6w5+K+7+NPPxj+R6jEdc
	33mv6D89ceA9hBhWDteGOFKwHTALzxmES9G+PPgr9glqbqf2bQsleOknNBI0+QydRUvl3QTuBsm
	4LkLwbMLVCp/BGC7GAP5V3sWHZfiHG1zuzhqgWfAJnGRMfFxyY/8SyGg0rIRxN4K0DXKS1imRE7
	f7OYxUiAgSuPJcYgLWKNxvq78azVveCKWtaLcaNcjCbPZgQnFEVhvB8sXyyPFas8s9VsawZXiR+
	iW11ck6kLTNeJvUTbRY2ly55W2vj8J/1ZA8b0wJQI+kfsRJdrq0SQ1Mgx5CCow3ZvJGhxdo8WMk
	QWv6iXBcIE78YqRWvcUt5lc1lLgoGRyAacnhaaD1+gJoH8joMuF7n2a4giCRdYztKQAnV318qCB
	RlXuO37cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.709200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1855CEFE36B23BD2996F096E4238EF6FD8DFFACC3453EFE8EB7A63622EEEA9672000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_003544_177586_33AB4C30 
X-CRM114-Status: GOOD (  15.82  )
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

"tracing_event_file" is at the risk of use-after-free due to the race of
two functions "tracing_open_file_tr" and "synth_event_release".
Specifically, it could be freed by synth_event_release before
tracing_open_file_tr has the opportunity to access its members.

It's easy to reproduced by first executing script 'A' and then script 'B'
in my environment.

  Script 'A':
    echo "hello int aaa" > /sys/kernel/tracing/synthetic_events
    while :
    do
      echo 0 > /sys/kernel/tracing/events/synthetic/hello/enable
    done

  Script 'B':
    echo > /sys/kernel/tracing/synthetic/events

  My environment:
    arm64 + generic and swtag based KASAN both enabled + kernel-6.6.18

KASAN report
==================================================================
BUG: KASAN: slab-use-after-free in tracing_open_file_tr
Read of size 8 at addr 9*ffff********** by task sh/3485
Pointer tag: [9*], memory tag: [fe]

CPU: * PID: 3485 Comm: sh Tainted: ****************
Call trace:
 __hwasan_tag_mismatch
 tracing_open_file_tr
 do_dentry_open
 vfs_open
 path_openat

Freed by task 3490:
 slab_free_freelist_hook
 kmem_cache_free
 event_file_put
 remove_event_file_dir
 __trace_remove_event_call
 trace_remove_event_call
 synth_event_release
 dyn_events_release_all
 synth_events_open

page last allocated via order 0, migratetype Unmovable:
 __slab_alloc
 kmem_cache_alloc
 trace_create_new_event
 trace_add_event_call
 register_synth_event
 __create_synth_event
 create_or_delete_synth_event
 trace_parse_run_command
 synth_events_write
 vfs_write

Based on the assumption that eventfs_inode will persist throughout the
execution of the tracing_open_file_tr function,
we can fix this issue by incrementing the reference count of
trace_event_file once it is assigned to eventfs_inode->data.
The reference count will then be decremented during the release phase of
eventfs_inode.

This ensures that trace_event_file is not prematurely freed while the
tracing_open_file_tr function is being called.

Fixes: bb32500fb9b7 ("tracing: Have trace_event_file have ref counters")
Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan wu <Tze-nan.Wu@mediatek.com>
---
BTW, I've also attempted to reproduce the same issue in another
environment (described below).
It's also reproducible but in a lower rate.

another environment:
  x86 + ubuntu + generic kasan enabled + kernel-6.9-rc4

After applying the patch, KASAN no longer reports any issues when
following the same reproduction steps in my arm64 environment. 
However, I am concerned about potential side effects that the patch might introduce.
Additionally, the newly added function "is_entry_event_callback" may not
be reliable in my opinion,
as the callback function used in the comparison could change in future. 
Nonetheless, this is the best solution I can come up with now.

Looking for any suggestion or solution, appreciate.

 fs/tracefs/event_inode.c     | 3 +++
 include/linux/trace_events.h | 4 ++++
 kernel/trace/trace_events.c  | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 894c6ca1e500..fd49c0f88500 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -20,6 +20,7 @@
 #include <linux/workqueue.h>
 #include <linux/security.h>
 #include <linux/tracefs.h>
+#include <linux/trace_events.h>
 #include <linux/kref.h>
 #include <linux/delay.h>
 #include "internal.h"
@@ -90,6 +91,8 @@ static void release_ei(struct kref *ref)
 
 	kfree(ei->entry_attrs);
 	kfree_const(ei->name);
+	if (ei->nr_entries && is_entry_event_callback(ei->entries[0]))
+		event_file_put(ei->data);
 	if (ei->is_events) {
 		rei = get_root_inode(ei);
 		kfree_rcu(rei, ei.rcu);
diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 6f9bdfb09d1d..602e87682ee2 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -9,6 +9,7 @@
 #include <linux/hardirq.h>
 #include <linux/perf_event.h>
 #include <linux/tracepoint.h>
+#include <linux/tracefs.h>
 
 struct trace_array;
 struct array_buffer;
@@ -505,6 +506,7 @@ extern struct trace_event_file *trace_get_event_file(const char *instance,
 						     const char *system,
 						     const char *event);
 extern void trace_put_event_file(struct trace_event_file *file);
+bool is_entry_event_callback(struct eventfs_entry entry);
 
 #define MAX_DYNEVENT_CMD_LEN	(2048)
 
@@ -731,6 +733,8 @@ extern void
 event_triggers_post_call(struct trace_event_file *file,
 			 enum event_trigger_type tt);
 
+extern void event_file_put(struct trace_event_file *file);
+
 bool trace_event_ignore_this_pid(struct trace_event_file *trace_file);
 
 bool __trace_trigger_soft_disabled(struct trace_event_file *file);
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 52f75c36bbca..de01676b59ff 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2626,6 +2626,7 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 		return -1;
 	}
 
+	event_file_get(file);
 	file->ei = ei;
 
 	ret = event_define_fields(call);
@@ -3420,6 +3421,11 @@ void trace_put_event_file(struct trace_event_file *file)
 }
 EXPORT_SYMBOL_GPL(trace_put_event_file);
 
+bool is_entry_event_callback(struct eventfs_entry entry)
+{
+	return entry.callback == event_callback;
+}
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 
 /* Avoid typos */
-- 
2.18.0


