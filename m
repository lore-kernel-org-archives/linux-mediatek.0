Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A552BECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJ2Ks2SzIHWrbePz+44veAyPxFRsiZ4mtPWykrfa3RY=; b=yzZ9OpbiBqfRsEQK7XsXR2OjmV
	XIpjPpKI5z5MpjpAFte8F2b1sELw8k3EI4akJL8YCiFfUgQJTw6Z0j3QfElg/WlDRfDlz2UK//XiJ
	uazxocxV/1j4hQku7PEkRZft1ljy7mZcpU/qMteZgwwHrsWz1gBB1SGjhJ7E5TFo+KHBi+AxpYLdb
	QxuxWkv6je2odHUw7gOcG+Ja8sWhfQtE8gscEHyikl4Z3pX4A4EqrgZz1Q4YCK5Pffgo2Hbg1+eFD
	pbe+ysP3V1eE1rxHi1hQvHmevyLks7t1RfYV1rNCXxVuxNt9NCQoD3reTSbyKsxxMbO9EkmPbITB4
	LcTq26vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndzO-00000001y7V-1JBA;
	Mon, 09 Sep 2024 12:59:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndrk-00000001wAr-37Lh
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:51:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-374c5bab490so3283264f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886295; x=1726491095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJ2Ks2SzIHWrbePz+44veAyPxFRsiZ4mtPWykrfa3RY=;
        b=LJgizqd7ChPlf9MeRR9Cl6MmOnq6EZgoijfMOWR1/QTWWqRn4RX9Ya+Dgy+TD7ml9K
         ZeMM5+vOOw6jMhWh1xBLPsIiMgQ3e+AKC4baS0F443BAtooiPAHVHbxxZ1rs/Td5p1jU
         EM8YWClHqSRCEXsz9XmkPL6OKxXZqxjE3C2ewLeDg3WKpEs1EYnmJFFqpYBljajgpNiF
         XqwWMCbhphYdGwr53z+sXu8V1zYz4m6Gzb0bDI85L5Gfm1E5Tp8/loVIE2IY4syZahQc
         TEiig6X/tELc6KSE4w5JEubHlgBNkJaSuhJMnuePj3oMXn6IeFHUmix82azLF8cyUeMW
         YMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886295; x=1726491095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJ2Ks2SzIHWrbePz+44veAyPxFRsiZ4mtPWykrfa3RY=;
        b=e/E/qOABHVp1R0FV3UEdQqVU0Dz0TyYzWGzFzqIrlC+7GEaOTqI/9cw05oEIfflok/
         RoXfX3h5KdY7QNWJQfUR/5CwlkL5X/oBfrsShLS/MrPU2dvjiM8kuvxjMH1EBGOWRIy8
         SfKJwGoYvs3pQdQ95Ube40dbRDsihqe3lTWt3eTb9Hm0BgEXgySWpJtpUJ/sbHOPkzxB
         VbHI1UoRfQuKdHMgOZ0hj8auZHeteT4pZyEqM2UTicXa/Wg4cVp48mNw/KY8EzKMDksi
         CJU5KCwJYTC4bpllB6k1BgFW75yLsCfpyOl8lJQNGnXr6+BpFvldTFQooU5dRXVs+dFS
         SvKg==
X-Forwarded-Encrypted: i=1; AJvYcCWVEh9907j26oeplX73kg4pTu4leJnCRExMPnW1cr2NLyODNTedEK49LPLwnd4cQW3O8fUeEsST5C9bAQn5DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkCNG+2tm8po6xusTgIk3QR8h+jthdj+sPUAxmPV80j07gthOf
	gPFhGh1B3EFejC8s2w2ggytSswvAg3W/pjcFDgcuDm4kvtEG6BPpIx5Iu/+45ZU=
X-Google-Smtp-Source: AGHT+IEdh2bujjJqWi9VgZ9tGPxOdGbD4BeCjn/5is4c/ki/hcUfGEw1iNBzWOGI2bFRam0XXHp2jQ==
X-Received: by 2002:adf:f78b:0:b0:374:ca0c:51b0 with SMTP id ffacd0b85a97d-378885d0348mr5147113f8f.12.1725886295003;
        Mon, 09 Sep 2024 05:51:35 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3941sm5970616f8f.84.2024.09.09.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:51:34 -0700 (PDT)
Message-ID: <16decde3-f9ee-4962-8015-239c53fe9b2e@baylibre.com>
Date: Mon, 9 Sep 2024 14:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mt8365: Remove unused prototype for
 mt8365_afe_clk_group_48k()
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055136_833030_AA9BF671 
X-CRM114-Status: GOOD (  15.88  )
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
> The function is not used outside of the file it is defined and the
> equivalent function for 44.1kHz is not prototyped so remove the prototype
> for this function.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-common.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> index 1fa87e54a57f..731406e15ac7 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> @@ -421,7 +421,6 @@ static inline u32 AutoRstThLo(unsigned int fs)
>   	}
>   }
>   
> -bool mt8365_afe_clk_group_48k(int sample_rate);
>   bool mt8365_afe_rate_supported(unsigned int rate, unsigned int id);
>   bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id);
>   
> 

-- 
Regards,
Alexandre

