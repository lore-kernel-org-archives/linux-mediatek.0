Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0703C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfM9RBMb+AqS/bclRfdAQ3saXdOiyOPPt8hFK2yZmnk=; b=azJTpvJTtKSYGWdJOAtelosah5
	E1+UtlVjLiSnyRAMMK7P/LWcSkoVugbGXgE1yGvsELUcn2uzavVjpF7iQUapAZEkAIQ4CBybAHWZP
	ZJy2HvbjqCLFH+QLVEnnk0E5hY/j8StnGlt2wEz2gjpWXVEkWmEZYEc1uanBNzr/3KaindoNjqUVD
	arTGJmK1+H5SGugiCKu2hgLE7dtXCG3KO1ztVaqIqtKHP4HixlJgp1/1vHnxVIgZhq0Xc7GuO+uCv
	2xlkxkqOnJGdoHAmP5znspeiP85miH3+tvDCyuap/pkrFX1fodOy8Ok+q6jZgJZKq89ln7SZ+vIoI
	AkyTg6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ivk-002L6E-NW; Fri, 08 Jul 2022 08:01:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ivZ-002L1R-D5; Fri, 08 Jul 2022 08:01:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A78266019D0;
	Fri,  8 Jul 2022 09:01:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657267283;
	bh=LzbKmXmv7B7il/FKmq7QEq+6QN2jxgs/LXih2F4BwGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CjlJ+P8svhBRvMCG/0a0sKlb5G4gVagcN/c7sYzlGDV0AlznmiMr22htGcxjwHECC
	 qQKaGh5T9bsmqD1OCaP/ly9krlA961L8r7Vu6g3wK7WhMBZd/l2h6zWEITQvyY1HSP
	 rkgWbC1mffjvVsLGu75tZ+i1cjUMlDE5YjgTp7j9RcIZ5bO3TvMZQobsjxRX4updi8
	 t4+wGN2LqTvio2dWsk6hpC8E6lK3TyL9VrS3I6Wn+Z6pTXts220TGrWcDEWbZqlA/g
	 RVXOV22Ogoe45YCF+hIepEM7jvRx/nF7jW5KBqGZZXZcSh8K8S7F8Sk+2ud4ypjBc1
	 /JN5dK6+CBpFQ==
Message-ID: <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
Date: Fri, 8 Jul 2022 10:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: Zhongjun Tan <hbut_tan@163.com>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.c, tiwai@suse.com, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, tanzhongjun@coolpad.com, colin.king@intel.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220708024651.42999-1-hbut_tan@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708024651.42999-1-hbut_tan@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_010129_625154_85F0628B 
X-CRM114-Status: GOOD (  13.28  )
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

Il 08/07/22 04:46, Zhongjun Tan ha scritto:
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> 
> Remove condition with no effect
> 
> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> index db71b032770d..6be6d4f3b585 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_PRE_PMU:
>   		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
>   			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
> -		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
> -			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);

I think that this needs some clarification from MediaTek: was 0x31 a typo here?

Regards,
Angelo

>   		else
>   			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
>   		break;



