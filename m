Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E6C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH2qf+/7x2PdEheDi5NWdKtVuYDTIlULnrq89BgQm7A=; b=n7BDFAHQgwidQO
	Zf7fZEhF0bgvgwAWmdMqNEUNahlQGx0lZ0gH4s+Xqg4ktd1vgd9CrVbkgRA2zjJfneLQdGxy8YYVv
	2d/fzkk16AKNOnGboIKft1+ICS208MayBakJIFB872IEoZxqFF1D9My612GWaysrrNlO4OJkacxff
	pWrccViWeNcRbDROj1amX6cxNwIAzZExIwzQ0stUh9D1jhIxSiDpt+70Peb1V1rccb9sGQjVJk08S
	UjoDFmhWTk53Cx2qEXCWvtDhDDyxa8O8Uev0YZ7+nrSBkkSgDDRJ+/yY56VrMHajg1pQebJLypKU/
	ejOtSBZ3qdW0udwMOExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPPaU-002uk9-4q; Wed, 02 Mar 2022 14:04:18 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPPaQ-002uhF-Hr
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 14:04:16 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-196-4Li6Fux3PdyQ14Lo-DMf3A-1; Wed, 02 Mar 2022 14:04:10 +0000
X-MC-Unique: 4Li6Fux3PdyQ14Lo-DMf3A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 2 Mar 2022 14:04:06 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 2 Mar 2022 14:04:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Xiaomeng Tong' <xiam0nd.tong@gmail.com>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>
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
 <tipc-discussion@lists.sourceforge.net>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Topic: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Thread-Index: AQHYLhg9+DU/OogLf0+tiSFmjztyUKysHu+Q
Date: Wed, 2 Mar 2022 14:04:06 +0000
Message-ID: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
References: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <20220302093106.8402-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220302093106.8402-1-xiam0nd.tong@gmail.com>
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
X-CRM114-CacheID: sfid-20220302_060414_886803_F75B18C6 
X-CRM114-Status: GOOD (  13.59  )
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
> Sent: 02 March 2022 09:31
> 
> On Mon, 28 Feb 2022 16:41:04 -0800, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But basically to _me_, the important part is that the end result is
> > maintainable longer-term.
> 
> I couldn't agree more. And because of that, I stick with the following
> approach because it's maintainable longer-term than "type(pos) pos" one:
>  Implements a new macro for each list_for_each_entry* with _inside suffix.
>   #define list_for_each_entry_inside(pos, type, head, member)

I think that it would be better to make any alternate loop macro
just set the variable to NULL on the loop exit.
That is easier to code for and the compiler might be persuaded to
not redo the test.

It also doesn't need an extra variable defined in the for() statement
so can be back-ported to older kernels without required declaration
in the middle of blocks.

OTOH there may be alternative definitions that can be used to get
the compiler (or other compiler-like tools) to detect broken code.
Even if the definition can't possibly generate a working kerrnel.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
