Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB651C83001
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56072073E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nXIg29sF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y01Hg1aI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56072073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xa0R9+QEuR5GxxpclD+I5DVQ3oYL74aoumTd3XE5eY8=; b=nXIg29sFvcLcvO
	4/P+9GBrCX43TITZMq7+bARx34fbYd6BJvZRWY736nfP5gKKtrJt7WsVwtkTtErDGAKUltSD4b+VX
	6UkW3yXYgFkrEANvZ8GcQ4jrdF/OS/iT6ej6188rrNGelqOOYjyAvt+Gm+6XkwckbbYL4TWb1zP8I
	G5mpPxbMmuwp7kHosfremjCXevYCoCTjS+OKVg3+rleOjpOHqIzTJS+uq/aZCtrNzrGpic9x5xjf3
	TGX5nyTEfr8jPL4ExokhvApvYraTvC3V2aa8XflekacSssFPEEzeghRi9Sg9a27dWm/W4zFYTdq6E
	7/fOHE+DOgQYGJdXcXDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4N5-0008Hv-Qj; Thu, 30 Apr 2020 08:16:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4MZ-0007kg-6Z
 for linux-mediatek@lists.infradead.org; Thu, 30 Apr 2020 08:16:10 +0000
X-UUID: 330c28cc3c824ae9acfa72464fd490d7-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T1IsRcXqZalGl+MREkX3NQDS+CM9kjFsPBXIszY21wE=; 
 b=Y01Hg1aI5u7oYpHXAVAMLx+j0xT/O48MA9a7gNWTgL0kBMlP6SUEa7jtXKHeC6MPQbSNGVWgRQKJk0DtJM+WX6QFwlGSR4TTkW4QkpCQWmsRZ6LCotGWVRiqLqBM6ilE2z/znMrzDErtgVcpp9bHXLQLQDNIVfEix9x8/Nyl4v4=;
X-UUID: 330c28cc3c824ae9acfa72464fd490d7-20200430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1110415146; Thu, 30 Apr 2020 00:15:46 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 01:14:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 16:14:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Apr 2020 16:14:04 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 1/1] binder: transaction latency tracking for user build
Date: Thu, 30 Apr 2020 16:13:59 +0800
Message-ID: <1588234439-7959-2-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1588234439-7959-1-git-send-email-Frankie.Chang@mediatek.com>
References: <1586929044-12708-2-git-send-email-Frankie.Chang@mediatek.com>
 <1588234439-7959-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1DB05B56B1754AD3BCD1863515200A19BF2FDBFB90F5622C6DA8C3EBF631DC792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_011607_273258_58F86104 
X-CRM114-Status: GOOD (  18.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Todd Kjos <tkjos@android.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Frankie Chang <Frankie.Chang@mediatek.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Record start/end timestamp for binder transaction.
When transaction is completed or transaction is free,
it would be checked if transaction latency over threshold (2 sec),
if yes, printing related information for tracing.

/* Implement details */
- Add tracepoint/trace at free transaction.
  Since the original trace_binder_transaction_received cannot
  precisely present the real finished time of transaction, adding a
  trace_binder_free_transaction at the point of free transaction
  may be more close to it.

- Add latency tracer module to monitor slow transaction.
  The trace_binder_free_transaction would not be enabled
  by default. Monitoring which transaction is too slow to
  cause some of exceptions is important. So we hook the
  tracepoint to call the monitor function.

- Move some struct from core file to header file.
  Need some struct defined in core file in latency trace module
  In addition, moving all structs to header file makes module
  more extendable, and make all these strcuts to be defined
  in the same file.

Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
---
 drivers/android/Kconfig                 |    8 +
 drivers/android/Makefile                |    1 +
 drivers/android/binder.c                |  408 +-----------------------------
 drivers/android/binder_internal.h       |  416 +++++++++++++++++++++++++++++++
 drivers/android/binder_latency_tracer.c |  105 ++++++++
 drivers/android/binder_trace.h          |   49 ++++
 6 files changed, 583 insertions(+), 404 deletions(-)
 create mode 100644 drivers/android/binder_latency_tracer.c

diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index 6fdf2ab..7ba80eb 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
 	  exhaustively with combinations of various buffer sizes and
 	  alignments.
 
+config BINDER_USER_TRACKING
+	bool "Android Binder transaction tracking"
+	help
+	  Used for track abnormal binder transaction which is over 2 seconds,
+	  when the transaction is done or be free, this transaction would be
+	  checked whether it executed overtime.
+	  If yes, printing out the detail info about it.
+
 endif # if ANDROID
 
 endmenu
diff --git a/drivers/android/Makefile b/drivers/android/Makefile
index c9d3d0c9..552e8ac 100644
--- a/drivers/android/Makefile
+++ b/drivers/android/Makefile
@@ -4,3 +4,4 @@ ccflags-y += -I$(src)			# needed for trace events
 obj-$(CONFIG_ANDROID_BINDERFS)		+= binderfs.o
 obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o
 obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
+obj-$(CONFIG_BINDER_USER_TRACKING)	+= binder_latency_tracer.o
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index a6b2082..b89d75a 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -160,24 +160,6 @@ static int binder_set_stop_on_user_error(const char *val,
 #define to_binder_fd_array_object(hdr) \
 	container_of(hdr, struct binder_fd_array_object, hdr)
 
-enum binder_stat_types {
-	BINDER_STAT_PROC,
-	BINDER_STAT_THREAD,
-	BINDER_STAT_NODE,
-	BINDER_STAT_REF,
-	BINDER_STAT_DEATH,
-	BINDER_STAT_TRANSACTION,
-	BINDER_STAT_TRANSACTION_COMPLETE,
-	BINDER_STAT_COUNT
-};
-
-struct binder_stats {
-	atomic_t br[_IOC_NR(BR_FAILED_REPLY) + 1];
-	atomic_t bc[_IOC_NR(BC_REPLY_SG) + 1];
-	atomic_t obj_created[BINDER_STAT_COUNT];
-	atomic_t obj_deleted[BINDER_STAT_COUNT];
-};
-
 static struct binder_stats binder_stats;
 
 static inline void binder_stats_deleted(enum binder_stat_types type)
@@ -213,278 +195,11 @@ static struct binder_transaction_log_entry *binder_transaction_log_add(
 	return e;
 }
 
-/**
- * struct binder_work - work enqueued on a worklist
- * @entry:             node enqueued on list
- * @type:              type of work to be performed
- *
- * There are separate work lists for proc, thread, and node (async).
- */
-struct binder_work {
-	struct list_head entry;
-
-	enum {
-		BINDER_WORK_TRANSACTION = 1,
-		BINDER_WORK_TRANSACTION_COMPLETE,
-		BINDER_WORK_RETURN_ERROR,
-		BINDER_WORK_NODE,
-		BINDER_WORK_DEAD_BINDER,
-		BINDER_WORK_DEAD_BINDER_AND_CLEAR,
-		BINDER_WORK_CLEAR_DEATH_NOTIFICATION,
-	} type;
-};
-
-struct binder_error {
-	struct binder_work work;
-	uint32_t cmd;
-};
-
-/**
- * struct binder_node - binder node bookkeeping
- * @debug_id:             unique ID for debugging
- *                        (invariant after initialized)
- * @lock:                 lock for node fields
- * @work:                 worklist element for node work
- *                        (protected by @proc->inner_lock)
- * @rb_node:              element for proc->nodes tree
- *                        (protected by @proc->inner_lock)
- * @dead_node:            element for binder_dead_nodes list
- *                        (protected by binder_dead_nodes_lock)
- * @proc:                 binder_proc that owns this node
- *                        (invariant after initialized)
- * @refs:                 list of references on this node
- *                        (protected by @lock)
- * @internal_strong_refs: used to take strong references when
- *                        initiating a transaction
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @local_weak_refs:      weak user refs from local process
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @local_strong_refs:    strong user refs from local process
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @tmp_refs:             temporary kernel refs
- *                        (protected by @proc->inner_lock while @proc
- *                        is valid, and by binder_dead_nodes_lock
- *                        if @proc is NULL. During inc/dec and node release
- *                        it is also protected by @lock to provide safety
- *                        as the node dies and @proc becomes NULL)
- * @ptr:                  userspace pointer for node
- *                        (invariant, no lock needed)
- * @cookie:               userspace cookie for node
- *                        (invariant, no lock needed)
- * @has_strong_ref:       userspace notified of strong ref
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @pending_strong_ref:   userspace has acked notification of strong ref
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @has_weak_ref:         userspace notified of weak ref
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @pending_weak_ref:     userspace has acked notification of weak ref
- *                        (protected by @proc->inner_lock if @proc
- *                        and by @lock)
- * @has_async_transaction: async transaction to node in progress
- *                        (protected by @lock)
- * @accept_fds:           file descriptor operations supported for node
- *                        (invariant after initialized)
- * @min_priority:         minimum scheduling priority
- *                        (invariant after initialized)
- * @txn_security_ctx:     require sender's security context
- *                        (invariant after initialized)
- * @async_todo:           list of async work items
- *                        (protected by @proc->inner_lock)
- *
- * Bookkeeping structure for binder nodes.
- */
-struct binder_node {
-	int debug_id;
-	spinlock_t lock;
-	struct binder_work work;
-	union {
-		struct rb_node rb_node;
-		struct hlist_node dead_node;
-	};
-	struct binder_proc *proc;
-	struct hlist_head refs;
-	int internal_strong_refs;
-	int local_weak_refs;
-	int local_strong_refs;
-	int tmp_refs;
-	binder_uintptr_t ptr;
-	binder_uintptr_t cookie;
-	struct {
-		/*
-		 * bitfield elements protected by
-		 * proc inner_lock
-		 */
-		u8 has_strong_ref:1;
-		u8 pending_strong_ref:1;
-		u8 has_weak_ref:1;
-		u8 pending_weak_ref:1;
-	};
-	struct {
-		/*
-		 * invariant after initialization
-		 */
-		u8 accept_fds:1;
-		u8 txn_security_ctx:1;
-		u8 min_priority;
-	};
-	bool has_async_transaction;
-	struct list_head async_todo;
-};
-
-struct binder_ref_death {
-	/**
-	 * @work: worklist element for death notifications
-	 *        (protected by inner_lock of the proc that
-	 *        this ref belongs to)
-	 */
-	struct binder_work work;
-	binder_uintptr_t cookie;
-};
-
-/**
- * struct binder_ref_data - binder_ref counts and id
- * @debug_id:        unique ID for the ref
- * @desc:            unique userspace handle for ref
- * @strong:          strong ref count (debugging only if not locked)
- * @weak:            weak ref count (debugging only if not locked)
- *
- * Structure to hold ref count and ref id information. Since
- * the actual ref can only be accessed with a lock, this structure
- * is used to return information about the ref to callers of
- * ref inc/dec functions.
- */
-struct binder_ref_data {
-	int debug_id;
-	uint32_t desc;
-	int strong;
-	int weak;
-};
-
-/**
- * struct binder_ref - struct to track references on nodes
- * @data:        binder_ref_data containing id, handle, and current refcounts
- * @rb_node_desc: node for lookup by @data.desc in proc's rb_tree
- * @rb_node_node: node for lookup by @node in proc's rb_tree
- * @node_entry:  list entry for node->refs list in target node
- *               (protected by @node->lock)
- * @proc:        binder_proc containing ref
- * @node:        binder_node of target node. When cleaning up a
- *               ref for deletion in binder_cleanup_ref, a non-NULL
- *               @node indicates the node must be freed
- * @death:       pointer to death notification (ref_death) if requested
- *               (protected by @node->lock)
- *
- * Structure to track references from procA to target node (on procB). This
- * structure is unsafe to access without holding @proc->outer_lock.
- */
-struct binder_ref {
-	/* Lookups needed: */
-	/*   node + proc => ref (transaction) */
-	/*   desc + proc => ref (transaction, inc/dec ref) */
-	/*   node => refs + procs (proc exit) */
-	struct binder_ref_data data;
-	struct rb_node rb_node_desc;
-	struct rb_node rb_node_node;
-	struct hlist_node node_entry;
-	struct binder_proc *proc;
-	struct binder_node *node;
-	struct binder_ref_death *death;
-};
-
 enum binder_deferred_state {
 	BINDER_DEFERRED_FLUSH        = 0x01,
 	BINDER_DEFERRED_RELEASE      = 0x02,
 };
 
-/**
- * struct binder_proc - binder process bookkeeping
- * @proc_node:            element for binder_procs list
- * @threads:              rbtree of binder_threads in this proc
- *                        (protected by @inner_lock)
- * @nodes:                rbtree of binder nodes associated with
- *                        this proc ordered by node->ptr
- *                        (protected by @inner_lock)
- * @refs_by_desc:         rbtree of refs ordered by ref->desc
- *                        (protected by @outer_lock)
- * @refs_by_node:         rbtree of refs ordered by ref->node
- *                        (protected by @outer_lock)
- * @waiting_threads:      threads currently waiting for proc work
- *                        (protected by @inner_lock)
- * @pid                   PID of group_leader of process
- *                        (invariant after initialized)
- * @tsk                   task_struct for group_leader of process
- *                        (invariant after initialized)
- * @deferred_work_node:   element for binder_deferred_list
- *                        (protected by binder_deferred_lock)
- * @deferred_work:        bitmap of deferred work to perform
- *                        (protected by binder_deferred_lock)
- * @is_dead:              process is dead and awaiting free
- *                        when outstanding transactions are cleaned up
- *                        (protected by @inner_lock)
- * @todo:                 list of work for this process
- *                        (protected by @inner_lock)
- * @stats:                per-process binder statistics
- *                        (atomics, no lock needed)
- * @delivered_death:      list of delivered death notification
- *                        (protected by @inner_lock)
- * @max_threads:          cap on number of binder threads
- *                        (protected by @inner_lock)
- * @requested_threads:    number of binder threads requested but not
- *                        yet started. In current implementation, can
- *                        only be 0 or 1.
- *                        (protected by @inner_lock)
- * @requested_threads_started: number binder threads started
- *                        (protected by @inner_lock)
- * @tmp_ref:              temporary reference to indicate proc is in use
- *                        (protected by @inner_lock)
- * @default_priority:     default scheduler priority
- *                        (invariant after initialized)
- * @debugfs_entry:        debugfs node
- * @alloc:                binder allocator bookkeeping
- * @context:              binder_context for this proc
- *                        (invariant after initialized)
- * @inner_lock:           can nest under outer_lock and/or node lock
- * @outer_lock:           no nesting under innor or node lock
- *                        Lock order: 1) outer, 2) node, 3) inner
- * @binderfs_entry:       process-specific binderfs log file
- *
- * Bookkeeping structure for binder processes
- */
-struct binder_proc {
-	struct hlist_node proc_node;
-	struct rb_root threads;
-	struct rb_root nodes;
-	struct rb_root refs_by_desc;
-	struct rb_root refs_by_node;
-	struct list_head waiting_threads;
-	int pid;
-	struct task_struct *tsk;
-	struct hlist_node deferred_work_node;
-	int deferred_work;
-	bool is_dead;
-
-	struct list_head todo;
-	struct binder_stats stats;
-	struct list_head delivered_death;
-	int max_threads;
-	int requested_threads;
-	int requested_threads_started;
-	int tmp_ref;
-	long default_priority;
-	struct dentry *debugfs_entry;
-	struct binder_alloc alloc;
-	struct binder_context *context;
-	spinlock_t inner_lock;
-	spinlock_t outer_lock;
-	struct dentry *binderfs_entry;
-};
-
 enum {
 	BINDER_LOOPER_STATE_REGISTERED  = 0x01,
 	BINDER_LOOPER_STATE_ENTERED     = 0x02,
@@ -495,125 +210,6 @@ enum {
 };
 
 /**
- * struct binder_thread - binder thread bookkeeping
- * @proc:                 binder process for this thread
- *                        (invariant after initialization)
- * @rb_node:              element for proc->threads rbtree
- *                        (protected by @proc->inner_lock)
- * @waiting_thread_node:  element for @proc->waiting_threads list
- *                        (protected by @proc->inner_lock)
- * @pid:                  PID for this thread
- *                        (invariant after initialization)
- * @looper:               bitmap of looping state
- *                        (only accessed by this thread)
- * @looper_needs_return:  looping thread needs to exit driver
- *                        (no lock needed)
- * @transaction_stack:    stack of in-progress transactions for this thread
- *                        (protected by @proc->inner_lock)
- * @todo:                 list of work to do for this thread
- *                        (protected by @proc->inner_lock)
- * @process_todo:         whether work in @todo should be processed
- *                        (protected by @proc->inner_lock)
- * @return_error:         transaction errors reported by this thread
- *                        (only accessed by this thread)
- * @reply_error:          transaction errors reported by target thread
- *                        (protected by @proc->inner_lock)
- * @wait:                 wait queue for thread work
- * @stats:                per-thread statistics
- *                        (atomics, no lock needed)
- * @tmp_ref:              temporary reference to indicate thread is in use
- *                        (atomic since @proc->inner_lock cannot
- *                        always be acquired)
- * @is_dead:              thread is dead and awaiting free
- *                        when outstanding transactions are cleaned up
- *                        (protected by @proc->inner_lock)
- *
- * Bookkeeping structure for binder threads.
- */
-struct binder_thread {
-	struct binder_proc *proc;
-	struct rb_node rb_node;
-	struct list_head waiting_thread_node;
-	int pid;
-	int looper;              /* only modified by this thread */
-	bool looper_need_return; /* can be written by other thread */
-	struct binder_transaction *transaction_stack;
-	struct list_head todo;
-	bool process_todo;
-	struct binder_error return_error;
-	struct binder_error reply_error;
-	wait_queue_head_t wait;
-	struct binder_stats stats;
-	atomic_t tmp_ref;
-	bool is_dead;
-};
-
-/**
- * struct binder_txn_fd_fixup - transaction fd fixup list element
- * @fixup_entry:          list entry
- * @file:                 struct file to be associated with new fd
- * @offset:               offset in buffer data to this fixup
- *
- * List element for fd fixups in a transaction. Since file
- * descriptors need to be allocated in the context of the
- * target process, we pass each fd to be processed in this
- * struct.
- */
-struct binder_txn_fd_fixup {
-	struct list_head fixup_entry;
-	struct file *file;
-	size_t offset;
-};
-
-struct binder_transaction {
-	int debug_id;
-	struct binder_work work;
-	struct binder_thread *from;
-	struct binder_transaction *from_parent;
-	struct binder_proc *to_proc;
-	struct binder_thread *to_thread;
-	struct binder_transaction *to_parent;
-	unsigned need_reply:1;
-	/* unsigned is_dead:1; */	/* not used at the moment */
-
-	struct binder_buffer *buffer;
-	unsigned int	code;
-	unsigned int	flags;
-	long	priority;
-	long	saved_priority;
-	kuid_t	sender_euid;
-	struct list_head fd_fixups;
-	binder_uintptr_t security_ctx;
-	/**
-	 * @lock:  protects @from, @to_proc, and @to_thread
-	 *
-	 * @from, @to_proc, and @to_thread can be set to NULL
-	 * during thread teardown
-	 */
-	spinlock_t lock;
-};
-
-/**
- * struct binder_object - union of flat binder object types
- * @hdr:   generic object header
- * @fbo:   binder object (nodes and refs)
- * @fdo:   file descriptor object
- * @bbo:   binder buffer pointer
- * @fdao:  file descriptor array
- *
- * Used for type-independent object copies
- */
-struct binder_object {
-	union {
-		struct binder_object_header hdr;
-		struct flat_binder_object fbo;
-		struct binder_fd_object fdo;
-		struct binder_buffer_object bbo;
-		struct binder_fd_array_object fdao;
-	};
-};
-
-/**
  * binder_proc_lock() - Acquire outer lock for given binder_proc
  * @proc:         struct binder_proc to acquire
  *
@@ -1927,6 +1523,7 @@ static void binder_free_transaction(struct binder_transaction *t)
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
 	 */
+	trace_binder_free_transaction(t);
 	binder_free_txn_fixups(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
@@ -3060,6 +2657,7 @@ static void binder_transaction(struct binder_proc *proc,
 		return_error_line = __LINE__;
 		goto err_alloc_t_failed;
 	}
+	trace_binder_update_info(t, e);
 	INIT_LIST_HEAD(&t->fd_fixups);
 	binder_stats_created(BINDER_STAT_TRANSACTION);
 	spin_lock_init(&t->lock);
@@ -3498,6 +3096,7 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	trace_binder_free_transaction(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
@@ -5547,6 +5146,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
 		   t->to_thread ? t->to_thread->pid : 0,
 		   t->code, t->flags, t->priority, t->need_reply);
 	spin_unlock(&t->lock);
+	trace_print_binder_transaction_ext(m, t);
 
 	if (proc != to_proc) {
 		/*
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index ae99109..24d7beb 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -12,6 +12,11 @@
 #include <linux/types.h>
 #include <linux/uidgid.h>
 
+#ifdef CONFIG_BINDER_USER_TRACKING
+#include <linux/rtc.h>
+#include <linux/time.h>
+#endif
+
 struct binder_context {
 	struct binder_node *binder_context_mgr_node;
 	struct mutex context_mgr_node_lock;
@@ -131,6 +136,10 @@ struct binder_transaction_log_entry {
 	uint32_t return_error;
 	uint32_t return_error_param;
 	char context_name[BINDERFS_MAX_NAME + 1];
+#ifdef CONFIG_BINDER_USER_TRACKING
+	struct timespec timestamp;
+	struct timeval tv;
+#endif
 };
 
 struct binder_transaction_log {
@@ -139,6 +148,413 @@ struct binder_transaction_log {
 	struct binder_transaction_log_entry entry[32];
 };
 
+enum binder_stat_types {
+	BINDER_STAT_PROC,
+	BINDER_STAT_THREAD,
+	BINDER_STAT_NODE,
+	BINDER_STAT_REF,
+	BINDER_STAT_DEATH,
+	BINDER_STAT_TRANSACTION,
+	BINDER_STAT_TRANSACTION_COMPLETE,
+	BINDER_STAT_COUNT
+};
+
+struct binder_stats {
+	atomic_t br[_IOC_NR(BR_FAILED_REPLY) + 1];
+	atomic_t bc[_IOC_NR(BC_REPLY_SG) + 1];
+	atomic_t obj_created[BINDER_STAT_COUNT];
+	atomic_t obj_deleted[BINDER_STAT_COUNT];
+};
+
+/**
+ * struct binder_work - work enqueued on a worklist
+ * @entry:             node enqueued on list
+ * @type:              type of work to be performed
+ *
+ * There are separate work lists for proc, thread, and node (async).
+ */
+struct binder_work {
+	struct list_head entry;
+
+	enum {
+		BINDER_WORK_TRANSACTION = 1,
+		BINDER_WORK_TRANSACTION_COMPLETE,
+		BINDER_WORK_RETURN_ERROR,
+		BINDER_WORK_NODE,
+		BINDER_WORK_DEAD_BINDER,
+		BINDER_WORK_DEAD_BINDER_AND_CLEAR,
+		BINDER_WORK_CLEAR_DEATH_NOTIFICATION,
+	} type;
+};
+
+struct binder_error {
+	struct binder_work work;
+	uint32_t cmd;
+};
+
+/* struct binder_node - binder node bookkeeping
+ * @debug_id:             unique ID for debugging
+ *                        (invariant after initialized)
+ * @lock:                 lock for node fields
+ * @work:                 worklist element for node work
+ *                        (protected by @proc->inner_lock)
+ * @rb_node:              element for proc->nodes tree
+ *                        (protected by @proc->inner_lock)
+ * @dead_node:            element for binder_dead_nodes list
+ *                        (protected by binder_dead_nodes_lock)
+ * @proc:                 binder_proc that owns this node
+ *                        (invariant after initialized)
+ * @refs:                 list of references on this node
+ *                        (protected by @lock)
+ * @internal_strong_refs: used to take strong references when
+ *                        initiating a transaction
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @local_weak_refs:      weak user refs from local process
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @local_strong_refs:    strong user refs from local process
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @tmp_refs:             temporary kernel refs
+ *                        (protected by @proc->inner_lock while @proc
+ *                        is valid, and by binder_dead_nodes_lock
+ *                        if @proc is NULL. During inc/dec and node release
+ *                        it is also protected by @lock to provide safety
+ *                        as the node dies and @proc becomes NULL)
+ * @ptr:                  userspace pointer for node
+ *                        (invariant, no lock needed)
+ * @cookie:               userspace cookie for node
+ *                        (invariant, no lock needed)
+ * @has_strong_ref:       userspace notified of strong ref
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @pending_strong_ref:   userspace has acked notification of strong ref
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @has_weak_ref:         userspace notified of weak ref
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @pending_weak_ref:     userspace has acked notification of weak ref
+ *                        (protected by @proc->inner_lock if @proc
+ *                        and by @lock)
+ * @has_async_transaction: async transaction to node in progress
+ *                        (protected by @lock)
+ * @accept_fds:           file descriptor operations supported for node
+ *                        (invariant after initialized)
+ * @min_priority:         minimum scheduling priority
+ *                        (invariant after initialized)
+ * @txn_security_ctx:     require sender's security context
+ *                        (invariant after initialized)
+ * @async_todo:           list of async work items
+ *                        (protected by @proc->inner_lock)
+ *
+ * Bookkeeping structure for binder nodes.
+ */
+struct binder_node {
+	int debug_id;
+	spinlock_t lock;
+	struct binder_work work;
+	union {
+		struct rb_node rb_node;
+		struct hlist_node dead_node;
+	};
+	struct binder_proc *proc;
+	struct hlist_head refs;
+	int internal_strong_refs;
+	int local_weak_refs;
+	int local_strong_refs;
+	int tmp_refs;
+	binder_uintptr_t ptr;
+	binder_uintptr_t cookie;
+	struct {
+		/*
+		 * bitfield elements protected by
+		 * proc inner_lock
+		 */
+		u8 has_strong_ref:1;
+		u8 pending_strong_ref:1;
+		u8 has_weak_ref:1;
+		u8 pending_weak_ref:1;
+	};
+	struct {
+		/*
+		 * invariant after initialization
+		 */
+		u8 accept_fds:1;
+		u8 txn_security_ctx:1;
+		u8 min_priority;
+	};
+	bool has_async_transaction;
+	struct list_head async_todo;
+};
+
+struct binder_ref_death {
+	/**
+	 * @work: worklist element for death notifications
+	 *        (protected by inner_lock of the proc that
+	 *        this ref belongs to)
+	 */
+	struct binder_work work;
+	binder_uintptr_t cookie;
+};
+
+/**
+ * struct binder_ref_data - binder_ref counts and id
+ * @debug_id:        unique ID for the ref
+ * @desc:            unique userspace handle for ref
+ * @strong:          strong ref count (debugging only if not locked)
+ * @weak:            weak ref count (debugging only if not locked)
+ *
+ * Structure to hold ref count and ref id information. Since
+ * the actual ref can only be accessed with a lock, this structure
+ * is used to return information about the ref to callers of
+ * ref inc/dec functions.
+ */
+struct binder_ref_data {
+	int debug_id;
+	uint32_t desc;
+	int strong;
+	int weak;
+};
+
+/**
+ * struct binder_ref - struct to track references on nodes
+ * @data:        binder_ref_data containing id, handle, and current refcounts
+ * @rb_node_desc: node for lookup by @data.desc in proc's rb_tree
+ * @rb_node_node: node for lookup by @node in proc's rb_tree
+ * @node_entry:  list entry for node->refs list in target node
+ *               (protected by @node->lock)
+ * @proc:        binder_proc containing ref
+ * @node:        binder_node of target node. When cleaning up a
+ *               ref for deletion in binder_cleanup_ref, a non-NULL
+ *               @node indicates the node must be freed
+ * @death:       pointer to death notification (ref_death) if requested
+ *               (protected by @node->lock)
+ *
+ * Structure to track references from procA to target node (on procB). This
+ * structure is unsafe to access without holding @proc->outer_lock.
+ */
+struct binder_ref {
+	/* Lookups needed: */
+	/*   node + proc => ref (transaction) */
+	/*   desc + proc => ref (transaction, inc/dec ref) */
+	/*   node => refs + procs (proc exit) */
+	struct binder_ref_data data;
+	struct rb_node rb_node_desc;
+	struct rb_node rb_node_node;
+	struct hlist_node node_entry;
+	struct binder_proc *proc;
+	struct binder_node *node;
+	struct binder_ref_death *death;
+};
+
+/**
+ * struct binder_proc - binder process bookkeeping
+ * @proc_node:            element for binder_procs list
+ * @threads:              rbtree of binder_threads in this proc
+ *                        (protected by @inner_lock)
+ * @nodes:                rbtree of binder nodes associated with
+ *                        this proc ordered by node->ptr
+ *                        (protected by @inner_lock)
+ * @refs_by_desc:         rbtree of refs ordered by ref->desc
+ *                        (protected by @outer_lock)
+ * @refs_by_node:         rbtree of refs ordered by ref->node
+ *                        (protected by @outer_lock)
+ * @waiting_threads:      threads currently waiting for proc work
+ *                        (protected by @inner_lock)
+ * @pid                   PID of group_leader of process
+ *                        (invariant after initialized)
+ * @tsk                   task_struct for group_leader of process
+ *                        (invariant after initialized)
+ * @deferred_work_node:   element for binder_deferred_list
+ *                        (protected by binder_deferred_lock)
+ * @deferred_work:        bitmap of deferred work to perform
+ *                        (protected by binder_deferred_lock)
+ * @is_dead:              process is dead and awaiting free
+ *                        when outstanding transactions are cleaned up
+ *                        (protected by @inner_lock)
+ * @todo:                 list of work for this process
+ *                        (protected by @inner_lock)
+ * @stats:                per-process binder statistics
+ *                        (atomics, no lock needed)
+ * @delivered_death:      list of delivered death notification
+ *                        (protected by @inner_lock)
+ * @max_threads:          cap on number of binder threads
+ *                        (protected by @inner_lock)
+ * @requested_threads:    number of binder threads requested but not
+ *                        yet started. In current implementation, can
+ *                        only be 0 or 1.
+ *                        (protected by @inner_lock)
+ * @requested_threads_started: number binder threads started
+ *                        (protected by @inner_lock)
+ * @tmp_ref:              temporary reference to indicate proc is in use
+ *                        (protected by @inner_lock)
+ * @default_priority:     default scheduler priority
+ *                        (invariant after initialized)
+ * @debugfs_entry:        debugfs node
+ * @alloc:                binder allocator bookkeeping
+ * @context:              binder_context for this proc
+ *                        (invariant after initialized)
+ * @inner_lock:           can nest under outer_lock and/or node lock
+ * @outer_lock:           no nesting under innor or node lock
+ *                        Lock order: 1) outer, 2) node, 3) inner
+ * @binderfs_entry:       process-specific binderfs log file
+ *
+ * Bookkeeping structure for binder processes
+ */
+struct binder_proc {
+	struct hlist_node proc_node;
+	struct rb_root threads;
+	struct rb_root nodes;
+	struct rb_root refs_by_desc;
+	struct rb_root refs_by_node;
+	struct list_head waiting_threads;
+	int pid;
+	struct task_struct *tsk;
+	struct hlist_node deferred_work_node;
+	int deferred_work;
+	bool is_dead;
+
+	struct list_head todo;
+	struct binder_stats stats;
+	struct list_head delivered_death;
+	int max_threads;
+	int requested_threads;
+	int requested_threads_started;
+	int tmp_ref;
+	long default_priority;
+	struct dentry *debugfs_entry;
+	struct binder_alloc alloc;
+	struct binder_context *context;
+	spinlock_t inner_lock;
+	spinlock_t outer_lock;
+	struct dentry *binderfs_entry;
+};
+
+/**
+ * struct binder_thread - binder thread bookkeeping
+ * @proc:                 binder process for this thread
+ *                        (invariant after initialization)
+ * @rb_node:              element for proc->threads rbtree
+ *                        (protected by @proc->inner_lock)
+ * @waiting_thread_node:  element for @proc->waiting_threads list
+ *                        (protected by @proc->inner_lock)
+ * @pid:                  PID for this thread
+ *                        (invariant after initialization)
+ * @looper:               bitmap of looping state
+ *                        (only accessed by this thread)
+ * @looper_needs_return:  looping thread needs to exit driver
+ *                        (no lock needed)
+ * @transaction_stack:    stack of in-progress transactions for this thread
+ *                        (protected by @proc->inner_lock)
+ * @todo:                 list of work to do for this thread
+ *                        (protected by @proc->inner_lock)
+ * @process_todo:         whether work in @todo should be processed
+ *                        (protected by @proc->inner_lock)
+ * @return_error:         transaction errors reported by this thread
+ *                        (only accessed by this thread)
+ * @reply_error:          transaction errors reported by target thread
+ *                        (protected by @proc->inner_lock)
+ * @wait:                 wait queue for thread work
+ * @stats:                per-thread statistics
+ *                        (atomics, no lock needed)
+ * @tmp_ref:              temporary reference to indicate thread is in use
+ *                        (atomic since @proc->inner_lock cannot
+ *                        always be acquired)
+ * @is_dead:              thread is dead and awaiting free
+ *                        when outstanding transactions are cleaned up
+ *                        (protected by @proc->inner_lock)
+ *
+ * Bookkeeping structure for binder threads.
+ */
+struct binder_thread {
+	struct binder_proc *proc;
+	struct rb_node rb_node;
+	struct list_head waiting_thread_node;
+	int pid;
+	int looper;              /* only modified by this thread */
+	bool looper_need_return; /* can be written by other thread */
+	struct binder_transaction *transaction_stack;
+	struct list_head todo;
+	bool process_todo;
+	struct binder_error return_error;
+	struct binder_error reply_error;
+	wait_queue_head_t wait;
+	struct binder_stats stats;
+	atomic_t tmp_ref;
+	bool is_dead;
+};
+
+/**
+ * struct binder_txn_fd_fixup - transaction fd fixup list element
+ * @fixup_entry:          list entry
+ * @file:                 struct file to be associated with new fd
+ * @offset:               offset in buffer data to this fixup
+ *
+ * List element for fd fixups in a transaction. Since file
+ * descriptors need to be allocated in the context of the
+ * target process, we pass each fd to be processed in this
+ * struct.
+ */
+struct binder_txn_fd_fixup {
+	struct list_head fixup_entry;
+	struct file *file;
+	size_t offset;
+};
+
+struct binder_transaction {
+	int debug_id;
+	struct binder_work work;
+	struct binder_thread *from;
+	struct binder_transaction *from_parent;
+	struct binder_proc *to_proc;
+	struct binder_thread *to_thread;
+	struct binder_transaction *to_parent;
+	unsigned need_reply:1;
+	/* unsigned is_dead:1; */       /* not used at the moment */
+
+	struct binder_buffer *buffer;
+	unsigned int    code;
+	unsigned int    flags;
+	long    priority;
+	long    saved_priority;
+	kuid_t  sender_euid;
+	struct list_head fd_fixups;
+	binder_uintptr_t security_ctx;
+	/**
+	 * @lock:  protects @from, @to_proc, and @to_thread
+	 *
+	 * @from, @to_proc, and @to_thread can be set to NULL
+	 * during thread teardown
+	 */
+	spinlock_t lock;
+#ifdef CONFIG_BINDER_USER_TRACKING
+	struct timespec timestamp;
+	struct timeval tv;
+#endif
+};
+
+/**
+ * struct binder_object - union of flat binder object types
+ * @hdr:   generic object header
+ * @fbo:   binder object (nodes and refs)
+ * @fdo:   file descriptor object
+ * @bbo:   binder buffer pointer
+ * @fdao:  file descriptor array
+ *
+ * Used for type-independent object copies
+ */
+struct binder_object {
+	union {
+		struct binder_object_header hdr;
+		struct flat_binder_object fbo;
+		struct binder_fd_object fdo;
+		struct binder_buffer_object bbo;
+		struct binder_fd_array_object fdao;
+	};
+};
+
 extern struct binder_transaction_log binder_transaction_log;
 extern struct binder_transaction_log binder_transaction_log_failed;
 #endif /* _LINUX_BINDER_INTERNAL_H */
diff --git a/drivers/android/binder_latency_tracer.c b/drivers/android/binder_latency_tracer.c
new file mode 100644
index 0000000..2fc9d4c
--- /dev/null
+++ b/drivers/android/binder_latency_tracer.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ */
+
+#include <linux/module.h>
+#include <uapi/linux/android/binder.h>
+#include "binder_alloc.h"
+#include "binder_internal.h"
+#include "binder_trace.h"
+
+/*
+ * probe_binder_free_transaction - Output info of a delay transaction
+ * @t:          pointer to the over-time transaction
+ */
+void probe_binder_free_transaction(void *ignore, struct binder_transaction *t)
+{
+	struct rtc_time tm;
+	struct timespec *startime;
+	struct timespec cur, sub_t;
+
+	ktime_get_ts(&cur);
+	startime = &t->timestamp;
+	sub_t = timespec_sub(cur, *startime);
+
+	/* if transaction time is over than 2 sec,
+	 * show timeout warning log.
+	 */
+	if (sub_t.tv_sec < 2)
+		return;
+
+	rtc_time_to_tm(t->tv.tv_sec, &tm);
+
+	spin_lock(&t->lock);
+	pr_info_ratelimited("%d: from %d:%d to %d:%d",
+			t->debug_id,
+			t->from ? t->from->proc->pid : 0,
+			t->from ? t->from->pid : 0,
+			t->to_proc ? t->to_proc->pid : 0,
+			t->to_thread ? t->to_thread->pid : 0);
+	spin_unlock(&t->lock);
+
+	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
+			(unsigned int)sub_t.tv_sec,
+			(sub_t.tv_nsec / NSEC_PER_MSEC),
+			t->code,
+			(unsigned long)startime->tv_sec,
+			(startime->tv_nsec / NSEC_PER_MSEC),
+			(tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+			tm.tm_hour, tm.tm_min, tm.tm_sec,
+			(unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
+}
+
+static void probe_binder_update_info(void *ignore, struct binder_transaction *t,
+			   struct binder_transaction_log_entry *e)
+{
+	ktime_get_ts(&e->timestamp);
+	do_gettimeofday(&e->tv);
+	e->tv.tv_sec -= (sys_tz.tz_minuteswest * 60);
+	memcpy(&t->timestamp, &e->timestamp, sizeof(struct timespec));
+	memcpy(&t->tv, &e->tv, sizeof(struct timeval));
+}
+
+static void probe_print_binder_transaction_ext(void *ignore, struct seq_file *m,
+					 struct binder_transaction *t)
+{
+	struct rtc_time tm;
+
+	rtc_time_to_tm(t->tv.tv_sec, &tm);
+	seq_printf(m,
+		   " start %lu.%06lu android %d-%02d-%02d %02d:%02d:%02d.%03lu",
+		   (unsigned long)t->timestamp.tv_sec,
+		   (t->timestamp.tv_nsec / NSEC_PER_USEC),
+		   (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+		   tm.tm_hour, tm.tm_min, tm.tm_sec,
+		   (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
+}
+
+static int __init init_binder_latency_tracer(void)
+{
+	register_trace_binder_free_transaction(
+			probe_binder_free_transaction, NULL);
+	register_trace_binder_update_info(
+			probe_binder_update_info, NULL);
+	register_trace_print_binder_transaction_ext(
+			probe_print_binder_transaction_ext, NULL);
+
+	return 0;
+}
+
+static void exit_binder_latency_tracer(void)
+{
+	unregister_trace_binder_free_transaction(
+			probe_binder_free_transaction, NULL);
+	unregister_trace_binder_update_info(
+			probe_binder_update_info, NULL);
+	unregister_trace_print_binder_transaction_ext(
+			probe_print_binder_transaction_ext, NULL);
+}
+
+module_init(init_binder_latency_tracer);
+module_exit(exit_binder_latency_tracer);
+
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 6731c3c..e0e1f9c 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -18,6 +18,7 @@
 struct binder_ref_data;
 struct binder_thread;
 struct binder_transaction;
+struct binder_transaction_log_entry;
 
 TRACE_EVENT(binder_ioctl,
 	TP_PROTO(unsigned int cmd, unsigned long arg),
@@ -95,6 +96,54 @@
 		  __entry->thread_todo)
 );
 
+DECLARE_TRACE(binder_update_info,
+	TP_PROTO(struct binder_transaction *t,
+		 struct binder_transaction_log_entry *e),
+	TP_ARGS(t, e)
+);
+
+DECLARE_TRACE(print_binder_transaction_ext,
+	TP_PROTO(struct seq_file *m,
+		 struct binder_transaction *t),
+	TP_ARGS(m, t)
+);
+
+TRACE_EVENT(binder_free_transaction,
+	TP_PROTO(struct binder_transaction *t),
+	TP_ARGS(t),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+		__field(int, from_proc)
+		__field(int, from_thread)
+		__field(int, to_proc)
+		__field(int, to_thread)
+		__field(unsigned int, code)
+		__field(unsigned int, flags)
+		__field(unsigned long, start_sec)
+		__field(unsigned long, start_nsec)
+	),
+	TP_fast_assign(
+		__entry->debug_id = t->debug_id;
+		__entry->from_proc = t->from ? t->from->proc->pid : 0;
+		__entry->from_thread = t->from ? t->from->pid : 0;
+		__entry->to_proc = t->to_proc ? t->to_proc->pid : 0;
+		__entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
+		__entry->code = t->code;
+		__entry->flags = t->flags;
+#ifdef CONFIG_BINDER_USER_TRACKING
+		__entry->start_sec = t->timestamp.tv_sec;
+		__entry->start_nsec = t->timestamp.tv_nsec / NSEC_PER_MSEC;
+#else
+		__entry->start_sec = 0;
+		__entry->start_nsec = 0;
+#endif
+	),
+	TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x start %lu.%03ld",
+		  __entry->debug_id, __entry->from_proc, __entry->from_thread,
+		  __entry->to_proc, __entry->to_thread, __entry->code,
+		  __entry->flags, __entry->start_sec, __entry->start_nsec)
+);
+
 TRACE_EVENT(binder_transaction,
 	TP_PROTO(bool reply, struct binder_transaction *t,
 		 struct binder_node *target_node),
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
