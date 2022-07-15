Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01095C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00GkD97srSJ90mIUZ5uc3QblzSF5dgEQEcOpo0lt6zg=; b=iX/sRJBl+jmA9VEZi3qhGj3ZUi
	LRu3Zt8r7pGr2AxN0FTtYThD+5RoulNToVyOr2mNZlH47pVbmg3hp6cA9j6aSdUSeATSoqBvmV78s
	KUpvazLOR6cTUvPzPC0r3JB71NQyWM2DJT2zrQpvWJYvhIzOwq6WpM2PwpLLfmKXxfP4H/lkwPOj5
	XqRXsFZ8Ge5WRruOWkEXndyKLGJC9giLrSodrraJfos1ubzzzDHxSWa4QAS9PGU9MKIWAsgk2VuLG
	YIIG/5MD60gW2GwaARp1JqkHC/1aU2QsKAqeDANtFm1Novagm8Qf5K3ZOVzDGquAPk5Zblg3wzcGL
	Si2A5TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCT2U-00AUmX-P6; Fri, 15 Jul 2022 21:39:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCT2K-00AUiy-7u; Fri, 15 Jul 2022 21:39:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77F4861926;
	Fri, 15 Jul 2022 21:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2089C34115;
	Fri, 15 Jul 2022 21:39:45 +0000 (UTC)
Date: Fri, 15 Jul 2022 17:39:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
Message-ID: <20220715173944.386743d8@gandalf.local.home>
In-Reply-To: <1267b234b09280b9b475cfe2bb32580e967e2dac.camel@mediatek.com>
References: <20220714164256.403842845@goodmis.org>
	<20220714164330.311734558@goodmis.org>
	<1267b234b09280b9b475cfe2bb32580e967e2dac.camel@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_143948_350761_2CFDD4A4 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, 15 Jul 2022 14:32:05 +0800
Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Can you help to remove macro "MTU3_MSG_MAX" and one blank line after it
> in this file, this macro is not used anymore after apply this patch.

Care to send me a patch, and I'll just include it in my series?

-- Steve

