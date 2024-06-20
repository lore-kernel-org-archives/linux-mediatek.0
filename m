Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C8C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCIO/o/A9Ks/njWCY3587q/pF5POzt7gd6y+7P3xLo4=; b=SLlFGRu6SsVUm3iQnKXXVkr4WU
	9YPEAwlEvmMZMM53R4z5pZsKVCc8ylWYoeNE3WEcNodPBj5xUFh00oAkjPHXvoL8v+tnoZS8Oaq0e
	f/6ODztSU7cv+VtuoO2wzKFtWKtnm/Jh9vyU0xIM0eGwv1WUN/oDo36Yy2lL+DDoxo2KZjbe4PXvp
	STPxTprNhZXfB0N0UV8689MIf0jw1foyyNjD0u4fZL+rBQvrloSaKTWGboROeNe4vNELSYwbLAc+D
	IHw3VZtIZYL3CN6hxoyp0FwcTJiJ7KJDFe5OVBvdK4XDJxieiSHQltTI6nInpL7J/I0UqbhuTdL8J
	28ciMyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKF0U-00000004Zan-3B6o;
	Thu, 20 Jun 2024 10:27:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKF0R-00000004ZZr-2Zfn
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 10:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718879222;
	bh=MDwHYzc+sSlTWkT2rzpeIoOGVSVCib30Bhl9mdbk5R8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JwAxtL4DZSYlvz9FRg+aflJ3XNf4s0cUBbBLbl1vMvOi0PX7/oRVnmVgG04dTst+E
	 FpGMpsy7H9OYgMd3+3DfpO5u3h/w85co3skjyHsZxK7ZemlqghEP8rN/tbbgB8vyPH
	 R/efrvkdAfnfg9CmcAiRCiHbxUB1Z4LIQ7n6sTau/ft2nPRqUA8yBFIDvPrCxi7Vbc
	 dI5R07TQaPgUeB4RIc8jgqEeBR74u3+zyis3bHbcPZhsfxKB07WEj+RCKyltbYitaH
	 OLqZed51xGYPGWFKBxiSRv/7o3GKa1vNbIfeALHcny6t6dYyYuFSE+aRhyIAZmhxfF
	 gNmyxsmQAHEEQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AAA473780698;
	Thu, 20 Jun 2024 10:27:01 +0000 (UTC)
Message-ID: <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
Date: Thu, 20 Jun 2024 12:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for
 ETDM1_OUT_BE dai link
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240620092526.2353537-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240620092526.2353537-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_032703_827424_D4932267 
X-CRM114-Status: GOOD (  19.26  )
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

Il 20/06/24 11:25, Chen-Yu Tsai ha scritto:
> This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29da.
> 
> Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
> some reason. This does not have the intended effect, as the remaining
> DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
> entry, and the platform entry is completely gone.
> 
> This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
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
> Re-add the entry so that dai_link->platforms has space.
> 

Ok, but wait a minute... the commit that you're pointing at in the Fixes tag is
a commit that fixes a problem identified in commit

13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")

to keep it short, after that one, without removing the COMP_DUMMY(), the audio
was broken in .. some way, I don't currently remember specifically what was
happening, but I had no sound at all.

If the problem is not showing up anymore, backporting this commit to the kernels
kernels affected by the issue that I solved... will break sound!

So... well.. that's the "some reason".... :-)

Cheers,
Angelo

> Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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


