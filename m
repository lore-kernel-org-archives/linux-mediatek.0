Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0223CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMjbesMdn+qtLdaftXdet62uuV9p5A/VNrKt/cHgu0g=; b=DYNUnbPuQlj3FdF9ijS9hntz7N
	D7A4eOWo2I4u49rYp6vleBQLaRqGr8W5b1ZUeyNJ8yIbYS/sA0NLFL2yTIoNrUIw2tvw7Ctkq6v6S
	S+G0P8M1WtlnOtlOxL13gAjNEsmW8NK0xYZKCLkxv0OkDiJhV/mBJY5fwZVsMrdrth//Kx0fyEC78
	CnPxbG1qSym352m9B3V1JwghLcJ6brylEV8Rt5axkgQaYQvk64gH+DgidoFIW8aMhSoAx1RixNZgW
	7R/s6GspPhSCX7iQgw8BmUfMJJMnysQxmw02NR6KrECiM/X/9PXFAsTI/7CmBAgM8fx5ptJqHdW1q
	d/MMIWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYWt-00000007M6j-0J9S;
	Wed, 10 Apr 2024 14:02:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYWp-00000007M3d-2bRi
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 14:02:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-34175878e3cso4839233f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712757737; x=1713362537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMjbesMdn+qtLdaftXdet62uuV9p5A/VNrKt/cHgu0g=;
        b=rk9MTrkhkYv2XuacFyYZyQKO9yNHKaLZ4Tl9w9SrN1qw44xnhk1rynRhfvg1QI21eI
         Qi8EABzBBNYBTzTpUbPs7mPpxToBmaiFWV+0nCUglMMJBHAEPCkGbnt2RpKFSwLZzPHK
         UnFVTvNHTJ14ghlpyp1JUHSDVvk2w8vPt4S18SJFIGgmuy9FZfDCNeL00msPvZwOBpUa
         As+n8FwAfRJPcA5Qc7Uc0umnR0ntE9hoILr3yQnVrdBX1ZUed0CfQFeLlOVDmGwVD50O
         9nuP/bBvCUHZQsGg1iNm7F9PdBOlotG3QtvMXHAPlFSJguJX5QxOz9Z5GPEchQ5zdw/l
         YPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757737; x=1713362537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMjbesMdn+qtLdaftXdet62uuV9p5A/VNrKt/cHgu0g=;
        b=pgom/1jUf5j24mlPbs45d693wNQlu7TcyNPZHDDiZXuTyNa90uTruh5WYMqG5m/f1G
         MsI3/N/46OEsfgpPDmrOswGZVI6Myo9oQJnNZIrqKQh/vM67E/D7BXFgJm3GDqWAfeES
         6IcV28dTKEB/QvypOhTscPKCLIX1GHKg5lLZTdEBYo1usWoD/L2qf3hVzyY+KefOprrJ
         dPJh15Zla1HErSggvZs3Mh5ibmUvRxMoaEJBiD0OdCFJ7DyUepCOQoRBKUBd+H5hwtYb
         6rKnUhp4KC885u1CbEsb9RSA6oQLxBtwXdj7IScQTKDz0YZ/dVCx8Bk57kkSFqqjZY/M
         6PgA==
X-Forwarded-Encrypted: i=1; AJvYcCVI2ZxVLi+lgWxWLmKTEGjUMfUz3pMkido4Y5YG//hZPtB7ozU8z+DCZ59pZoUEdmozZcV5UkDtd4IfoZ0EBGq6NQpDUF3m8qu+GcON5OqFMHRf
X-Gm-Message-State: AOJu0YytmJcpg5fIpH9SLajQAFuRKAaPJ/ZYqx8bLup2honIYkt9rpW4
	OhermPBl5YwW6o1Qnk+relWlTetvAjgbUO8QfshPNdnRTgl2RiSTh+JwCx01qVs=
X-Google-Smtp-Source: AGHT+IHDRsDMr0SXIA1BZFJa3MxdxnnQmiYZftYqYOsfFpe40vWDa1uC6IrsGh3VJIa1HBNRB3jl0Q==
X-Received: by 2002:a5d:628d:0:b0:343:bccb:dbbb with SMTP id k13-20020a5d628d000000b00343bccbdbbbmr1888712wru.12.1712757736649;
        Wed, 10 Apr 2024 07:02:16 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b003439d2a5f99sm13761613wrv.55.2024.04.10.07.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:02:16 -0700 (PDT)
Message-ID: <50bf4fb6-7ad8-40b7-ad95-c1fc5e292149@baylibre.com>
Date: Wed, 10 Apr 2024 16:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/18] ASoC: mediatek: mt8186: Migrate to
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
 <20240409113310.303261-7-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_070219_669243_D6092A26 
X-CRM114-Status: GOOD (  11.01  )
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
> Add mtk_soundcard_pdata platform data for the MediaTek common sound card
> probe mechanism, including a driver/soc-specific probe extension (used
> for bits that cannot be commonized  hence specific to this driver), and
> change the probe function to mtk_soundcard_common_probe.
> 
> This is also adding the possibility of specifying the links and routing
> with the audio-routing property and (x)-dai-link nodes in device trees
> to stop hardcoding machine specific links in the card driver assupported
> by the common probe function, but support for legacy device trees is
> retained with a legacy_probe function, which is used only in case the
> new properties are not found.

-- 
Regards,
Alexandre

