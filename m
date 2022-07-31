Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B0C00140
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jul 2022 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=4FhSlQ9FfMpGJ7dO6xOT+Rn97esvk0TEw13bTMkN0mo=; b=WGl3t0VBDt5U99
	h9YyA08tfdu0bBhCgIZ5RbYnCg7R+O75hWy7wM1EFqqqXm2Y6nRqgj+JDfEve/Ll0Fok0VNcJ4DmJ
	7gCRDpTaqeZayhvddkc53D533wCbXhdlJE5VcKgI5kXwUdm4NpPwUH66UDdgibSEh9jLYzG3yZu9F
	rQuTAO7c3EpRtgmFrWJ8nX4kA2Z2DAaQvGpVsKDN3bOIm7NiAjev1zpnIqkBeeTI6ndj/cTy4fAI2
	NqIX0Q8l5xAEipW9kBRTrXnxAxRtEz7D3Cpek2uE6meb+aoAI1QeDNurkYIWpR1lLLwy5VzFcxo3+
	TxLLXNRdWlDlEyj6YR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIEFL-00FEXW-AR; Sun, 31 Jul 2022 19:05:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIEEw-00FEDi-3V; Sun, 31 Jul 2022 19:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4459AB80DC8;
	Sun, 31 Jul 2022 19:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F59BC433D7;
	Sun, 31 Jul 2022 19:04:33 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1oIEEq-007G2B-0I;
	Sun, 31 Jul 2022 15:04:32 -0400
Message-ID: <20220731190431.934571546@goodmis.org>
User-Agent: quilt/0.66
Date: Sun, 31 Jul 2022 15:03:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [for-next][PATCH 01/21] USB: mtu3: tracing: Use the new __vstring() helper
References: <20220731190329.641602282@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_120438_338028_7194A0B2 
X-CRM114-Status: GOOD (  13.54  )
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

Link: https://lkml.kernel.org/r/20220719112719.17e796c6@gandalf.local.home

Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
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

