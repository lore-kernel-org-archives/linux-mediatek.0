Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F28C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7EQpZQ0zIYpX4tsqF5beTBP8gidcV6pAM9ZgWvM3MI=; b=lCq/yAGF86ArWp2avtp8W8Gdl3
	hv4ZpAqpnffxtU31udememOh3P272lwVCSV9LO6OPXK9DBzQ2pwc4I3n1nCRU5Ox/Q48M8imAeKbp
	9hRt6B4l7CtRU6m/RPOhn66AtvmgDQDYp/YBJcmczIZFt/IJqTzi2lpxdBG+BNQZ+4fJ03EtA6dfD
	3Cr2FmWfUV8ho/n5+0j+Ay16ieUksHK7L7wetsBOefUGxy4WDXOaXgRzFmtcSEDNJP4xj5JtyIYTG
	Tf529gdLQGnMTQ2goFoT1ic0v+mXPFVXothpstASspuMi25NfOTbTPCFl5EZnMOKIFmTp2hjclM/y
	oJlV/Teg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXInL-00Fabn-2j; Wed, 01 Mar 2023 09:30:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXInB-00Faa1-1m; Wed, 01 Mar 2023 09:30:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DC106600362;
	Wed,  1 Mar 2023 09:30:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677663028;
	bh=kzRKHPaffCQS5sZAFMRnd4mRdECYEDJHB5S8AGoRV3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ilJhazDlsLkG0QAjiGSO16V0TmcYh3StQiRL5RB9pxezQuHyy5YJl2YKZXyTn3iox
	 G558l5GWrGaUOt7gVhT6EDDGpYo8/we/o8y+n9vanUn9LOEDVYSnX4lXdjLPjoKIUS
	 NCQw3HOODF4DkwXD8jj5XpQvOov/Crh6OQSYY05shfq0CX54cIbuT8k0iIs2S7vyGs
	 L02OS97YYbQTOD/lUSxdqKXz4r6R95OmShXqkfnDTCPXoTySQ9LFkj/+489zNVlnn1
	 YiVOGSQ/Ony31EpA7UlTr4lGbxwwa9xEw9pJuNy4vwurSXUkK8aSl/0squi69e0LlZ
	 UfdmJiK2Wz30Q==
Message-ID: <1022ffb8-c691-5af3-e138-006ea77d3165@collabora.com>
Date: Wed, 1 Mar 2023 10:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/18] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
 <20230228104741.717819-12-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FyjoLo1VW2Kep5JWH0tz5JE77XjbwWiKusnTntj2eZHQ@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FyjoLo1VW2Kep5JWH0tz5JE77XjbwWiKusnTntj2eZHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_013033_245542_85669182 
X-CRM114-Status: GOOD (  21.12  )
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

Il 01/03/23 05:53, Chen-Yu Tsai ha scritto:
> On Tue, Feb 28, 2023 at 6:47 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add coupling for these regulators, as VSRAM_OTHER is used to power the
>> GPU SRAM, and they have a strict voltage output relation to satisfy in
>> order to ensure GPU stable operation.
>> While at it, also add voltage constraint overrides for the GPU SRAM
>> regulator "mt6359_vsram_others", but don't touch mt6315's vbuck1 as
>> its constraints are fine.
> 
> The minimum voltage on vbuck1 matches the lowest OPP. However the maximum
> voltage is set to the maximum of the regulator itself. The MT8192 datasheet
> says the absolute maximum for the GPU is 0.8V, and the recommended range
> for 0.8V is 0.72V ~ 0.88V. The highest OPP we have is 0.8V, so I would
> just set the maximum voltage to that?
> 

The point was that we'd never get vbuck1 at more than vsram+10mV because
of the constraints that are set with regulator-coupled-max-spread, but
thinking about it again, relying on that is *highly* suboptimal.

Yes, you're right, let's change the constraints on vbuck1 to 800mV: that's
going to be for v4.

Thanks!
Angelo

> ChenYu
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> index df477eb89f21..c8b6e1a9605b 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>>          regulator-always-on;
>>   };
>>
>> +&mt6359_vsram_others_ldo_reg {
>> +       regulator-min-microvolt = <750000>;
>> +       regulator-max-microvolt = <850000>;
>> +       regulator-coupled-with = <&mt6315_7_vbuck1>;
>> +       regulator-coupled-max-spread = <10000>;
>> +};
>> +
>>   &mt6359_vufs_ldo_reg {
>>          regulator-always-on;
>>   };
>> @@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
>>                                  regulator-max-microvolt = <1193750>;
>>                                  regulator-enable-ramp-delay = <256>;
>>                                  regulator-allowed-modes = <0 1 2>;
>> +                               regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
>> +                               regulator-coupled-max-spread = <10000>;
>>                          };
>>                  };
>>          };
>> --
>> 2.39.2
>>


