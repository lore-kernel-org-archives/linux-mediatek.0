Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93511C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q55jSnnsIC77cLIVtPNm2P4c/eaGAN1WuqYV2PIJrKg=; b=pH80qLC58z4LNtqbbJj4QBLeqR
	VBuqWZ/GsV1kXKNhwwb9Cp7U/Y4K3bxhId+If2lg8+CneodcvQCeKm2KHURvlaO6goETe6bsGMezz
	d0QYbpktOdfoO9hI5H9jMTHBusel/lS1q/fAKCkS2EriZ0y5zYFatw+0QIyiQ5E0te9CY0AtVPLd2
	CMy0SklnxWB9LIxEbn1B3oLR+Ey5FqQBTdXBkumkgaFTQx5Snu/r8toDPexbKsn+O1Gai3CIsC6IZ
	aRqjfctr0YjXS8S+6iSf0EnKVC8aX3UgmXL3rbVNXRQUiIz83d/bopPcz8r4Vagws17IN0ZpoimfD
	oI2epO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMxB-0000000GYKU-0AVO;
	Fri, 09 Feb 2024 09:13:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMx7-0000000GYJf-42er;
	Fri, 09 Feb 2024 09:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707470024;
	bh=bM1d8kHT075G3SCvCV7Hu/u/EgAsOXV6u29c7fmcHpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=up3Rlg2CKh+aq9+7EULqx6XeSO5KnyPnRZ82aiHYq2n/E28X9jZIlY+Pndfctv4v2
	 suvnHbydLMpNR1mqtO3Z6pisgFEW6rF3KmJDnQAV8j+dvW2Wha5St6C10vY9se+tCt
	 xKy7lof5zBhmWkQ1doTg5Okf2cAF+LNVLuewBj2pt2HRtQQn7qA+NvyjuGtb7a3qCd
	 FFN2B/S6C1b6gASkdNdX/8FZ96v4Lsy26ZjCKpJXb181JjrEgJXYZjYmnMfzRM+Y8b
	 JhoBfpY7Ojtm/eAfPVgDITpWOHk8t0WBWhLp3LLB6pVrbe5b6XWK1YjImiVBr8v1/f
	 HhskzLUluzJcA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 537B337809D0;
	Fri,  9 Feb 2024 09:13:43 +0000 (UTC)
Message-ID: <17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com>
Date: Fri, 9 Feb 2024 10:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: thermal: mediatek,thermal: document
 AUXADC 32k clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>,
 Sam Shih <sam.shih@mediatek.com>
References: <20240209055203.17144-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240209055203.17144-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_011346_328260_1BB771C1 
X-CRM114-Status: GOOD (  13.23  )
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

Il 09/02/24 06:52, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> SoCs MT7981 and MT7986 include a newer thermal block (V3) that requires
> enabling one more clock called AUXADC 32k. Require it in binding.
> 
> Cc: Daniel Golle <daniel@makrotopia.org>
> Cc: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

So, I've made some research on this matter.. and this is a NACK.

I'll keep it short: you don't really have any 32KHz clock input for the ADC in
the infracfg clock controller (nor others).

What you're trying to say here is that you have a FastRC Oscillator input clock
(in your case, this is CLK_INFRA_ADC_FRC_CK): this clock is responsible for
providing an input clock of either 26MHz or something that is MPLL/16 (I do not
know what MPLL outputs on your platform, but those PLLs are usually giving out
"big numbers").

The FRC osc in the AUXADC will perhaps output a 32KHz clock for internal reference
and/or whatever else, but I'm not even sure that it's really going to be 32k then
internally to the IP block.

(I said "I'll keep it short" btw :-P)

Anyway.

The FRC clock is also required for the INFRA_ADC_26M clock to work correctly and,
in the clock controller driver(s) of both 7981 and 7986, that is parented to....
... surprise surprise ... INFRA_ADC_FRC_CK :-)


Finally, you do *not* need this commit, INFRA does *not* provide an adc_32k clock
to the thermal block, and you do *not* need to add the FRC clock in the devicetree
of 7981, nor 7986.

Mind you - at least in mt7986a.dtsi, there is an adc_32k clock in the thermal node,
so the right way to get your thermal node validated is not to modify the binding,
but to adhere to it by removing the extra, unneeded, clock.

Cheers!
Angelo



