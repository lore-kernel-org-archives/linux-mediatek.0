Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F3C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/bwk/XkHpMTJQMXvOCIeLCxtkh1TRndiUN0nTyhgCM=; b=oeK7IKcxH3aKq+AWPgmQydVqLR
	zzvCgHOy543arU5qL1ygMElx8colQwhH5ppTmIOrihuHezFFYCgMbIL/xAI6AJIqDzZuG5aXGoiA3
	b+eWG2GpFvecXTj8WkwAq6KYjBd0wngFc5qIiAuMrWhQvLAV43dvJI9s3U+PzOVDT0M9ji3gZ3lz2
	vdf82PoNatvRIn8WUMAHE8Bfbidbq7MtXjZ+L/Z9HgeZxNlUF4GUpmxXzu1g4Y2zpoWtYLnoNBPSY
	5p82dDk6Envw9bkTw2FFMKKjZ5KEtE2Ll4ZV4bA7q5jh8xTQbYao6Mc41vL8TroI4649gOCpcI7WL
	3q7/YfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXg08-001eGI-Oh; Thu, 02 Mar 2023 10:17:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfzy-001eDv-2z; Thu, 02 Mar 2023 10:17:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09DD96602E5A;
	Thu,  2 Mar 2023 10:17:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677752236;
	bh=o7ImUOBWJocC9IE4w/doapnXAOm4lxDZbXD8YD8dd4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KIkRDQIORgXA/JtkgBUDzdxgOgnBoCEig6Lp2q8g58I0F4raynLoL6kwtDyDRrGk0
	 Cqt1KU04//2mmbVqjmV3Ia0mNY/qIMNxa1f1YwEHRblxvlcjSWFOSbf5IzXcHv8exN
	 FQLNWCTHVgyp3+ylDkzs0Xr638oVKA2GaStFbRKjDR3e8vODI6llTkL+ah0pvb6RcE
	 zYsIWcRTCI9ey2meVJL2XaZt9GlQ/etqv1Q6HMa42EKE6zJ/LUPJUoKrMoGtFCx3zO
	 fT24Dx6Mocw65XersYHWcQ8e8f6OLKsCyKseS1Dt+GL6ESI7F2RjRR8Outd9r+YUj4
	 frtmC8FIxFMbg==
Message-ID: <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com>
Date: Thu, 2 Mar 2023 11:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_021718_296833_DD4B0669 
X-CRM114-Status: GOOD (  21.27  )
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

Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
> On Wed, Mar 1, 2023 at 5:55 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add coupling for these regulators, as VSRAM_OTHER is used to power the
>> GPU SRAM, and they have a strict voltage output relation to satisfy in
>> order to ensure GPU stable operation.
>> While at it, also add voltage constraint overrides for the GPU SRAM
>> regulator "mt6359_vsram_others" so that we stay in a safe range of
>> 0.75-0.80V.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> index 8570b78c04a4..f858eca219d7 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>>          regulator-always-on;
>>   };
>>
>> +&mt6359_vsram_others_ldo_reg {
>> +       regulator-min-microvolt = <750000>;
>> +       regulator-max-microvolt = <800000>;
>> +       regulator-coupled-with = <&mt6315_7_vbuck1>;
>> +       regulator-coupled-max-spread = <10000>;
> 
> Looking again at the downstream OPP table, it seems there's no voltage
> difference requirement. It only needs V_SRAM >= V_GPU. Same applies to
> MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >= 10000.

On MT8195 we don't need any regulator coupling. There, the GPU-SRAM voltage
is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need to
scale the vsram.

> 
> Would setting max-spread to 0 work? I ask because with both regulator's
> maximum voltage set to 0.8V, there's no way we can reach the highest
> OPP.
> 

No that doesn't work. I can raise the Vgpu max voltage to 0.88V to solve the
issue right here and right now, or we can leave it like that and revisit it
later.

I would at this point go for setting mt6315_7_vbuck1's max-microvolt to
880000, as this is the maximum recommended voltage for the GPU as per the
MT8192 datasheet, it would also make sense as we would be still describing
the hardware in a correct manner.

What do you think?

Angelo

> ChenYu
> 
> 
>> +};
>> +
>>   &mt6359_vufs_ldo_reg {
>>          regulator-always-on;
>>   };
>> @@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
>>                                  regulator-max-microvolt = <800000>;
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

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


