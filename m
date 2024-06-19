Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B3C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpX6bG6XMS+/VxZ2r+vYAEndoam/HI9/Q0rVq2MJdQQ=; b=hPj3woogc5QA0bONYTv/Va7Qlv
	M4Ug2e7KqpYtf0ARxM7sRltgRdmJQmIwyuhtTHSlo41cfg5/eJfTJ3G9LlpEw7y7vsdHuTzxJPl35
	4uRbjNFgb9C/hIA8ciFJN17/jebGr2fX+7ycWovob5u9SQ7zgJrIr4oLPXtD39mjV1EST8G9Iifsb
	tzvQ0eZX2XkaXPWFen4Pykjwt5BUnHm1TRBrLwb1s1A+NMcJ5Y6oU+QFnWoWA+1mUY9zZFFZZMd75
	4sYfiC4IOJvR0nUoiKKIgihdlCWdWCa0I1hWEabYjU1/eWt0h68TYeJTfcZIMEV3Zx0W9QLFQlPgO
	z2PqyXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs2Z-00000000fNN-25wu;
	Wed, 19 Jun 2024 09:55:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs2T-00000000fKw-3MZl;
	Wed, 19 Jun 2024 09:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790934;
	bh=RgR7pL3q6FdzPNPxMoHYHj3+d6yEDIjf4KWYmXODHlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OTUCVd1SLJQ05t+OduwXHaRfIRbVoR5/XhgVJb9HsZShVz1HbDbckPUqXRF+PN2bM
	 XmZAq3vM/JSReGHz0ARFMXKO0Al8gXt9Neo6lckyi6icceTkt0bdoEPJIP3gwoBH7Z
	 J7tn0XyQinzdIGi3KEuYvZwt9A+byQtNSDm8jUPNxeVbBtITfnSPEl3NmrqapokyqH
	 g1EycX1z3VbO0s2EJbt/n4Fw4dLip+Ff9EB3lwQP7TJX0ROqfxw+bcurna5Ey6MQVk
	 Si1ZrDtvbPetpAPc8neh+R8Xr9YSigY3AKlcc+8MLiaem81Gf6dI5ufk/5rsexYzaE
	 1uCvV+6kWR2sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CFF413782163;
	Wed, 19 Jun 2024 09:55:32 +0000 (UTC)
Message-ID: <0942a9d3-fca4-4c59-9a3a-47717111233a@collabora.com>
Date: Wed, 19 Jun 2024 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 08/16] ASoC: mediatek: mt8365: Add DMIC DAI
 support
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
 <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025538_155427_BFA64230 
X-CRM114-Status: UNSURE (   6.47  )
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
> Add Digital Micro Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


