Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538C5C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 11:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F5861006
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 11:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F5861006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRBaaIethjGU0EoEbCcCMfQtUK8KRKf+3WOnrz6fixI=; b=KrCFEJuKACE9Oru002Hm3mSKc2
	JYgfR345CnbY2id5xJKueI4vpQmCfcSg4Fn8+sr3tAoNSAdTH+4O06m6nvQcr2N2jPfIrn+WFwg4u
	LxshYdPoae5vl6V5EqExSPWQ++uxQPOL1sUD8HfEITbYdes9tiJfIvwNjnsYwHRZfcB/kpq4nz4L4
	oLlboF9WukpQ5w6N6Ci5ebtRkb9Skqcgs5YLUYLGwVjGSevajKg21UVo72ZhYDw5WtdDQqJreB19o
	wZ8qyiEdr91WcEhHLwbP4fNSo8tFFeIuJ0leNZfqlk/LgQn6Z2K56ZisXA7fV1zW7kWiCwVBFYVQs
	WhI5JbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2uSE-007Dbt-NS; Mon, 12 Jul 2021 11:50:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2uS1-007DYa-JX; Mon, 12 Jul 2021 11:50:19 +0000
Received: from [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7] (unknown
 [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B6CA01F42190;
 Mon, 12 Jul 2021 12:50:13 +0100 (BST)
Subject: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Enric Balletbo Serra <eballetbo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20210710132431.265985-1-linux@fw-web.de>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
Date: Mon, 12 Jul 2021 13:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710132431.265985-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_045017_836338_C929296A 
X-CRM114-Status: GOOD (  25.09  )
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

Hi

On 10.07.21 15:24, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> HDMI output was broken on mt7623/BPI-R2 in 5.13 because function for
> special output selection (mtk_mmsys_ddp_sout_sel) was dropped.
> This function wrote 3 registers at one time and so it is not compatible
> with the array-approach.
> 
> I re-added the old function and call this after the default routing table
> was applied. This default routing table can still be used as the only
> connection handled by mmsys on BPI-R2 is OVL0->RDMA0 and this is already
> present in the default routing table
> 
> Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..f91b7fdd417a 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -57,6 +57,25 @@ struct mtk_mmsys {
>   	const struct mtk_mmsys_driver_data *data;
>   };
>   
> +static void mtk_mmsys_ddp_sout_sel(struct device *dev,
> +				   enum mtk_ddp_comp_id cur,
> +				   enum mtk_ddp_comp_id next)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> +			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> +			       mmsys->regs + DISP_REG_CONFIG_OUT_SEL);
> +		writel_relaxed(DSI_SEL_IN_RDMA,
> +			       mmsys->regs + DISP_REG_CONFIG_DSI_SEL);
> +		writel_relaxed(DPI_SEL_IN_BLS,
> +			       mmsys->regs + DISP_REG_CONFIG_DPI_SEL);

you can still use the array approach for this like that:

         {
                 DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
                 DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1
         }, {
         {
                 DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
                 DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI
         }, {
         {
                 DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
                 DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA
         }, {
         {
                 DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
                 DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS
         }, {


Thanks,
Dafna

> +	}
> +}
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
> @@ -71,6 +90,8 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>   			reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
>   			writel_relaxed(reg, mmsys->regs + routes[i].addr);
>   		}
> +
> +	mtk_mmsys_ddp_sout_sel(dev, cur, next);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
