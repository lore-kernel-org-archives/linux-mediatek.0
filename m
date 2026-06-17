Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3BCCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwVDvYzjQxyECx1yVb/9X3JuzhEAdvMppJ0CKYONVrE=; b=W7uUHmnNP4tNDUNROmdnCsHoKD
	/crsPwZrnxt/hakrREMIonMzvCnX5fTYorwQzzwatVxqonZq9bX0BUnv5EcDfAUFe9QxGesuXMR1w
	2s73ohyeQQngMBbKmgeqJp0g4Ddyd0qZE5BYWGCUP2Wq3PFzOsK/lFtTp7xh78RJ+EKAM1BaBQZoe
	BssLIdh2JauPXMNVzP1UY3i/BGCqO0Wtp3WatJxfizD3RTTy3OPNtu68MRMSiIDjwC6gaC51wkRuD
	Pf1M9Wqy7CyWlW1dZ8itVa3dRwO8RhYUfRCbDonT4XTuaEUju32o0MkbgLNqOB3uhxqB44YAtLb8W
	PTHX7n8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzY4-00000000QKU-06Oc;
	Wed, 17 Jun 2026 23:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzY2-00000000QKG-1bzg;
	Wed, 17 Jun 2026 23:19:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3AB5403ED;
	Wed, 17 Jun 2026 23:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A7C1F000E9;
	Wed, 17 Jun 2026 23:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781738393;
	bh=lwVDvYzjQxyECx1yVb/9X3JuzhEAdvMppJ0CKYONVrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SrWJbfoYeMhjv1FkuFksigLZtgltUzGa0+7XY9K5aysrUf+m+qvzNq1nt+IAszAdV
	 3zAZwMrMmVOMX7PmmkbKWHcb4DcO5059TI+hSkn8Rl1UzsAAzJ2R02pYBD4cDEt8kh
	 QumZ96mHoXVKTezMTYubxBCyrCNx686fuJCzTcihcQ0XDwz6O1tX6NItMnZp30qMku
	 89GnIzeYVo2Xioj1CwQw44AsfK5yVFQIlTAU4LV2L5gtEt/iJxPBPI0IPygeJrjxgX
	 QkMsH+zqRMo1vPhkTTAk4NEPlP9yijDaOFB+F0wB8EWpPpY3MlWETxwxNTcdXAWtKY
	 gRUwMHbC+9eBw==
Date: Wed, 17 Jun 2026 16:19:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org, horms@kernel.org,
 pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
Message-ID: <20260617161951.52abe413@kernel.org>
In-Reply-To: <178161373805.2167512.2544164327472822616@gmail.com>
References: <178161373805.2167512.2544164327472822616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 14 Jun 2026 07:30:54 +0800 Wayen Yan wrote:
> In airoha_dev_select_queue(), the expression:
> 
>   queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> 
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 = 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
> 
> Fix by guarding the subtraction: when priority is 0, map to queue 0
> (lowest priority), otherwise apply the original (priority - 1) % 8
> mapping.
> 
> Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 31cdb11cd7..d476ef83c3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
>  	 */
>  	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
>  	channel = channel % AIROHA_NUM_QOS_CHANNELS;
> -	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
> +	queue = skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES : 0;

Hi Lorenzo, is there a reason we're subtracting 1 here in the first
place? Could be just me, but may be worth adding a comment here.

Intuitively if we are "narrowing" 16 prios to 8 queues it'd make most
sense to group the adjacent ones -- divide by two.

Please respin with some sort of an explanation..

>  	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
>  
>  	return queue < dev->num_tx_queues ? queue : 0;
-- 
pw-bot: cr

