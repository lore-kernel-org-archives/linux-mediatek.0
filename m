Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DF7C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k2WOaSt5rNiqEUmMnRw4bBaUeSfCj6BPdwWhpUGWHNw=; b=M0ie8ImEoQbMtnPnE4C4HrMnnh
	BVJIw/xrUWRnn5d2WESi4Lx2Hx9dOMHuMXSCihEIY9x7JB5tbkD6Fza17svydmdCUezPEjUIORhCO
	6del/ew5IDxFoPqGBY+QTswB+Em85RZ3HH+/Z1VHQIInenHY/sqcoEO+tXKAbxcoeAWib2cMcewqt
	TLTCWg5woxhvplFJks81vPkWn3H4SiTWHlxF9tlmHVSBxtWBeUj2NHjI5j/05jTuzM+lUGnOrcoLK
	bk0Gss4nuvxIWR42a6s5Ia8y3iDkqekXlE3dBnRfViTuprmFjRcVM9ZWWsVxP0MuxlyHCsIs6R+uc
	UC+qBjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp8L-00A2pt-QR; Tue, 19 Jul 2022 15:27:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp89-00A2iS-43; Tue, 19 Jul 2022 15:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C70C561946;
	Tue, 19 Jul 2022 15:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B4AC341C6;
	Tue, 19 Jul 2022 15:27:20 +0000 (UTC)
Date: Tue, 19 Jul 2022 11:27:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Ingo Molnar
 <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH v2] USB: mtu3: tracing: Use the new __vstring() helper
Message-ID: <20220719112719.17e796c6@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_082725_234459_D5C8DA68 
X-CRM114-Status: GOOD (  14.52  )
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Instead of open coding a __dynamic_array() with a fixed length (which
defeats the purpose of the dynamic array in the first place). Use the new
__vstring() helper that will use a va_list and only write enough of the
string into the ring buffer that is needed.

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
Changes since v1: https://lkml.kernel.org/r/20220705224750.354926535@goodmis.org

 - Removed MTU3_MSG_MAX define. (Chunfeng Yun)

 drivers/usb/mtu3/mtu3_trace.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 1b897636daf2..a98fa012b729 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -18,18 +18,16 @@
 
 #include "mtu3.h"
 
-#define MTU3_MSG_MAX	256
-
 TRACE_EVENT(mtu3_log,
 	TP_PROTO(struct device *dev, struct va_format *vaf),
 	TP_ARGS(dev, vaf),
 	TP_STRUCT__entry(
 		__string(name, dev_name(dev))
-		__dynamic_array(char, msg, MTU3_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__assign_str(name, dev_name(dev));
-		vsnprintf(__get_str(msg), MTU3_MSG_MAX, vaf->fmt, *vaf->va);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk("%s: %s", __get_str(name), __get_str(msg))
 );
-- 
2.35.1


