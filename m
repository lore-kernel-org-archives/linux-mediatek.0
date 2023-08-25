Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7DEC71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AI4j/imUS1MUuQuGpKi9NalKkJwpNjUoHfF8ByAQng=; b=AWAg5D5UeElMIUYOFza7TVmFzj
	WONrx7c6sWqPHRFVyAAIQGbCXLbjZ7fJ6jrVxDsMNkg4EJc/eSGbef+HqZ53CKqkJH0dlY8KvJyBA
	LzuIVlwMALEPA1bi13PMV7bpn1360TfaE/O1s+DBHp0q5Ctd3k8U0j7ybqKMPFBxorKYOJgy+3PzG
	4wB4VTSLfWFnBDPKkbkOkC5M0vuZZp6cNNqtr5fZobf4VUaB9yFcNdC6DwPvQI/7GCEsV6Z4MBmm2
	fDZLUibz1ds9EeLo30jdX1ca4U2QjjLDTEUCsdGnTDTnRVwy019wjhUYw3IMSqOlGjWmZ7HGtBBQm
	Th/no9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVr9-005NDi-20;
	Fri, 25 Aug 2023 12:24:03 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVr5-005ND5-16;
	Fri, 25 Aug 2023 12:24:00 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-64f444fe7a7so8989546d6.0;
        Fri, 25 Aug 2023 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966237; x=1693571037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AI4j/imUS1MUuQuGpKi9NalKkJwpNjUoHfF8ByAQng=;
        b=UdvTOpoxY/bhUnWcwMDoPK3kdZpyKVKrnioA961W9+oEUcjNgxrV5Tue0bv+v//qKs
         DtTT4REBuL39Fb1rY2VvgwZqPWpBaEycuMWT47HyyU8xheDjANC+hJjSXkOexRPpeMsE
         bYE11Fw4GrJPX1jpt0LVAb7i3hbt1HoMstnhvT4/2YYzb5ItJrp6L1eXl+d6u2ENnyeW
         cN5pclyTlYuHMZD2ag9nQGV3lw5WrRxyO3uu3bE1XS+n/D/UKlb3yNjI9/T7SZoWyY9v
         Oy7wMP/Cfn89YnHV9haKI8PJOlcxkEDy81a6qMXacVgbw4FiygZge8pLy3XfPd1WEp/M
         SA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966237; x=1693571037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AI4j/imUS1MUuQuGpKi9NalKkJwpNjUoHfF8ByAQng=;
        b=YVm1qmO73N8+OTgP3JljDjH+GwvTO2TNtaeTY1SqPFaRT5JlwDr/wBbSp4IT83Pqln
         eKw0ar3PffYPwBuBijt2ERMsr1APar5o66hs4j+WRWe02qv0Rdr916CqYbc4lqDHFJJ+
         IVLaECisVv05slet+6u19iuH/SAesJqjmNHEvuw/FCF2kb6VR05+cRgYgBhp4ap3L3aT
         drZb65djTeW+lDHZHRXhARuMwCMxu63WEl2vrIgF3bmm/iSSdty4svcknXCxP0c0jQ6B
         I0KeL06VJfRg2elQ4+cduqFg+9xm9jR1xSJLWEu6H59uAy1/TymC6HYnqQSOpk55xr0j
         0KVg==
X-Gm-Message-State: AOJu0YwjWe+FRdEAUB8ksPGH/AYCxSK0tW7cr7vpPMpKgqQzLnrfeWws
	iKhrLYC6rThq4NNXJ0uYA2mypYBsInAwSe9LbrY=
X-Google-Smtp-Source: AGHT+IGtZ7hZKI6y2+C2LIuIKucinFYqd9TnTYNAMR9h9zLHBa9eEs/JQljbdDYs/MShD6tHQS1vpuVnBnneRKpm9jc=
X-Received: by 2002:a0c:dc06:0:b0:64f:6625:48f4 with SMTP id
 s6-20020a0cdc06000000b0064f662548f4mr7140539qvk.5.1692966237149; Fri, 25 Aug
 2023 05:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <c8c059ce-53a9-3627-8984-dff771dff1de@rock-chips.com> <20230825083918.24334-1-Sharp.Xia@mediatek.com>
In-Reply-To: <20230825083918.24334-1-Sharp.Xia@mediatek.com>
From: Wenchao Chen <wenchao.chen666@gmail.com>
Date: Fri, 25 Aug 2023 20:23:45 +0800
Message-ID: <CA+Da2qxaCJwZhn0C7VxZzx8TB1VDR_xa2P0cDXUaNA9=YzSJYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
To: Sharp.Xia@mediatek.com
Cc: shawn.lin@rock-chips.com, angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	matthias.bgg@gmail.com, ulf.hansson@linaro.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052359_385228_42205059 
X-CRM114-Status: GOOD (  26.19  )
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

On Fri, Aug 25, 2023 at 7:43=E2=80=AFPM <Sharp.Xia@mediatek.com> wrote:
>
> On Fri, 2023-08-25 at 16:11 +0800, Shawn Lin wrote:
> >
> >  Hi Sharp,
> >
> > On 2023/8/25 15:10, Sharp Xia (=E5=A4=8F=E5=AE=87=E5=BD=AC) wrote:
> > > On Thu, 2023-08-24 at 12:55 +0200, Ulf Hansson wrote:
> > >>
> > >> External email : Please do not click links or open attachments
> > until
> > >> you have verified the sender or the content.
> > >>   On Fri, 18 Aug 2023 at 04:45, <Sharp.Xia@mediatek.com> wrote:
> > >>>
> > >>> From: Sharp Xia <Sharp.Xia@mediatek.com>
> > >>>
> > >>> MMC does not set readahead and uses the default
> > VM_READAHEAD_PAGES
> > >>> resulting in slower reading speed.
> > >>> Use the max_req_size reported by host driver to set the optimal
> > >>> I/O size to improve performance.
> > >>
> > >> This seems reasonable to me. However, it would be nice if you
> > could
> > >> share some performance numbers too - comparing before and after
> > >> $subject patch.
> > >>
> > >> Kind regards
> > >> Uffe
> > >>
> > >>>
> > >>> Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
> > >>> ---
> > >>>   drivers/mmc/core/queue.c | 1 +
> > >>>   1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> > >>> index b396e3900717..fc83c4917360 100644
> > >>> --- a/drivers/mmc/core/queue.c
> > >>> +++ b/drivers/mmc/core/queue.c
> > >>> @@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue
> > >> *mq, struct mmc_card *card)
> > >>>                  blk_queue_bounce_limit(mq->queue,
> > BLK_BOUNCE_HIGH);
> > >>>          blk_queue_max_hw_sectors(mq->queue,
> > >>>                  min(host->max_blk_count, host->max_req_size /
> > >> 512));
> > >>> +       blk_queue_io_opt(mq->queue, host->max_req_size);
> > >>>          if (host->can_dma_map_merge)
> > >>>                  WARN(!blk_queue_can_use_dma_map_merging(mq-
> > >queue,
> > >>>                                                          mmc_dev(
> > hos
> > >> t)),
> > >>> --
> > >>> 2.18.0
> > >>>
> > >
> > > I test this patch on internal platform(kernel-5.15).
> >
> > I patched this one and the test shows me a stable 11% performance
> > drop.
> >
> > Before:
> > echo 3 > proc/sys/vm/drop_caches && dd if=3D/data/1GB.img of=3D/dev/nul=
l
> >
> > 2048000+0 records in
> > 2048000+0 records out
> > 1048576000 bytes (0.9 G) copied, 3.912249 s, 256 M/s
> >
> > After:
> > echo 3 > proc/sys/vm/drop_caches && dd if=3D/data/1GB.img of=3D/dev/nul=
l
> > 2048000+0 records in
> > 2048000+0 records out
> > 1048576000 bytes (0.9 G) copied, 4.436271 s, 225 M/s
> >
> > >
> > > Before:
> > > console:/ # echo 3 > /proc/sys/vm/drop_caches
> > > console:/ # dd if=3D/mnt/media_rw/8031-130D/super.img of=3D/dev/null
> > > 4485393+1 records in
> > > 4485393+1 records out
> > > 2296521564 bytes (2.1 G) copied, 37.124446 s, 59 M/s
> > > console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> > > 128
> > >
> > > After:
> > > console:/ # echo 3 > /proc/sys/vm/drop_caches
> > > console:/ # dd if=3D/mnt/media_rw/8031-130D/super.img of=3D/dev/null
> > > 4485393+1 records in
> > > 4485393+1 records out
> > > 2296521564 bytes (2.1 G) copied, 28.956049 s, 76 M/s
> > > console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> > > 1024
> > >
> Hi Shawn,
>
> What is your readahead value before and after applying this patch?
>

Hi Sharp
Use "echo 1024 > sys/block/mmcblk0/queue/read_ahead_kb" instead of
"blk_queue_io_opt(mq->queue, host->max_req_size);"=EF=BC=9F

