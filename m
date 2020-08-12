Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FEAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:16:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631682083B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kobz/G1w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vj+AkpnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631682083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qxCwC0zRsatQeYHJ3OJOQEvPbSdYE+EePDFMgq32D0k=; b=Kobz/G1woj6h8nfnfnBfrF+HP
	vBBzoMGd8kioTx+X5ANgMu2aVilmho7FG/cnUuNO2pPQZgy0vQ3hbX4yrQrA4ErUSCd2bvt6iRGHp
	wU2BT6TxKhUiQCGsqvvk/DJg9pm0+4LwQhuPECYuc5VfSc8fceyWuKiLPBIOut1DWNo9FGHVhyqzp
	idOEs44tek+Ci+kkgcw9kqVZEN4kqSBhY/1cx6+l1EBHSSbcPd1B/soZ3pMU2PRCTp9I2yTqK5hdE
	OGqicAJEQj32DeKtDnTWcU2pu06O5BKQSiCXPCLpiFarE5EK/GF79PlE1tmsbQLd6v9H8Y68hq+PJ
	CUehLgTBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5mrY-0002A3-Jy; Wed, 12 Aug 2020 09:16:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5mrV-00029A-L2
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 09:15:58 +0000
X-UUID: 9cb04f45c6364dce8538c03bd0233cd4-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=L+KavRCBQgfTOdvCNrk/qG3OTZZfc+8SqW2qQrGwgrg=; 
 b=Vj+AkpnAXOI1M+CWJylimnh93Y4Vm8nVxIP0fxqcFdS+WRAhyE4QV2F+d0OPbx7QwygFiDwdP/Os0gevGB5k2qMoO8/Czh1elgXK6Vs61ja3IOYKj0WLHX9KlpNjgMElx3kzWWYBDJNlQynRDrng7kgqWj/b62KWweJ86RHLbLI=;
X-UUID: 9cb04f45c6364dce8538c03bd0233cd4-20200812
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 549336272; Wed, 12 Aug 2020 01:15:49 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 02:15:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 17:15:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 17:15:30 +0800
Message-ID: <1597223732.5467.10.camel@mtkswgap22>
Subject: RE: [PATCH] net: untag pointer in sockptr_is_kernel
From: Miles Chen <miles.chen@mediatek.com>
To: David Laight <David.Laight@ACULAB.COM>
Date: Wed, 12 Aug 2020 17:15:32 +0800
In-Reply-To: <36e381c558e24185bc2f7e80a758d06a@AcuMS.aculab.com>
References: <20200811102704.17875-1-miles.chen@mediatek.com>
 <20200811111551.GA3958@lst.de>
 <36e381c558e24185bc2f7e80a758d06a@AcuMS.aculab.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C830A68D723F95F6BDDC1C13338A4B11FEEE2C54A7FF5C5D7AFEA180AA80EE62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_051557_823476_06745238 
X-CRM114-Status: GOOD (  26.53  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 'Christoph Hellwig' <hch@lst.de>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-08-11 at 11:44 +0000, David Laight wrote:
> > On Tue, Aug 11, 2020 at 06:27:04PM +0800, Miles Chen wrote:
> > > From: Miles Chen <miles.chen@mediatek.com>
> > >
> > > sockptr_is_kernel() uses (sockptr.kernel >= TASK_SIZE) to tell
> > > if the pointer is kernel space or user space. When user space uses
> > > the "top byte ignored" feature such as HWAsan, we must untag
> > > the pointer before checking against TASK_SIZE.
> > >
> > > sockptr_is_kernel() will view a tagged user pointer as a kernel pointer
> > > and use memcpy directly and causes a kernel crash.
> > 
> > Dave merged a patch from me to rever the optimized sockptr
> > implementation for now.  If we bring it back we should fold in your
> > fix.
> 
> I missed that going though :-(
> I've looked for a fix to the access_ok(kernel_addr,0) being true issue.
> 
> Shouldn't TASK_SIZE be increased to cover all the 'tagged' addresses?
> ISTR the 'tag' bits are the 'next' 8 (or so) address bits at the top
> of valid user addresses.


I'm not sure if this is a good idea. TASK_SIZE is an arch dependent
constant, if we increase TASK_SIZE to cover the 'tagged' address space,
the TASK_SIZE will not tell us the actual virtual address size.

Maybe we need a macro to tell if a pointer is in user space or not and
handle the memory tag there.
But this only works for the "is this pointer in user space" problem. 


I reported another tagged pointer issue [1].

Miles

[1] https://lore.kernel.org/patchwork/patch/1283649/



> Then presumably the user-copies would be able to use the tagged
> address values getting whatever protection that gives.
> 
> ISTM that for kernel-user boundary checks TASK_SIZE is the
> wrong constant.
> (The upper limit for mmap() is entirely different.)
> The limit should be independent of whether the process is 32 or 64bit
> (any fault above 4G will fail to find a user-page for 32bit).
> The limit can also go well into the address 'black hole' that
> exists on x86-x64 (and similar) between valid user and kernel
> addresses - handling the relevant trap should be too hard
> (it is always an error, so need not be fast).
> 
> So with set_fs(KERNEL_DS) gone x86-x64 can (almost certainly)
> do a cheap test for (long)addr >= 0 in access_ok() (+ length test).
> While set_fs() is needed it can be:
> 	((long)addr & current->mask) >= 0
> (masking off the top bit if kernel addresses are valid).
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
