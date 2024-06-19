Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5748AC2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ+Co6Drz6aeDSynxQTa3WPjyeVOv5RG1RAWnkQ6FVw=; b=kCNFIkZyOJMf5KLongI2gM9Vws
	uga8Tlq/Jtd/GAcrEg7PNo8wEC3zmxnpm9gFOkhJfzU+4XuBw5kwwYKhJvYXs/ShUVi8NJt4vQIRo
	NoxhAKzG+OzpxgAdwsmvXICt0SFoCSGUA6vVLKuZcZCUnMIpbbolIiL5GfykO2fxCCZbZBRbP64/r
	3qvjArpm/kCculdmRHrfbs69TIqwnYu+FllfMrG4TMa2kDQTBOtIFysW1SOemb/iQfmxXqeFt22KZ
	ZjhgZzTmXPRRxQX+EIpF8M2T/h+4fy5j3Zv1WFyI768keuE4GluoKP6Us9NHum7Qeuv8kxR1Q2sT3
	oGDL4xUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs5g-00000000gto-2t4x;
	Wed, 19 Jun 2024 09:58:56 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs5W-00000000gor-3k3s;
	Wed, 19 Jun 2024 09:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718791125;
	bh=3DgwcQEpJg+efanAve5I4mMMZoiHaWnUZB/zpU57N9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BgpkkD+zwBWb+KtGZW8JOKmhG6ZpcccQWu6eAPU6eRO9Pi6z4f3mDI8Y0Zm0IFiih
	 QotGPFng1sbxYrqlgtu0MA9FIiNjbhqKyTcu0kC3Kcz9LZ1jG5TQS1buvZIXGD4UEF
	 kLszpPyzgKOnATlbm8jy0Tb7Bm89D+3ua4/1F2Z5ZQCGrd6qTKZnPubS9NuFOlsMvO
	 FtOVkJHbRW8jqWg3Qd4vXH0+MP26JIbeZSCsS/sywr5dqmBBmdwFno/HzkvViErNMz
	 HX4rGVwUHmyVuaRSjHVHcqF1vPt6PzkynBZuYRSlINrg0/vyTMXkDwol29W2IcIDV6
	 MDJbvV2I7q2bg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 985913782163;
	Wed, 19 Jun 2024 09:58:43 +0000 (UTC)
Message-ID: <6ba7aad1-0113-4e07-9420-18369ec6a79b@collabora.com>
Date: Wed, 19 Jun 2024 11:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025847_248740_1F9F7943 
X-CRM114-Status: UNSURE (   7.54  )
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
> Add audio front end support of MT8365 SoC.
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



