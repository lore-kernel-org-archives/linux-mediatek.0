Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A006C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jZydkKc9i7xAJsPNdcAdxjR7hb5g+ubUG2CQkh9stA=; b=lxTGlec2mwHF7Jn2beyMsVgMZX
	1rdwbvd6YH1aVEavr6km9eZdW3v6F520GdAKUg1yxXvxEyinyW29ITivN+MeJnaPDOvlKe/0yHTAt
	q06l4jvt+O72iQ/8Le3Edf0fBhSVmBg+ymZxu5WBrdBX1VvwoowCdukjxhgrKwcy85cIN7cE3hZ0e
	nO/PR91A7eATNFn1fm2oJ4De321C3rNa9cgR69B3jlJxLNdpHwJ0iedIDoWMGyr1WbOE0lmrxkNXR
	LQNDH7ahisV7U5WswgbNMo6Y9lg/Fz6o85jlqE9OEhr0W/AF8cqpjba+fEh1nlpEFg/kgyi8vJamP
	sS28Xqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeIR-0000000Fui4-0EaS;
	Mon, 24 Jun 2024 07:39:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeIM-0000000FugK-2mmd
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 07:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719214758;
	bh=V+/MuvOB5oRpHrUXIua2jOm8NVL5toa1d2l3vx43fvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kppcXub/wGYVKDXZW9lsyJvZlE+MHw94Ab2zNNosm0jdkPczLSeXIa1mX4CnB0TH3
	 Yb4E0vqO3PjC9VKzOt94QYra2asAz1mEXL6qdPrzeUV6k0kfkfIAGNjjidmDutXjkx
	 jsSsLzOtK/Ei0/dHmSjjlfMHlGaNxutpfeWUPXqGmg70DzoOe7p/L/gO5rcfofNGCh
	 UzEFxUwjQIZ9Xr2d5UaBFjQ0XqYnx37U/cIJpHRFV5DMamkEVIJW4boJpkbktShAqi
	 j78oPgSc40mkbwC6rOjvnJXUWGPueXDg5W3arSGPIQptFoOFBh/14pPeR9ZJ4u2DAC
	 PqUdQOigkcQHA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 950BA378216B;
	Mon, 24 Jun 2024 07:39:17 +0000 (UTC)
Message-ID: <aefe76a3-5712-4e34-8990-0463a5036324@collabora.com>
Date: Mon, 24 Jun 2024 09:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: Add platform entry for
 ETDM1_OUT_BE dai link
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240624061257.3115467-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240624061257.3115467-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_003922_883681_4CA701B6 
X-CRM114-Status: GOOD (  15.46  )
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

Il 24/06/24 08:12, Chen-Yu Tsai ha scritto:
> Commit e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component
> and rework codec link") removed the codec entry for the ETDM1_OUT_BE
> dai link entirely instead of replacing it with COMP_EMPTY(). This worked
> by accident as the remaining COMP_EMPTY() platform entry became the codec
> entry, and the platform entry became completely empty, effectively the
> same as COMP_DUMMY() since snd_soc_fill_dummy_dai() doesn't do anything
> for platform entries.
> 
> This causes a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
> in sound/soc/mediatek/common/mtk-soundcard-driver.c:
> 
> 	for_each_card_prelinks(card, i, dai_link) {
> 		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
> 			dai_link->platforms->of_node = adsp_node;
> 		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
> 			dai_link->platforms->of_node = platform_node;
> 	}
> 
> where the code expects the platforms array to have space for at least one entry.
> 
> Add an COMP_EMPTY() entry so that dai_link->platforms has space.
> 
> Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> ---
> Changes since v1:
> - Reword commit message with more details on how the original commit
>    got things wrong, and what this commit adds and fixes
> ---
>   sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> index ca8751190520..2832ef78eaed 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> @@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
>   
>   SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
>   		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
> +		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
>   		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
>   
>   SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,



