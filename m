Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3A5C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E12C206B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 07:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlLPCZ7K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="heU+0xPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E12C206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3WkHh+hqxC/lrcqUHcGqBE0DOX2E+8hBNFhxc5HPHy8=; b=AlLPCZ7KC760XjKsRFp5B4fJ9
	jtutL6TK5TbJmXdsTLJex6S7UT8gZ4WEuFihfkJX4qfNgLJKSgqhNH17Tx3dSc1ikH2oxTNXAB7Rz
	Ko6SFWlsM+1nGB3HjVX7YURsgIaxnMht61qirxpuRP/oXnAC3aF3PLrKsH6Pmh14wM1zD1VLbnei8
	LJvL4RDpIqeNOw6Y1xx6a/9KkbU7Yxpq55OK3Ab0kebexfykxMiCNifpRYxius3CnyUtSn0dmsJlG
	pMYfY4YUyHyTbpXrtJi2jjAquxLvL2TQVKa89HclF8nqytOpIzyzrlvW138c5V3lownXkv25dCSTU
	Dhhd35L2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFB8l-0008SL-IW; Mon, 07 Sep 2020 07:00:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFB8j-0008Rw-60
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 07:00:34 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1933206D4;
 Mon,  7 Sep 2020 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599462031;
 bh=jtl3ocdz4s7eCeaWwzmlgjsKUt1fZOXz5Rqn8hjmcMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=heU+0xPXwFMEP2dwdlDaqtYnliLSx1XhyOmFFboJ8ulYl86YNJ9ulUD6BKZb4X1Sd
 QNHhsxAyHAOMZp6rpQ0as8zPvN7fmdr0BEN3onb0RkDK+DxvEF56St9AhxkBZ5Ow/X
 EpMXnshKTzrkKvEsTE312pA0tffqyEtwiEB9Vbjs=
Date: Mon, 7 Sep 2020 09:00:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v7] binder: transaction latency tracking for user build
Message-ID: <20200907070045.GA605692@kroah.com>
References: <1596509145.5207.21.camel@mtkswgap22>
 <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
 <20200903162105.GA371057@kroah.com>
 <1599461369.16905.19.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599461369.16905.19.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_030033_789031_962A03AC 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 02:49:29PM +0800, Frankie Chang wrote:
> On Thu, 2020-09-03 at 18:21 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 04, 2020 at 09:59:09PM +0800, Frankie Chang wrote:
> > > 
> > > Frankie.Chang (3):
> > >   binder: move structs from core file to header file
> > >   binder: add trace at free transaction.
> > >   binder: add transaction latency tracer
> > > 
> > >  drivers/android/Kconfig                 |    8 +
> > >  drivers/android/Makefile                |    1 +
> > >  drivers/android/binder.c                |  425 ++-----------------------------
> > >  drivers/android/binder_internal.h       |  417 ++++++++++++++++++++++++++++++
> > >  drivers/android/binder_latency_tracer.c |  112 ++++++++
> > >  drivers/android/binder_trace.h          |   49 ++++
> > >  6 files changed, 607 insertions(+), 405 deletions(-)  create mode 100644 drivers/android/binder_latency_tracer.c
> > 
> > This series blows up the build into lots of tiny pieces, how was it
> > tested?
> > 
> 
> I am sorry that I had built pass.on the too older kernel, and some of
> api had been deprecated.
> I have fixed these errors in local, and I add the
> EXPORT_TRACEPOINT_SYMBOL for binder_latency_tracer to be ko needed.
> 
> Do I need to push a patch V8 or I provide the fixed code here ?

I need a whole new patch series, I dropped yours when it would not
compile properly.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
