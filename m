Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD5C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 03:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ugj/NETJNRbOxZrdSjQLTYLzePKnL6scHDuyLXG1qY=; b=pIwF++P4fotP33lQ8z9qqSd8aY
	PQNUuVE4o70S3Og2rUPKuALEN3fdytrCHpbO3LuiPAYnQxW3Cs2yvIqjooxjco4VVcLmDXtsOSAE2
	au4RNkAVtRRHPKOT+N0EDf0V95l2RJGv/N8wEfyJpSv3Fgl+4C7glgIOJLUVTB9PP2Yo3gAN06DEl
	XFaWrJXULHeK5fqSwAE3+Ckl43evaopmz454hhDT6j0GqYh8YFLfDGY+Wu4ppXk/heTqym0puBPv3
	nPYRyn5MscoQpulMU2zp4fJB8n0fXrWYQ8lujJlXJvKaAkVtP7/Uuok9xUmg9mvkjsbcr5PpWn8HL
	wVxiA98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NST-0000000BKTa-1zYf;
	Thu, 02 May 2024 03:50:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NSP-0000000BKSK-2cLv;
	Thu, 02 May 2024 03:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02BB1619E1;
	Thu,  2 May 2024 03:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CB8C116B1;
	Thu,  2 May 2024 03:49:59 +0000 (UTC)
Date: Wed, 1 May 2024 23:50:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan Wu (=?UTF-8?B?5ZCz5r6k5Y2X?=)" <Tze-nan.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Cheng-Jui Wang (=?UTF-8?B?546L5q2j552/?=)" <Cheng-Jui.Wang@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, "Bobule Chang (=?UTF-8?B?5by1?=
 =?UTF-8?B?5byY576p?=)" <bobule.chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Message-ID: <20240501235044.12fa3297@gandalf.local.home>
In-Reply-To: <661f101456506db945ccbd94700a0f47b95f91e5.camel@mediatek.com>
References: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
	<20240428202837.0cabca17@rorschach.local.home>
	<20240429144626.7d868ad3@gandalf.local.home>
	<661f101456506db945ccbd94700a0f47b95f91e5.camel@mediatek.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_205005_797095_CB0734F9 
X-CRM114-Status: GOOD (  30.83  )
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

On Thu, 2 May 2024 03:10:24 +0000
Tze-nan Wu (=E5=90=B3=E6=BE=A4=E5=8D=97) <Tze-nan.Wu@mediatek.com> wrote:

> >  =20
> Sorry for my late reply, I'm testing the patch on my machine now.=20
> Test will be done in four hours.
>=20
> There's something I'm worrying about in the patch,
> what I'm worrying about is commented in the code below.
>=20
> /kernel/trace/trace_events.c:
>   static int
>   event_create_dir(struct eventfs_inode *parent,=20
>   struct trace_event_file *file)=20
>   {
>         ...
>         ...
>         ...
>         nr_entries =3D ARRAY_SIZE(event_entries);
>=20
>         name =3D trace_event_name(call);
>=20
>         +event_file_get(file);        // Line A
>             ^^^^^^^^^^^^^
>         // Should we move the "event_file_get" to here, instead =20
>         // of calling it at line C?
>         // Due to Line B could eventually invoke "event_file_put".
>         //   eventfs_create_dir -> free_ei ->put_ei -> kref_put=20
>         //  -> release_ei -> event_release -> event_file_put
>         // Not sure if this is a potential risk? If Line B do call  =20
>         // event_file_put,"event_file_put" will be called prior to
>         // "event_file_get", could corrupt the reference of the file.

No, but you do bring up a good point. The release should not be called on
error, but it looks like it possibly can be.

>=20
>         ei =3D eventfs_create_dir(name, e_events,    // Line B=20
>              event_entries, nr_entries, file);
>         if (IS_ERR(ei)) {
>                 pr_warn("Could not create tracefs '%s' directory\n",=20
>                 name);
>                 return -1;
>         }
>         file->ei =3D ei;
>=20
>         ret =3D event_define_fields(call);
>         if (ret < 0) {
>                 pr_warn("Could not initialize trace point events/%s\n",
> name);
>                 return ret;
>                    ^^^^^^^^^         =20
>        // Maybe we chould have similar concern if we return here.
>        // Due to the event_inode had been created, but we did not call=20
>        // event_file_get.=20
>        // Could it lead to some issues in the future while freeing=20
>        // event_indoe?
>         }
>=20
>=20
>         -event_file_get(file);       //Line C
>         return 0;
>   }

This prevents the release() function from being called on failure of
creating the ei.

Can you try this patch instead?

-- Steve

diff --git a/fs/tracefs/event_inode.c b/fs/tracefs/event_inode.c
index 894c6ca1e500..f5510e26f0f6 100644
--- a/fs/tracefs/event_inode.c
+++ b/fs/tracefs/event_inode.c
@@ -84,10 +84,17 @@ enum {
 static void release_ei(struct kref *ref)
 {
 	struct eventfs_inode *ei =3D container_of(ref, struct eventfs_inode, kref=
);
+	const struct eventfs_entry *entry;
 	struct eventfs_root_inode *rei;
=20
 	WARN_ON_ONCE(!ei->is_freed);
=20
+	for (int i =3D 0; i < ei->nr_entries; i++) {
+		entry =3D &ei->entries[i];
+		if (entry->release)
+			entry->release(entry->name, ei->data);
+	}
+
 	kfree(ei->entry_attrs);
 	kfree_const(ei->name);
 	if (ei->is_events) {
@@ -112,6 +119,18 @@ static inline void free_ei(struct eventfs_inode *ei)
 	}
 }
=20
+/*
+ * Called when creation of an ei fails, do not call release() functions.
+ */
+static inline void cleanup_ei(struct eventfs_inode *ei)
+{
+	if (ei) {
+		/* Set nr_entries to 0 to prevent release() function being called */
+		ei->nr_entries =3D 0;
+		free_ei(ei);
+	}
+}
+
 static inline struct eventfs_inode *get_ei(struct eventfs_inode *ei)
 {
 	if (ei)
@@ -734,7 +753,7 @@ struct eventfs_inode *eventfs_create_dir(const char *na=
me, struct eventfs_inode
=20
 	/* Was the parent freed? */
 	if (list_empty(&ei->list)) {
-		free_ei(ei);
+		cleanup_ei(ei);
 		ei =3D NULL;
 	}
 	return ei;
@@ -835,7 +854,7 @@ struct eventfs_inode *eventfs_create_events_dir(const c=
har *name, struct dentry
 	return ei;
=20
  fail:
-	free_ei(ei);
+	cleanup_ei(ei);
 	tracefs_failed_creating(dentry);
 	return ERR_PTR(-ENOMEM);
 }
diff --git a/include/linux/tracefs.h b/include/linux/tracefs.h
index 7a5fe17b6bf9..d03f74658716 100644
--- a/include/linux/tracefs.h
+++ b/include/linux/tracefs.h
@@ -62,6 +62,8 @@ struct eventfs_file;
 typedef int (*eventfs_callback)(const char *name, umode_t *mode, void **da=
ta,
 				const struct file_operations **fops);
=20
+typedef void (*eventfs_release)(const char *name, void *data);
+
 /**
  * struct eventfs_entry - dynamically created eventfs file call back handl=
er
  * @name:	Then name of the dynamic file in an eventfs directory
@@ -72,6 +74,7 @@ typedef int (*eventfs_callback)(const char *name, umode_t=
 *mode, void **data,
 struct eventfs_entry {
 	const char			*name;
 	eventfs_callback		callback;
+	eventfs_release			release;
 };
=20
 struct eventfs_inode;
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 52f75c36bbca..6ef29eba90ce 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2552,6 +2552,14 @@ static int event_callback(const char *name, umode_t =
*mode, void **data,
 	return 0;
 }
=20
+/* The file is incremented on creation and freeing the enable file decreme=
nts it */
+static void event_release(const char *name, void *data)
+{
+	struct trace_event_file *file =3D data;
+
+	event_file_put(file);
+}
+
 static int
 event_create_dir(struct eventfs_inode *parent, struct trace_event_file *fi=
le)
 {
@@ -2566,6 +2574,7 @@ event_create_dir(struct eventfs_inode *parent, struct=
 trace_event_file *file)
 		{
 			.name		=3D "enable",
 			.callback	=3D event_callback,
+			.release	=3D event_release,
 		},
 		{
 			.name		=3D "filter",
@@ -2634,6 +2643,9 @@ event_create_dir(struct eventfs_inode *parent, struct=
 trace_event_file *file)
 		return ret;
 	}
=20
+	/* Gets decremented on freeing of the "enable" file */
+	event_file_get(file);
+
 	return 0;
 }
=20

