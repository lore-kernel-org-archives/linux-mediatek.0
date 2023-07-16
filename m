Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E7EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jul 2023 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LHEMA87hz0bPqq01aqffQrDTIU7RF1BFqZ+UOC0uVY=; b=LVb/Vc71u/teJDR6kmcmVM5DYF
	WcbFYaWxnkICTt6UCu1qmzcZEpKgDtcUkg+OJr9hZudvBh5aPFhX1kSYmgkLmTnpn+IKIot31E1yr
	54+QoLEv5x0fDgSEHo7Z4yR5vdD5ZB0VaBtBd8vP+c9LZiyU70ZQS9jUmrNThwzdtxzDAg8IzkMpw
	HWIU5q/oIPex5MgPWMbkmo9UQZ7+BETUavjpxX3MPLqrD89K173Y7LYcQLTqmSpof4nRgms4hQi6h
	6Wzd7zGRw0d4uY2ckWljQow9bsCnElZJYVP+kng1RwUEVna35wzselSCuoj1fFzjElf+BTzIPOY6e
	aE32zhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3U5-00CFHf-1Y;
	Sun, 16 Jul 2023 15:16:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3U1-00CFEb-0i;
	Sun, 16 Jul 2023 15:16:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8499160D32;
	Sun, 16 Jul 2023 15:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65317C433C8;
	Sun, 16 Jul 2023 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689520583;
	bh=TBe9iDjVnkR+UmC0zth4fQ+GS4Xe/RGNJO67dRLKtQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WX63MLrQ7bxnNctMb3HgCh4i2qCHQ3M5ugI6ZOkweVwbjM8/NoILt5biY78yW57Jo
	 nnE63fWeaDDp8rZpmuEAYBjbo1sIY89rs131GVe1z51rlH6jaF8OQSlzecqtRcljbi
	 s2c+TVGlaZ1Cm4Rje4UEBQk0NPGaag2HG8lcAsxc=
Date: Sun, 16 Jul 2023 17:16:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	Peter Korsgaard <peter@korsgaard.com>,
	Mike Snitzer <snitzer@kernel.org>, stable@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for
 asynchronously probed block devices
Message-ID: <2023071603-lustily-defraud-2149@gregkh>
References: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_081625_318851_FB00E61B 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> From: Peter Korsgaard <peter@korsgaard.com>
> 
> Just calling wait_for_device_probe() is not enough to ensure that
> asynchronously probed block devices are available (E.G. mmc, usb), so
> add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> dm-init to explicitly wait for specific block devices before
> initializing the tables with logic similar to the rootwait logic that
> was introduced with commit  cc1ed7542c8c ("init: wait for
> asynchronously scanned block devices").
> 
> E.G. with dm-verity on mmc using:
> dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> 
> [    0.671671] device-mapper: init: waiting for all devices to be available before creating mapped devices
> [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a ...
> [    0.710695] mmc0: new HS200 MMC card at address 0001
> [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, chardev (249:0)
> [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a ...
> [    0.751306] device-mapper: init: all devices available
> [    0.751683] device-mapper: verity: sha256 using implementation "sha256-generic"
> [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on device 254:0.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
>  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)

What is the git commit id of this change in Linus's tree?

thanks,

greg k-h

