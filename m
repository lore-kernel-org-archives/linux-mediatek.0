Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950F8C47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqBRPhf/4Al4bvzqC17QWycRnYORcPlcqnWqPXsFmH8=; b=OvPxzsdrlZZ71TMLLXO2LX0QEF
	Hr4sNtbGsvtkgX5y7FzeTocKkio8JtHVzO4KRkmvZIJVTKCglhsoeyyRW+qHvtNn/IM2qD/XlmuEi
	UqV3ktITmmT3OsCP9OppPvf+kaNHPjHQX+Y0KvTEQ+Z/jwSAJjdpGJCRD9OcWwpfY2czXr3GoJsEE
	Ql+KleiycTUpX0Dxqs17nGPUU+ueLlbm8HCP17ulffVwugXnxjBUX96KOweuGeQIZ5zZBTJGnI8Vw
	YSVMdpp3nCCVj7fiT307XTX695AMgly2dzk6DF/fgMRSqPxdnrwrDLocx4ve3f/7SdiY//acnpubt
	2yDOR2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTzz-00000007Otn-0aYt;
	Thu, 01 Feb 2024 10:08:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTzw-00000007Osc-0UcJ;
	Thu, 01 Feb 2024 10:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706782122;
	bh=Zbw1duyIkUff9kk8iVE8KbWbqATyvr/EHkllKd6B7Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z86UnYCO3n19Iz57kNWMmT0uZdLi3ScTKbcJBmq+uANG3S3GFbOPzIJkYnPiv7imu
	 lUc7yeFkPdCt1D4SWAlRkJ8B/BsZD6IYrfSd+xZBOlFrLQ816gy5lOIt941oiRm0Ir
	 ZfDcRnAIDX5dU+tz1hR7gRSy2AOHRMOM63MJ5/Z4ih8wod/lPXx0uf9/3kfepJA2gJ
	 Z5qbo6PXrGxXuqUMFy63bWX4u+24WaAd50oE9I+koZVzdR+b9VjNd6jR7nx4l9dMTI
	 ad35+HPNKXoUiFt6v0zKjmmEKsRK/ewKAWOoey7c5HZApJ8cwmxuVO+bhpWWyUsytp
	 8eGV6rRexID+g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A3A5B3782081;
	Thu,  1 Feb 2024 10:08:41 +0000 (UTC)
Message-ID: <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
Date: Thu, 1 Feb 2024 11:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Content-Language: en-US
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 ribalda@chromium.org, nicolas.ferre@microchip.com,
 u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 trevor.wu@mediatek.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lgirdwood@gmail.com
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_020844_342580_134EA3E9 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

Il 11/01/24 11:52, AngeloGioacchino Del Regno ha scritto:
> This series converts MediaTek AFE drivers' probe functions to use
> dev_err_probe() and devm functions where possible and, in some
> cases, dropping the .remove_new() callback, reducing the size.
> 
> Cheers!

Gentle ping for this series, afraid that went out of the radar :-)

Cheers,
Angelo

> 
> AngeloGioacchino Del Regno (7):
>    ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
>    ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
>    ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
>    ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
> 
>   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  78 +++------------
>   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 108 +++++++--------------
>   sound/soc/mediatek/mt8192/mt8192-afe-pcm.c |  95 ++++++------------
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  12 +--
>   4 files changed, 81 insertions(+), 212 deletions(-)
> 


