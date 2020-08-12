Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977C7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659A7206DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y0qtbre8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659A7206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C1WE1KshNIqJZer/eaCFkos7orTVnTDDNoIKQ8cBaQM=; b=y0qtbre8X9Ihq8UFn58/O+wb7
	P2redpiAZ4zjN9EzL0uwQAcGO3EbsjSHFN9k/NvypmL3a21WdyX3r2JcZyvCqQ5d8r9GD+CY3pfPn
	LhjkkjAqetJBJjzz9EPPjEbqhWP37WXCyPQCM0oa1orF+9hgJXjh6NudngPIKIJSHGpZqPA0/ab64
	BGecZJgOcUkrkdNqlAf1jbF4vUIN0DMUch6MWonqFEx1yM8Z7fr26Bv5hmyUzpchnSaQlFCjUJ2Hz
	4ANVmK8VZTyq/0DHRmEhiH14yYnpLrJkoODw80n0mmgv+Yebu/LoyZkGmffBHFfw7iIvIssErW+cG
	Wm4AnoT/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5nNP-000162-FO; Wed, 12 Aug 2020 09:48:55 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5nNM-00012b-QH
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 09:48:53 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-88-BXravPHFN-CLpwv5q6iGKw-1; Wed, 12 Aug 2020 10:48:48 +0100
X-MC-Unique: BXravPHFN-CLpwv5q6iGKw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 12 Aug 2020 10:48:48 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 12 Aug 2020 10:48:48 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Miles Chen' <miles.chen@mediatek.com>
Subject: RE: [PATCH] net: untag pointer in sockptr_is_kernel
Thread-Topic: [PATCH] net: untag pointer in sockptr_is_kernel
Thread-Index: AQHWb9DKxxLX2AshVECOBLD3J//Za6kyxXFQgAFcawCAABZWMA==
Date: Wed, 12 Aug 2020 09:48:48 +0000
Message-ID: <df130026160145f1abc1cbd63f11e8d3@AcuMS.aculab.com>
References: <20200811102704.17875-1-miles.chen@mediatek.com>
 <20200811111551.GA3958@lst.de>
 <36e381c558e24185bc2f7e80a758d06a@AcuMS.aculab.com>
 <1597223732.5467.10.camel@mtkswgap22>
In-Reply-To: <1597223732.5467.10.camel@mtkswgap22>
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
X-CRM114-CacheID: sfid-20200812_054853_035858_AAD64DB0 
X-CRM114-Status: GOOD (  23.45  )
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

From: Miles Chen <miles.chen@mediatek.com>
> Sent: 12 August 2020 10:16
> 
> On Tue, 2020-08-11 at 11:44 +0000, David Laight wrote:
> > > On Tue, Aug 11, 2020 at 06:27:04PM +0800, Miles Chen wrote:
> > > > From: Miles Chen <miles.chen@mediatek.com>
> > > >
> > > > sockptr_is_kernel() uses (sockptr.kernel >= TASK_SIZE) to tell
> > > > if the pointer is kernel space or user space. When user space uses
> > > > the "top byte ignored" feature such as HWAsan, we must untag
> > > > the pointer before checking against TASK_SIZE.
> > > >
> > > > sockptr_is_kernel() will view a tagged user pointer as a kernel pointer
> > > > and use memcpy directly and causes a kernel crash.
> > >
> > > Dave merged a patch from me to rever the optimized sockptr
> > > implementation for now.  If we bring it back we should fold in your
> > > fix.
> >
> > I missed that going though :-(
> > I've looked for a fix to the access_ok(kernel_addr,0) being true issue.
> >
> > Shouldn't TASK_SIZE be increased to cover all the 'tagged' addresses?
> > ISTR the 'tag' bits are the 'next' 8 (or so) address bits at the top
> > of valid user addresses.
> 
> 
> I'm not sure if this is a good idea. TASK_SIZE is an arch dependent
> constant, if we increase TASK_SIZE to cover the 'tagged' address space,
> the TASK_SIZE will not tell us the actual virtual address size.
> 
> Maybe we need a macro to tell if a pointer is in user space or not and
> handle the memory tag there.
> But this only works for the "is this pointer in user space" problem.

Well TASK_SIZE isn't a constant, it is read out of 'current'.
Typically it isn't even the limit on the address space since
(at least in x86) it is changed by setfs(KERNEL_DS) so that
access_ok() doesn't reject kernel addresses.

It is almost as if TASK_SIZE is only actually valid for the
check in access_ok().

I'd also have thought you'd want the kernel to use the 'tagged'
address so that the hardware checks it matches.
Or is there some scheme for having userpace use tagged pointers
without hardware support - but wouldn't that require masking
and/or large offsets all over the user code?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
