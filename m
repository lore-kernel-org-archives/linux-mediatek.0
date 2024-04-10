Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2ECD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNwy39mEHd5CSC3eirYZIbXLLfL+/dRw/DVFAe0gv+k=; b=kewODTCr4PfiW+WeDtv/1poS/t
	0F5kVjbt3HjmCnIWCE+RHCf1OvJC7OzyBrjDMs1gOhMg1xFDu/AGA5DKe7/Vr/u8bXFRzm4W6X4y5
	Ooe/PragxvzbMAADDt61gm+UZGy4xgc3MQUsiKqVE84PZLEF8uvzIFeOR99Yy40q1XO+EK+KOanI8
	HZ50kUCTO0raU/Rxtp8C3cR/zO343jG1Nky/cMna0Ted3ddjXlmI+HPhyy1qPeEn0GnA9mWD8yWth
	67QgWApeO0sbmyln8s2Rm6HRIkvBaAoxCoC+dQDxsOE1X6smQeVtc9deUd+w4iCFg0yuwkNj9d5NN
	4EY+F/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYHN-00000007GTW-1ZYl;
	Wed, 10 Apr 2024 13:46:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYHI-00000007GR2-2P8U
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 13:46:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-416a208d496so13798175e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712756774; x=1713361574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNwy39mEHd5CSC3eirYZIbXLLfL+/dRw/DVFAe0gv+k=;
        b=di2Ypx2ZvxClDwt/kC0imRXtuBYVKAGA5bGULj6HKwLVxjsyihuHNvwHZ5cVy4MtEE
         8YSqjw+t78xkMtgR+44xxOpKvwlDPdGSyAXmJcbltSsoK1zg4yLcE80Ia7duzX/u7wR1
         72xuW4EIAwo2cv3rkOwl5kfUZM1QVPpjqHohfWlC1PdlSHiSK9OTddQBolmepQxizm9p
         UKxOSJ4qVklxycxpHyeLGXFt9P3+Dtgqj04f7YXH1XOUXhjUSENs+8J7HJbwLjpVUHQ4
         ObWdG/JGonegP8MzDmS76a4VljBBfJd/TCcufNBo2cO/RGyZCwaldscolGaiKjRzjiIn
         V+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756774; x=1713361574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNwy39mEHd5CSC3eirYZIbXLLfL+/dRw/DVFAe0gv+k=;
        b=D3a7EN7QpQYWwv8qNkcMB9zXLwhcHGEB/11SK1CHU+KNwGXR5i0o6fgTigSq7xhTqI
         AXtK0z4OaEXWPzx20IQLeG0XdNewnkrO7e9RSg5ngd/Z4H34zLYnZ5bL+b6vG3OgnGWC
         1cWBv6mBTKW/ERbUE5/HUzInMnjCVZTvZj1BABy2mQBmGPoTrQXQHMrGr5DMkQbVrndn
         6y0VBbPbufUt1yN4oEq3NWTgi7ma7xu3uJfC6+0rBV/Kgj74VmaDS8hz1R1sPCt5pYMz
         r/MOayN4OU/BzV9hkToEHaxj7PqlNGPrljms9J7glR5O+0/CBpJphwFXt97HK1Bl7mBk
         /ELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQy6AWFBKc11s0PqIq69jfIxa5WRbcxhAk8S0x4r3XTgvrhQUQmRnEzB0AwH9Sc/KooGONGzkT8vTDjp9VwRqWKlrU61njL8GdDv7gVuCAGLuw
X-Gm-Message-State: AOJu0YzR4R4swSRyCV+9A41BTl+32FgniizHH+QQNIoYLulbp/gKtY3y
	vBGPBO90Sm7JT9ZK7PgUUOKYcyHM6UxWn2twoe+Uhf6Y8+6TQ69zlex67EgD5q8=
X-Google-Smtp-Source: AGHT+IGxsQggXycRi+dm4Bw4Xi8pQLO4aefRSNITx/omDNTFi8n4uULRx1pb1qcEcpuljXdkWzOSMA==
X-Received: by 2002:a05:600c:4446:b0:416:c990:d668 with SMTP id v6-20020a05600c444600b00416c990d668mr1409845wmn.8.1712756774480;
        Wed, 10 Apr 2024 06:46:14 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c4fc400b004170e0aff7asm1931574wmq.35.2024.04.10.06.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:46:14 -0700 (PDT)
Message-ID: <dba5a3d3-97ba-491a-9290-35ffd42c740b@baylibre.com>
Date: Wed, 10 Apr 2024 15:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/18] ASoC: mediatek: mt8195: Migrate to
 mtk_soundcard_common_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-5-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_064616_619088_C646F418 
X-CRM114-Status: UNSURE (   7.44  )
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



On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> @@ -29,6 +30,13 @@
>   #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
>   #define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
>   
> +#define DUMB_CODEC_INIT				BIT(0)
> +#define MT6359_CODEC_INIT			BIT(1)
> +#define RT1011_CODEC_INIT			BIT(2)
> +#define RT1019_CODEC_INIT			BIT(3)
> +#define MAX98390_CODEC_INIT			BIT(4)
> +#define RT5682_CODEC_INIT			BIT(5)
> +

Why are you using defines+single variable to track inited parts in the 
probe function but do it in the different way for legacy_probe using 
bool: is5682s, init6359 ? AFAII, both can use the same method with the 
defines above.

>   #define RT1011_CODEC_DAI	"rt1011-aif"
>   #define RT1011_DEV0_NAME	"rt1011.2-0038"
>   #define RT1011_DEV1_NAME	"rt1011.2-0039"

-- 
Regards,
Alexandre

