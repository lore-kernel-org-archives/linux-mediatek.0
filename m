Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC71C43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 03:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJbHE0FI4cNx5BFU0LInyVEJbwRXfkWdbhMX04O72pU=; b=3+3yD0LiISUYh2
	0JNZ00z3/rI+Nd4a4SB7oXwO1RiDo0V9YXeeiagVDlWi1T5QUehIvargXlOeIs23harmkQcdpvftp
	nc9ox46OoV36IthOXuS4u9FN8lDQS9Tj8YXRuJytzE7xuc0zTzFo3mXopDsBe8RRU9+CWicmL6rF5
	FKW9C7jF03Q7MlCuAJOS0PjiWRiXOm/9sF3rgjiX+pchACZV/TkW89keh2Yyen/DWYEhG4PkDGEsk
	MJ/cOLlJcfKrmwnK42bpvnw3lqP825Ha/DhliJvvhWQz14wGVwa9KfFoqDsgkMmSZxQYJpgyHjAoS
	58HYOZsg7VOqzHQjcrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOsnw-00ElTB-TD; Tue, 01 Mar 2022 03:04:00 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOsnt-00ElRP-05
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 03:03:58 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-267-9MSeLLg1PRGi9Q5Mk98pjw-1; Tue, 01 Mar 2022 03:03:54 +0000
X-MC-Unique: 9MSeLLg1PRGi9Q5Mk98pjw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 03:03:52 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 1 Mar 2022 03:03:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matthew Wilcox' <willy@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
CC: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "Jakob
 Koschel" <jakobkoschel@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Cristiano Giuffrida
 <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, "drbd-dev@lists.linbit.com"
 <drbd-dev@lists.linbit.com>, linux-arch <linux-arch@vger.kernel.org>, CIFS
 <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, linux-scsi
 <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Bos, H.J."
 <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, "Arnd
 Bergman" <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, Brian Johannesmeyer
 <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, "v9fs-developer@lists.sourceforge.net"
 <v9fs-developer@lists.sourceforge.net>, linux-tegra
 <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "linux-sgx@vger.kernel.org"
 <linux-sgx@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS Dev
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Topic: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Index: AQHYLOAn+DU/OogLf0+tiSFmjztyUKyp1n9A
Date: Tue, 1 Mar 2022 03:03:52 +0000
Message-ID: <198022f201814cdc9384ef083741185e@AcuMS.aculab.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_190357_342257_F538E3FE 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthew Wilcox
> Sent: 28 February 2022 20:16
> 
> On Mon, Feb 28, 2022 at 12:10:24PM -0800, Linus Torvalds wrote:
> > We can do
> >
> >         typeof(pos) pos
> >
> > in the 'for ()' loop, and never use __iter at all.
> >
> > That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.
> 
> > +#define list_for_each_entry(pos, head, member)					\
> > +	for (typeof(pos) pos = list_first_entry(head, typeof(*pos), member);	\
> > +	     !list_entry_is_head(pos, head, member);	\
> >  	     pos = list_next_entry(pos, member))

Actually can't you use 'pos' to temporarily hold the address of 'member'.
Something like:
	for (pos = (void *)head; \
		pos ? ((pos = (void *)pos - offsetof(member)), 1) : 0; \
		pos = (void *)pos->next)
So that 'pos' is NULL if the loop terminates.
No pointers outside structures are generated.
Probably need to kill list_entry_is_head() - or it just checks for NULL.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
