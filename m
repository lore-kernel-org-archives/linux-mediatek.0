Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D08BECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj5yLv/ZZH1FRnKgAiHYKIRr56LuHNVkVtzMQnax5UE=; b=v+/AbpXV0QmYEIxCfMSbuhdZbm
	tevGwwrNSgNPFEnlkbBUAP9QngNM/ILu0yFRDxGNji0sTuPWl+qj2/RomtjUbMileEDD50Y9oGn6z
	9EIowlK9ee80k4e81FFnKXz2wC0A1dIj6n9dsVgdoJNsxxuLyizgleM8T9N29OIZBDpl+kmioMGwS
	DTRDcgiLVexkdHts8aCyipqZwaaK7j/7r6NO8zSB/6lF6ICzObUJYbQ0jowNxalYWS6eKDg4en9+b
	+77pMyJQVmQhYLwfbI02xw//Cn4OWxEQw/34g/SqG5UaSMSOwzfTtEiWhmKzMjlRtNl5tfgDSkpip
	sCVliL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndxO-00000001xf2-3yFq;
	Mon, 09 Sep 2024 12:57:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndrN-00000001w2n-0iCE
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:51:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374c7d14191so2942906f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886272; x=1726491072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yj5yLv/ZZH1FRnKgAiHYKIRr56LuHNVkVtzMQnax5UE=;
        b=k6DWr/BkRqtqmxiWXn4pbspauapYVb4FE+ZDS+DgliXjXHsUcjvjQxubpbb1B/q1d6
         wxBnU/YzJQeFzdi55XuOQkiKH4+Dk0UpUx/eU3NU0VdI6qO0/hNtEqprPiFa12pQcYMx
         WxTyrOWD+uFJSqdzC2BAIORn3LxSUk/lj5cQuYDkg1URaVvoUto+DKIBz+4L2i86E6El
         wUJ6RxL9oaRgCa5/PlPMPIIstp5U5EwGE4XisGjL6Qh0WwCyrEBuCpStALywf0nsvPnU
         iqRcXdMxkiTNEbDhN76zYTBzz0E0vrr2aZa0zYrbJRT27shUR6bRAv8iXyjJ+CaJ5CQU
         YW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886272; x=1726491072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj5yLv/ZZH1FRnKgAiHYKIRr56LuHNVkVtzMQnax5UE=;
        b=WMuuksmAyGYguaMRvvLQGQYwb0ZWDiKgWof7NRnwPNzmaLAWeIaMvwjatLl/8Y4DwQ
         +ZVVZ7xbfAziXISa0cupNemLWMGPXzLaNRCWBOOFs85c8FAYSnJYD6SHVihDqj/PGTuJ
         PLUG+uPQEqS9BC/ilqkgtrKG5er5SFfYj51du7VuPqrys1OgCjubWJW3uCaxx52b2ykK
         W2dJ/JBr6UmCDk54LQcsPpCwIjZTZVpgRY6a3enu6S8mV2tG8cWWVfWgnEb1xqiida/7
         FjmXeFL1u7DRkcx4BNIcjDkwLO/fyizgmRu2gu8NE1HZmwlbnZRkwHYF3Duq7pAyn9QC
         PpOA==
X-Forwarded-Encrypted: i=1; AJvYcCXbegEYTv3ZnVCsF7+h2Rr1kaPrc0MmaYtqFpC2mLVdwTHWHkPRoFAxtAWKC8I8M1n/F/B+kNrFBerL90xhdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Rli6b0I05KkWY7evu35HFnS4H8mYFFtroIYRrpL2MbZKsTqe
	1mJ/tmdl/rG7GlHWMPm2CgaDsCJyBhyGWJFs49Urs2WECe94ipGRje6/h6mSHqj4GBzW0eEMu8C
	fhEM=
X-Google-Smtp-Source: AGHT+IF7+n0ukNJJ1C8zj6VSJDueCV3USNDHumSPWy7hUUSWu75cFlU2nX0q/4jHTWZ6HrRjePiq5w==
X-Received: by 2002:a05:6000:2c5:b0:374:badf:3017 with SMTP id ffacd0b85a97d-37888b34ca8mr8233636f8f.33.1725886271596;
        Mon, 09 Sep 2024 05:51:11 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d2ec2sm5998400f8f.75.2024.09.09.05.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:51:11 -0700 (PDT)
Message-ID: <5db7058c-79d8-4fc8-8f37-89cdde68984a@baylibre.com>
Date: Mon, 9 Sep 2024 14:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: mt8365: Remove spurious unsigned long casts
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055113_279555_3422E09B 
X-CRM114-Status: GOOD (  15.39  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The regmap APIs take unsigned ints not unsigned longs so casting their
> arguments to unsigned longs is not a good choice, the constants being
> cast here are all unsigned ints anyway.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> index 5003fe5e5ccf..6b4d8b7e24ca 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> @@ -385,7 +385,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
>   		/* disable IIR coeff SRAM access */
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
>   				   COEFF_SRAM_CTRL,
> -				   (unsigned long)~COEFF_SRAM_CTRL);
> +				   ~COEFF_SRAM_CTRL);
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
>   				   CLR_IIR_HISTORY | IIR_EN | IIR_STAGE_MASK,
>   				   CLR_IIR_HISTORY | IIR_EN |
> @@ -393,7 +393,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
>   	} else {
>   		/* disable IIR */
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
> -				   IIR_EN, (unsigned long)~IIR_EN);
> +				   IIR_EN, ~IIR_EN);
>   	}
>   
>   	/* CON3 setting (RX OFS) */
> @@ -456,7 +456,7 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
>   				   ASM_ON, ASM_ON);
>   	else
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
> -				   ASM_ON, (unsigned long)~ASM_ON);
> +				   ASM_ON, ~ASM_ON);
>   	return 0;
>   }
>   
> 

-- 
Regards,
Alexandre

