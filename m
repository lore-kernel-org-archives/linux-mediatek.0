Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C64C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkP0JFe88jY/eLpAiMVd6rSp8BvUGMEXl678bLjYbZA=; b=Xlh6CeiTpmIwHG/ioMPNkHuDWQ
	j0sFTrLLG2ofosXPttyqYt5j6t+ldkVirfWJ3TMZaFg19spE21HnplxoOZM2NtafkA8N8NVhF3O/U
	PfrxaXQzCOhN6fCklAyJFfK4RwDoflgWFuDpdCn3XRJlHXuEE5vvr1xE8VgUG7nQsE30YbovYuYJ/
	rJzzqvuJYfpnDhD4/OnQwBXTTu8nPckWp/oeuMmFZOrg/u1tbMu1dqZhJwf9rHnSP6+YfWUyVUPAq
	6ubdMRYQfp8jUOwFfnP0ww0xi0GeZP/HDWbhDg1Bw7yDU2683t2MyicSVrBkB/fmHu3c5w9T2iTub
	zkwjgDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp5x-00A105-NV; Tue, 19 Jul 2022 15:25:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDp5i-00A0qH-Ac; Tue, 19 Jul 2022 15:24:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C97FDB81C00;
	Tue, 19 Jul 2022 15:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C198C341C6;
	Tue, 19 Jul 2022 15:24:49 +0000 (UTC)
Date: Tue, 19 Jul 2022 11:24:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
Message-ID: <20220719112448.4e9915e0@gandalf.local.home>
In-Reply-To: <2893728a294ef13bdeba9e587083b82fb794cc68.camel@mediatek.com>
References: <20220714164256.403842845@goodmis.org>
	<20220714164330.311734558@goodmis.org>
	<1267b234b09280b9b475cfe2bb32580e967e2dac.camel@mediatek.com>
	<20220715173944.386743d8@gandalf.local.home>
	<2893728a294ef13bdeba9e587083b82fb794cc68.camel@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_082454_581456_0629EEA4 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, 19 Jul 2022 13:23:06 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> > Care to send me a patch, and I'll just include it in my series?  
> Seems no need add another patch, just modify this patch as below:
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h
> b/drivers/usb/mtu3/mtu3_trace.h
> index a09deae1146f..03d2a9bac27e 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -18,18 +18,16 @@
> 
>  #include "mtu3.h"
> 
> -#define MTU3_MSG_MAX   256
> -
>  TRACE_EVENT(mtu3_log,
>         TP_PROTO(struct device *dev, struct va_format *vaf),
>         TP_ARGS(dev, vaf),
>         TP_STRUCT__entry(
>                 __string(name, dev_name(dev))
> -               __dynamic_array(char, msg, MTU3_MSG_MAX)
> +               __vstring(msg, vaf->fmt, vaf->va)
>         ),
>         TP_fast_assign(
>                 __assign_str(name, dev_name(dev));
> -               vsnprintf(__get_str(msg), MTU3_MSG_MAX, vaf->fmt, *vaf-
> >va);  
> +               __assign_vstr(msg, vaf->fmt, vaf->va);
>         ),
>         TP_printk("%s: %s", __get_str(name), __get_str(msg))
>  );
> >   
> 
> remove below two lines
> "
> -#define MTU3_MSG_MAX   256
> -

Fine.

Even though I already pushed to linux-next, I did something I seldom do. I
rebased my for-next branch and removed this patch.

I'll send a v2.

-- Steve

