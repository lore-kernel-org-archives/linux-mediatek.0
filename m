Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30319C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1RNMza/FYgHvj33jNjozA6gVKX8HFlv5PptHiwW4FU=; b=mHT8UKARdynht/ufqyXGGSz1kb
	yVtFbguiyludLq/WxjFm6eNeJACs6JRGJt93DJ6oTtY4lbIlCTI0RTcIDImRh1Vnsk2jzXCCGBWW8
	+s5yxN9uYcj4mCjoAaGGEPqjmSk+eeEezAVrcsYwdRchAzXyuBAG1zjav6Pww2hllIFFji5f7oRBm
	AWgiku3fDAMryAe/tWPw6KNzDzfrAplccl7tGgzJidtp5+rHniQ+ob/TgUIU6VOVjlXL2V2aCxV9B
	CAoGOSOaUoWKFMX3iWwMHxIWR/hkeSGpUxHcYgh80tnCfMYA9Sh79HIcQjoJoDvLA7eAT9jZ3yRqX
	dcN8WAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYBj-009Bsh-20;
	Mon, 28 Aug 2023 09:05:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYBg-009Bs2-2F
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 09:05:34 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-58d9ba95c78so34829217b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693213530; x=1693818330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J1RNMza/FYgHvj33jNjozA6gVKX8HFlv5PptHiwW4FU=;
        b=d2aQfYsK32hUyp2Yu5cXAdJwNM7w09dyAa694IhAP449GN90ljg8UT03FZtYOHTkNe
         0u/2vxFEiJTKr/tgpGfqFTAhyC0XRo1s0FRs45HRvNbVsSaMc0qfwLSg7VEou9TFparr
         Hx4FXLlxnvbRbdx7G28RosE9WH4wbT6rT5BMxAuQcs5510Q0kYwew0iNmxj6EMkWSzJ/
         XkMb1yZKN/sNq+mGq5nh7NoAmBZBfip9mQeteFqDFLqf6G65w6vUuhLiD9QEY3mE6bLa
         Szcu5EB2I38TgAp0hXGn8Co0k0oODnhqI13xoG8zIVAXNkSb2FZT3CAXar5F/v+emPur
         KfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693213530; x=1693818330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1RNMza/FYgHvj33jNjozA6gVKX8HFlv5PptHiwW4FU=;
        b=mCFuNwrB79HLvIZp/sCDmmbAxaPQXYSlAgjKG4dXDgNGvPN/UVCYNrI3x06/ByLUSK
         9UWz2AFJp6bmDSwwnbJeTbxFgsSD/7QhaNzGUiVna9bCjs+RH0YpPVMwoQzytGffRD4d
         Ra/s7zXaBS5uWLGndC7I/0I9AdOvnUczDhE5WFYDKF3SfIWtRNslMzGOXUsX41YYMk0q
         NV4xdozdd2DVf9wFFTpRW+YUaOBM0p2VdgLcFbjRhAXVN7aut7Xjb2BeMd0PpadAuJmZ
         3Lcfcpm3VHOIDj206CfDwHjbR1y0dg1/bz95vmqZdpeQ+JrBq6IJbQBze0tmUP5d794D
         2mLg==
X-Gm-Message-State: AOJu0Yzl9KpRftjjm8mOPHCiYgw4ob6+x0uf30OnsYwtYRhQyXECGO37
	6a71zpDWVcJhrrueGS7L/o54OXYqRxTYYXGWW8WNkg==
X-Google-Smtp-Source: AGHT+IHq+aJHFLWI8UMIwAM1r5QOuuXEt5p+X5yVlU5MKm+roaUxdv6D3/izv+QX8vHNDmiY/hXGs6MNYvsLy/6tvqs=
X-Received: by 2002:a25:23c6:0:b0:d7a:bfcf:2d3 with SMTP id
 j189-20020a2523c6000000b00d7abfcf02d3mr5069144ybj.51.1693213530110; Mon, 28
 Aug 2023 02:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <769a67cb-1b32-fd4f-b37e-e3ec4dab5eb9@rock-chips.com>
 <20230826162635.617-1-Sharp.Xia@mediatek.com> <95e9525e-3101-4433-27e2-cd69f254af1c@rock-chips.com>
In-Reply-To: <95e9525e-3101-4433-27e2-cd69f254af1c@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Aug 2023 11:04:54 +0200
Message-ID: <CAPDyKFqgQmvdmXe8Sxnv2E5EY9cose+E2pBK3r0P_OzqAC79dg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
To: sharp.xia@mediatek.com, Shawn Lin <shawn.lin@rock-chips.com>
Cc: angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	matthias.bgg@gmail.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_020532_805720_D4C918B9 
X-CRM114-Status: GOOD (  15.99  )
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

On Mon, 28 Aug 2023 at 04:28, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Sharp
>
> On 2023/8/27 0:26, Sharp.Xia@mediatek.com wrote:
> > On Fri, 2023-08-25 at 17:17 +0800, Shawn Lin wrote:
> >>
> >>
>
> After more testing, most of my platforms which runs at HS400/HS200 mode
> shows nearly no differences with the readahead ranging from 128 to 1024.
> Yet just a board shows a performance drop now. Highly suspect it's eMMC
> chip depends. I would recommand leave it to the BSP guys to decide which
> readahead value is best for their usage.

That's a very good point. The SD/eMMC card certainly behaves
differently, depending on the request-size.

Another thing we could consider doing, could be to combine the
information about the request-size from the mmc host, with some
relevant information from the registers in the card (not sure exactly
what though).

>
> >
> > I tested with RK3568 and sdhci-of-dwcmshc.c driver, the performance improved by 2~3%.
> >
> > Before:
> > root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
> > 2097152+0 records in
> > 2097152+0 records out
> > real    0m 6.01s
> > user    0m 0.84s
> > sys     0m 2.89s
> > root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
> > 128
> >
> > After:
> > root@OpenWrt:/mnt/mmcblk0p3# echo 3 > /proc/sys/vm/drop_caches
> > root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
> > 2097152+0 records in
> > 2097152+0 records out
> > real    0m 5.86s
> > user    0m 1.04s
> > sys     0m 3.18s
> > root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
> > 1024
> >
> > root@OpenWrt:/sys/kernel/debug/mmc0# cat ios
> > clock:          200000000 Hz
> > actual clock:   200000000 Hz
> > vdd:            18 (3.0 ~ 3.1 V)
> > bus mode:       2 (push-pull)
> > chip select:    0 (don't care)
> > power mode:     2 (on)
> > bus width:      3 (8 bits)
> > timing spec:    9 (mmc HS200)
> > signal voltage: 1 (1.80 V)
> > driver type:    0 (driver type B)
> >

Thanks for testing and sharing the data, both of you!

Kind regards
Uffe

