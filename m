Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB011C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9q4fp7/vZb3AmJlZVKh7KDewsGUfmbhHaKJy5A47YY=; b=o5SZp9rwwyagKF
	hl3N0EkkuGTmB42sVxRamoKysgtKmU827C5dusOeUCaH/AEN+/C/E6wHqWvxwvi5GLpjIDN+CVgGz
	zSHDQOCTCj0i7y11RPEgV4FZH4KOH2ZsQ+jMjYNwRsvuxa47xYDVyU95NxSoQVnvRS3JxHomTZerg
	V1bO1cEBTkTpLzdWTsskbB7C6aAKdB+UfQSaElbcxHrOppsDxgqmpo3bhD4vCQBF95mj+pI1XJvgr
	OmvcaB8Fni0LSM9MTLEEZEyqR7uccxQpPWMpsywmLKLHNEBIrW5OVoi13SjY7RWV/TO5FhlT0btwd
	RO+P8Z/G8hlnqK+kWmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOkds-00Dh3K-EK; Mon, 28 Feb 2022 18:21:04 +0000
Received: from relay.hostedemail.com ([64.99.140.26])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOkdp-00Dh1g-CA
 for linux-mediatek@lists.infradead.org; Mon, 28 Feb 2022 18:21:02 +0000
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id 8480C81766;
 Mon, 28 Feb 2022 18:20:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 5C4272002A; 
 Mon, 28 Feb 2022 18:20:29 +0000 (UTC)
Message-ID: <0be9de3920442df490f01b6fb1c42521c3de6190.camel@perches.com>
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past
 the loop body
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Jakob Koschel
 <jakobkoschel@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arch
 <linux-arch@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Arnd
 Bergman <arnd@arndb.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Mike
 Rapoport <rppt@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida
 <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Jason Gunthorpe <jgg@ziepe.ca>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor
 <nathan@kernel.org>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
 linux-sgx@vger.kernel.org,  drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org,  linux-iio@vger.kernel.org,
 linux-crypto@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,  amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org,  intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org,  linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-usb@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,  bcm-kernel-feedback-list@broadcom.com,
 linux-tegra@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 kvm@vger.kernel.org,  linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org,  linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org,  kgdb-bugreport@lists.sourceforge.net,
 v9fs-developer@lists.sourceforge.net, 
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Date: Mon, 28 Feb 2022 10:20:28 -0800
In-Reply-To: <20220228112413.GA2812@kadam>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: 1e1i8ombnsc3cdkptu3anccezjc89zox
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5C4272002A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+i6vY6IDwHpNq++UEo/5hqvP4PvgQNb4E=
X-HE-Tag: 1646072429-12569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_102101_525840_621C3CE1 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2022-02-28 at 14:24 +0300, Dan Carpenter wrote:

> a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.

That's more your personal preference than a coding style guideline.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
