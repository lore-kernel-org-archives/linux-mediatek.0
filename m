Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD966CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=; b=ulif3JxKLVeozUDJPeXb0F7BAp
	Q7hfcJpCn6FLaGdmw3r0CVFRI8+WuB9LWviL87vitavA4UFfv50xLU+941dowYIkseQSUme252hph
	eKIRgVlQwCj/dZO1PdYL+xy26nodfdTunPaEHvBpPLN9kTzWB9H/+PC+T1gW3En4E4y2UuXvsUbLj
	0nQXGYTn0tNa87dS0NiHg/HiqU4k7UmiyUElLEt5+WQAVWe3EcxIQz3kBdXRbnErnibFceKAorSXy
	9QyNyVk7qRqmvRTPvDu+9mN+Wx5KZdmzKo1qAJ2KLP6So9N1mmhgSPXznDKxU3P4MVgIwT9/kYhs6
	XavjfivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXHv-00000006vVG-1TpS;
	Wed, 10 Apr 2024 12:42:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXHr-00000006vTn-305q
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 12:42:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-343eb6cc46bso3435714f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712752965; x=1713357765; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=Scy1O62hAtpP4FoUeYTw0tgraFxxmiCr2eXAZ0pE3qAgFmFTlJBqrqgBwLQF6THeU+
         TGDECsccbXBugz/FBBJ38zaf9dPo2037TcS2wNfCvwzGQS3iFu+7hriWxtCBgzJBnEw0
         0EcFG3gRWRsRDIKxS0P0lf+eEaT+qDX8ptoffn7onfWv/0kD4hRAfKifoVxYe+0+51fk
         Vy68goSzVjytXKkk352qqG9TP0vSh/zrOLcVQwbem27EKaEblkbFXrCJJ/vIqorNw4o/
         ssbXST6h3ZZE+QOMmP6fm7biocWbTkYJpWjWxzFtRPaASziOn50CQPYqiM6pHjZxLqkO
         5/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752965; x=1713357765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=QR2GnaFZhkI8u/UHEUJrGZlhTEPLcGp+2X8KAVXPVJaeaw+FIcsunyh0iRK3kPxFRd
         Kvj5KZl3bemObNZvFuoYPHmA/00lKetdyqYq6HflfysaSgLiX6//75m8q15asef+LYnY
         RdtSiwtXmmFrG7as55NibwVMrUdpJHpEuNik6WablAKVXqE3tw0BrkFeudIPVj+FhTK6
         9VzlA+Sjtm14VqTQXaa5yMsqSkVniTdqlIzS8Q4lI6/OgqCgcezkBaK49GTc8o0UnVSX
         camDQCPm68O+hK3Bl4mdbNHbMTlHkHlxK8ycEWgFMGdyoQTJRQs3yZStjrlUpbJQiNXf
         BMXw==
X-Forwarded-Encrypted: i=1; AJvYcCUb59xJnMtj9Os9YxC62HjSlv8JiBOYXwcLZTeyKg9wcCAn2XeruX3E/QiHbfYBImIaREVRvASUlUA1E+P3DJGhpIye+tvSpLV4TnLsQFBQ0iYB
X-Gm-Message-State: AOJu0Yy9h3GPD7nPGy0JBmz4cx9cgaYWFq9J60eNTvEnoV8/mAUie1a3
	kCH0HH2GbiUnZkdVjcwD1MqwUUvuEAjI8HSLZeJB0znetgZVR9XUFwUOcMGWhrw=
X-Google-Smtp-Source: AGHT+IGLIzv68MN2vk07ucSWBnQpWhzyZz3+w9au/M9OjAewrobTeMyExcozFPeCXalIxP/pVJHGdA==
X-Received: by 2002:a5d:64c3:0:b0:33e:19ae:3716 with SMTP id f3-20020a5d64c3000000b0033e19ae3716mr2319146wri.11.1712752965497;
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b00341ba91c1f5sm13702046wrt.102.2024.04.10.05.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Message-ID: <6ae5ed54-4205-46ae-b903-188a8138eaa4@baylibre.com>
Date: Wed, 10 Apr 2024 14:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
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
 <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_054247_895563_80E7EA2C 
X-CRM114-Status: UNSURE (   9.54  )
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
> Add a common machine soundcard driver probe function that supports both
> DSP and AFE-direct usecases and also provides a hook for legacy machine
> soundcard driver probe mechanisms.
> 
> Note that the hook is there because, even for legacy probe, a lot of the
> actual code can still be commonized, hence still reducing duplication
> for the legacy devicetree retrocompatibility cases.
> 
> This common probe function deprecates all of the inconsistent previous
> probe mechanisms and aims to settle all of the MediaTek card drivers on
> consistent and common devicetree properties describing wanted DAIs,
> device specific DAI configuration and DAI links to codecs found on
> each device/board.

-- 
Regards,
Alexandre

