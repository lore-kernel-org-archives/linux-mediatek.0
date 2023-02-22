Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B014C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPr5tKFDM/jXos0MTQ1djio+zYQs5TNiciHA8TDLmgM=; b=ZbVjBBNh4AuuQw1fNMp44kTFli
	+XuxisBqxQp9pX2M/Ga/ae627J9QonNr9rkygsQTFCFYfldmWPp6UCklHJewtrzRWh/lAEZWEdUuN
	pX9rPWziDy7GPRnOhk0ymYNHXAKzLrRTcDgP1S6H6fuXVTZIA1QLWJ9n8O1KJpo7acueAX6Y7MSOu
	WWfLWVc887MRUm4dYj+hzJD1fJ6uSmv0k3Pz+bC2QKW5QVKd8bs00V1NmIABXER5++2G30NgrKDyd
	GK+URP+3YknOiK6nfV4mqMSyqq41K41YcpoHeZtFUowMN0wxIepjLlScZqr8pSPp/oO9tx/ShxmYg
	7uZ58orA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmc9-00C2mq-FR; Wed, 22 Feb 2023 10:44:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmbb-00C2Xr-So; Wed, 22 Feb 2023 10:44:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D9E76600864;
	Wed, 22 Feb 2023 10:44:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677062646;
	bh=2c2NjaUUjpoZ9sAYskn4chLZb1xFyWpgbPXg/Yf9Ihw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ltbA5xeVzjRT6lsN6jY1JhI/67FS776M26GCLglPecv2wIsthsOsCOXE5DgZS5kOI
	 eC690RY+xGt9Q61oMOyvJbruXY3ZUzux9IKejP5bR4SQ1uGhzXwTUV8Uw9wFZtxBzE
	 HeCxYsfMH1dJGgR6B+46Vajro0HABA+F9aqwzH5krNM03PpH9WhpsCuiFaODeJFA0s
	 6VBegZwTykG9r1lFljFUI3VWru+X3nq/3BgXnWFZAm+u06opTtfxZoJGQJ7rOlP+B7
	 u5nmcxjKqvmzGGfmoAl8jeXr42bf/dWJD4sGvH+kWwdqdPDuAg7nNf88Hy/jWJPpBn
	 WIeQFz78C98Nw==
Message-ID: <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
Date: Wed, 22 Feb 2023 11:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221227074759.5216-1-jason-jh.lin@mediatek.com>
 <20221227074759.5216-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221227074759.5216-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_024412_101176_60F2EEC4 
X-CRM114-Status: GOOD (  16.24  )
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

Il 27/12/22 08:47, Jason-JH.Lin ha scritto:
> Because compatible of mt8195 is changing from "mediatek,mt8195-mmsys"
> to "mediatek,mt8195-vdosys0".
> 
> We have to revert the multiple compatible finding function and
> add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 128 +++--------------------
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 --
>   3 files changed, 20 insertions(+), 120 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 0ec2e4049e07..66cdd0bc1311 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -370,6 +370,10 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
>   	.fifo_size = 5 * SZ_1K,
>   };
>   
> +static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
> +	.fifo_size = 5 * SZ_1K,
> +};
> +
>   static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
>   	.fifo_size = 1920,
>   };
> @@ -381,6 +385,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>   	  .data = &mt8173_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-rdma",
>   	  .data = &mt8183_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-rdma",
> +	  .data = &mt8192_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8195-disp-rdma",
>   	  .data = &mt8195_rdma_driver_data},
>   	{},

Can you please drop unrelated changes in mtk_disp_rdma.c and send a v8?
We should aim to get this entire thing (8195 vdosys1) finally upstream.


After dropping mtk_disp_rdma.c changes:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



