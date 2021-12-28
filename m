Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58173C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=svisfSMqAaIk5slKdhMxhRS0XA7xT1USru/uwzNx9Uw=; b=Oljs2ASxCpvXeM
	bZrPuES9x6eRxETuq8uw7GupAHskjmPkzjWyg6mpJxE06uW4agGichziK/l1hfzEVV6Rw96+l7lOu
	JkjUEdLtlFoTHgMNuHYivQDe+yQOu+zN1zo8zrYMreR6lliSLUwD5yR0HC1IJ0afAh3QxbfLSqLVE
	MjAok2d38Fe3hG9+Fe28dP1fDlOmrYjZKKdADjtmyAGTxQkxOwYQVgVcYuUvJn5SuilY6DyIJlQmk
	O2JoXjELotdx+X8KKIKAagSxF4VBdIPbsuWG+ZUhEYFhwpLR9uuNrliI53zXCZILAEbAjaqouun5/
	P1n2iar49JKOUKC10t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n25Am-000DlF-Vl; Tue, 28 Dec 2021 05:37:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n25Aj-000Dke-HJ; Tue, 28 Dec 2021 05:37:18 +0000
X-UUID: c596207739b24debb9cfbb088a7233fc-20211227
X-UUID: c596207739b24debb9cfbb088a7233fc-20211227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <calvin.liao@gmail.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 250311761; Mon, 27 Dec 2021 22:37:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 21:34:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Dec 2021 13:34:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Dec 2021 13:34:36 +0800
From: Calvin Liao <calvin.liao@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "Eric W . Biederman"
 <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Christian Brauner
 <christian.brauner@ubuntu.com>, Jens Axboe <axboe@kernel.dk>, Alexey Gladkov
 <legion@kernel.org>, Mike Christie <michael.christie@oracle.com>, "David
 Hildenbrand" <david@redhat.com>, Rolf Eike Beer <eb@emlix.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, calvin.liao <calvin.liao@mediatek.com>
Subject: [PATCH 1/1] seccomp: release seccomp after killing terminate
 clone/fork
Date: Tue, 28 Dec 2021 13:34:21 +0800
Message-ID: <20211228053421.26825-1-calvin.liao@gmail.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_213717_610087_B4ED5F54 
X-CRM114-Status: UNSURE (   8.49  )
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

From: "calvin.liao" <calvin.liao@mediatek.com>

Add to release seccomp after killing terminate clone/fork to avoid
memory leak when enabling CONFIG_SECCOMP.

Signed-off-by: calvin.liao <calvin.liao@mediatek.com>
---
 kernel/fork.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 403b9dbbfb62..984103967a97 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1698,6 +1698,13 @@ static void copy_seccomp(struct task_struct *p)
 #endif
 }
 
+static void release_seccomp(struct task_struct *p)
+{
+#ifdef CONFIG_SECCOMP
+	seccomp_filter_release(p);
+#endif
+}
+
 SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
 {
 	current->clear_child_tid = tidptr;
@@ -2405,6 +2412,7 @@ static __latent_entropy struct task_struct *copy_process(
 	return p;
 
 bad_fork_cancel_cgroup:
+	release_seccomp(p);
 	sched_core_free(p);
 	spin_unlock(&current->sighand->siglock);
 	write_unlock_irq(&tasklist_lock);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
