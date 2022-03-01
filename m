Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F36C43219
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6FCKkCvBBxjgp4FX8VNC8vkmFRsvKHDirS+5U7WD1Y=; b=QQjsf9CfWRe/dg
	cPtjzwvxhZ7lQPgmyfGDqgcMQz3PfTy5I7Ogmt+qrupkKDRXJAAfmPkWWFpoHFe2p+2URvPMAIykm
	26fEih5fHs7EYQhWh9kRQ1REVmcVFAeOPWIJ+LEXGpuwf2r+K4UQiR2UZRVGD/TVoJA7N3ZSTAl+a
	nqgVP2jS1kI/rzhmKkxihmO0E7cRNVfuzJHiLkj9VJ4eFT6va23/LRQQdKLmEq8C/ourEIJcmjp/Y
	PCTfeOHdhcZhKH/+p/RCCvBAfz+/Z6WD7NYjiHoVSLHNT3/kLWzFF4e2Hh6m8Omlb/c8PAg1y/nlo
	YT81F8iMbUfX4mmTmOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP6RD-0005Ld-QQ; Tue, 01 Mar 2022 17:37:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP6RA-0005Jb-Fz; Tue, 01 Mar 2022 17:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 531B4B81BE7;
 Tue,  1 Mar 2022 17:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071ADC340EE;
 Tue,  1 Mar 2022 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646156241;
 bh=pTV2MFZ+7d07p5uTbhq3otIc2cmXwQTMtR9OmiTt6ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpCJZz+2kmNYzjHFDfNSN8QomXtdcPSo3VhSYDe/9DvnLjw6+Gf8JZk1Z8B7/MpEr
 7jyq5w6VtMe9h/eDSvv1UXjGNGEtGZwH42GPuJGwpwQgnv9I5iH7DWZlof3+dZGTFm
 esB5bRgUOyJTALvSP9KXHdoyU5cCbTmKTmS3YsdQ=
Date: Tue, 1 Mar 2022 18:37:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-sgx@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kvm@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 v9fs-developer@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5ZzNQQQE8rIexy@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <Yhyv42ONIxTj04mg@kroah.com>
 <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_093724_896191_E32F374E 
X-CRM114-Status: GOOD (  30.07  )
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

On Mon, Feb 28, 2022 at 01:06:57PM +0100, Jakob Koschel wrote:
> 
> 
> > On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
> >> If the list does not contain the expected element, the value of
> >> list_for_each_entry() iterator will not point to a valid structure.
> >> To avoid type confusion in such case, the list iterator
> >> scope will be limited to list_for_each_entry() loop.
> >> 
> >> In preparation to limiting scope of a list iterator to the list traversal
> >> loop, use a dedicated pointer to point to the found element.
> >> Determining if an element was found is then simply checking if
> >> the pointer is != NULL.
> >> 
> >> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> >> ---
> >> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
> >> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
> >> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
> >> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
> >> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
> >> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
> >> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
> >> drivers/usb/musb/musb_gadget.c       | 11 +++++---
> >> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
> >> 9 files changed, 88 insertions(+), 50 deletions(-)
> > 
> > The drivers/usb/ portion of this patch should be in patch 1/X, right?
> 
> I kept them separate since it's a slightly different case.
> Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
> this commit up as you mentioned.
> 
> > 
> > Also, you will have to split these up per-subsystem so that the
> > different subsystem maintainers can take these in their trees.
> 
> Thanks for the feedback.
> To clarify I understand you correctly:
> I should do one patch set per-subsystem with every instance/(file?)
> fixed as a separate commit?

Yes, each file needs a different commit as they are usually all written
or maintained by different people.

As I said in my other response, if you need any help with this, just let
me know, I'm glad to help.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
