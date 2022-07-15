Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTn5wj8nMwJwbas90BAyA4NNBlY+0jSpOvxI+S9FzCI=; b=ztxfvOUUfKstVG971usDyo5LCV
	efATw298dcQG6UPYDUTTdrI9LTgQTE9GI0J7IPtXYcJZZl5/OPI5l/mObzArmMHTkUj5Aa12sgIn6
	jIj2m4I9O23KdlF5ul7D7TyUoMi20j4e/j+1I27m+RV6WRUNGBC0tt7QU04x2t3+DNm90Amu1mpKi
	0Dw1wV9NaV/J5UlLBzZ1hYDcZiYF0qw4a1lGnEhjqPpVBIiT+ilLVYAR4xqtRmTBThB4mo3w3MZsL
	mTImCeXZ/TN2L8jFJczAdGYE2Ko7qwBljknw4pMRhnqDIt0ld2BRQFdn+7O+l1cnLZqvIiUa4C/O/
	ITJkyWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMR9-007hbY-QG; Fri, 15 Jul 2022 14:36:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMQy-007hWD-TY; Fri, 15 Jul 2022 14:36:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BFDB61DA7;
	Fri, 15 Jul 2022 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3862C34115;
	Fri, 15 Jul 2022 14:36:46 +0000 (UTC)
Date: Fri, 15 Jul 2022 10:36:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
Message-ID: <20220715103645.484f08e9@gandalf.local.home>
In-Reply-To: <962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
References: <20220714164256.403842845@goodmis.org>
	<20220714164330.311734558@goodmis.org>
	<962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_073649_019395_4C69B99F 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 15 Jul 2022 18:01:44 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> the second and third lines with this patch:
>  irq/254-1120100-137     [000] d..1.   266.629399: mtu3_log:
> 11201000.usb: link speed super-speed
> 
>  irq/254-1120100-137     [000] d..1.   266.629662: mtu3_log:
> 11201000.usb: ep0_state SETUPr-speed
> 
> "r-speed" seems the remain of last log;

Thanks for testing! I'll investigate. (Another reason I didn't push to
linux-next yet).

-- Steve

