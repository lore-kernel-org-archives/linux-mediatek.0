Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BAEC8300A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FAD214D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7zpzZOq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQpj6MdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FAD214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3plOin8/Wny/YI5V79oxzHx863s8lHPS1WgX8btzUU=; b=O7zpzZOqslUnpe
	HVNEykBONIj3rg+pJZob9+2sr8CEB8PI4olosZG0d9CGp/LKaKct4J9TAIwd+xDlokvifOLVRjf0s
	wop8OHGhRpYQuXG7tCa6HcHoxS2yfyejQqUODpBk733wmS/iW3IQtRowaQLMflqjk0FJu33x34YlU
	133NmOjwi9EOOKvwagmMCkSt3Ea7D2/Rp/2SgS/ewxF//HyMHdZDwhmrUcu/IO3wD/vV+DQ0l24Jy
	ERjgEMXNfogx7NieH2b+PcC7K6EGK5+MBK/GdvIyMgGJw67w3wCmE9jHC3FGVaR+PX6IzyGxIKwv9
	x3hWJvjFqeppfpv73jfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4vA-0003Sk-Bx; Thu, 30 Apr 2020 08:51:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4uR-0002mH-RX
 for linux-mediatek@lists.infradead.org; Thu, 30 Apr 2020 08:51:09 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E54920787;
 Thu, 30 Apr 2020 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588236667;
 bh=B25IdFkSF/Xe5nfhCVFQRFDEhKUayIXoiR5sj0+5jMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQpj6MdPRT8b93Oyrn50O5QctFKfv7EG0MoIOkqp4mdOlo8hcVYXd65sWdV1zHoQt
 Os3vgxS45zA62gjVSPdyQVLKG9ePdxlAr9m9/oAGrrJKjpRWBilACWjfAhQ6z+pXO8
 4Cnih2x/4oppwN83J/SciohdcrFoxsblbuWuope8=
Date: Thu, 30 Apr 2020 10:51:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v3 1/1] binder: transaction latency tracking for user build
Message-ID: <20200430085105.GF2496467@kroah.com>
References: <1586929044-12708-2-git-send-email-Frankie.Chang@mediatek.com>
 <1588234439-7959-1-git-send-email-Frankie.Chang@mediatek.com>
 <1588234439-7959-2-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588234439-7959-2-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_015107_933763_DD980962 
X-CRM114-Status: GOOD (  14.24  )
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

Also, this should be split up into a patch series, the first moving
things around, and the rest of the patches each adding a single feature.
As it is, this patch is almost impossible to review.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
