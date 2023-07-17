Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FDEEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 02:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWG5WrewmZyGOqX9g3fBInai637V8c0IB0YAxIq934s=; b=QuaDfNZwgwi3cG3t7CzZDggdAf
	KxXDwHUCijj0HeO8REB9q3kBnJ6YEAjtt5vXLbHd9IefAqQGgiPq4lu25WWFll8elrNMMbKfaoV0G
	LPaP/TdecOEHKh57JMGgwMy5WdMRtopV1AsGWRE4gTfZa84SVd0cEh6/mISUasc3zjluwtiGGpl/Z
	EQ+A3tqQCjKW/tCANxj/fEOK8qHrsn8qxtNHFSWZZFMe8KFzV0kOFTa4IdDhqJlznyxZmkzs8fYKx
	/zl0sH6W7TbjGE0l5n0NSJs7htX/Q8m7b4eTSvo6asU1EdCPgGJrFmTcMRKPL3kVrLFbg6oAR+K6E
	Dq50DESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDes-000dbO-0e;
	Mon, 17 Jul 2023 02:08:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDeo-000dXb-1h;
	Mon, 17 Jul 2023 02:08:16 +0000
X-UUID: c3422700244611ee912e1518a6540028-20230716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iWG5WrewmZyGOqX9g3fBInai637V8c0IB0YAxIq934s=;
	b=erb0pqvQU+77Z4XObw+hivyQ+0zdsAr1thX+qnIhHLllmdUuYUWQwIN5eNfMcJYYmVXNudGBrDHyZtR1wf8NfP1wtPNZ7PQbv/PUQeIapz+UetzG7QI22VfF1OiE8L7J+khBQoLo/cBvzSpzVGMTkE3b/CTpJuizmLqEOhGYqWM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:4d6c5087-6023-45a7-be9b-2467346bc583,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:085bc64c-06c1-468b-847d-5b62d44dbb9b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c3422700244611ee912e1518a6540028-20230716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 258426663; Sun, 16 Jul 2023 19:08:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jul 2023 09:57:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jul 2023 09:57:28 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <snitzer@redhat.com>
CC: <agk@redhat.com>, <corbet@lwn.net>, <dm-devel@redhat.com>,
	<gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
	<matthias.bgg@gmail.com>, <peter@korsgaard.com>, <snitzer@kernel.org>,
	<stable@vger.kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
Date: Mon, 17 Jul 2023 09:57:28 +0800
Message-ID: <20230717015728.12641-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
References: <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_190814_618118_626E4D49 
X-CRM114-Status: GOOD (  25.35  )
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

Thanks for your comment.
The reason why we think this should be backported to stable kernel is
that it actually fix the potential race condition when make block
device probe async in stable kernel.
And we'd like to fix this upstream rather than just take it in
our custom tree.

> 
> But to answer your original question the upstream commit is:
> 
> 035641b01e72 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
> 
> Thanks,
> Mike

