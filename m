Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31B6C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfcKAiA8UtkOdI2wffTfQTaRZGnC1DcDTTQRXtBv2ds=; b=tK9g+p4o7pbWwloReqmX2zZxEH
	hrOanpk7Jk0EyVRd6bNp+89RUuak319IkhbuQa+BBP3TIq7vRtewi4tvyZIoJFwbX5xMSp5qJperK
	tbubI6/EE1ycCGinzOKJcZuv2EZECKUDItULMCNX/99fTL6rs2b+uRzRzeNrbRVP7/KPaHyO0FKZk
	rks5Az4Hg/OcZPYaSrbifwbXa6ZCHUsAzIugpklkB8xFi4cIC3lFI+sGDxfCEKa6S7TQiJyUtC7dC
	vjAxtTocXV1LvyndmTnALdhpRCjQDgBGt5Tqh9PjZQSd9YPz9Ncwsw/NLealJA80TA2IQxphs5qkU
	iIH3FEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs3Z-00000000fv4-0nzK;
	Wed, 19 Jun 2024 09:56:45 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs2c-00000000fPh-3U3o;
	Wed, 19 Jun 2024 09:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790945;
	bh=ccqhkRQ+dQDXGIwdq7jXyziveJY0PrkdcAxZPvyIbTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RBCHa7VhJYw8kadFFaI+Ln3q8ur+ATI4w25Yt2Gbdae+K2y3x4GuxKnx8rBmN1+v4
	 dyxQASh9VmMXW6DpeFmKCkFEWGhLDQGGTPzpz0QYWVICqC5x8kc95koTD9690ZbCQP
	 9KVKaH4Rj5zWmt5frlNGuEeZjzEgItA2O9ZXjeukYEKFwTP/XcspByJjeqmKPIzIct
	 XAmfSS3NxCo2zFKtDo498Mco2RjrVDwEAknkzNiXug63KHFbWBSgORG57oGd44cboC
	 r2OEVNEXL5A2HNNSVynqLImvhUt7aNzgUjvEvKXTO8nkt7iRuMRKADokA0a/Q3t0BI
	 gDvZDSIQjSBYA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DB8F537821CD;
	Wed, 19 Jun 2024 09:55:43 +0000 (UTC)
Message-ID: <c5f7cd1f-e2a2-4055-8d0a-9da320ff591f@collabora.com>
Date: Wed, 19 Jun 2024 11:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 02/16] ASoC: dt-bindings:
 mediatek,mt8365-mt6357: Add audio sound card document
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025547_245303_6AC0D059 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



