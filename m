Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19345C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5srht2ZwRzHSs26Ms9NQJRIJcot0Xb9Gjy8d3MZtrw=; b=bH00T2XI+bGKol
	ebAUpJ537gES1BIjVy7ErS/iQLQPb+I+ZY5366rkoTBslKNZw0zktOrIz5WOd0eajTsuSSjf8zamI
	IqVPJUh4pMDRNMB9qBM3PHFkt3Vy3N6XVjiFYVzSG33Ui4TuamirPxDGsVi59tLhiEpIMTzBXYorN
	l2O2tiF+59HCkcV3rWoKmPPJ5XpoueS1lJ7zqtdwxbH3gBJWv89gCnCNW9iCsWD2+X/unthzIG8SY
	EdhET6T0j6zsuHS4zLCgMz1uZxKaWB9iUt16XhX1zKmfIVXTcrqJOMo1RFohB/7AEJ2WmYpIWoMrW
	ypjVS+xGmhKX2NXg5JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOmds-00E26C-AY; Mon, 28 Feb 2022 20:29:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOmdp-00E24x-7g; Mon, 28 Feb 2022 20:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=uTSgVBk5w89AJnv82I9bqMWvwbVIn7Apzl6uMNeIbWY=; 
 t=1646080149; x=1647289749; b=e23jtEy+eKunFC8CGgj3DoIjxD/zRbJLDiUxMjggM4wpfqZ
 h0s9hAVa9LBbYxq+Kj5BUwV3i5A27w32h/wO0Rrao9Zjjeq6RomwfH8we7miPxhHTvt/VmDPdce4l
 cbmYZjO/gn65vrInLS0CePBlg44I2IYvDUjcAFQ3LtUnr8czBCCUSmgXWO7n6+l2qvpti0VsUR2XH
 l9VrbgSFq2XopZIBuR93oLefxT35Koz0m9DAhD0iMNMfp4RDxNEGWab/yF9eo+27xFOzAuzAMiDKR
 3cey6ys4UteWRTSVEFY10/ILJcXl6U78wLxr6q/0wqEU8f8yFOKAG8KXBmLHfwVQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nOmc1-00716Q-Dh; Mon, 28 Feb 2022 21:27:17 +0100
Message-ID: <e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: Johannes Berg <johannes@sipsolutions.net>
To: Matthew Wilcox <willy@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jakob
 Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org,
 linux-aspeed@lists.ozlabs.org,  "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>, linux-iio@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Cristiano Giuffrida
 <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org,  linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, CIFS
 <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, linux-scsi
 <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe
 <jgg@ziepe.ca>,  intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, 
 bcm-kernel-feedback-list@broadcom.com, Dan Carpenter
 <dan.carpenter@oracle.com>,  Linux Media Mailing List
 <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd
 Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>,  Brian Johannesmeyer
 <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, v9fs-developer@lists.sourceforge.net, 
 linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,  linux-usb@vger.kernel.org, linux-wireless
 <linux-wireless@vger.kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List
 <linux-f2fs-devel@lists.sourceforge.net>, 
 tipc-discussion@lists.sourceforge.net, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>,  linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Date: Mon, 28 Feb 2022 21:27:13 +0100
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_122909_284214_EE873B36 
X-CRM114-Status: GOOD (  15.13  )
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

On Mon, 2022-02-28 at 20:16 +0000, Matthew Wilcox wrote:
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

I was just going to say the same thing...

If we're willing to change the API for the macro, we could do

  list_for_each_entry(type, pos, head, member)

and then actually take advantage of -Wshadow?

johannes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
