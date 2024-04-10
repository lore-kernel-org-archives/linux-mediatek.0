Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3ECCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFeYAr3tgWzelp4Qc502/jt9QrT83vOai+OT7e3SF3I=; b=SOb6iQFdEBIdAeCUycOASQxTc0
	a144u1Qqw3JFIVJTs2StO1/RaaeFqJxalUxxpWb41gtdx/WrLajhbQWnTo0q+kVuc3nob5j8w3z2x
	MppWce94CxcREVUoO9TAu9QblN9JrLB+j1n/F33Bvvareztxzwn0vSGBHzPGgc/uceJYxL3Dgrlic
	iSMqVhQWIdjBv0zIQidyLxqzOQjCuBwbz9AVFkHW6Xdlfq4zEfJNmycR92Yf05DifMElgTRyEFtKH
	jgGurBsw+RsEQ1fJVRCXUIWReoECfWSEnkL3KGWchhpMF2dsB8arfCZ266D01HAglw3tTVysRGHpt
	RJPy6xKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYuy-00000007Sk7-2Kow;
	Wed, 10 Apr 2024 14:27:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYut-00000007SiF-1Jiz
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 14:27:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-343d6b55c42so4853954f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712759228; x=1713364028; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFeYAr3tgWzelp4Qc502/jt9QrT83vOai+OT7e3SF3I=;
        b=oa6C6ln4msf33Xs1bkMOWMTznrBoqvXSikkYJQ9anFW3fKTehLqsZgZScj9fhXwpcG
         EgcCVqGUDSDps0fluh8uXjD9t5MSUyt6cBBwBTYNK2tqmBpmLinCxix+RF+11znnw+jS
         /h8hnbO8p1HVzjSpFnhHS80AvAO7T24zjFiAEP/DqzRGJP+2e6rZH13l6uEZHnsCyAyJ
         gWXMzBxAKZlIVTS2os8H4aEJRSAxNbPZ9vekmVQvdtub8csmusyncgHVlm7tu9v/TAXU
         pgN6xHX1d30WeKoWHV6+FBV5Z98hC1ODIUrUjMNO4NzKV4k+mmpxfQLcpFDX/tkG7DpK
         byrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712759228; x=1713364028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFeYAr3tgWzelp4Qc502/jt9QrT83vOai+OT7e3SF3I=;
        b=Px8UnRFDsXS3K1Qx8OxBAxDkLafsRJghdtQ0czy7dcf7uAs94fMywaVgYTxxtyiH78
         8nBzSqkNhGyfXDxgDHho9GzzHU4vO8yTLe/mZB3xV6Eo/8+GkYOg2tJNoZRyZg6xAye3
         DQivcejTDlXTKplTGZAOW9r6W2D/UuGhvQpkENrSEDHWkwGmvIJVFlj8Xm6OWTpfxYlZ
         TzcS3Dw+EOuQ020OclDXjkJYQfXADJVE89bS/LjCFzY1u/2i2Iyqa6pW7i/EKjCGUsjr
         6Gs+NnEcv56aDh0vQ9mjnzTGql6XOLq9lG+8XkmXMZBx7eDLDEeFEiiYX0C/giKolFC3
         AbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ByD0awTAg4UZRl5+qE4AfJ3wSGWGmhSJ/Yylxh9x9mJn1oyy4/OazCo1D2L9+25HQ0TsqAmYhDkFA5xMpVT0IQgIfbKmofs6VEnP9TcSUg7k
X-Gm-Message-State: AOJu0YyCIft2QUrxjw98q/qfRqWhLxtG5uAjYMIuZM9H9/8rmBTSEUu8
	95BLNp5Ro6PxDEVMksADMRHG2Ere5DMVjKp7oOhRuULlH/ZdPmJYFiE+tmBamCI=
X-Google-Smtp-Source: AGHT+IGSvVBdvyjiYeq1pMtO732y4Er6q/giXpAXAVvEFvGgI0ZjYjMZMlOGyJUSQFXanGM+QGMBOw==
X-Received: by 2002:a05:6000:188a:b0:344:4bcc:ed28 with SMTP id a10-20020a056000188a00b003444bcced28mr3345746wri.32.1712759228609;
        Wed, 10 Apr 2024 07:27:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d40d1000000b00343cad2a4d3sm13846851wrq.18.2024.04.10.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:27:08 -0700 (PDT)
Message-ID: <d334ddc4-3c8e-49d7-8940-30f78bff823f@baylibre.com>
Date: Wed, 10 Apr 2024 16:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/18] ASoC: mediatek: Add common snd_soc_ops
 .startup() callback
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
 <20240409113310.303261-8-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072711_419460_E057DE67 
X-CRM114-Status: UNSURE (   6.65  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> MediaTek platforms are typically setting PCM rate and channels
> constraints for playback, capture and HDMI/DisplayPort playback:
> commonize the startup callback by adding the PCM constraints data
> to the mtk_platform_card_data structure and by reusing the common
> mtk_soundcard_startup() function for all of them by getting back
> the parameters from the aforementioned struct.

-- 
Regards,
Alexandre

