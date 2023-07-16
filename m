Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B136EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jul 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjKpqR/un+xqnmH4u/xs4cWkynkrba3RxsIKpUmzl5A=; b=Tyd3/Bbh0PSSR1ZXdFu/OWgvhW
	JKOXGVS9YObbJ5Holw+R9SiVyuAnSf52YDQsdXva9TAHU1U4O/MJi5FYunxc85BoQKOR3sMJoCCN8
	Pw2ZzRoVsXVzNF5c29MgaVijiiwQMeiqv8DDmbOpGBPGLYLkCcf4wAS+fEbg5Yh6x646lq4i+GUOt
	hfAUy0ufLNUFG87XVYYMBVfcT7CgnSV0WA78NRsjPqGVs01hPBDblGqucjiU+QkXXZ9itJckN/qPE
	FbUI3IQfUJda2McippRFbcIbIv6oNGbetvtgptt4cFssOOnFsYbSfa2JFYMIsDxa03a1Gs2YFKU3k
	yQntHMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3q0-00CRtA-0F;
	Sun, 16 Jul 2023 15:39:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3pv-00CRpE-39
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jul 2023 15:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689521941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjKpqR/un+xqnmH4u/xs4cWkynkrba3RxsIKpUmzl5A=;
	b=JbNaaUxVPjD/oRU3+abmRZ+2b3CDaED8fUAuaIHFEY5RM10vZcoaTwhfT8J/iQQpWshP7+
	M+86eJVkcDfGgeAKk1j7tA9OgiMt7hLLKHXRsKCXH/quCh29i0TystmcyMvlbS3TaB5h8c
	RIIUe4YQF0c6l3DhlpIrmgJTBZdR0vM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-FoGE2oK1Oz6GQOJzZxedbw-1; Sun, 16 Jul 2023 11:36:42 -0400
X-MC-Unique: FoGE2oK1Oz6GQOJzZxedbw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-765986c0568so562445385a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jul 2023 08:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689521801; x=1692113801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKpqR/un+xqnmH4u/xs4cWkynkrba3RxsIKpUmzl5A=;
        b=dosZv3Op0m5SeXrMTAQX7Jrj4w2efUuRBg4qFUuRFYmtkslaY3z1mzBwNGPTbk4x4z
         TTcBEVasfw7R5uGW7vqFHAIng8m8ALo9H8PbPg2SOO4+5yDTSQymrQM9baQKF1ZFtpO2
         ZqRzfFRazetgSvLFAu46/pT1qSIUPVGnDQ1xfWUwnFoIff/eg9kXH9OzrmrBgOFo4WjG
         aBItgqm49Ld3yA/ICz/bLuusTwYsOSP6smStfIArG9qxkjvtvrJfBamvchaJkFXdUkMr
         9rFBwocv/qGz0h3acxplI/VQdg0Jd3b3EPKYR8nLpwQxNfSe71yJWBSeRk5Dyipw8RQI
         jWVA==
X-Gm-Message-State: ABy/qLbg2DI04Tig0REwl7Pz0yEtWGR6ytYICCfTD9azRwv8C2MsF3Wm
	ilLztSb8V42CZ6dB7601MEoFZBma5jxrGZ/dH5ZC1DxonG2lans9EUY3bwGF72ISa3eqmNyWtyT
	FY9IFdlmhHxTAhJK9Ii3Vf+fywgK0pDw=
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr11678680qkm.49.1689521801803;
        Sun, 16 Jul 2023 08:36:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGf+9RMl8b0IZ7BAM8vVkiIbftoUFL/qQ02Lwshk7jN2Z9DSLREpZmbP00aTzB4D/vKmJjFrA==
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr11678558qkm.49.1689521798519;
        Sun, 16 Jul 2023 08:36:38 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id g7-20020ae9e107000000b0075cd80fde9esm5405203qkm.89.2023.07.16.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 08:36:37 -0700 (PDT)
Date: Sun, 16 Jul 2023 11:36:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <CAH6w=aztzhm3Sa-afN2Xk-7mp1BVtTKNXJ=JyXqJvm3wtEnd3Q@mail.gmail.com>
References: <20230713055841.24815-1-mark-pk.tsai@mediatek.com>
 <2023071603-lustily-defraud-2149@gregkh>
MIME-Version: 1.0
In-Reply-To: <2023071603-lustily-defraud-2149@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_083904_836007_59CCB439 
X-CRM114-Status: GOOD (  21.71  )
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

On Sun, Jul 16, 2023, 11:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Thu, Jul 13, 2023 at 01:58:37PM +0800, Mark-PK Tsai wrote:
> > From: Peter Korsgaard <peter@korsgaard.com>
> > 
> > Just calling wait_for_device_probe() is not enough to ensure that
> > asynchronously probed block devices are available (E.G. mmc, usb), so
> > add a "dm-mod.waitfor=<device1>[,..,<deviceN>]" parameter to get
> > dm-init to explicitly wait for specific block devices before
> > initializing the tables with logic similar to the rootwait logic that
> > was introduced with commit  cc1ed7542c8c ("init: wait for
> > asynchronously scanned block devices").
> > 
> > E.G. with dm-verity on mmc using:
> > dm-mod.waitfor="PARTLABEL=hash-a,PARTLABEL=root-a"
> > 
> > [    0.671671] device-mapper: init: waiting for all devices to be 
> available before creating mapped devices
> > [    0.671679] device-mapper: init: waiting for device PARTLABEL=hash-a 
> ...
> > [    0.710695] mmc0: new HS200 MMC card at address 0001
> > [    0.711158] mmcblk0: mmc0:0001 004GA0 3.69 GiB
> > [    0.715954] mmcblk0boot0: mmc0:0001 004GA0 partition 1 2.00 MiB
> > [    0.722085] mmcblk0boot1: mmc0:0001 004GA0 partition 2 2.00 MiB
> > [    0.728093] mmcblk0rpmb: mmc0:0001 004GA0 partition 3 512 KiB, 
> chardev (249:0)
> > [    0.738274]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
> > [    0.751282] device-mapper: init: waiting for device PARTLABEL=root-a 
> ...
> > [    0.751306] device-mapper: init: all devices available
> > [    0.751683] device-mapper: verity: sha256 using implementation 
> "sha256-generic"
> > [    0.759344] device-mapper: ioctl: dm-0 (vroot) is ready
> > [    0.766540] VFS: Mounted root (squashfs filesystem) readonly on 
> device 254:0.
> > 
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  .../admin-guide/device-mapper/dm-init.rst     |  8 +++++++
> >  drivers/md/dm-init.c                          | 22 ++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
>
> What is the git commit id of this change in Linus's tree?
>
> thanks,
>
> greg k-h
>
>

Hey Greg,

This change shouldn't be backported to stable@. It is a feature, if
Mark-PK feels they need it older kernels they need to carry the change
in their own tree. Or at a minimum they need to explain why this
change is warranted in stable@.

But to answer your original question the upstream commit is:

035641b01e72 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices

Thanks,
Mike


