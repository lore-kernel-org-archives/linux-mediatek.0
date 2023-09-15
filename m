Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D78EE644A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuJ+JftYN/b1DEO/cNmTSFFteFWazy0/r1D9oFa3ynw=; b=eTuq84Xk1KJA92CrepUyYajIwJ
	B67KyW36YzOj13ztln3ZbnGNNldeRunO8oTtoUD5UHYh3RJA3SSByFQvlvbNCd1iAaTplaRBbYK/J
	HzGFsmX0l7tGuyqIKDFeV19hg9A3GLqeBNJnpwfhFcJG4mujIp/3uzlFXzX454HPHSrLVVNUHiY10
	tPjoXcCoY6O4p4BDCRJpMYAFeQxg53peArOinDIOVgPMT6cRi4+F2Da2aBWEVHK4m1+YrUXoIBAaW
	CDgsuw8P9vQbGH9uLSVHRNpYSpGEo+vRpmm2PBwta6Ga8f0Nj367VEmFoYNaDmENqsWPGoUgVH4Or
	5+1qsP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4ex-00AD2Y-0Q;
	Fri, 15 Sep 2023 08:58:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4et-00AD1j-0B;
	Fri, 15 Sep 2023 08:58:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3496366072BA;
	Fri, 15 Sep 2023 09:58:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694768317;
	bh=QvOarZtm9q0/2Kba7YS408C3On3CckrdIr72iCDGik0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R69HQPLoeSJeRPnLMYl37vbwbaKYVtZ638yOLvIiYj8GORIrmSChH0A86OyLeP3WK
	 szQREpUVuA8jzgUFa1NzVasateqS26xlwtwPcVMmnLLQmlKDdbnraH2fDpaAMRythX
	 pbctN3GX+1bMVJ18SZIHOgyF1WeOzbz8IsX00JFpnAlPV8Kp4yRj2FKGLttIc+83bg
	 V5ITMSFDWwLqcxc1+UNzeknVQ6RWXUTm4kt1xIqs1jMVxIP7yjjMdtidGnnjSofEwY
	 wmUAoyN9wNxHI9lSerXXcAcsKk+99WTGY0yYqfxPguiez+aWO/cUCcGJellnTtL4RA
	 xR7TrWis50apQ==
Message-ID: <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
Date: Fri, 15 Sep 2023 10:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230915075756.263591-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915075756.263591-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_015839_245167_BA1FD9AD 
X-CRM114-Status: GOOD (  16.71  )
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

Il 15/09/23 09:57, Michael Walle ha scritto:
> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
> definition") inverted the logic of the control bit. Maybe it was because
> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
> wrong and there will be no EOTp on the DSI link by default. Fix it.
> 
> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Hello Michael,
your commit is missing a small piece! :-)

Besides, I've already sent a fix for what you're trying to do here:
https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d67e5c61a9b9..8024b20f6b13 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>   	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>   		tmp_reg |= HSTX_CKLP_EN;
>   
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>   		tmp_reg |= DIS_EOT;
>   
>   	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);



