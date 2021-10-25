Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0632C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 05:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C43061002
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 05:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C43061002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRvpD3a+h5CV4aJXCIv6iu78QC0EuxXWbwZiivc8fcE=; b=qyWPLgi8y58A7z
	u4eeJ29xk1Q1vajGG+aAGqP4qYHuNp9x1PK8KOd/BX/rv9oSaUz1P2QdzFrAeguo9sU9dugmrVs4D
	+IiywbM+z5WVtXvDRnT5zGk5TztzamH25AxYwP3fjc0rqMgDEyfrIx7dRiLKtbrOlh0JOGdCR7VLt
	XmqnwWBZ96Icjgm/XOO2LaJtofJCQYuLoGS6yYtwCL94Hz/wgNcfIcpZ+I5P75r5SCFc4lTkByl+x
	jvEMevotUHygcTZoOSEVtUM4vj0aoJBgRtdMK9lwKGldXSbABwTe9tsm+9jyI3ReMT14XV6aVCOG3
	HzX2CrJzrjNeNSGouE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mesx6-00FLKJ-NK; Mon, 25 Oct 2021 05:55:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meswu-00FLIk-De; Mon, 25 Oct 2021 05:55:10 +0000
X-UUID: abc9aea0b81c4e938e36a6b7cf4b55a3-20211024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hgypc63DFGmLTnW1m2n7ieTqZKlTu26l24zVzBqPp1s=; 
 b=pkwU5D34jhofGhg3U6AzYRDhrTyXBrE7AaZ5NJmrUp03iJQ5kQlPdU09xojWSHqXK6w8nkbfuY+epbHnW0R7kwueHWy6OMYlZjrx+zk2bsWK7fEqiHtHB72Kf96Jrk+Kd5ARHTuIDWCi2ohkMdKoXcttVjhQopoazxc61r3pqhk=;
X-UUID: abc9aea0b81c4e938e36a6b7cf4b55a3-20211024
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunlei.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1013400149; Sun, 24 Oct 2021 22:55:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Oct 2021 22:55:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 13:54:59 +0800
Received: from mbjsdccf07 (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 13:54:56 +0800
Message-ID: <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
Subject: [PATCH] Fix prb_next_seq() performance issue
From: chunlei.wang <Chunlei.wang@mediatek.com>
To: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>
CC: Steven Rostedt <rostedt@goodmis.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, John Ogness
 <john.ogness@linutronix.de>, <wsd_upstream@medaitek.com>, Chunlei Wang
 <chunlei.wang@mediatek.com>
Date: Mon, 25 Oct 2021 13:51:07 +0800
In-Reply-To: <20200424070219.GA543@jagdpanzerIV.localdomain>
References: <1587709294.9792.5.camel@mbjsdccf07>
 <20200424070219.GA543@jagdpanzerIV.localdomain>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_225508_499270_D07BB265 
X-CRM114-Status: GOOD (  18.98  )
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


Subject: [PATCH] Fix prb_next_seq() performance issue.

prb_next_seq() function have a performance issue, in bad case it will
check all the seqs. If log buffer is 256K, the number of while loop
is 8K, 512K is 16K, 2M is 64K, it will cause performance issue.
we have a process use do_syslog poll&read method to read kernel log,
sometime the cpu loading is 50%. So we add old_seq to reduce the
loop time. It only check new log times.

Signed-off-by: Chunlei Wang <chunlei.wang@mediatek.com>
---
 kernel/printk/printk.c            | 12 ++++++------
 kernel/printk/printk_ringbuffer.c |  4 ++--
 kernel/printk/printk_ringbuffer.h |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a8d0a58deebc..9c6d4d617a95 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -801,7 +801,7 @@ static loff_t devkmsg_llseek(struct file *file,
loff_t offset, int whence)
                break;
        case SEEK_END:
                /* after the last record */
-               atomic64_set(&user->seq, prb_next_seq(prb));
+               atomic64_set(&user->seq, prb_next_seq(prb,
latched_seq_read_nolock(&clear_seq)));
                break;
        default:
                ret = -EINVAL;
@@ -1155,9 +1155,9 @@ void __init setup_log_buf(int early)
                        free -= text_size;
        }

-       if (seq != prb_next_seq(&printk_rb_static)) {
+       if (seq != prb_next_seq(&printk_rb_static, seq)) {
                pr_err("dropped %llu messages\n",
-                      prb_next_seq(&printk_rb_static) - seq);
+                      prb_next_seq(&printk_rb_static, seq) - seq);
        }

        pr_info("log_buf_len: %u bytes\n", log_buf_len);
@@ -1625,7 +1625,7 @@ static int syslog_print_all(char __user *buf, int
size, bool clear)
 static void syslog_clear(void)
 {
        mutex_lock(&syslog_lock);
-       latched_seq_write(&clear_seq, prb_next_seq(prb));
+       latched_seq_write(&clear_seq, prb_next_seq(prb, 0));
        mutex_unlock(&syslog_lock);
 }

@@ -1714,7 +1714,7 @@ int do_syslog(int type, char __user *buf, int
len, int source)
                         * for pending data, not the size; return the
count of
                         * records, not the length.
                         */
-                       error = prb_next_seq(prb) - syslog_seq;
+                       error = prb_next_seq(prb, syslog_seq) -
syslog_seq;
                } else {
                        bool time = syslog_partial ? syslog_time :
printk_time;
                        unsigned int line_count;
@@ -3573,7 +3573,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
 void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
        iter->cur_seq = latched_seq_read_nolock(&clear_seq);
-       iter->next_seq = prb_next_seq(prb);
+       iter->next_seq = prb_next_seq(prb, iter->cur_seq);
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_rewind);

diff --git a/kernel/printk/printk_ringbuffer.c
b/kernel/printk/printk_ringbuffer.c
index 8a7b7362c0dd..a910b79d9341 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -2003,9 +2003,9 @@ u64 prb_first_valid_seq(struct printk_ringbuffer
*rb)
  * Return: The sequence number of the next newest (not yet available)
record
  *         for readers.
  */
-u64 prb_next_seq(struct printk_ringbuffer *rb)
+u64 prb_next_seq(struct printk_ringbuffer *rb, u64 old_seq)
 {
-       u64 seq = 0;
+       u64 seq = old_seq;

        /* Search forward from the oldest descriptor. */
        while (_prb_read_valid(rb, &seq, NULL, NULL))
diff --git a/kernel/printk/printk_ringbuffer.h
b/kernel/printk/printk_ringbuffer.h
index 73cc80e01cef..0729b21a9d34 100644
--- a/kernel/printk/printk_ringbuffer.h
+++ b/kernel/printk/printk_ringbuffer.h
@@ -377,6 +377,6 @@ bool prb_read_valid_info(struct printk_ringbuffer
*rb, u64 seq,
                         struct printk_info *info, unsigned int
*line_count);

 u64 prb_first_valid_seq(struct printk_ringbuffer *rb);
-u64 prb_next_seq(struct printk_ringbuffer *rb);
+u64 prb_next_seq(struct printk_ringbuffer *rb, u64 seq);

 #endif /* _KERNEL_PRINTK_RINGBUFFER_H */
--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
