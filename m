Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AFE10775F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNkp3LcoZSLW6JIqm+kjSOBJD5smseduRbxCyXtLUwU=; b=mDlm+cpmTLGix+lLb72+JSxxJL
	3SwBt7Ya0mNq2BpVRsPrtgH9Dv+yhHyWROhA+58lA03ZWczXEb1Q8qiN2oVq+nkSM/HYb3lZKxGYZ
	YLobbYZB/7AMBjc1KBhHlqgUtqgVCD0GF6FXHeZrrp0Xq9W1A9Qgo2NYkSOO9oQRVedGFiPS0P0AW
	vohMEg7sROcpYGAuDNNod4DVwCeu5Z4JlPWAluhqhLtamXI6J9oew7sXL1iQRqveojqiADhz95nYw
	x60xzs3vjw8j79f9yYNGa6O2Y+8SuGVc/Mz9pefs65fEdMJcAlQPC9NyKKt/VE41avD7Dbr+4/ntj
	BAQkN6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ube-000000093qm-48IP;
	Wed, 18 Mar 2026 17:22:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ubd-000000093qI-2pbd;
	Wed, 18 Mar 2026 17:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vNkp3LcoZSLW6JIqm+kjSOBJD5smseduRbxCyXtLUwU=; b=Lr8LFjm452CCorOZWYI9TrD/Yt
	/UCWM7qEbD0H4xxq4STOMX/vCwwltRuQkDJ9PEUEwzoNR/GdCCi/mh3J0XwIVD3ZgleeVPTJt34OV
	RQl0bmrDOVC88kR+Y7OI/N+ZcHJE/SdjVNqZIOFY4n02bxUvpC/BdpElxLicxqXyQEHN/oe5CTTUM
	1sv9zrjQamwel+4EQbrOFcuFrL4mHNGM9/OawqfxjIaLMgZDTJQMe4XBvv1XsfRaPUNwoJBXCdcLA
	os1hqfS1I1O1JxvzvMEmu2/xzC6eUyUAjobFQjdAyQVvdaOQTdHJM2MEzuHErmzJR/24tDqIqP0Sq
	AFFHL5kQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uba-0000000BrdJ-1Qad;
	Wed, 18 Mar 2026 17:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773854564;
	bh=ynyBnNeJwC1iJq0V3/CMoDF/qT11osJ8LY2W6q765hQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LyHi1XOm1XcajxqvX8esnSlpNh+SuznV4YyDPzPfC9JVObF6JgfRs4SwkgSAOF0lv
	 UGSt5RYxqSzjSPjKlKHDHW00v1tO3jTscIB081PEEy1mov+ontvkNhwayX9+2bqNRU
	 uKehGX45Du8tFja1zwTWI9Ycc7eQz25D1TX6hNBaPjOS61OaZF0/Ar3V2gJYT4uoJK
	 N7eZWmXpDW8/0GcgkyOZNoJUy7P7UdOIccATW18cRm0nV8bxRlqX9tdBRXeMTJjpIm
	 14Jx6vgXSlS3XqONXD83EYEd1Q9Er0WNnjiU2wzQkfOA/d/divMEK14Gswr9AI2ohL
	 Jn6NbHB4FYxPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68F7617E0E42;
	Wed, 18 Mar 2026 18:22:43 +0100 (CET)
Message-ID: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
Date: Wed, 18 Mar 2026 18:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: wens@kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Julien Massot <julien.massot@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_172250_553402_389038C4 
X-CRM114-Status: GOOD (  17.15  )
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

Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
>>> From: Val Packett <val@packett.cool>
>>>
>>> Add the dts to be included by all boards using the MT6392 PMIC.
>>>
>>> Signed-off-by: Val Packett <val@packett.cool>
>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
>>>    1 file changed, 141 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>> new file mode 100644
>>> index 000000000000..fbf6f671524c
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2019 MediaTek Inc.
>>> + * Copyright (c) 2024 Val Packett <val@packett.cool>
>>> + */
>>> +
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +&pwrap {
>>> +     pmic: pmic {
>>> +             compatible = "mediatek,mt6392", "mediatek,mt6323";
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +
>>> +             keys {
>>> +                     compatible = "mediatek,mt6392-keys";
>>> +
>>> +                     key-power {
>>> +                             linux,keycodes = <KEY_POWER>;
>>> +                             wakeup-source;
>>> +                     };
>>> +
>>> +                     key-home {
>>> +                             linux,keycodes = <KEY_HOME>;
>>> +                             wakeup-source;
>>> +                     };
>>> +             };
>>> +
>>> +             pio6392: pinctrl {
>>> +                     compatible = "mediatek,mt6392-pinctrl";
>>> +
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +             };
>>> +
>>> +             rtc {
>>> +                     compatible = "mediatek,mt6392-rtc",
>>> +                             "mediatek,mt6323-rtc";
>>> +             };
>>> +
>>> +             regulators {
>>> +                     compatible = "mediatek,mt6392-regulator";
>>> +
>>> +                     mt6392_vproc_reg: buck_vproc {
>>
>> s/buck//g
>>
>> Also, no min/max voltages?!
> 
> We really shouldn't set min/max voltages in the PMIC dtsi file.
> 
> The min/max voltages are supposed to be the intersection of the
> consumers acceptable operating ranges. The min/max of the regulator
> itself is already implied by the model / compatible.
> 

Your point is fair, but it's also true that some of the regulators are not
really meant to ever output anything different than what they are supposed
to, though, with slight variations being possible... I guess the best option
here is to leave declaring voltages to board DTs instead, which is sensible
in the end.

Okay, agreed. Let's go with no voltages.

Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

Cheers,
Angelo


