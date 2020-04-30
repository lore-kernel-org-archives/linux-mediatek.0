Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63480C8300C
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B0F20838
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="htUbSySP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaqhsY86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B0F20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJvME1zWITiaqggkzCdx0uIl4PRUI42Xl1fEBps3I18=; b=htUbSySPwCqacJ
	My3k9RWU0d61veUgc3Z4qpJTnNEk1ZvddQc1aLg0GKPrZMu+ufo3yh6PNVtAw+cn4fXkB37GJyhXw
	omeAhWO2QHxeywwQimlSXAwLZt+gYnThyJibkZJQPzn4yQHt5e9QN6Eco4HyVHPJFOx5dwg31UyX+
	ppXWWmjClL0ETG9r8/Dp7oORxcwrJURmbRav550tMKXXpwBIngoZFP7oYkdNF+YaWHaZLqMvJPPvd
	6l6czWUvD4YnBoRVTiKXsvULvBFqm6NOOhKsTDdi84Spar0k8o83mJjy29ZfbO+WhYliVzoGsp4fN
	GfBsHp6KHFUla/G9Ozlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4v6-0003Od-It; Thu, 30 Apr 2020 08:51:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4tZ-00017E-SK
 for linux-mediatek@lists.infradead.org; Thu, 30 Apr 2020 08:50:15 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9D6E20787;
 Thu, 30 Apr 2020 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588236612;
 bh=ghrQEmeIlI+g1P6iSZ6DPBPbRnUsSttZWP+GFYy29mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaqhsY86LNEksszvxHtMCCMJEREzCEgFGgqb0u5DpNO5Dv36tLHp1jXriMGXRhM6g
 0IQfo4XYD7e8ikcmo5LrxJpxAG57PPiEbMIZrBHCTsBbTMMLAlK3QtxxjXDdsIS1PV
 0We4M0prTxcdZvZteHR81YOQBz0OW3xRfgcS5GXM=
Date: Thu, 30 Apr 2020 10:50:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v3 1/1] binder: transaction latency tracking for user build
Message-ID: <20200430085010.GE2496467@kroah.com>
References: <1586929044-12708-2-git-send-email-Frankie.Chang@mediatek.com>
 <1588234439-7959-1-git-send-email-Frankie.Chang@mediatek.com>
 <1588234439-7959-2-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588234439-7959-2-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_015014_282968_86871712 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: Todd Kjos <tkjos@android.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 04:13:59PM +0800, Frankie Chang wrote:
> Record start/end timestamp for binder transaction.
> When transaction is completed or transaction is free,
> it would be checked if transaction latency over threshold (2 sec),
> if yes, printing related information for tracing.
> 
> /* Implement details */
> - Add tracepoint/trace at free transaction.
>   Since the original trace_binder_transaction_received cannot
>   precisely present the real finished time of transaction, adding a
>   trace_binder_free_transaction at the point of free transaction
>   may be more close to it.
> 
> - Add latency tracer module to monitor slow transaction.
>   The trace_binder_free_transaction would not be enabled
>   by default. Monitoring which transaction is too slow to
>   cause some of exceptions is important. So we hook the
>   tracepoint to call the monitor function.
> 
> - Move some struct from core file to header file.
>   Need some struct defined in core file in latency trace module
>   In addition, moving all structs to header file makes module
>   more extendable, and make all these strcuts to be defined
>   in the same file.
> 
> Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> ---
>  drivers/android/Kconfig                 |    8 +
>  drivers/android/Makefile                |    1 +
>  drivers/android/binder.c                |  408 +-----------------------------
>  drivers/android/binder_internal.h       |  416 +++++++++++++++++++++++++++++++
>  drivers/android/binder_latency_tracer.c |  105 ++++++++
>  drivers/android/binder_trace.h          |   49 ++++
>  6 files changed, 583 insertions(+), 404 deletions(-)
>  create mode 100644 drivers/android/binder_latency_tracer.c

What changed from previous versions?  That always needs to go below the
--- line, as is documented in the kernel documentation.

Please fix that up and resend a v4.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
