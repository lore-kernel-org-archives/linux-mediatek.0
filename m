Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFE1C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 04:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Dscruq5HvHfT1eWyhQ7m6u1Th8UMAzL2FZHFdqxDJk=; b=AhFT47PXf6RS+N
	0AdCIhck94kgYJfPVbVESe5KC2/Y1MB/zBlY5KxQIlbrLrSZ+ooPRsgbzmRM+FbrY/OUj7crhUCnq
	RoneDX+EgWdSa/w+hTtDY+rb0l1If/6JnRcliSJp+a49sj/L1Tzs1rK4tJrJeQ+6CVAq2iXPtkm/a
	2lQhrCGpB2KsGmV1DRK9T/GCqUv7cpF254c8xW6P9cNSFdscV20wyHHT+aMyXeN597CQFsGYBVui8
	TRj+DrmO076guNWjxENQyZU4ApzRcrvVpoujnGyf4NsNOAWmRKhYYiUb8hagFdKbSIa5uIwB3VWp9
	0/G1Egf/5N6yJmIiMO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPdXv-005DXZ-JI; Thu, 03 Mar 2022 04:58:35 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPdXs-005DVs-Vd
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 04:58:34 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-5-c9saVIHFMHux_Sno3vxg6w-1; Thu, 03 Mar 2022 04:58:25 +0000
X-MC-Unique: c9saVIHFMHux_Sno3vxg6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 3 Mar 2022 04:58:23 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 3 Mar 2022 04:58:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Xiaomeng Tong' <xiam0nd.tong@gmail.com>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "bjohannesmeyer@gmail.com"
 <bjohannesmeyer@gmail.com>, "c.giuffrida@vu.nl" <c.giuffrida@vu.nl>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "h.j.bos@vu.nl"
 <h.j.bos@vu.nl>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "jakobkoschel@gmail.com"
 <jakobkoschel@gmail.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-sgx@vger.kernel.org"
 <linux-sgx@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "nathan@kernel.org" <nathan@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rppt@kernel.org" <rppt@kernel.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>, "v9fs-developer@lists.sourceforge.net"
 <v9fs-developer@lists.sourceforge.net>
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Topic: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Index: AQHYLhg9+DU/OogLf0+tiSFmjztyUKysHu+QgADRVYCAACVtoA==
Date: Thu, 3 Mar 2022 04:58:23 +0000
Message-ID: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
 <20220303022729.9321-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220303022729.9321-1-xiam0nd.tong@gmail.com>
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
X-CRM114-CacheID: sfid-20220302_205833_338554_000D8F73 
X-CRM114-Status: GOOD (  21.34  )
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

From: Xiaomeng Tong
> Sent: 03 March 2022 02:27
> 
> On Wed, 2 Mar 2022 14:04:06 +0000, David Laight
> <David.Laight@ACULAB.COM> wrote:
> > I think that it would be better to make any alternate loop macro
> > just set the variable to NULL on the loop exit.
> > That is easier to code for and the compiler might be persuaded to
> > not redo the test.
> 
> No, that would lead to a NULL dereference.

Why, it would make it b ethe same as the 'easy to use':
	for (item = head; item; item = item->next) {
		...
		if (...)
			break;
		...
	}
	if (!item)
		return;
 
> The problem is the mis-use of iterator outside the loop on exit, and
> the iterator will be the HEAD's container_of pointer which pointers
> to a type-confused struct. Sidenote: The *mis-use* here refers to
> mistakely access to other members of the struct, instead of the
> list_head member which acutally is the valid HEAD.

The problem is that the HEAD's container_of pointer should never
be calculated at all.
This is what is fundamentally broken about the current definition.

> IOW, you would dereference a (NULL + offset_of_member) address here.

Where?

> Please remind me if i missed something, thanks.
>
> Can you share your "alternative definitions" details? thanks!

The loop should probably use as extra variable that points
to the 'list node' in the next structure.
Something like:
	for (xxx *iter = head->next;
		iter == &head ? ((item = NULL),0) : ((item = list_item(iter),1));
		iter = item->member->next) {
	   ...
With a bit of casting you can use 'item' to hold 'iter'.

> 
> > OTOH there may be alternative definitions that can be used to get
> > the compiler (or other compiler-like tools) to detect broken code.
> > Even if the definition can't possibly generate a working kerrnel.
> 
> The "list_for_each_entry_inside(pos, type, head, member)" way makes
> the iterator invisiable outside the loop, and would be catched by
> compiler if use-after-loop things happened.

It is also a compete PITA for anything doing a search.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
