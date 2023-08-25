Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C649BC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU4/V6ndA5R7lvrGvDLIjLvlK6dyYIJGN/XjomZsBm8=; b=UwL3f0olTNpUZNuEjj2t5WDydO
	OKllYpP0XwhEAXRXJrlZ0Cc51kCkp8BV/gIPBQ1J2B8sM2eLWWfi3b9e2GXVGI68pBRNCIswNN+KA
	zO6LIuoBneZZa/5wS6ysGXHKz8+yOkvOW/UdT5uyMUXlgFDKzQUM9qmZXL4lAkuSSrdwUbj25P0CQ
	4uLJ0eD+6I+8sWLbq10k9S1wuPZxLwBS3tEc4nd4TwuaPrOjUTRD1W0KIJ8winautNWaJOa8MNF1W
	bcf/49nTrLqtJDg6Su7AyoVXLZ7NZcJb+9aGCw2kPQu/rrqhW1VbReaLjtJBKLVq9c7us5Hc3Udq9
	unv3svjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRSv-004Yq7-0j;
	Fri, 25 Aug 2023 07:42:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRSr-004YpY-35;
	Fri, 25 Aug 2023 07:42:43 +0000
X-UUID: f42ca712431a11ee83ed1395ce914268-20230825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sU4/V6ndA5R7lvrGvDLIjLvlK6dyYIJGN/XjomZsBm8=;
	b=iHuxotYZaEKndvPVIOALXBfrOPCiYKuNU6N57Arg9zeoYavBHe1jq8d8AGZAxw4/eAYmlYlxk/BbhMslgQawjTfJwQesBN8H3MWMne+hsvwn+5+IDv3HWltCSEXRiGXoGRt0Fum3HQ1tUKJO+6IO94tQbEYebgEijJfLsgMzIgg=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f359f1f4-203c-4969-9682-7a76f12f9191,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-INFO: VERSION:1.1.31,REQID:f359f1f4-203c-4969-9682-7a76f12f9191,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
	release,TS:54
X-CID-META: VersionHash:0ad78a4,CLOUDID:ea26f0ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:230824185604G6OMGZAT,BulkQuantity:11,Recheck:0,SF:29|28|16|19|48|64|
	102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_OBB,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_USA
X-UUID: f42ca712431a11ee83ed1395ce914268-20230825
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <sharp.xia@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1887386191; Fri, 25 Aug 2023 00:42:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 15:42:31 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 15:42:30 +0800
From: <Sharp.Xia@mediatek.com>
To: <ulf.hansson@linaro.org>
CC: <Sharp.Xia@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <wsd_upstream@medaitek.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Date: Fri, 25 Aug 2023 15:25:36 +0800
Message-ID: <20230825072536.23602-1-Sharp.Xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAPDyKFqN0K=2e4rijUBz=9LXVfhEVvDzNgqXTyTgvaPRK-PBNQ@mail.gmail.com>
References: <CAPDyKFqN0K=2e4rijUBz=9LXVfhEVvDzNgqXTyTgvaPRK-PBNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_004242_047320_61C4B326 
X-CRM114-Status: GOOD (  23.19  )
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

On Thu, 2023-08-24 at 12:55 +0200, Ulf Hansson wrote:
>        
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>  On Fri, 18 Aug 2023 at 04:45, <Sharp.Xia@mediatek.com> wrote:
> >
> > From: Sharp Xia <Sharp.Xia@mediatek.com>
> >
> > MMC does not set readahead and uses the default VM_READAHEAD_PAGES
> > resulting in slower reading speed.
> > Use the max_req_size reported by host driver to set the optimal
> > I/O size to improve performance.
> 
> This seems reasonable to me. However, it would be nice if you could
> share some performance numbers too - comparing before and after
> $subject patch.
> 
> Kind regards
> Uffe
> 
> >
> > Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
> > ---
> >  drivers/mmc/core/queue.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> > index b396e3900717..fc83c4917360 100644
> > --- a/drivers/mmc/core/queue.c
> > +++ b/drivers/mmc/core/queue.c
> > @@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue
> *mq, struct mmc_card *card)
> >                 blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
> >         blk_queue_max_hw_sectors(mq->queue,
> >                 min(host->max_blk_count, host->max_req_size /
> 512));
> > +       blk_queue_io_opt(mq->queue, host->max_req_size);
> >         if (host->can_dma_map_merge)
> >                 WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
> >                                                         mmc_dev(hos
> t)),
> > --
> > 2.18.0
> >

I test this patch on internal platform(kernel-5.15).

Before:
console:/ # echo 3 > /proc/sys/vm/drop_caches
console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
4485393+1 records in
4485393+1 records out
2296521564 bytes (2.1 G) copied, 37.124446 s, 59 M/s
console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
128

After:
console:/ # echo 3 > /proc/sys/vm/drop_caches
console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
4485393+1 records in
4485393+1 records out
2296521564 bytes (2.1 G) copied, 28.956049 s, 76 M/s
console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
1024


