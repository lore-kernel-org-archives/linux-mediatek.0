Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C78EECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umZi9yP51lcJ8RnrYZCo5jDOmCTZJdRYUd8lcqv4bzE=; b=aDiJyyN14OwoAFfzod6AIePRAL
	NaNQT/sKS66apP15kqciQf4kVmsMhhOabwC7g0HPrOnkFk/cX/R5BzRvhA1MHXWG67q5So0atrFIp
	LlYPhpt9Pq7T67cqXr5tN4yfEJgLJ2P+jINMPclF5hKsXdFgPY1EK3dtX89Ri7W6Fa7HY2reicenm
	wtYvsGLbVufTZoRkBnEfCmchDibO3Hx19ATnd/hOAm7VFR0w/1w1ZZD4713tdWtjxfBgwYprwXN+P
	1vrsRTeGBpdiGwxNIGSQRyu3m0VvyuGFPJ6bdD0FuPwpS4//S9qdkQF1eIOYaJMoWVuns1sug4DDM
	Ld/BVwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne5H-00000001zOe-3i7w;
	Mon, 09 Sep 2024 13:05:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne1Y-00000001yXF-1Wih
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:01:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so6131175e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886903; x=1726491703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umZi9yP51lcJ8RnrYZCo5jDOmCTZJdRYUd8lcqv4bzE=;
        b=ezWSI1s6uA5lV2I0pQT91mD1vybkUfkzOZP25FB50BaDi3kFZaMXtagI4JTmLAiyQj
         e5yoy2U16BEhis/0swFmis1mb/2Gt57ILPLobQuqBWvYGC3Y4aOdKsQVF75QOZTrnGRR
         Llnasvoc6bZ8XnXnnSKHHFlfrX8E0HGZMt+ngJXHY1eNbPTl7BXHIAfLn67slomc8hPK
         C08SdZ+ufRcDtvY+JK7bBbjECqzM5x78H2wajCUN1c9m5ruXxFNZEi/3/IHHL30oRHjj
         MS/DL5FffbSh7vW0KlU8G/Aght0pjEDy1r5DjkXPz9llxqURZyuXpD/Jbl826472kGhC
         yGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886903; x=1726491703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umZi9yP51lcJ8RnrYZCo5jDOmCTZJdRYUd8lcqv4bzE=;
        b=nWDqxzd6RmD0LyM0GeWVE/M67JUoTlEbRcUYcRC3nhJS+m3exA5st9a4CxRUfLHBxz
         21MBlow5MVGVBM5GFcdcMperqZgs6K5E1rT090zDgfMDuQtL6alB6E/jO28SsNWx26an
         M0WG8+ZyjV73td7QdQHArWGHBlA/j4jGgzpcX1wWzh/dgmH83h0sUU9uD2QHy8Be5V6G
         LieCMTtRbgzm3GzObF7+c3bPR7qMUbs6kw2ZZsEoTb7uh03Fl6GIqVRXOZzgYTpD4rSI
         MX0p1z939RxMIviTUDYQFCkA2MK1tpvUDGZEVHux6Udngi8DYo31e2TbBJXM5r8eWZ+f
         yiQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2+ZkfThp4y4jEuH5tEirurgokh28llndoxS6YaTF7U/61OqjokrGA9JsCV5KLvQdO7xxjqggI/pJTcBlEaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhCxR59RyE+GTbSgd27rEg/TbYsLtZbUe9SJj64dW93zbG4kTJ
	2RRZdne+lbFb1emwGMh9vuuHaKs1kM576iy2EGbLaJ47/ULnOKZQi0Fwnota3b8=
X-Google-Smtp-Source: AGHT+IH9Romwpgt1JE9YYIpT65omJV/odmabpcbADjq2kLQrDj02YgN6/FmS8gS8gLzsLuEGe2rV6g==
X-Received: by 2002:adf:ec0c:0:b0:374:cb5c:2966 with SMTP id ffacd0b85a97d-378896a94aamr8655060f8f.40.1725886901672;
        Mon, 09 Sep 2024 06:01:41 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956652ddsm6040100f8f.29.2024.09.09.06.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:01:41 -0700 (PDT)
Message-ID: <ce36e6e6-2e56-489c-be15-5a2d84d035b0@baylibre.com>
Date: Mon, 9 Sep 2024 15:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: mt8365: Allow build coverage
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-7-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-7-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_060144_445169_FDDC26F5 
X-CRM114-Status: GOOD (  14.53  )
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
> There is no build time dependency on anything specific to ARCH_MEDIATEK so
> enable COMPILE_TEST builds.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index e6f7a5a49794..3033e2d3fe16 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -301,7 +301,7 @@ config SND_SOC_MT8195_MT6359
>   
>   config SND_SOC_MT8365
>   	tristate "ASoC support for MediaTek MT8365 chip"
> -	depends on ARCH_MEDIATEK
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>   	select SND_SOC_MEDIATEK
>   	help
>   	  This adds ASoC platform driver support for MediaTek MT8365 chip
> 

-- 
Regards,
Alexandre

