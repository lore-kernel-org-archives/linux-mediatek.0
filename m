Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75573C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKQFfGkdqBFica5fVu3/2wn7CybOwsxmbDQADUPtkOo=; b=bRMjZDfg+C84QL
	XYHq3YJiELYQmzty1rjJrZRWcpkxfFgEiWF0HPYGQ9XoaD+7NqwCgfgGFwoCwPxtVi9QDDZul/Qlo
	m7lnxMtN5wOZlvXdqmju11z56yAcnJTFiEMypx9S2FUmG2S8ZPO9JoWldphgttEEK29h1M/jgJCIS
	NTffEO23LyNy9AI9+92KRZYJeuHO/FljkH/7obdvxoU0/glFes7boszslbxoko2lLKWLaDOerK71P
	xX5fwB7bA6I6FYeKTcLFim2dMX9nbdsiGIWQMLXfXunlD1WY5ScpXnc1a+Iv26ipTCrUm96L+rr+l
	2UbX3x69hjkB6pplYqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFGJ-000c5W-8b; Mon, 07 Mar 2022 15:27:03 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFGF-000bzz-QX
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 15:27:01 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-85-dcBRBPURPaqNT771jbYVzw-1; Mon, 07 Mar 2022 15:26:52 +0000
X-MC-Unique: dcBRBPURPaqNT771jbYVzw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 15:26:48 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 7 Mar 2022 15:26:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Jakob Koschel
 <jakobkoschel@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "Gustavo A.
 R. Silva" <gustavo@embeddedor.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, "drbd-dev@lists.linbit.com"
 <drbd-dev@lists.linbit.com>, linux-arch <linux-arch@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe
 <jgg@ziepe.ca>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, "Arnd
 Bergman" <arnd@arndb.de>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Brian Johannesmeyer
 <bjohannesmeyer@gmail.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, "v9fs-developer@lists.sourceforge.net"
 <v9fs-developer@lists.sourceforge.net>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sgx@vger.kernel.org"
 <linux-sgx@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dmaengine@vger.kernel.org"
 <dmaengine@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Subject: RE: [PATCH 0/6] Remove usage of list iterator past the loop body
Thread-Topic: [PATCH 0/6] Remove usage of list iterator past the loop body
Thread-Index: AQHYMjRtYqIeET2JD0yO+p9PX3jHEKy0Bmqg
Date: Mon, 7 Mar 2022 15:26:48 +0000
Message-ID: <f7ffd78aa68340e1ade6af15fa2f06d8@AcuMS.aculab.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220307150037.GD3293@kadam>
In-Reply-To: <20220307150037.GD3293@kadam>
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
X-CRM114-CacheID: sfid-20220307_072700_165517_3080411B 
X-CRM114-Status: GOOD (  13.24  )
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

From: Dan Carpenter
> Sent: 07 March 2022 15:01
> 
> Updating this API is risky because some places rely on the old behavior
> and not all of them have been updated.  Here are some additional places
> you might want to change.

I really can't help thinking that trying to merge this patch is
actually impossible.
It affects far too many different parts of the tree.

Since (I believe) this is a doubly linked list with forwards and
backwards pointers that point to a 'node' (not that there is a
nice comment to that effect in the header - and there are lots of
ways to do linked lists) the 'head' pretty much has to be a 'node'.

I'd write the following new defines (but I might be using
the old names here):

list_first(head, field) First item, NULL if empty.
list_last(head, field) Last item NULL if empty.
list_next(head, item, field) Item after 'item', NULL if last.
list_prev(head, item. field) Item before 'item', NULL if first.

You get (something like):
#define list_first(head, field) \
	head->next == &head ? NULL : list_item(head->next, field)
(probably needs typeof(item) from somewhere).

The iterator loop is then just:
#define loop_iterate(item, head, field) \
	for (item = list_first(head, field); item; \
		item = list_next(head, item, field)

I'm not sure, but making the 'head' be a structure that contains
a single member that is a 'node' might help type checking.

Then all the code that uses the current defines can slowly be
moved over (probably a couple of releases) before the existing
defines are deleted.

That should simplify all the open-coded search loops that are
just as likely to be buggy (possibly more so).

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
