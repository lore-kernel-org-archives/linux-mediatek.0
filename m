Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCCECD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=; b=yg4ougoB63vAq2QskbPzP/mwBx
	OG7sl/ttXoYrMxV9AI1TRSkcVaXPdb957EH0wW3bVQzsXAtxOdqmDmypCE5sqnWRVYFlv4Pn7JK/C
	wgNd6djdmDYB224TmABj+qI0ez/j00boO3AHuCRaDdvMdRzYDzreztGAQnj2FFfQDoYMMUF/1UM/2
	5Qzxm2tS1X4bNY9ZnB/b+BI/DsoyqoCLNO0cB94PsDU88LqA/kTpn2BFgDjUw3r6cKRCzd+Yb7ai+
	WkvIi4Yd/G0fVWp49xuxhWvWRY+giz+qVAIDe6wBzHYY0+u4t0A5ZP7tgU1wUBXYE6iX2AYbcq9gp
	if4byn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZMb-00000007cwI-0UBk;
	Wed, 10 Apr 2024 14:55:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZMX-00000007cs2-3oRr
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 14:55:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-416c3aca500so7966415e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712760943; x=1713365743; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=GrBXsD+kz7RV29IyPZUaAW5pLXs7TJFCAAih7SJv58uC6YAE/FMGS1N8W3+vo6LlYp
         Di2RFWFu2ejTMEncX8IpyBAzmX93wgR/XLS3BrXvT1JqDs7jBfgxcQ/gHLPju4odK8zS
         SSgCqu5WQrNAUiyLAluQ4Hy0j3/GANwkfAB8dKWpg/GZA82SjC5qljcYgjah3nYTBStT
         WDBhnTtZyL4zyJc0CA84lbTSgJk+stFr8/etAO5Nk7jqSBHsK0KNBPjGdDlvVYylmrIX
         3ovYp8RBjvs+RgLT/9DYldVUKnh9FZNmfX6OT2wU6YIoBeM+g7Xmg56aloualtmJRIvG
         yREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760943; x=1713365743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=m7HNKvrgzmL/VsaJA4VYrOy1/ghU8m8pHPrKyylpoBxw5Awq3zoNv738VtS/atjYRg
         cT+EfFg/7VGNnjtVlV99N9ymDQkONtZewaNNG6/EndGOpkj9EDkZMmMowkwLemS3Lhek
         ZdqmY8ZCA/oq3PdIhmXwgAxZLBBHOpf6lgs/nQoib5eM1Tr08vubxcaT+iASurdz3QsA
         Mpdmj8U/Yi3vpsHcMAWqAtTUyfIy4b3Xty/bUfEkI9RYTwhMyGJgTgwkaukurTRiZyUR
         1k4RsXdDOkNZkLshzIPQocZz8hyk+L0IJS59Ggc29KS1As4c3aeNUP+GkTRpzlgMhxsE
         s5/g==
X-Forwarded-Encrypted: i=1; AJvYcCVIrrlSrZHqMNKXysFI4AcZwRhQl9OebcM6w2UvGdX8tQG8kteQSx4z3Ox3iLupvHMMjsV2vyl/Z/4aRT7N5kW9s5wGZLrEd43lEONtPOGceu9t
X-Gm-Message-State: AOJu0YxLoOe+PeMsKsLQ5gG0ye1l8e+kAUmziGqBQJv40gw1jr3TklAj
	Lt/NseNdhPbEh0jk70mU1Hc2rdZTwtUEABmzcoWWq0M71+Fa9qIdj1rpczjkxs4=
X-Google-Smtp-Source: AGHT+IGNeLxOaiscREzifrbAz46PPEQrwOJh5pOyr0RZ/5W5R5nlpeialGLWcsM4T9o9oxKaQqjncg==
X-Received: by 2002:a05:600c:4511:b0:415:8651:9b8e with SMTP id t17-20020a05600c451100b0041586519b8emr2356050wmo.39.1712760943089;
        Wed, 10 Apr 2024 07:55:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bg25-20020a05600c3c9900b004162d06768bsm2523860wmb.21.2024.04.10.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:55:42 -0700 (PDT)
Message-ID: <c86fb571-fc66-4549-9592-9ea984f3e49b@baylibre.com>
Date: Wed, 10 Apr 2024 16:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] ASoC: mediatek: mt8192: Migrate to the common
 mtk_soundcard_startup
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
 <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_075546_041884_E4C1A4F9 
X-CRM114-Status: UNSURE (   6.02  )
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

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Add a const mtk_pcm_constraints_data struct array with all of the
> (again, constant) constraints for all of the supported usecases,
> remove the duplicated functions and call mtk_soundcard_startup()
> instead in all of the .startup() callbacks.

-- 
Regards,
Alexandre

