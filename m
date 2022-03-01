Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9P8IIdaR5E3bwZzxo8kHAmwOq8gSZ+PQY5l6rdZ0rI=; b=jreVmD1gO06xLn
	uio3SyDo97a2n9Pb9dck/D5VcO51OBoSK83ddFv1AbjuL8qhtc4lgIIPIwU8lO8oKcSUOc53EILD0
	IViOy7s1eVg1XRGw74pH1de6w2l5vaKkB/WWzJUYfB74E90RZEi8jpLUOmZTOVhdPqZ00SBEqe5yH
	tu5nlFUlziRfc4auJ48qEB6x4XcVKZU2CSfjrAiotO7J9wFGz+VGnO18NqxPWJT+sVSer+2GNqDcJ
	kwz4RcPBI/d2W81+w64WoNXnGlOgi1tZVX97BEfjZYGD4i+9Ix716DCkjA8Qhjq1Y01TIs0I6Fo/b
	HEJjraw+87I4t29ADsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOx7L-00FMM1-O9; Tue, 01 Mar 2022 07:40:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOx6n-00FMA6-Um; Tue, 01 Mar 2022 07:39:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m6so1768120wrr.10;
 Mon, 28 Feb 2022 23:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6qd4wly0ZYkUmRnAy3gZktl5PxXqoeJ7cLSu4TZL6L8=;
 b=C8+Nw59KMWOuBxqg2PDDm56mlc0KA7UwqTkS5hR4J7x31VCcaffB3b3Arxx2cpUSDe
 319ZSA+SJxvCN9E92HBjHkspHIibgEO26tZPaPlt3z6oCnt2EF2OsJCofQxOKdPyG6uL
 TqvetWOcwu9po5HQD62DvgKhzftqrEnFy1cmTS1xpYqb9VAP13lR95a3iHR5OierBZLr
 RmpdMce8IRHVHFR6Bf6Ptspn3e4UIx4pysmvxLQWD2bOwzkEM0XLK86o6K1PfN7GMCba
 aC4p4S+LKjWUlnlA/rmt14wAtAglWwM7IA3zvcoSiziAFMyO/t4VleAJwG+OIvAJnMZn
 +bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6qd4wly0ZYkUmRnAy3gZktl5PxXqoeJ7cLSu4TZL6L8=;
 b=Fvzz+LdnSDurivHm84X9jYyVgccmlrgAeK97kIfMkZ2qVKobSxscLnvpBrrcB2izMw
 pOEZE/qznqOt1CLFGjj6KJAPbTFVa0znYE/GjnOE4R1FtOqUAAdNdWmaYO/oJQ4dKQXk
 X3uIEkCz8I3jX+fzNwZ1FtPvNOCFBdp9Wp5pzUQw92qD3szpT5nZeyUI3aNKnnAKefIl
 OAB9szQar15JvMzG6Y6xO6FXdHglP66mva7ZDvOcvM87peGPjyTgQnnOEFXgiITOQR6W
 OCeWAbJZ8vY5HaZynObYg2TVvDtZ8GR48ptDTWeqEpknecsazpkCYZ/iQ7Taxj/msRHw
 5u3w==
X-Gm-Message-State: AOAM532+hnnr4ZIZtbwgSVZZX58pPxEcUAS+TSpT3AcQAcd0gCOnhqCJ
 7c7B1GR7BRc2Q+5G0oMLxjo=
X-Google-Smtp-Source: ABdhPJxVrjIm1agzAk9N23dwEgJBgrES/gCSzeZ7KtVImnSp0vU9M1HD+N1+6VZr1sFokVQSMEfqeg==
X-Received: by 2002:a5d:64a8:0:b0:1ef:f99c:8c12 with SMTP id
 m8-20020a5d64a8000000b001eff99c8c12mr3496161wrp.214.1646120384677; 
 Mon, 28 Feb 2022 23:39:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm667149wra.97.2022.02.28.23.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:39:44 -0800 (PST)
Message-ID: <9cc89fdf-f98b-8fba-eab7-ce292f6ae75b@gmail.com>
Date: Tue, 1 Mar 2022 08:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's
 input sel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yongqiang.niu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_233946_056333_AF89F246 
X-CRM114-Status: GOOD (  21.00  )
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



On 28/01/2022 15:20, AngeloGioacchino Del Regno wrote:
> In commit d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table"),
> the mmsys routing table for mt8192 was introduced but the input selector
> for DITHER->DSI0 has no value assigned to it.
> 
> This means that we are clearing bit 0 instead of setting it, blocking
> communication between these two blocks; due to that, any display that
> is connected to DSI0 will not work, as no data will go through.
> The effect of that issue is that, during bootup, the DRM will block for
> some time, while atomically waiting for a vblank that never happens;
> later, the situation doesn't get better, leaving the display in a
> non-functional state.
> 
> To fix this issue, fix the route entry in the table by assigning the
> dither input selector to MT8192_DISP_DSI0_SEL_IN.
> 
> Fixes: d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mt8192-mmsys.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
> index 6f0a57044a7b..6aae0b12b6ff 100644
> --- a/drivers/soc/mediatek/mt8192-mmsys.h
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -53,7 +53,8 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
>   		MT8192_AAL0_SEL_IN_CCORR0
>   	}, {
>   		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> -		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
> +		MT8192_DSI0_SEL_IN_DITHER0
>   	}, {
>   		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
>   		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
