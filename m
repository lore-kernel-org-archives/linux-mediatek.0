Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F92EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXf8WO/VGMjutdLm2Csgj4jBIsNa4tCMVRwrKZGndmc=; b=mjhgEXRqqiVAFb0WpsQC8ewI29
	ranMZuYgvyEW4zhgcPzi+439Yk9rHNY6dKyAjX+0sLxC30QSYM5o2ANaYOEOWXFkSweHbuUcJoaPp
	KSWeg9mwJrWz1luvkR8znw2BSgXhYZPYCu7sOrb86BFIoxkuAnnN14DrbuwkVHeGkJs+7L3xv8yhb
	pmyCYZSb3YFPUuSaOW68t/ysTwu5OjMb9aHTz+fwI/p6AGUInm6mPWNiuEgoOpGgo/kz41yd9EkPZ
	QwqfXMR6r1qZDmVPLsUDfNrGSVYA3NPc2sk5G5SYZC0nDxoAy6ffjmSTffafQAov6R6cKK7eGNi0J
	CE9isJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjnc-00D4BB-30;
	Fri, 21 Jul 2023 06:39:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjnZ-00D487-36;
	Fri, 21 Jul 2023 06:39:35 +0000
X-UUID: 53f59f78279111ee912e1518a6540028-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iXf8WO/VGMjutdLm2Csgj4jBIsNa4tCMVRwrKZGndmc=;
	b=YujTcJ5unOLEsLutQr/RRlQ/PDI7c2KJhUR7XPtTvWmV2SguPhVh0Nrd1ALW2Cd/sUOqQV9cY7Yy4zJYhMCt51f7tNn+os5tKaiCp93TVMLMVSajiOcSJ9vtf/HlPkSRxUMCJiRznZM3DQCXHtNNpxNKz9lXekzPHeraoUgBSsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:bb97ce13-69ac-444e-9267-29c7828a2f35,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:3568eb8e-7caa-48c2-8dbb-206f0389473c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 53f59f78279111ee912e1518a6540028-20230720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1886379105; Thu, 20 Jul 2023 23:39:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jul 2023 14:38:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jul 2023 14:38:45 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <gregkh@linuxfoundation.org>
CC: <agk@redhat.com>, <corbet@lwn.net>, <dm-devel@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <peter@korsgaard.com>,
	<snitzer@kernel.org>, <snitzer@redhat.com>, <stable@vger.kernel.org>,
	<yj.chiang@mediatek.com>
Subject: Re: [PATCH 5.15] dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
Date: Fri, 21 Jul 2023 14:38:45 +0800
Message-ID: <20230721063845.11676-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <2023072033-hedge-buffing-8862@gregkh>
References: <2023072033-hedge-buffing-8862@gregkh>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_233934_007064_3F3F239E 
X-CRM114-Status: GOOD (  33.44  )
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

> On Mon, Jul 17, 2023 at 09:57:28AM +0800, Mark-PK Tsai wrote:
> > > On Sun, Jul 16, 2023, 11:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> > > > > From: Peter Korsgaard <peter@korsgaard.com>
> > > > > 
> > > > > Just calling wait_for_device_probe() is not enough to ensure that
> > > > > asynchronously probed block devices are available (E.G. mmc, usb), so
> > > > > add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> > > > > dm-init to explicitly wait for specific block devices before
> > > > > initializing the tables with logic similar to the rootwait logic that
> > > > > was introduced with commit  cc1ed7542c8c ("init: wait for
> > > > > asynchronously scanned block devices").
> > > > > 
> > > > > E.G. with dm-verity on mmc using:
> > > > > dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> > > > > 
> > > > > [    0.671671] device-mapper: init: waiting for all devices to be 
> > > > available before creating mapped devices
> > > > > [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a 
> > > > ...
> > > > > [    0.710695] mmc0: new HS200 MMC card at address 0001
> > > > > [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> > > > > [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> > > > > [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> > > > > [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, 
> > > > chardev (249:0)
> > > > > [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > > > > [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a 
> > > > ...
> > > > > [    0.751306] device-mapper: init: all devices available
> > > > > [    0.751683] device-mapper: verity: sha256 using implementation 
> > > > "sha256-generic"
> > > > > [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> > > > > [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on 
> > > > device 254:0.
> > > > > 
> > > > > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > > > > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > ---
> > > > >  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
> > > > >  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
> > > > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > > >
> > > > What is the git commit id of this change in Linus's tree?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > > >
> > > >
> > > 
> > > Hey Greg,
> > > 
> > > This change shouldn't be backported to stable@. It is a feature, if
> > > Mark-PK feels they need it older kernels they need to carry the change
> > > in their own tree. Or at a minimum they need to explain why this
> > > change is warranted in stable@.
> > 
> > Thanks for your comment.
> > The reason why we think this should be backported to stable kernel is
> > that it actually fix the potential race condition when make block
> > device probe async in stable kernel.
> > And we'd like to fix this upstream rather than just take it in
> > our custom tree.
> 
> Potential race condition, is this actually able to be hit in real life?

Yes it hanppened, and it can lead the kernel init process stuck in
the root wait loop.

Below is the log.
(I add 20 seconds delay in mtk_mci probe to quick reproduce it.)

* Before apply this pactch
[    0.368594][    T1] device-mapper: init: waiting for all devices to be available before creating mapped devices
[   21.673047][   T45] probe of 1c660000.mtk-mmc-fcie returned 0 after 21541020 usecs
[   21.673061][   T45] mtk_mci 1c660000.mtk-mmc-fcie: driver mtk_mci async attach completed: 0
[   21.680006][    T1] device-mapper: table: 254:0: verity: Data device lookup failed <--------------- start after mtk_mci probe done
[   21.680012][    T1] device-mapper: ioctl: error adding target to table <--------------------------- won't create /dev/dm-0
[   21.680067][   T67] mmc0: new HS400 Enhanced strobe MMC card at address 0001
[   21.680184][   T67] bus: 'mmc': __driver_probe_device: matched device mmc0:0001 with driver mmcblk
[   21.680192][   T67] bus: 'mmc': really_probe: probing driver mmcblk with device mmc0:0001
[   21.680500][   T67] mmcblk0: mmc0:0001 016G01 14.5 GiB 
[   21.683404][   T67]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
[   21.686152][   T67] mmcblk0boot0: mmc0:0001 016G01 8.00 MiB 
[   21.687166][   T67] mmcblk0boot1: mmc0:0001 016G01 8.00 MiB 
[   21.687955][   T67] mmcblk0rpmb: mmc0:0001 016G01 4.00 MiB, chardev (238:0)
[   21.687977][   T67] driver: 'mmcblk': driver_bound: bound to device 'mmc0:0001'
[   21.688004][   T67] bus: 'mmc': really_probe: bound device mmc0:0001 to driver mmcblk
[   21.688010][   T67] probe of mmc0:0001 returned 0 after 7819 usecs
[   21.688166][    T1] Waiting for root device /dev/dm-0...
[   41.023192][    T1] driver_probe_done: probe_count = 0
... can't exit from the root wait loop

* After apply this patch and add dm-mod.waitfor="PARTLABEL=rootfs"
[    0.368417][    T1] device-mapper: init: waiting for all devices to be available before creating mapped devices
[   21.672749][   T45] probe of 1c660000.mtk-mmc-fcie returned 0 after 21540992 usecs
[   21.672767][   T45] mtk_mci 1c660000.mtk-mmc-fcie: driver mtk_mci async attach completed: 0
[   21.672774][    T1] device-mapper: init: waiting for device PARTLABEL=rootfs ...
[   21.672869][   T43] mtk_mci 1c660000.mtk-mmc-fcie: eMMC: HS400 5.1 200MHz
[   21.679743][   T43] mmc0: new HS400 Enhanced strobe MMC card at address 0001
[   21.679852][   T43] bus: 'mmc': __driver_probe_device: matched device mmc0:0001 with driver mmcblk
[   21.679858][   T43] bus: 'mmc': really_probe: probing driver mmcblk with device mmc0:0001
[   21.680204][   T43] mmcblk0: mmc0:0001 016G01 14.5 GiB 
[   21.682866][   T43]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
[   21.685579][   T43] mmcblk0boot0: mmc0:0001 016G01 8.00 MiB 
[   21.686631][   T43] mmcblk0boot1: mmc0:0001 016G01 8.00 MiB 
[   21.687533][   T43] mmcblk0rpmb: mmc0:0001 016G01 4.00 MiB, chardev (238:0)
[   21.687559][   T43] driver: 'mmcblk': driver_bound: bound to device 'mmc0:0001'
[   21.687585][   T43] bus: 'mmc': really_probe: bound device mmc0:0001 to driver mmcblk
[   21.687591][   T43] probe of mmc0:0001 returned 0 after 7732 usecs
[   21.687838][    T1] device-mapper: init: all devices available <---------------------------------- start after PARTLABEL=rootfs is ready
[   21.688155][    T1] device-mapper: verity: sha1 using implementation "sha1-generic"
[   21.688975][    T1] device-mapper: ioctl: dm-0 (dm-verity) is ready

> 
> thanks,
> 
> greg k-h

