Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7BFC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 13:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E0422B4D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 13:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLT1fqlZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i7Mf4L2g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E0422B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZz2aZM2V04EaNjFRNpeLlBPu/r3hlAo/S49wTrwEBU=; b=PLT1fqlZ3VXHBJqYb6pjKYDPT
	wWZNtdr0PnsUxU28GLby2p+lenQO30zEb9BKFjFr/5YwD17SAx/bld97bJW5Co5YQ4gAzxYKhdDGr
	0pDn9irRP5oLxqBsCcTd8+cIAXPy9SaflmmGMz9tuKJdfFUQu3dwR41ejtoG14fvKpAJ+xuYixsLb
	Gdkn5O0Hrs+AXvBeizSO0O0lKLLmhUlyuwDaNsXUvMfeDtOaLtmQZQ3vDwPZnbbVdc1185eW3FoNX
	H1DRphPkOEBor1Z5cFutYEQnKllL1nb5Z/0lTxr+TUGbKsQOcSRmj1JaZH+oEsvpEkeGTPUeGwASg
	+tUUCTfMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxWAf-00061j-8U; Mon, 20 Jul 2020 13:49:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxWAc-00061B-Oi
 for linux-mediatek@lists.infradead.org; Mon, 20 Jul 2020 13:49:31 +0000
X-UUID: e1ec000104e74358ac170b8cf6cddac7-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yjrsMDbea0ajD15SAf9EUujh8AYZA8JCoirJ5p5xHCA=; 
 b=i7Mf4L2gZG92BzRUmc7p6ux/bmAuNWA3rJIpiJY0In3ntaNiRJA3wshccrHysRXE9YMGzsLaSGZYtlsA2AlMjUdvU449YSrHerKLF2cC1WGMiqKSD7ba7Vo8NDEgzOTbv0/r7U5ABpXGTLmi5NV+OeDrMihBDwFIYDrmBnZlTy8=;
X-UUID: e1ec000104e74358ac170b8cf6cddac7-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 253774187; Mon, 20 Jul 2020 05:49:20 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 06:40:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 21:40:28 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 21:40:28 +0800
Message-ID: <1595252430.5899.6.camel@mtkswgap22>
Subject: Re: [PATCH v5] binder: transaction latency tracking for user build
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ". Todd Kjos"
 <tkjos@google.com>
Date: Mon, 20 Jul 2020 21:40:30 +0800
In-Reply-To: <1593696357.5899.3.camel@mtkswgap22>
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
 <1593696357.5899.3.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_094931_013571_DDA0C11A 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Greg, Todd and all

Gentle ping for this patch set

Thanks

On Thu, 2020-07-02 at 21:25 +0800, Frankie Chang wrote:
> Hi Greg, Todd and all
> 
> Gentle remind of this patch set
> 
> Thanks.
> Frankie
> 
> On Wed, 2020-06-10 at 20:23 +0800, Frankie Chang wrote:
> > Frankie.Chang (3):
> >   binder: move structs from core file to header file
> >   binder: add trace at free transaction.
> >   binder: add transaction latency tracer
> > 
> >  drivers/android/Kconfig                 |   8 +
> >  drivers/android/Makefile                |   1 +
> >  drivers/android/binder.c                | 408 +----------------------
> >  drivers/android/binder_internal.h       | 416 ++++++++++++++++++++++++
> >  drivers/android/binder_latency_tracer.c | 108 ++++++
> >  drivers/android/binder_trace.h          |  49 +++
> >  6 files changed, 586 insertions(+), 404 deletions(-)  create mode 100644 drivers/android/binder_latency_tracer.c
> > 
> > Change from v5:
> >   - change config name to the proper one, CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING.
> >   - change tracepoint name to more descriptive one, trace_binder_txn_latency_(alloc|info|free)
> >   - enhance some lock protection.
> > 
> > Change from v4:
> >   - split up into patch series.
> > 
> > Change from v3:
> >   - use tracepoints for binder_update_info and print_binder_transaction_ext,
> >     instead of custom registration functions.
> > 
> > Change from v2:
> >   - create transaction latency module to monitor slow transaction.
> > 
> > Change from v1:
> >   - first patchset.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
