Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54396CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=; b=tuqCC3g5H2UjQTJqeRofQ98DRz
	oEOoYmcOnikhj2+9lF8ubJ8c5VqDAPGPsuvHVlDVE8ZnDAXVwCaaHwVRBZ2WaFDWDOMTX4o+tZQu3
	ZDbK9DsjJbYhPoEp8DkU7TbbW+hYzVmtRTRkBkeHzS2mydVbcVpPj5usLJvDgPCqSLmYc67PVItsu
	89IyHdgFXfkKU3kOAQiHdCzSB1MzRu8ki+sAQFUJ902iJYBjmjSY43R89ftjeLkP6iJ7Z+7gRXvLI
	eqcQw67I5NI3dGOl9/9o4H3ANNMSGXoRVYM8usOZME4Yn8W1pqHxe/f16gdgdQW1jfAP4X5Ei3F7l
	9+OlgLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZe9-00000007j6O-2SjT;
	Wed, 10 Apr 2024 15:13:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZe5-00000007j3L-1Qwq
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 15:13:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so5070954f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762030; x=1713366830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=Z6MLtha4ZUQbwf/y35oqbY4gCyyq3Gz0cEInRokiJl+R+L5dwrIOAAVtbahnY6roqO
         Nt9ZzKC5kOSl8AAVTwR77vYazPsGebGnE4HCk0XM2v5rqxn8tBIbg1bcz5PV9XEzXcuP
         IPDIz0KawPH5GGr9PRK6BcVlWPAW6sAa8owICRECmRDBXcFU9RcHSdpwd80EhwqPmXtM
         uD9VFFg56opeIBoL7oYLmpIqMHQUcg8AJ8AxpEqxEcyZua5QXHjQ+C5Qo8C3ySm1chbK
         acJTZEXjEB8VtfEuhuodrgpvGLKfA4EIh/0tXuI2y7S/FSL3CXxXPQ+AT5482RLMa3nY
         lOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762030; x=1713366830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=QGoOx14hKo8SOZ8Jf96YjxfJGkCK4sGZsuZ0z/z+FPSNRQ8woUR7cdbO5Q7PasQcvU
         dxZojxuV5ChCgk0It9EBHf4g60Xej6OFvU4qIMVvWZDXHbrspshMd6SOUSsSgP4x1NmW
         6pgsProgO19Sr48zErIS9xvAC7vBQG0Jwc0xe4IDyplHhbGNv8dJeAUfD84JEOkCBBoO
         3D57C8olLePjltI0ps9aT8itg6JN3V6u9Ba5T0AChvKrbvu3E1qO+Y4vPzBJitMWqEyj
         JuTP8fGO0PsOUM30IfDV5ROSv1CYAkPo2xIhEeNZiyWl6mbKsrI3D5J5K6LyLI+qP9Q4
         ULkw==
X-Forwarded-Encrypted: i=1; AJvYcCUIPyDIAbUVsGhNxbpILKm2y3ynxZ443J/wdkX5ldDnfXkTU6I4yppmo4GwePhF9qme3Syl3vC2883B3jfr2XAbiuT4F/aQq6XEhHYZzuQWu7ZO
X-Gm-Message-State: AOJu0YxUeCu/jNU7Dl79yKHv5lyCdV0fNkt1U29WbYXq1ZmpHfWXDHFm
	f26DHu0rLidK3JeD+cw0vjJ4FQfL3NbAmPwtOpAUUd/x7jS0hsdj8hKZERHzcf4=
X-Google-Smtp-Source: AGHT+IGoier3Sm8gMlqmjZALBvxdoG/1vWwzVX851wh99fQXUyteeMA3kD8B7Fgl7bkM9Q+1QuTWTQ==
X-Received: by 2002:a05:6000:186b:b0:343:6b76:251f with SMTP id d11-20020a056000186b00b003436b76251fmr3201804wri.42.1712762030404;
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm1118117wmr.25.2024.04.10.08.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Message-ID: <fd7cc1d7-f293-47f9-9ff6-98b78150d61e@baylibre.com>
Date: Wed, 10 Apr 2024 17:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] ASoC: mediatek: Add common
 mtk_afe_component_probe callback
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
 <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_081353_443001_85C6F083 
X-CRM114-Status: UNSURE (   5.96  )
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
> Multiple MediaTek AFE PCM component drivers are using their own .probe()
> callback, but most of those are simply duplicated functions as they are
> doing exactly the same thing over and over.
> 
> Add a common probe callback for this component to reduce duplication.

-- 
Regards,
Alexandre

