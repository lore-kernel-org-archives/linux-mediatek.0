Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D10CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 09:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1CC20684
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 09:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz9fwnAt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1CC20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG/X5E0C2BymByeUTeIAsN4e1gO2FbaCliTU0Sr9xDM=; b=Yz9fwnAt4qEie/
	w6TLychjQxnPlrHCm2QONHoWsuJM0NtEm+ecocdUaoKo/IKJi79Hy94YfeDiY+eCQh3uFjhoENoAU
	b+3ivZoz8KS0R0gmDYyBQEQmSW0d5rjdqLlmlziNpbT6uSO4WWdyUmdXi/I74PzEU4PDwgxpSmkOD
	lMq2Yt5S8l7x1mZiufxeXUcJOFGzNxsrmz3+bWdR6XFNdHLuCfeXfBzAUbEne31TcOPxZuno+Uf6Y
	nsbJquAd9OOhb5k2XPgLJAEWI2+yJR5W0y3oIcMo2+QMfU45mYdr2FM9t4d4OgFEkisevegVxl2KU
	LU/euwpsK6fBFv8/wm5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNZfN-0008Ot-Qz; Thu, 24 Oct 2019 09:44:25 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNZfK-0008Nk-VU; Thu, 24 Oct 2019 09:44:24 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.2) (envelope-from <daniel@makrotopia.org>)
 id 1iNZey-0004X9-F4; Thu, 24 Oct 2019 11:44:04 +0200
Date: Thu, 24 Oct 2019 11:43:39 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: mt76x2e hardware restart
Message-ID: <20191024094339.GB1252@makrotopia.org>
References: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
 <c6d621759c190f7810d898765115f3b4@natalenko.name>
 <9d581001e2e6cece418329842b2b0959@natalenko.name>
 <20191012165028.GA8739@lore-desk-wlan.lan>
 <f7695bc79d40bbc96744a639b1243027@natalenko.name>
 <96f43a2103a9f2be152c53f867f5805c@natalenko.name>
 <20191016163842.GA18799@localhost.localdomain>
 <20191023085039.GB2461@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023085039.GB2461@localhost.localdomain>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_024423_015020_73E5F10A 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <sgruszka@redhat.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 linux-mediatek@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>,
 Roy Luo <royluo@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lorenzo,

On Wed, Oct 23, 2019 at 10:50:39AM +0200, Lorenzo Bianconi wrote:
> ...
> I think I spotted the SG issue on mt76x2e. Could you please:
> - keep pcie_aspm patch I sent
> - remove the debug patch where I disabled TX Scatter-Gather on mt76x2e
> - apply the following patch

With those two patches I'm for the first time able to use the U7612
mPCIe module on my x86 Laptop in a more or less stable way.
In now 10 hours uptime I had one serious hickup of
[35790.926455] mt76x2e 0000:02:00.0: MCU message 31 (seq 11) timed out
[35790.991227] mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
[35790.991231] mt76x2e 0000:02:00.0: Build: 1
[35790.991233] mt76x2e 0000:02:00.0: Build Time: 201507311614____
[35791.016460] mt76x2e 0000:02:00.0: Firmware running!
[35791.017153] ieee80211 phy0: Hardware restart was requested
...(repeating about 10 times, every 20 seconds)
and one less serious, all related to MCU message 31.
However, unlike before, the hardware actually recovers and works
quite well most of the time.

Thank you!!!

Cheers

Daniel

> 
> Regards,
> Lorenzo
> 
> mt76: dma: fix buffer unmap with non-linear skbs
> 
> mt76 dma layer is supposed to unmap skb data buffers while keep txwi mapped
> on hw dma ring. At the moment mt76 wrongly unmap txwi or does not unmap data
> fragments in even positions for non-linear skbs. This issue may result in hw
> hangs with A-MSUD if the system relies on IOMMU or SWIOTLB.
> Fix this behaviour marking first and last queue entries introducing
> MT_QUEUE_ENTRY_FIRST and MT_QUEUE_ENTRY_LAST flags and properly unmap
> data fragments
> 
> Fixes: 17f1de56df05 ("mt76: add common code shared between multiple chipsets")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/wireless/mediatek/mt76/dma.c  | 33 +++++++++++++----------
>  drivers/net/wireless/mediatek/mt76/mt76.h |  3 +++
>  2 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
> index 4da7cffbab29..a3026a0ca8c5 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -54,7 +54,7 @@ mt76_dma_add_buf(struct mt76_dev *dev, struct mt76_queue *q,
>  	int i, idx = -1;
>  
>  	if (txwi)
> -		q->entry[q->head].txwi = DMA_DUMMY_DATA;
> +		q->entry[q->head].flags = MT_QUEUE_ENTRY_FIRST;
>  
>  	for (i = 0; i < nbufs; i += 2, buf += 2) {
>  		u32 buf0 = buf[0].addr, buf1 = 0;
> @@ -83,6 +83,7 @@ mt76_dma_add_buf(struct mt76_dev *dev, struct mt76_queue *q,
>  		q->queued++;
>  	}
>  
> +	q->entry[idx].flags |= MT_QUEUE_ENTRY_LAST;
>  	q->entry[idx].txwi = txwi;
>  	q->entry[idx].skb = skb;
>  
> @@ -93,27 +94,31 @@ static void
>  mt76_dma_tx_cleanup_idx(struct mt76_dev *dev, struct mt76_queue *q, int idx,
>  			struct mt76_queue_entry *prev_e)
>  {
> +	__le32 addr, __ctrl = READ_ONCE(q->desc[idx].ctrl);
>  	struct mt76_queue_entry *e = &q->entry[idx];
> -	__le32 __ctrl = READ_ONCE(q->desc[idx].ctrl);
> -	u32 ctrl = le32_to_cpu(__ctrl);
> -
> -	if (!e->txwi || !e->skb) {
> -		__le32 addr = READ_ONCE(q->desc[idx].buf0);
> -		u32 len = FIELD_GET(MT_DMA_CTL_SD_LEN0, ctrl);
> +	u32 len, ctrl = le32_to_cpu(__ctrl);
>  
> +	if (e->flags & MT_QUEUE_ENTRY_FIRST) {
> +		addr = READ_ONCE(q->desc[idx].buf1);
> +		len = FIELD_GET(MT_DMA_CTL_SD_LEN1, ctrl);
>  		dma_unmap_single(dev->dev, le32_to_cpu(addr), len,
>  				 DMA_TO_DEVICE);
> -	}
> -
> -	if (!(ctrl & MT_DMA_CTL_LAST_SEC0)) {
> -		__le32 addr = READ_ONCE(q->desc[idx].buf1);
> -		u32 len = FIELD_GET(MT_DMA_CTL_SD_LEN1, ctrl);
> -
> +	} else {
> +		addr = READ_ONCE(q->desc[idx].buf0);
> +		len = FIELD_GET(MT_DMA_CTL_SD_LEN0, ctrl);
>  		dma_unmap_single(dev->dev, le32_to_cpu(addr), len,
>  				 DMA_TO_DEVICE);
> +		if (e->txwi &&
> +		    ((ctrl & MT_DMA_CTL_LAST_SEC1) ||
> +		     !(e->flags & MT_QUEUE_ENTRY_LAST))) {
> +			addr = READ_ONCE(q->desc[idx].buf1);
> +			len = FIELD_GET(MT_DMA_CTL_SD_LEN1, ctrl);
> +			dma_unmap_single(dev->dev, le32_to_cpu(addr), len,
> +					 DMA_TO_DEVICE);
> +		}
>  	}
>  
> -	if (e->txwi == DMA_DUMMY_DATA)
> +	if (!(e->flags & MT_QUEUE_ENTRY_LAST))
>  		e->txwi = NULL;
>  
>  	if (e->skb == DMA_DUMMY_DATA)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> index e95a5893f93b..b0ac82b31789 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -83,6 +83,8 @@ struct mt76_tx_info {
>  	u32 info;
>  };
>  
> +#define MT_QUEUE_ENTRY_FIRST	BIT(0)
> +#define MT_QUEUE_ENTRY_LAST	BIT(1)
>  struct mt76_queue_entry {
>  	union {
>  		void *buf;
> @@ -95,6 +97,7 @@ struct mt76_queue_entry {
>  	enum mt76_txq_id qid;
>  	bool schedule;
>  	bool done;
> +	u32 flags;
>  };
>  
>  struct mt76_queue_regs {
> -- 
> 2.21.0
> 
> > 
> > Regards,
> > Lorenzo
> > 
> > > 
> > > -- 
> > >   Oleksandr Natalenko (post-factum)
> 
> 



> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
