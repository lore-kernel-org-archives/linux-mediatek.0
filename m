Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E1CEEB565
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rkhhtJg3KI5Lb3plQrFJ8XWtOp+E8JXeRwQOxDVSCQ=; b=WmBQ7qXBus6KgD6Yphzro41edI
	EgLtz+EUKTpgUaCKwXu9o97aWMN+z0pjd2qAF0XiNkJZyjUSk4Fby4onsQmAeJmdlNm/F+Ln6kjxp
	otmQssW1bVo6X3iD5nomLuW8x+/U2OSR83nHqs9qv2WnTtejSkwEllHomEkNlSYHU1q7mp2D+mkP1
	Txan1b5QoGJjPV/9uv+KAgTM44GUU8U9jpKIjQ/ZlwC8DDz/CnfUi8kZkLSIgyKuSpepNGSVaR5i9
	IHC+9KWYX9ET2lwDTQWXvW0/JX40rRyhsob+zXBuO1yT84in1GZgQn3JRyXr88kNOSkyvY32M42rG
	sHKQZavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofh3-0000000CSAI-3YUh;
	Thu, 12 Sep 2024 09:00:49 +0000
Received: from a7-42.smtp-out.eu-west-1.amazonses.com ([54.240.7.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soed2-0000000CFxi-2Taz;
	Thu, 12 Sep 2024 07:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726127552;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K3pm6X6uxgABerMke/w7Hi/s9E6MlhMLw0RxpeXXuic=;
	b=DWi3/XmpM4dXcSRy3WBYeEz09HFUYETrYfN+9K+6AUsDhtV7qg7Q9s/cT+IIG6Xs
	Xq9gdTBnDXUGedB3w4BemQNyZwGMtqk0PwIKu9ooE9m1yhriwwaqRDVYu2Dh4Ph2T+0
	SEBmSKAl4DU2yj05P/CtjdLPe477qK5b1j3H4aeXyBQhbiQoVvOaD5ndkDidxNCK9l7
	UrRuxDgtfLH2u67qNJZL0qblDMhtuWD708LUYjk2oXZ1V7gLK36qitqqTYudd4Z4xb8
	Z1ir5etzgpW8f2di9Y4oFdMBbF6egCNiNfkmCq+YpokKrksWABGBka7JX0LQXTmjrrH
	wOTu+vmRCg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726127552;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=K3pm6X6uxgABerMke/w7Hi/s9E6MlhMLw0RxpeXXuic=;
	b=SwxBjU3Go+S1KILudUPzbepP9EQyOQNFAnh/cV1AWFJqOeJbwG0Hrkmh9HUdeBmz
	TFb6ClOlhBj+5uLPurfx5LCPJf/5bqyI6mNBG1qmRDmzgpCRVexmBhSt7lpcjcpTbvL
	WBuVEvh/J1RN8E9i8WGhbu39Cnr46CiQqe6EFymo=
Message-ID: <01020191e5383829-7eb375ea-ee17-419e-b173-30df46f61863-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 07:52:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240910143245.5282-1-pablo.sun@mediatek.com>
 <01020191e04d4237-204596e1-6cc1-491c-a60f-de3917af7d42-000000@eu-west-1.amazonses.com>
 <2fd45240-a341-806b-f336-78d0595a8031@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2fd45240-a341-806b-f336-78d0595a8031@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_005236_866247_7BD355F4 
X-CRM114-Status: GOOD (  22.24  )
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

Il 11/09/24 12:35, Pablo Sun ha scritto:
> Hi Angelo,
> 
> Thanks for the review,
> 
> On 9/11/24 16:57, AngeloGioacchino Del Regno wrote:
> 
> [snip]
> 
>>> +/* for GPU SRAM */
>>> +&mt6359_vsram_others_ldo_reg {
>>> +    regulator-always-on;
>>
>> No, that's not good. Like that, the GPU VSRAM will be subject to current leakage.
>>
>> Remove the regulator-always-on property.
>> The right way of doing that is to add the vgpu to the mfg0's domain supply and
>> vsram to mfg1; that way all of the GPU regulators will be off at PM suspend time.
> 
> Thanks for pointing this out, I'll send v2 to fix this.
> 
>>>   &mt6359codec {
>>>       mediatek,mic-type-0 = <1>; /* ACC */
>>>       mediatek,mic-type-1 = <3>; /* DCC */
>>> @@ -839,8 +851,8 @@ regulators {
>>>               mt6315_7_vbuck1: vbuck1 {
>>>                   regulator-compatible = "vbuck1";
>>>                   regulator-name = "Vgpu";
>>> -                regulator-min-microvolt = <300000>;
>>> -                regulator-max-microvolt = <1193750>;
>>> +                regulator-min-microvolt = <546000>;
>>
>> I'm okay with this constraint but are you sure that MTK-SVS won't go any lower 
>> than 0.546V?
> 
> I'll see if I could confirm the maximum voltage drop that may be lowered by mtk-svs 
> for MT8395. There are 3 constraints that I am aware of:
> 
> - capability of Vgpu buck: 0.3V-1.193V
> - sign-off voltage of the EVK board: 0.6V to 1.2V
> - recommended operating voltage of MT8395 DVDD_GPU: 0.546V to 0.787V
> 
> For the device tree of the board, would you recommend set the regulator voltage 
> constraints in narrower range (because it's safer to keep in recommended operating 
> conditions), or in a wider range (leaving the check to driver software for 
> potential power saving?)
> 

The range should match the target device's Vin constraints; in this case, it
should be no lower than the minimum working voltage of the Vgpu-in of the Mali IP.

The drivers will be responsible of setting the lowest possible voltage for
enhanced efficiency (power saving), taking into account the fused chip quality bits
(in this case, the MediaTek SVS driver!).

You should, at this point, check the constraints of SVS, as in, given a reference
voltage (in this case, located in the GPU OPP table, the voltage associated with
the lowest frequency of the GPU), what is the maximum voltage *subtraction* that
SVS will do on the VGPU?

After the subtraction, may this voltage be lower than 0.546V? :-)

Cheers,
Angelo

> Thanks
> 
> 




