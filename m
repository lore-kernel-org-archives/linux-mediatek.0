Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D24C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 11:45:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534A52075D
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 11:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIMdLP4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 534A52075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KMen8YgK6a4aB1nKcr2eaWjPtKutXq51/wRQnh5p6jk=; b=dIMdLP4b2u/Df0jSmyDXSxIyA
	J4hLHe6gKI1nUKKJyWgKBpGC+r/8FB/BcOl1UINMoJYrsDtZjiEnvCA7+MCWroyE0s4n2IDiUqyLi
	52qkvv7IE28VVdiD+ElGv50gEFj13iNcz58FCrZL10YolonB4v2WT8UzAdasUK7zYaI9JwX4PKE54
	hun1JlKuOerYigsvcnWYQSy5pBr/M1yMZX77OOyDQmlyO2jUdlVT9/WqJckpWTR5zzpRkWQDHymRn
	mDsLC587U+VWkqXDQz99QVrnHEttfN5U5YRdyoa0ZmgH7VDTTJ4GcWeo6Y5FpOdpwshll+zn6n7nr
	Bn/Tz1LSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5SiJ-0008OD-Bl; Tue, 11 Aug 2020 11:45:07 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5SiH-0008NL-7v
 for linux-mediatek@lists.infradead.org; Tue, 11 Aug 2020 11:45:06 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-255-VCkWQE-EOdO3IYWYtzwiVA-1; Tue, 11 Aug 2020 12:44:59 +0100
X-MC-Unique: VCkWQE-EOdO3IYWYtzwiVA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 11 Aug 2020 12:44:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 11 Aug 2020 12:44:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Miles Chen <miles.chen@mediatek.com>
Subject: RE: [PATCH] net: untag pointer in sockptr_is_kernel
Thread-Topic: [PATCH] net: untag pointer in sockptr_is_kernel
Thread-Index: AQHWb9DKxxLX2AshVECOBLD3J//Za6kyxXFQ
Date: Tue, 11 Aug 2020 11:44:59 +0000
Message-ID: <36e381c558e24185bc2f7e80a758d06a@AcuMS.aculab.com>
References: <20200811102704.17875-1-miles.chen@mediatek.com>
 <20200811111551.GA3958@lst.de>
In-Reply-To: <20200811111551.GA3958@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_074505_506702_597813FC 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> On Tue, Aug 11, 2020 at 06:27:04PM +0800, Miles Chen wrote:
> > From: Miles Chen <miles.chen@mediatek.com>
> >
> > sockptr_is_kernel() uses (sockptr.kernel >= TASK_SIZE) to tell
> > if the pointer is kernel space or user space. When user space uses
> > the "top byte ignored" feature such as HWAsan, we must untag
> > the pointer before checking against TASK_SIZE.
> >
> > sockptr_is_kernel() will view a tagged user pointer as a kernel pointer
> > and use memcpy directly and causes a kernel crash.
> 
> Dave merged a patch from me to rever the optimized sockptr
> implementation for now.  If we bring it back we should fold in your
> fix.

I missed that going though :-(
I've looked for a fix to the access_ok(kernel_addr,0) being true issue.

Shouldn't TASK_SIZE be increased to cover all the 'tagged' addresses?
ISTR the 'tag' bits are the 'next' 8 (or so) address bits at the top
of valid user addresses.

Then presumably the user-copies would be able to use the tagged
address values getting whatever protection that gives.

ISTM that for kernel-user boundary checks TASK_SIZE is the
wrong constant.
(The upper limit for mmap() is entirely different.)
The limit should be independent of whether the process is 32 or 64bit
(any fault above 4G will fail to find a user-page for 32bit).
The limit can also go well into the address 'black hole' that
exists on x86-x64 (and similar) between valid user and kernel
addresses - handling the relevant trap should be too hard
(it is always an error, so need not be fast).

So with set_fs(KERNEL_DS) gone x86-x64 can (almost certainly)
do a cheap test for (long)addr >= 0 in access_ok() (+ length test).
While set_fs() is needed it can be:
	((long)addr & current->mask) >= 0
(masking off the top bit if kernel addresses are valid).

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
