Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC1C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 21:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yStnF453+CWIEKN3ZB+E8YDNFufoGX/iH3AgvcxmH4U=; b=wpQVXR8p39jOibwwzBM6aNY0eq
	ePwwUUZuXaQcAFVdeOkEbScSNxjtjVPx6zrfNO+pbmUyz0LwK6ofFJRPMucgPw/Mq2tTwaYUaYrJG
	BfzjTd3OJQPJxoQo/9xmKZ0NmRvMSvqz0tCXXLWO1ZdxZ1AnVznBH9lpyve6I2yePQAnb3QSlAmJE
	HbqgmN6/yZBQAcpSqDoGTcRI4BVux9cP7w1nP2p91bvCKKmsuyRcoPQBr1f3sx/A/MQgUdXCzJPAR
	yK3M/ZCdcqkk77BxpRxC/vzbu1rPi03AdyH9LmYcGmVluadpZ7Pyd91X7HWBNjiXUzjfyR8c8+cos
	9snZfhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSnd-00AQVg-Ua; Fri, 15 Jul 2022 21:24:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSnT-00AQTK-8n; Fri, 15 Jul 2022 21:24:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EAE96174A;
	Fri, 15 Jul 2022 21:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE25C34115;
	Fri, 15 Jul 2022 21:24:25 +0000 (UTC)
Date: Fri, 15 Jul 2022 17:24:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
Message-ID: <20220715172423.6b57b9eb@gandalf.local.home>
In-Reply-To: <962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
References: <20220714164256.403842845@goodmis.org>
	<20220714164330.311734558@goodmis.org>
	<962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_142427_377242_AEFF80C8 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, 15 Jul 2022 18:01:44 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

>  irq/254-1120100-137     [000] d..1.   266.629662: mtu3_log:
> 11201000.usb: ep0_state SETUPr-speed
> 
> "r-speed" seems the remain of last log;

I found an off-by-one bug in the vstring patch. I'll rebase, test and try
again.

In the mean time, care to add this on top to make sure it's fixed?

Thanks!

-- Steve

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index e6f8ba52a958..b18759a673c6 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -922,16 +922,16 @@ perf_trace_buf_submit(void *raw_data, int size, int rctx, u16 type,
  * gcc warns that you can not use a va_list in an inlined
  * function. But lets me make it into a macro :-/
  */
-#define __trace_event_vstr_len(fmt, va)		\
-({						\
-	va_list __ap;				\
-	int __ret;				\
-						\
-	va_copy(__ap, *(va));			\
-	__ret = vsnprintf(NULL, 0, fmt, __ap);	\
-	va_end(__ap);				\
-						\
-	min(__ret, TRACE_EVENT_STR_MAX);	\
+#define __trace_event_vstr_len(fmt, va)			\
+({							\
+	va_list __ap;					\
+	int __ret;					\
+							\
+	va_copy(__ap, *(va));				\
+	__ret = vsnprintf(NULL, 0, fmt, __ap) + 1;	\
+	va_end(__ap);					\
+							\
+	min(__ret, TRACE_EVENT_STR_MAX);		\
 })
 
 #endif /* _LINUX_TRACE_EVENT_H */

