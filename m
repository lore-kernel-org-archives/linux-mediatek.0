Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC20C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131A06112F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 131A06112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSzigHfl4p6Pm6u6nzE/66RLbUIEj5M/bLNDq6nknr4=; b=ti2pUWCZGdrAUuB/atXLLTwj+D
	NZX5JGiqPKw5ZEiMTqan11Rmzt8MSWIXben49FSoM++UQooEXy2oLPYpOPewZaXLGwYupzwppnoD1
	gy0uA0VD/76TYh1KEPHsPciRcPxziWwPWmCZh9wtPF4MBfcBLlZaFN8XzECFLmvWSLRdRvTUg2jer
	X9lo9Wm0etgwug9TJK2MBw+Bm32ixBY2Am7NlYgfLCnpxYbHbVgEbPnwZLUdtwJjHcYtYIuSukNe5
	M1ERyq2C+B5Dh87oiGSFHn3RMiGpySBlMvnQWdVb4viMmiEYsIoXY0c3GezVXduTveo1zA3r2nwqk
	pL4BktUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwPX-00BPXF-EJ; Fri, 22 Oct 2021 15:24:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwPL-00BPTI-1u; Fri, 22 Oct 2021 15:24:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1D4241F44B70
Subject: Re: [PATCH v2 3/4] media: platform: mtk-mdp3: Set
 dma_set_mask_and_coherent
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
 <20211022092827.24631-4-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <448b3d2f-54a0-f021-dc2a-ea29dc56c146@collabora.com>
Date: Fri, 22 Oct 2021 17:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022092827.24631-4-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_082435_272697_D4E3BC7A 
X-CRM114-Status: GOOD (  18.86  )
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

Il 22/10/21 11:28, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Use the dma_set_mask_and_coherent helper to set mdp
> DMA bit mask to support 34bits iova space(16GB) that
> the mt8195 iommu HW supports.
> 
> The whole iova range separates to 0~4G/4G~8G/8G~12G/12G~16G.
> Regarding which iova range mdp actually locates,
> it depends on the dma-ranges property of mdp dtsi node.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> index 12b029d145d6..51f7ef2b31ce 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -1141,6 +1141,9 @@ static int mdp_probe(struct platform_device *pdev)
>   	mdp->pdev = pdev;
>   	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
>   
> +	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +
>   	ret = of_property_read_u32(dev->of_node, "mediatek,mdp3-id", &id);
>   	if (ret) {
>   		dev_err(dev, "Failed to get mdp-id\n");
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
