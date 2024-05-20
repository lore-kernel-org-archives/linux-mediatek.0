Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4271CC25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWTKYWoZye9FO3nP25t0ROK8hspoP6WjWeN8srkRIeg=; b=kxF/gV6WAKpvuZVmbNPWq1dUen
	xC5TfT60FimODYVrvuO1LCAK3t3uh6WkHYDLcn+yWjuMUymg4P8cfSeEvKrqhVVXUzTfelMlSoRR5
	AycC9ktcfAPdpc1y24WkXpVZixqR/d99QZhmhDOPNRFky4c1SUJyv1U6UTOHwxhwsCp966s+iQE4Q
	ZobyEffWywvQu9q1zbYI9yoYm2SuMt3z7k2URHdXcVUnc5+H1HFxlfKYtdq6zb4Psr/Ic8NK6n+vr
	JwyvivaYcASqbLrezA6aky5KdgbViCLG1uX20m7Oi6nbNbZFB0m0xexkCrxNSb59Ao56QjvgSm5RU
	f2Xyedkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Jf-0000000E9q2-2qiE;
	Mon, 20 May 2024 10:32:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90Jb-0000000E9ok-0hOi;
	Mon, 20 May 2024 10:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716201141;
	bh=oWTKYWoZye9FO3nP25t0ROK8hspoP6WjWeN8srkRIeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HfDQeyxs2tJjTFW7mdRovBqi9G/lD27u6gEuk6HPtgJZOmh0trhBEW8dvzFngP3NX
	 qMUoWR1aHS22H07jbK7503bJVIrtU9OEKWKSUY200lNeKbcLL5vHdGouv0AjS7pude
	 cABN1/XPExuy0jLag2xH1o6nudcPfL99iNJqyDl2ceAhZ9xTYPLCrqBvAkZOIRqnFs
	 eLuRvYUgrCN1dnQ3URBixLdMPYwoDDtlceSkLqsISmPo2alBWr7gNQAkOTWGBf9TwV
	 wZFffZi7OwoFaoeVnshVHKCeghpVyzZYQ+k3ARm3uQ8XEh4ZNRvZQ8Dt5ZQ+iyMqUt
	 mUwr7lEOd04Ow==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 04C133782199;
	Mon, 20 May 2024 10:32:19 +0000 (UTC)
Message-ID: <c63a237e-7c8e-4f3e-b69f-f89bd0733a69@collabora.com>
Date: Mon, 20 May 2024 12:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/16] ASoC: mediatek: mt8365: Add platform driver
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
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-11-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-11-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_033223_378586_D3442F85 
X-CRM114-Status: UNSURE (   6.81  )
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

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add mt8365 platform driver.

Since you have to anyway send a v5:

Add a driver for the Analog Front End (AFE) PCM blahblah MT8365 blahblah :-)

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



