Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2322C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKsYaHkOrnPElHNnLq6Hk4H0iFT5pj4tGI1GOOPLmlI=; b=emBQuFHadVt4i6tbvE6kVSG2ao
	BTh9ypIkYWFAqVJMfVz7GHbxgnTbNhfVqCiaaRshU/FFbSTRtKuYX8PtWXVGHlbo5qzjVMCy+bKSK
	Za+iwELdmmC00xG6PzB4ibRrm3QSHfxGD4ofeOEfwFNLcgZnO28lQdk8JDAWafHd/8h3ue1sGXnre
	rBRrfs4sr82Wa/zoNxA4FPBDOcPU++OSjfBSuOFH24Tzq9/OpogCPFCwY4KTs0S2nHqctudZEFK7E
	fh72yj+0HcsHrdelI6FkIn1QVKnY/v0S+sMntifYH0zy3wRqr8FQ/K0YpVZLC/kxfgs45DmJvLaNp
	+FnhsA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuc3-00000009seK-1CsR;
	Mon, 22 Jul 2024 15:06:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVubf-00000009sVj-0fit;
	Mon, 22 Jul 2024 15:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660742;
	bh=sLVyGWJOqBRBNhkFXxDmIXAIszctI5pJTbC9XTG9YW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOPefoLuebdSHdJq1uKoa3ninL9kZooNifFvsx3mwcbDkMiLG9Le8PsuMv2Az5qmw
	 fb7wUBZ1RafMUpHabpVQQWzIf7spT069mIYtw/tMqBhPx9YCTxEH3Vn1lfgzmIzlRW
	 eI25ASU2m9agr8tSSWAK6bgh0Gay842CsjO2KU0jVw5Mo5WKdEtwuyl26OTjOe4T4k
	 cvr4XnOyt5L6/kLcmmj5riPgzln6apRetpWzUYVJHYED/SatH3kXfNeeeXhY7xtm8r
	 3z8C+lpk6N5qBOGiSaNQAnN1IyFvgbxV7geleo9tW8w5iErF3ZXdzHu2TMIa1bn9e/
	 c8kTsNNG/+9rA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0CC8F3780523;
	Mon, 22 Jul 2024 15:05:40 +0000 (UTC)
Message-ID: <2938cb6d-b07f-4521-bd8b-b8f44dccf7c6@collabora.com>
Date: Mon, 22 Jul 2024 17:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8192: remove redundant null pointer
 check before of_node_put
To: Chen Ni <nichen@iscas.ac.cn>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 amergnat@baylibre.com, kuninori.morimoto.gx@renesas.com,
 jernej.skrabec@gmail.com, nfraprado@collabora.com, robh@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240709085131.1436128-1-nichen@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240709085131.1436128-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_080543_363384_5D4705FC 
X-CRM114-Status: GOOD (  12.49  )
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

Il 09/07/24 10:51, Chen Ni ha scritto:
> of_node_put() has taken the null pointer check into account. So it is safe
> to remove the duplicated check before of_node_put().
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> index 8b323fb19925..db00704e206d 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> @@ -1108,9 +1108,7 @@ static int mt8192_mt6359_legacy_probe(struct mtk_soc_card_data *soc_card_data)
>   err_headset_codec:
>   	of_node_put(speaker_codec);
>   err_speaker_codec:
> -	if (hdmi_codec)
> -		of_node_put(hdmi_codec);
> -
> +	of_node_put(hdmi_codec);
>   	return ret;
>   }
>   



