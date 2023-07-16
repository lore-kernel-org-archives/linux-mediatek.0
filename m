Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF63EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jul 2023 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8YK+g6bbaiBzRtsdDfNlqPPIdMif4KpRQIjjMRTwGk=; b=PeSn3LuN1AY7FhX8OOORTIlo3K
	ou/nQtC5fa3GnnU73fDz/KqNV+HUar+/3nUNwhBANOZTBAQg6CM8hMtM5EM25KI9RyBtYC8cmFdiX
	sxv6GI/XOzXO7VrPAs7HqeA2FC7p6udQQJH5ndK+FaeFdNN2m7q8JT7CUd1gMDz7Tumh45/NqTy3h
	9bVPi77q9ajg4CYtVf+P6V11lw18Ac+ffJOa5wpdY6up/wUwQdKs9/8s6emaA6sZf9aQVMRlMV7iL
	m7EgI1ssdvwJCETks/G1/oSBktTc+SNQTuxyrpUQ1B9xO1OsFTs4m5pLt49FqD5wHSr5evzppAXVl
	oOVS0pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3uL-00CUQB-0m;
	Sun, 16 Jul 2023 15:43:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3uH-00CUMo-1E;
	Sun, 16 Jul 2023 15:43:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3836A60D57;
	Sun, 16 Jul 2023 15:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F5FC433C8;
	Sun, 16 Jul 2023 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689522211;
	bh=jaqa0HCS19s0PDvOrcJ3LKInhBxF2KV171eQMHttwyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQARaTQayEv+DfaM2Gz058pqDQpaTD9G0lzO7bgWOpLc2MuguNh4fzrA5+1uzT+g8
	 PvsLDuduUSxPdblx0IFoyiF5tN4W4E9uDIxRcur4W4Ua4Of9NCZQ18qXMBj3TU6VC/
	 5q5k6KyJAdq2YB8dcgZBAaHjUo01dA3SM6NP4U28=
Date: Sun, 16 Jul 2023 17:43:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mike Snitzer <snitzer@redhat.com>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Alasdair Kergon <agk@redhat.com>,
	"development, device-mapper" <dm-devel@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	Peter Korsgaard <peter@korsgaard.com>,
	Mike Snitzer <snitzer@kernel.org>, stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for
 asynchronously probed block devices
Message-ID: <2023071657-marry-usual-882f@gregkh>
References: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
 <2023071603-lustily-defraud-2149@gregkh>
 <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_084333_509131_08999F73 
X-CRM114-Status: GOOD (  26.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 16, 2023 at 11:36:36AM -0400, Mike Snitzer wrote:
> On Sun, Jul 16, 2023, 11:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> > > From: Peter Korsgaard <peter@korsgaard.com>
> > > 
> > > Just calling wait_for_device_probe() is not enough to ensure that
> > > asynchronously probed block devices are available (E.G. mmc, usb), so
> > > add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> > > dm-init to explicitly wait for specific block devices before
> > > initializing the tables with logic similar to the rootwait logic that
> > > was introduced with commit  cc1ed7542c8c ("init: wait for
> > > asynchronously scanned block devices").
> > > 
> > > E.G. with dm-verity on mmc using:
> > > dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> > > 
> > > [    0.671671] device-mapper: init: waiting for all devices to be 
> > available before creating mapped devices
> > > [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a 
> > ...
> > > [    0.710695] mmc0: new HS200 MMC card at address 0001
> > > [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> > > [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> > > [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> > > [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, 
> > chardev (249:0)
> > > [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > > [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a 
> > ...
> > > [    0.751306] device-mapper: init: all devices available
> > > [    0.751683] device-mapper: verity: sha256 using implementation 
> > "sha256-generic"
> > > [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> > > [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on 
> > device 254:0.
> > > 
> > > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > ---
> > >  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
> > >  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > What is the git commit id of this change in Linus's tree?
> >
> > thanks,
> >
> > greg k-h
> >
> >
> 
> Hey Greg,
> 
> This change shouldn't be backported to stable@. It is a feature, if
> Mark-PK feels they need it older kernels they need to carry the change
> in their own tree. Or at a minimum they need to explain why this
> change is warranted in stable@.

Ok, I'll drop it from my queue.

> But to answer your original question the upstream commit is:
> 
> 035641b01e72 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices

Ah, showed up in 6.2, so we have to have a 6.1.y backport as well, I
can't take patches for only older kernels, sorry.

thanks,

greg k-h

