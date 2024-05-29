Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F3FC27C44
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nb5nhOzKfN+J02YtDY3AeUrCiDolu7/gOfIHBIOnf24=; b=afcHuIggj61hNi7UYxP/qeaLSg
	GmnUPMl2939jOIq3VLovPYnfbh4qileRJTNcw3BU4NOZcoYzK3rJinpgHoWOfbbh4CSIK4HUFJ99A
	n4tOjTT3Y6zlQHaAjtuLZUSSmeIPOTveLl301RAO3g1g/x1DIgKiDmfKACJ4XM4QXpalqY0ZIiKj5
	76GbpmKCzS+bOkkOpN+Pmigl/lNx2rj+v9sCCKVgspqmW1iKbMoWzBxFeo2KsNbuBsuHcXu5/fzJG
	ZctGmlZftCB/FSzqUsA2z6GDI4jfIm8KVuaWp7weB8xaQ9vyu9hp3QkcYBynwBi48EHnVMaWf0eGd
	T1/zbFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCI4c-000000041nC-07xX;
	Wed, 29 May 2024 12:06:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCI4V-000000041kG-01MZ;
	Wed, 29 May 2024 12:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716984373;
	bh=Kam7GlrgaXVFK23XrEQCDs7nyWMWsFNSiXp7twV37rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZhTN61tKJzQX2QRKsKJdg0qMXjNOgIKplP84ePEYUqM/Vzyo+YLquJ3+JKPqGczB
	 HoulKRjZSwvmt5Rz3qazylvOEk+kXQns6p/icwwKZuURhfchSdXTFW/PcayaDFCI17
	 EBj0vvpfOFsZz/g6VIB9d4otAOk1mJ3396Q+lpP+IIA8Mf4XawXWH08ozY9fT1VJRI
	 jGiPhijsyo0ij+lC9ZnVS886LAYZz5XScl1pVAYGZYjt7tl5FXycHU0S/DXlJ3OIhe
	 GmFCVOShbR4r5lIwoiRrV1wKkYRWmKVEebiTtNsGaXTGt9Uj0HFuf4dugAZGkEGYa2
	 a8ReS6O0g27Bw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E2C45378216D;
	Wed, 29 May 2024 12:06:12 +0000 (UTC)
Message-ID: <ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com>
Date: Wed, 29 May 2024 14:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal
 zones
To: Julien Panis <jpanis@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
 <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
 <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
 <808db317-4cee-426b-a840-013a5e03098d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <808db317-4cee-426b-a840-013a5e03098d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_050623_242221_4DF711B8 
X-CRM114-Status: GOOD (  23.76  )
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

Il 29/05/24 11:12, Julien Panis ha scritto:
> On 5/29/24 10:33, Chen-Yu Tsai wrote:
>> On Wed, May 29, 2024 at 4:17 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>> Il 29/05/24 07:57, Julien Panis ha scritto:
>>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>>
>>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>>> driver version.
>>>>
>>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> I'm getting some crazy readings which would cause the machine to
>> immediately shutdown during boot. Anyone else see this? Or maybe
>> my device has bad calibration data?
>>
>> gpu_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       +229.7 C
>>
>> nna_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       +229.7 C
>>
>> cpu_big0_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:         -7.2 C
>>
>> cpu_little2_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       +157.2 C
>>
>> cpu_little0_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       -277.1 C
>>
>> adsp_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       +229.7 C
>>
>> cpu_big1_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       +229.7 C
>>
>> cam_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:        +45.4 C
>>
>> cpu_little1_thermal-virtual-0
>> Adapter: Virtual device
>> temp1:       -241.8 C
> 
> It's likely that your device has bad calibration data indeed. We observed the same
> behavior on the mt8186 device we used (a Corsola) and finally realized that the
> golden temperature was 0 (device not properly calibrated).
> 
> To make a comparison, we run chromiumos v5.15 and dmesg output was:
> 'This sample is not calibrated, fake !!'
> Additional debugging revealed that the golden temp was actually 0. As a result,
> chromiumos v5.15 does not use the calibration data. It uses some default values
> instead. That's why you can observe good temperatures with chromiumos v5.15
> even with a device that is not calibrated.
> 
> This feature is not implemented in the driver upstream, so you need a device
> properly calibrated to get good temperatures with it. When we forced this
> driver using the default values used by chromiumos v5.15 instead of real calib
> data (temporarily, just for testing), the temperatures were good.
> 
> Please make sure your device is properly calibrated: 0 < golden temp < 62.
> 

Wait wait wait wait.

What's up with that calibration data stuff?

If there's any device that cannot use the calibration data, we need a way to
recognize whether the provided data (read from efuse, of course) is valid,
otherwise we're creating an important regression here.

"This device is unlucky" is not a good reason to have this kind of regression.

Since - as far as I understand - downstream can recognize that, upstream should
do the same.
I'd be okay with refusing to even probe this driver on such devices for the
moment being, as those are things that could be eventually handled on a second
part series, even though I would prefer a kind of on-the-fly calibration or
anyway something that would still make the unlucky ones to actually have good
readings *right now*.

Though, the fact that you assert that you observed this behavior on one of your
devices and *still decided to send that upstream* is, in my opinion, unacceptable.

Regards,
Angelo

