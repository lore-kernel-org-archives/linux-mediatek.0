Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91974C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 06:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6506920767
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 06:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tN+rXlw+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jki6o9F6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6506920767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTIjFmwnQjDIghDgO2leLRTHxqe+LJk1/0Ij8BpHyPk=; b=tN+rXlw++qow71
	l0BDb4ztH6suI7IYdTt2dzVfeA4iVRHMk5zP7RIO7t2HQgdiHOGWMW4L3eopRPAzv1HjWXeIV0/Wt
	onMpHsrLs7S22wpr060iYt6L6LA44aneMvPUyJ3k+Jm0O5xJVSoe+jQ1hmnNpiJuQPrfzyn/iabYu
	1pZbG47qXuLElYbzBrCUQmSGj94nsNqJ20e0h3wL7jXCo7DshWklDel7eSJsRyentHInbermWArf6
	5OfnSMguSfGAggz7Yb/f+9eN92LTcmjHT7wH3TPc5c5DDBdxGB0rIsBwgteTwA8R7usPIbvoKLXJR
	/GwEi//xrWBgeNtCpw/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRrwJ-0005JL-OS; Fri, 24 Apr 2020 06:35:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRrw9-0005AF-9m; Fri, 24 Apr 2020 06:35:47 +0000
X-UUID: f1dab4cffa6d4e969ed54308efff02cc-20200423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=gUH3k9xdy2IwCn6QUAzl7AD8mJmLALhoEKFKTESkF1s=; 
 b=jki6o9F6WW1XujiN/G4WEpbPvfu8BrkV3rEMEY47hvBAMRH8nnu+6A2rqsWwhCJOgXMoXBd6IkEEhhop3QWFegVmC8Krqg8mLEBg4SQGZucJQALgku9Mw7El+oVuyiztqz0VBUuigyEXC3Z9ueB030obO5DTYClS6mg2/iK3Gn8=;
X-UUID: f1dab4cffa6d4e969ed54308efff02cc-20200423
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunlei.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 976859729; Thu, 23 Apr 2020 22:35:34 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Apr 2020 23:25:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 14:25:29 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Apr 2020 14:25:27 +0800
Message-ID: <1587709294.9792.5.camel@mbjsdccf07>
Subject: [PATCH] printk: Add printk log prefix information.
From: chunlei.wang <Chunlei.wang@mediatek.com>
To: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 24 Apr 2020 14:21:34 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4701CD02712B8E95F383685B50F21C734F359AC30BDF287C31E6FEEDDABB905B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_233545_347898_4631FFF7 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Add prefix status/cpu_id/pid/process_name to each kernel log.
example:
[ 8408.806432] (4)[19963:kworker/4:1]wifi_fw: ring_emi_seg.sz=4164,
ring_cache_pt=000000004f5ca8fa, ring_cache_seg.sz=4164
[ 8408.806729]-(4)[19963:kworker/4:1]connlog_log_data_handler: 1
callbacks suppressed
Status now only include irq status. If in ISR print too much log, will
cause performance issue, we can check the log to find which module. We
also can expand the status in future.
cpu_id mean which cpu print this log, we can check specific cpu's
action.
pocess_name show the log process id and name.
These information is very useful in embedded system, it can provide more
information to analyze issue.

Feature: printk
Signed-off-by: Chunlei Wang <chunlei.wang@mediatek.com>
---
 kernel/printk/printk.c | 52 ++++++++++++++++++++++++++++++++++++++++--
 lib/Kconfig.debug      |  9 ++++++++
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1ef6f75d92f1..9cb2a4c2157b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -60,6 +60,11 @@
 #include "braille.h"
 #include "internal.h"
 
+
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+static DEFINE_PER_CPU(char, printk_state);
+#endif
+
 int console_printk[4] = {
        CONSOLE_LOGLEVEL_DEFAULT,       /* console_loglevel */
        MESSAGE_LOGLEVEL_DEFAULT,       /* default_message_loglevel */
@@ -610,8 +615,35 @@ static int log_store(u32 caller_id, int facility,
int level,
        u32 size, pad_len;
        u16 trunc_msg_len = 0;
 
-       /* number of '\0' padding bytes to next message */
-       size = msg_used_size(text_len, dict_len, &pad_len);
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+       int this_cpu = smp_processor_id();
+       char state = this_cpu_read(printk_state);
+       char tbuf[50];
+       unsigned int tlen = 0;
+#endif
+
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+               if (state == 0) {
+                       this_cpu_write(printk_state, ' ');
+                       state = ' ';
+               }
+               if (!(flags & LOG_CONT)) {
+                       if (console_suspended == 0)
+                               tlen = snprintf(tbuf, sizeof(tbuf),
+                                       "%c(%x)[%d:%s]", state,
this_cpu,
+                                       current->pid, current->comm);
+                       else
+                               tlen = snprintf(tbuf, sizeof(tbuf), "%
c(%x)",
+                                       state, this_cpu);
+               }
+#endif
+
+               /* number of '\0' padding bytes to next message */
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+               size = msg_used_size(text_len + tlen, dict_len,
&pad_len);
+#else
+               size = msg_used_size(text_len, dict_len, &pad_len);
+#endif
 
        if (log_make_free_space(size)) {
                /* truncate the message if it is too long for empty
buffer */
@@ -634,7 +666,16 @@ static int log_store(u32 caller_id, int facility,
int level,
 
        /* fill message */
        msg = (struct printk_log *)(log_buf + log_next_idx);
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+       memcpy(log_text(msg), tbuf, tlen);
+       if (tlen + text_len > LOG_LINE_MAX)
+               text_len = LOG_LINE_MAX - tlen;
+
+       memcpy(log_text(msg) + tlen, text, text_len);
+       text_len += tlen;
+#else
        memcpy(log_text(msg), text, text_len);
+#endif
        msg->text_len = text_len;
        if (trunc_msg_len) {
                memcpy(log_text(msg) + text_len, trunc_msg,
trunc_msg_len);
@@ -1964,6 +2005,13 @@ asmlinkage int vprintk_emit(int facility, int
level,
        if (unlikely(suppress_printk))
                return 0;
 
+#ifdef CONFIG_PRINTK_PREFIX_ENHANCE
+       if (irqs_disabled())
+               this_cpu_write(printk_state, '-');
+       else
+               this_cpu_write(printk_state, ' ');
+#endif
+
        if (level == LOGLEVEL_SCHED) {
                level = LOGLEVEL_DEFAULT;
                in_sched = true;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d1842fe756d5..6e6c783cd570 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -35,6 +35,15 @@ config PRINTK_CALLER
          no option to enable/disable at the kernel command line
parameter or
          sysfs interface.
 
+config PRINTK_PREFIX_ENHANCE
+       bool "Prefix cpu_id/status/pid/process_name to each kernel log"
+       depends on PRINTK
+       help
+         PRINTK_PREFIX_ENHANCE which is used to control whether to show
+         other information about this log. The information include
+         which cpu about this process in, whether in isr, pid and
thread
+         name. These information can help to analyze issue.
+
 config CONSOLE_LOGLEVEL_DEFAULT
        int "Default console loglevel (1-15)"
        range 1 15
-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
