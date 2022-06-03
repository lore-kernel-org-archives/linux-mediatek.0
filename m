Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED6CCA473
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 04:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ4vFR8FvjHMR9vR5lNSbTYbq3plkP/6qzyLPwvvKuI=; b=uN4BkyL1ALb38Z
	hEjEuIaXNvPoZ0FDKYwqLjPofn7CyYBBMdZW8kBWKi0ZzFMECwfF/Ik+NEYVh/tQcFeSKRONVTgfx
	0sjUvomsjcPp1yGM8DRpe+1YOHaegKgVSt+KXf7vNiBpDFy+UBle0lHyIcvyZC7RmHQv0Pfo9xWjm
	bJK4Ik7RBQnwq0ocwxr+NNr8kVhrml8U569zLitI8JYyCjwakUkBufOunW8OQgi5IFPd/LI3HHV7v
	kv2kfLpRdRzJd0Blm1dGHCxa0LR6g+bI74UZBM+pBeipymLD+oBVz2qFkT0/Fuh+tGdOu+FJV1tQj
	H2vi95+NPI6NpY9ue5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyy1-005neR-HU; Fri, 03 Jun 2022 04:31:21 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyxq-005nb2-Ps; Fri, 03 Jun 2022 04:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=EYuaU/n29S6mPWu7974aUOfQXdaYQnassV8I6gREXSk=; b=jFs5aKNPKQND+2mAmm11jMfMsE
	oaCck4bKK7ocz1ORSzv1n7xnYz304ARX6tWej2j4cphCoj+oDzZUJoFx4zuXIP/ZsG3p3SVCE466n
	k0ZK2P5lPgkE1SsT+MHdzYnXqDNq3gt9SpJYllbd8tngS03nKSE90ps+c5Ha/P3Mnvps=;
Received: from p200300daa70ef200058bb5d56adcce0c.dip0.t-ipconnect.de ([2003:da:a70e:f200:58b:b5d5:6adc:ce0c] helo=nf.local)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nwyxP-0004ok-B8; Fri, 03 Jun 2022 06:30:43 +0200
Message-ID: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
Date: Fri, 3 Jun 2022 06:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Content-Language: en-US
To: Chen Lin <chen45464546@163.com>, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com
References: <1654229435-2934-1-git-send-email-chen45464546@163.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev_alloc_frag
In-Reply-To: <1654229435-2934-1-git-send-email-chen45464546@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_213111_132776_6FCE8EF1 
X-CRM114-Status: GOOD (  17.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03.06.22 06:10, Chen Lin wrote:
> When rx_flag == MTK_RX_FLAGS_HWLRO,
> rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
> netdev_alloc_frag is for alloction of page fragment only.
> Reference to other drivers and Documentation/vm/page_frags.rst
> 
> Branch to use kmalloc when rx_data_len > PAGE_SIZE.
> 
> Signed-off-by: Chen Lin <chen45464546@163.com>
> ---
>   drivers/net/ethernet/mediatek/mtk_eth_soc.c |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b3b3c07..d0eebca 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1914,7 +1914,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>   		return -ENOMEM;
>   
>   	for (i = 0; i < rx_dma_size; i++) {
> -		ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +		if (ring->frag_size <= PAGE_SIZE)
> +			ring->data[i] = netdev_alloc_frag(ring->frag_size);
> +		else
> +			ring->data[i] = kmalloc(ring->frag_size, GFP_KERNEL);
I'm pretty sure you also need to update all the other places in the code 
that currently assume that the buffer is allocated using the page frag 
allocator.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
