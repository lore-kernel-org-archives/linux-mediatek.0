Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF45FCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+liYlweKIXu6N7S4m/k/bRDBUeKAJt2vxuhR0nl/B8=; b=q6GKj4QsFv7FZD
	0Kgg0ohROaKWaZU6TkTGpujJ00AW8kLpw464nQuej0+yVvmWF5rYMa+2rSFPMm8U5WywPDFj0/+4P
	RFtbxn5JA31V3tv2r8NsiQPV+IGBUiN7dft2CJoXetMt6wIVcNz8PGgHwzfyYQqR0n0vW0w8R5KgO
	37S5FXJUamMrR40um8Fu4+Ktax8n3s2AYlDvXLqDmtA36CVElLKpgi4KDcPDYysWZuRzxyA3cOBUB
	7bVeTaztuAQmgctgHyvcut5oe0canR1BAcNlhXsNugSxfa6Y+g6lYcz06+Ruvr/myyrJTRIrz39gt
	3wM3Bu9a7Zd1h0ikMrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggQ-00Bse6-2R;
	Tue, 17 Oct 2023 09:48:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggG-00BsY7-06;
	Tue, 17 Oct 2023 09:48:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B622866072E4;
	Tue, 17 Oct 2023 10:48:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697536082;
	bh=f1idfIPcMQyPsHWuXPvo14v1fXq19rfleCQgQ3pX2nQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghVrzDasF81DZVT5kyGRSpfn4vBQSmeCCtp+bj2xMA7Sy2CmffoVSer/w3Kl/6CjQ
	 c8sRG3qh8tdw7vbDh8C6u69DHRvNTyuX+jswhW/yi6i6YQi2X1PaPDKZT6+hNszKF5
	 ujAhV0eypK8FgOXIIQCtwcTLnydbG1GN9LPT7SzS+WcvvODQhv6/2WAhoZ0AWaJRW1
	 RCizx0T0ReJ6HvHSWEUgMnVJhAK74VPYU0toJGYuXC7QixDoSHoOpm2LTWM36jWCxx
	 cUHiZ/B5qEnXKINHuLX5Rq3x4YNPxkJV+UoczSm+NyGTy0GpMw9muiYGsgLBYCBAdL
	 sDW9UTyx3x2ew==
Message-ID: <97dae7c0-0bcb-456f-b808-b794ba9e3c8a@collabora.com>
Date: Tue, 17 Oct 2023 11:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/23] drm/mediatek: Add Padding to OVL adaptor
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-19-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-19-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024804_205304_8214D1F2 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> Add MT8188 Padding to OVL adaptor to probe the driver.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.

> ---
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 354ba6186166..b80425360e76 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -29,6 +29,7 @@ enum mtk_ovl_adaptor_comp_type {
>   	OVL_ADAPTOR_TYPE_ETHDR,
>   	OVL_ADAPTOR_TYPE_MDP_RDMA,
>   	OVL_ADAPTOR_TYPE_MERGE,
> +	OVL_ADAPTOR_TYPE_PADDING,
>   	OVL_ADAPTOR_TYPE_NUM,
>   };
>   
> @@ -46,6 +47,14 @@ enum mtk_ovl_adaptor_comp_id {
>   	OVL_ADAPTOR_MERGE1,
>   	OVL_ADAPTOR_MERGE2,
>   	OVL_ADAPTOR_MERGE3,
> +	OVL_ADAPTOR_PADDING0,
> +	OVL_ADAPTOR_PADDING1,
> +	OVL_ADAPTOR_PADDING2,
> +	OVL_ADAPTOR_PADDING3,
> +	OVL_ADAPTOR_PADDING4,
> +	OVL_ADAPTOR_PADDING5,
> +	OVL_ADAPTOR_PADDING6,
> +	OVL_ADAPTOR_PADDING7,
>   	OVL_ADAPTOR_ID_MAX
>   };
>   
> @@ -66,6 +75,7 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>   	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
>   	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
>   	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
> +	[OVL_ADAPTOR_TYPE_PADDING]	= "padding",
>   };
>   
>   static const struct mtk_ddp_comp_funcs _ethdr = {
> @@ -80,6 +90,13 @@ static const struct mtk_ddp_comp_funcs _merge = {
>   	.clk_disable = mtk_merge_clk_disable,
>   };
>   
> +static const struct mtk_ddp_comp_funcs _padding = {

Please, _padding -> padding or mtk_padding


Thanks,
Angelo

