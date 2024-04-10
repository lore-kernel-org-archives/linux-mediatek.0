Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6499CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=; b=aDd6+p/WqVshIACcZFmrGPaxW9
	fva7dwkcqd4+19PP5W3W66fyC46aJy1ipcJ+nXeNA2MprsaCFTDYgeOMAYkaxvvfxm+g0ycV0LzXG
	rg7S+ZVmFpUYzXHj9afvYRPTsudKG5u+grWpw/Ki6YQbIKqaX7q8VDY63/SixH5w3Qsz3bGIHgKGb
	JRmK5P+ebs96vOHC9jlMlXh/uUcR9rAEnU1ng/dxvSqPbQ/x5RsPitPyPZBpUZ4/mtzeOXH1g7Ncp
	RvCy5q+TqbPLEI5I4bfNgot79Wf+JJ8wRX2wtLylyHnf7Sfb2stv2tVFuAs5LnklnkdcK9cBVrowM
	ItAMoh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXLX-00000006wgK-1nZr;
	Wed, 10 Apr 2024 12:46:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXLT-00000006wbM-25pt
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 12:46:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-416920b1a2aso17339785e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753183; x=1713357983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=rZJWSfGxroUYs04DeJ2tWgSvtaMriePp3xdaUe2r2NKg9ZXSpHJuwmTFESTioGK+XT
         pX45ydxL3P/lTyM3TAYiW0qvVsz1qgsOo3LG3BwmQYQgmhWYsz/KxB+avdpk0K3zazkx
         82520deXwuj5ViRMtVW6sYf9j00Pi+zSG+qvwiz/yQTq0WaZiA4Ojw4+0uwusKQfcjZd
         nFleqiTC4azodYo1a5NTeemBx29+PdYjV8c4ahy8RqVPHBqRrCn5zA15yDL57kGmLMs7
         tFjjq/WxGdXSnMyICZe3yb5az9gis+6LSSmnHmAZi7qwJIh4E4jzOHYgh5wn6347Qy5u
         xHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753183; x=1713357983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=f9vaiwHK04WdnV7NMTumK1IwnIRn5+pWRe0uncJxNw4zmazPjfMjezT30+nUNFjzYD
         2+7Rk9IRicRDCBMgThHhdUQ3CH4jKLcGeFjyRKgJcQKEoCYuBpWHSxM3VQeKlViKstpp
         QE9L9yI4fSr3wktB2g06ZAv9CkIF1Ek+HN/Pv61/cNuKPIWPL7bXxPkTERgunGtphMud
         Dimwh4kGEVIloNoqJw8RYNWqwv0fxfKUbWATpW71YFzBdrBacmrDP09XUY1fBxKWs6k7
         oIHNqz6a9V4COnkDlkPo6pS1d6qMyvzjN78ePyBPQ5P+rtycanYe2N3VANFCFUAlSDF2
         irMA==
X-Forwarded-Encrypted: i=1; AJvYcCVnHjJ4ZbHcnjhIfkJuf3SLaUbZT9Yk3Yi3eGRh5GRD198NU+JA3E3+fmP2oxokyCU3DIAacf6WpLSfNpVQuCO4B5jP64cERW/DxFXEvzMIW1Hi
X-Gm-Message-State: AOJu0Yz7DHMMjh2u1fDehmbHY6FjJN47WN9tkoD5FoMQQQ7ipkyARtiS
	Pp6Ao6uOe4GDQvEaB2DRK6m7WVuFiF7vSTPq7ykQ7woy/dxq+UdHMzlcMlRCT7w=
X-Google-Smtp-Source: AGHT+IH/p5zp4MA87AZJY28HHV74sXRlJbaCaAhPeW3fvyn77BGC/TGc4xDQpjJDHMWC56s9vnYqaw==
X-Received: by 2002:a05:600c:198e:b0:416:a8b8:a8a7 with SMTP id t14-20020a05600c198e00b00416a8b8a8a7mr1764086wmq.40.1712753182974;
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c470d00b00416b06656ecsm2190983wmo.9.2024.04.10.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Message-ID: <713cbf7d-8418-44a8-9b35-6503fe3df0d6@baylibre.com>
Date: Wed, 10 Apr 2024 14:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] ASoC: mediatek: common: Constify struct
 mtk_sof_priv
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
 <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_054631_634426_72F8862D 
X-CRM114-Status: UNSURE (   7.22  )
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
> Apart from a dai_link_list variable, the mtk_sof_priv currently holds
> data that never gets modified during runtime.
> 
> Constify the mtk_sof_priv structure and move the SOF dai_link_list as
> sof_dai_link_list in struct mtk_soc_card_data, which is a structure
> that already holds the card's machine specific, runtime modified data.
> 
> This allows to safely pass the mtk_sof_priv structure as platform data
> for the commonized card probe mechanism.

-- 
Regards,
Alexandre

