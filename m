Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A1CD1299
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=; b=xAXetTHiiN19aKg4TRnVY5DJLC
	CP5C/Paleu8RH8Y7K3Yl6qFwQLuPEQrjC9b0g5SFOMMHApDkqLnb7HlBZXTpNQJHpSZMi69+2UWjc
	EUpn/OzxDFsTWqfnjb0QEiEnXKHskzIajFkML/YveFMmOaDv1T2ya+4QdwU4hWZPbUYJabse1GQaP
	Cs5udnkAxthZDRjW1hC6O56EuGaQxfv21GhdeR798/M+j/Bf6SiGiAJP2DslfUqZdquYbx8LRwk76
	r6yKXyjnmU97ZPda+o+Fol3jnHFJWB+W6Pm+o6mXaPTjK2dOSNU1dpwRySfeW7KNZ3SdRqxAp28/N
	4fPzQOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZet-00000007jNT-3FKR;
	Wed, 10 Apr 2024 15:14:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZek-00000007jIR-1igA
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 15:14:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-343e46ec237so4099418f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762071; x=1713366871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=nV5QaH+7k/u+2vmH4wHmVojM8kY0M0bXd5UL66tmv38r9sXIkETFi6REkWR4BZF9Q0
         iXmhmAHvdkx7pW2r/cyLWkHpAx7iwIVh158w6KCwNdyI+KrtQ4mOthSSz8cpzVowbCPb
         Lipm/P4/TlDTqE8fTevewJk5+SONXYhRt/+BuZSaR/oAvmbC7Ku/pfazPYS0axNUMRZW
         ThwFbYDttqPxVHmVzQXXsPAD9XJdE+T268Wcvh2aI8LwWCgasPAaxxq3RaTNk/MasRi6
         eRCmRpi8RjF6EvWeh/hJHoOmB4PTfxpT8fUEv45a8bS3Lw8YgPes5dUY/lLroN/SjAnS
         +5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762071; x=1713366871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=vmAs4/dxMnz+aPgu2CerrZnmxXKthF3veQgLxqi1xONExm58ev4oo+Yxrp700QTAFU
         NhTqCOSUhBXicMoZPb4Xxvu3DuYiKv5bzq3UMxv4lfUto/s2Iy/tfbRqWbta/LsBSJ3Z
         1BN6MbR9xbc8Bms5Ce0FV06FRu/qxIycTPz1FvdwuY39pbaUp7OkX4MZpRTQhFqhFjUF
         GB4XbZ+GMt+I/489ykh11Ks5yZMje1rX07zbGouXeO1QfEs4b980ngpJzpSfsMSHG2Zx
         w3QGpWNyfh06CuBLJZtKDuXG7sGPCfFp6hUNPLBkrcalviANzG6elqaKDgFl3HTxiQHi
         n1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWzzbCqe/It3If5JHvez5obmvx3Fz5o6/yuowzL5o4L5UoE73c3W9MJao2PSP4BzsqfGhoLYvynOXGqkRM9CC4tE4VQ5VGDtTv77iQTyD2TA8Sa
X-Gm-Message-State: AOJu0YydKFKzgqCIsmd9lT5DbJ4VoYaCL2ch66sPYqIZSvXOPEq9kXz+
	RCX8C5qQO6PqWIcdiJGpW8qxDvDGWWlLATskzUhJ6IBq4DQIc0HsLP9haYSm8+s=
X-Google-Smtp-Source: AGHT+IHsg96eOL2a4LJhVDQUrGOMuFbwCCDLT+zKpSk4ARDLKr/ObMqBjfvII1zIu2uKlKh/jpN3ew==
X-Received: by 2002:a05:6000:2a5:b0:343:7b6b:dcc6 with SMTP id l5-20020a05600002a500b003437b6bdcc6mr2373938wry.30.1712762070970;
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id d26-20020adfa35a000000b003469e7f5c52sm176322wrb.80.2024.04.10.08.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Message-ID: <437bdabd-f16e-4a2d-b9c2-55c91b2e399e@baylibre.com>
Date: Wed, 10 Apr 2024 17:14:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform
 with common probe cb
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
 <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_081438_025561_F53210D9 
X-CRM114-Status: UNSURE (   8.24  )
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

Also done for mt8365-afe-pcm in my serie

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Since the mtk-afe-platform-driver generic mtk_afe_pcm_platform now has
> a common .probe() callback, there is no reason to keep duplicating this
> function over and over in the SoC specific AFE-PCM drivers: switch over
> to register with the common bits instead.
> 
> Note that MT8186 was left out of this because it is registering some
> extra sinegen controls in the AFE-PCM probe callback and needs extra
> cleanups to be able to use the common bits.

-- 
Regards,
Alexandre

