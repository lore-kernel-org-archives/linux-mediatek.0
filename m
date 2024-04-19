Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0285C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oj/cIL9wN8HgB3px3XkG2m4KmLP04cwNnMao0gicrCo=; b=MhnJ9QEOoUdtccPGSV6BBNhi3b
	4jlNiilBt4cTKErlVYsHWYF1G4q44bhzTpgzicx4IDBekH5FiF4eBZhQ/WBwJ8VTrhSTzdqnkR2Xx
	JApb3AxtuIw0bGVtIibRzjoSgtaUFLIRt6DKXhITryYZh6J7RiZHm7paV4FGlvNfAY4zgE6/fAN6E
	VO+t+iwZ42Q68wCUY0bRPDpc7a0fUjHQHU9An32mlvIyP58F4d6grMYB6x9CdzVS/nmeCCDiO1HF2
	998rQYIkbmLLKj/PwIpTCIbCuFxkWeypYmO4lgK/PiDmGrbgXMw8rGJEnKvZsUfs6blKp8IjBIHY4
	Oj3MWCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjBJ-00000004rqw-1Rpt;
	Fri, 19 Apr 2024 08:01:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjBC-00000004rnJ-2sDt;
	Fri, 19 Apr 2024 08:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713513663;
	bh=bmmrpG9twzfl+7I9bjJ8i79tB8/NSeisn+ds2RBa2jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/JB5bjQ9tMmBy/2sL9FqxKtsvP0vRNp1Dip2qCJGzQp1mXq/TtcKSmfrt8NCxqX9
	 1C95N632nY+EA35Ny0jSzfyOcnkdKsn6O4LcSiNmYUbMmQTvVviP/DYSRDIYMEK4oK
	 CBAJ4tyuZHbTx59JXDEgqnsA/h5lTqr3xEXThitNy4iguMgnwFH8YGZ83nAxnuz0uX
	 tzw5ZGWf0gcg+nHzPehvGmhqG42uH7nX/4WtFfnAniRLzparrTnMGV4uKQoCkceKyu
	 nCWrJc1fVwgk9sFLVgRud+YA7lXx2yKulGRcXi4gj2iEf8liLZIc5RgTji8UfW65rc
	 g39BSWODH7vXw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7449E3781116;
	Fri, 19 Apr 2024 08:01:01 +0000 (UTC)
Message-ID: <9ef43fff-ee2a-4b2c-a595-30f5bf7588c2@collabora.com>
Date: Fri, 19 Apr 2024 10:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/17] drm/mediatek: add MT8365 SoC support
To: amergnat@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-14-53388f3ed34b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v3-14-53388f3ed34b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_010106_901267_1917C584 
X-CRM114-Status: GOOD (  17.36  )
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

Il 18/04/24 16:17, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add DRM support for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

There are two things that I want to point out. Please check below.

The series that I've sent for adding OF Graphs [1] support to MediaTek DRM is
not going to be picked in time for v6.10, but I think neither your MT8365 support
series is, and that's why I'm telling you this.

If your work was based off my series, you would not need to add the MT8365 ddp
MAIN and EXT paths to mtk_drm_drv: you'd just add it to the bindings and then
you would declare the paths in devicetree.


[1]: 
https://lore.kernel.org/r/20240409120211.321153-1-angelogioacchino.delregno@collabora.com

There's also one more comment....

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 74832c213092..427b601309c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c

..snip..

> @@ -793,6 +821,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8188-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8365-dpi",

You removed the mt8365 specific compatible from the DPI driver - why did you keep
it here?! that's not needed! :-)

Cheers,
Angelo

> +	  .data = (void *)MTK_DPI },
>   	{ }
>   };
>   
> 


