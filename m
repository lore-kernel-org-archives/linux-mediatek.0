Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA81CC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHN0S3NVXg6tu8IUhj0JOWDrZPMV2zreJoNkVEz3ogg=; b=rG7HqxAQHDUb6VSFwj4AKBSuSl
	9iEO2oNpvqbFQJaxrUpJp7N7w0v0A9VDf6hVTpgDgD3RDK5JOWRHroDIzaodfzvpp5f9R8o5ZDppH
	fbxyrpTcLTXvL+utHS3sEYbcopv2BsxBa3IClIJL+tCNcIBdi5vr7rXKfsUHCvFqzEBQgKVWuIN0a
	aJZPW4aOYgCyAs85atoAHCF0JNhCtsLqS6tDOqzkswpTHntxhC1nfDpiIPBS9x/UQBrJ2Wf4U7uyJ
	A8ad8WCLKs56doLHG1Umcnlf/xqLcGumRGTuzt0bxDO5z67tq7HfMMdYj+5p19rJHQxtYa0T1EKxb
	EbNFwLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSmQ-004gzV-14;
	Fri, 25 Aug 2023 09:06:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSmN-004gz7-2P;
	Fri, 25 Aug 2023 09:06:57 +0000
X-UUID: b95cb5e4432611ee83ed1395ce914268-20230825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MHN0S3NVXg6tu8IUhj0JOWDrZPMV2zreJoNkVEz3ogg=;
	b=SZrw6RlHMOTZx8N1x/e51+/uQV0Pb3ZOpxc9JsldkO2MXT3evA3IMmK3JX99o4zwOTe9YhzMmLbl4P28mDBTDztyBldaJjfNkuPtm8u7nN3lFFSQgzxx4cWOdfpKYi0G7w4ah8PxE/eNlm+jnxMiNCjArFh6W7oZT1oE6ag8u/0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:eef47e8a-d626-45d6-a0b5-987564101797,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:78d52e13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b95cb5e4432611ee83ed1395ce914268-20230825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sharp.xia@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 69045247; Fri, 25 Aug 2023 02:06:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 16:56:12 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 16:56:11 +0800
From: <Sharp.Xia@mediatek.com>
To: <shawn.lin@rock-chips.com>
CC: <Sharp.Xia@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <ulf.hansson@linaro.org>,
	<wsd_upstream@mediatek.com>
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Date: Fri, 25 Aug 2023 16:39:18 +0800
Message-ID: <20230825083918.24334-1-Sharp.Xia@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c8c059ce-53a9-3627-8984-dff771dff1de@rock-chips.com>
References: <c8c059ce-53a9-3627-8984-dff771dff1de@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_020655_792108_77A3E014 
X-CRM114-Status: GOOD (  23.87  )
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

On Fri, 2023-08-25 at 16:11 +0800, Shawn Lin wrote:
>  	 
>  Hi Sharp,
> 
> On 2023/8/25 15:10, Sharp Xia (夏宇彬) wrote:
> > On Thu, 2023-08-24 at 12:55 +0200, Ulf Hansson wrote:
> >>   
> >> External email : Please do not click links or open attachments
> until
> >> you have verified the sender or the content.
> >>   On Fri, 18 Aug 2023 at 04:45, <Sharp.Xia@mediatek.com> wrote:
> >>>
> >>> From: Sharp Xia <Sharp.Xia@mediatek.com>
> >>>
> >>> MMC does not set readahead and uses the default
> VM_READAHEAD_PAGES
> >>> resulting in slower reading speed.
> >>> Use the max_req_size reported by host driver to set the optimal
> >>> I/O size to improve performance.
> >>
> >> This seems reasonable to me. However, it would be nice if you
> could
> >> share some performance numbers too - comparing before and after
> >> $subject patch.
> >>
> >> Kind regards
> >> Uffe
> >>
> >>>
> >>> Signed-off-by: Sharp Xia <Sharp.Xia@mediatek.com>
> >>> ---
> >>>   drivers/mmc/core/queue.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> >>> index b396e3900717..fc83c4917360 100644
> >>> --- a/drivers/mmc/core/queue.c
> >>> +++ b/drivers/mmc/core/queue.c
> >>> @@ -359,6 +359,7 @@ static void mmc_setup_queue(struct mmc_queue
> >> *mq, struct mmc_card *card)
> >>>                  blk_queue_bounce_limit(mq->queue,
> BLK_BOUNCE_HIGH);
> >>>          blk_queue_max_hw_sectors(mq->queue,
> >>>                  min(host->max_blk_count, host->max_req_size /
> >> 512));
> >>> +       blk_queue_io_opt(mq->queue, host->max_req_size);
> >>>          if (host->can_dma_map_merge)
> >>>                  WARN(!blk_queue_can_use_dma_map_merging(mq-
> >queue,
> >>>                                                          mmc_dev(
> hos
> >> t)),
> >>> --
> >>> 2.18.0
> >>>
> > 
> > I test this patch on internal platform(kernel-5.15).
> 
> I patched this one and the test shows me a stable 11% performance
> drop.
> 
> Before:
> echo 3 > proc/sys/vm/drop_caches && dd if=/data/1GB.img of=/dev/null 
> 
> 2048000+0 records in
> 2048000+0 records out
> 1048576000 bytes (0.9 G) copied, 3.912249 s, 256 M/s
> 
> After:
> echo 3 > proc/sys/vm/drop_caches && dd if=/data/1GB.img of=/dev/null
> 2048000+0 records in
> 2048000+0 records out
> 1048576000 bytes (0.9 G) copied, 4.436271 s, 225 M/s
> 
> > 
> > Before:
> > console:/ # echo 3 > /proc/sys/vm/drop_caches
> > console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
> > 4485393+1 records in
> > 4485393+1 records out
> > 2296521564 bytes (2.1 G) copied, 37.124446 s, 59 M/s
> > console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> > 128
> > 
> > After:
> > console:/ # echo 3 > /proc/sys/vm/drop_caches
> > console:/ # dd if=/mnt/media_rw/8031-130D/super.img of=/dev/null
> > 4485393+1 records in
> > 4485393+1 records out
> > 2296521564 bytes (2.1 G) copied, 28.956049 s, 76 M/s
> > console:/ # cat /sys/block/mmcblk0/queue/read_ahead_kb
> > 1024
> > 
Hi Shawn,

What is your readahead value before and after applying this patch?


