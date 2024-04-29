Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5B3C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 18:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmjpVcBqOrF9YJQJFFl10tyjDmuKjh6f/Fzr45EJAEQ=; b=rsF44wKZVptYc3DxprsZxnVJ/V
	3MHsdzWwLfWlNNLVzDK2j787VBbhyvgxv97GLiirxog+vxYAToyjei/X8J4R+G9t1zMOD0y9Nk5+5
	prFwgA/nZpJnUJIvbIzyglMaNOEhI4ceKOFYJ1Y45OYdxjg/Rkjh27OthN1+dDPD2VENPTHSiTHTf
	VtqpvPucs2aVGdD2Q1YHiP8yEtV6C3FSbuLgV1lFzRt1qer9l/Qk/xNWlKBkY+Nbhww1X9Ss/KX06
	K8ZozC55cINXGqTcmzsNavNjitkosL28jLjasoomIemLOsNwLRVfLjdR7zIwPxWqsgjFa1y5iSaPA
	xvfRC7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1W0f-00000003uIT-1NDy;
	Mon, 29 Apr 2024 18:45:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1W0b-00000003uHW-3Kh7;
	Mon, 29 Apr 2024 18:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E371B61009;
	Mon, 29 Apr 2024 18:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A1FC113CD;
	Mon, 29 Apr 2024 18:45:47 +0000 (UTC)
Date: Mon, 29 Apr 2024 14:46:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan wu <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Message-ID: <20240429144626.7d868ad3@gandalf.local.home>
In-Reply-To: <20240428202837.0cabca17@rorschach.local.home>
References: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
	<20240428202837.0cabca17@rorschach.local.home>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_114549_978909_E721E0C3 
X-CRM114-Status: GOOD (  23.27  )
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

On Sun, 28 Apr 2024 20:28:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > Looking for any suggestion or solution, appreciate.  
> 
> Yeah, I do not think eventfs should be involved in this. It needs to be
> protected at a higher level (in the synthetic/dynamic event code).
> 
> I'm just coming back from Japan, and I'll need to take a deeper look at
> this after I recover from my jetlag.

OK, so I guess the eventfs nodes need an optional release callback. Here's
the right way to do that. I added a "release" function to the passed in
entry array that allows for calling a release function when the
eventfs_inode is freed. Then in code for creating events, I call
event_file_get() on the file being assigned and have the freeing of the
"enable" file have the release function that will call event_file_put() on
that file structure.

Does this fix it for you?

-- Steve

diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 894c6ca1e500..dc97c19f9e0a 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -84,10 +84,17 @@ enum {
 static void release_ei(struct kref *ref)
 {
 	struct eventfs_inode *ei = container_of(ref, struct eventfs_inode, kref);
+	const struct eventfs_entry *entry;
 	struct eventfs_root_inode *rei;
 
 	WARN_ON_ONCE(!ei->is_freed);
 
+	for (int i = 0; i < ei->nr_entries; i++) {
+		entry = &ei->entries[i];
+		if (entry->release)
+			entry->release(entry->name, ei->data);
+	}
+
 	kfree(ei->entry_attrs);
 	kfree_const(ei->name);
 	if (ei->is_events) {
diff --git a/include/linux/tracefs.h b/include/linux/tracefs.h
index 7a5fe17b6bf9..d03f74658716 100644
--- a/include/linux/tracefs.h
+++ b/include/linux/tracefs.h
@@ -62,6 +62,8 @@ struct eventfs_file;
 typedef int (*eventfs_callback)(const char *name, umode_t *mode, void **data,
 				const struct file_operations **fops);
 
+typedef void (*eventfs_release)(const char *name, void *data);
+
 /**
  * struct eventfs_entry - dynamically created eventfs file call back handler
  * @name:	Then name of the dynamic file in an eventfs directory
@@ -72,6 +74,7 @@ typedef int (*eventfs_callback)(const char *name, umode_t *mode, void **data,
 struct eventfs_entry {
 	const char			*name;
 	eventfs_callback		callback;
+	eventfs_release			release;
 };
 
 struct eventfs_inode;
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 52f75c36bbca..d14c84281f2b 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2552,6 +2552,14 @@ static int event_callback(const char *name, umode_t *mode, void **data,
 	return 0;
 }
 
+/* The file is incremented on creation and freeing the enable file decrements it */
+static void event_release(const char *name, void *data)
+{
+	struct trace_event_file *file = data;
+
+	event_file_put(file);
+}
+
 static int
 event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 {
@@ -2566,6 +2574,7 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 		{
 			.name		= "enable",
 			.callback	= event_callback,
+			.release	= event_release,
 		},
 		{
 			.name		= "filter",
@@ -2634,6 +2643,9 @@ event_create_dir(struct eventfs_inode *parent, struct trace_event_file *file)
 		return ret;
 	}
 
+	/* Gets decremented on freeing of the "enable" file */
+	event_file_get(file);
+
 	return 0;
 }
 

