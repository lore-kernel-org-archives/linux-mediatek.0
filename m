Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E78C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/blZWOcOiamNa0Mp5UEjaNBFl7uBOWHXQ2xNb+5O/E=; b=Nfl+I9fmmV/P34CB7wZA1VxMn/
	Y2NTvhGK4sqX1rUwAfhewoPuEC7JvKF3na6XUjNDM8AH1vmaFCt851hUPSCXIDEZr/CSG+F8O/5SO
	WqtBlRyzbCyQm/sR8qY6GXFJkq4o+p1nSGg4g8ZxU99B3VwBTQLDLy8y9NcBlm77PjHpolTaWMPT8
	R2ARv2BkXmr3BejS1mDWXnj4jm3bnbovDPhD+ISQZz5IigGFoEoR5VUpePwvkofCa0xYhnfoWei2r
	gHlqEQsJLKGtJ11n+nkWSWBGAAaVnWVvjMWeHm4YQEvOYudoay0XEgBuduaNSIhYHrJFHztM5778L
	iLRAJUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXik-002VNr-5C; Fri, 24 Feb 2023 13:02:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXiY-002VJV-BL; Fri, 24 Feb 2023 13:02:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80A406602FB6;
	Fri, 24 Feb 2023 13:02:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677243746;
	bh=v09nEiPPrKyyZ5dnBNTGSJ/5jA/WVigVy6zfFwa7DEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gUHDoki01EnQxD1f5QnXwVHKZs8QUfYzYPjD3m/a6F8vOYJ98XrwY1axIFFBz0966
	 vy1IgyZK+YkQctwONolbD6b8BEMpXFD2Q3FR7K+VfILJUJ/CTRsJ9iJNig0vcwuFtg
	 rM+jUY3OGYKoC3//BAncdrtS8ZR09KBLoT3bOxPvjsMMWz5s1JkqcVaMMmjUTPlBA3
	 rCxoRNhekOPa+us26y3IFOTdgjLGtruOgTRpxHyO6qfVnTjxy0wdbbRh/K/iw5ikZv
	 9Nwyt9aNWZgA5Do/GYd+jrulhFSn6e/0VcRvVtEvxRrqHoE0H4/vIttwCib3X7AFte
	 s+Uiuc/12/rJg==
Message-ID: <fa6c2d63-0341-b5d6-059e-d44b1f2e9d02@collabora.com>
Date: Fri, 24 Feb 2023 14:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/16] arm64: dts: mediatek: mt8183-kukui: Override
 vgpu/vsram_gpu constraints
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
 <20230223134345.82625-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FUzeB1SPDt+Ys8ALA_y5ZAPQGnz43NnLCPorvurF3eYg@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FUzeB1SPDt+Ys8ALA_y5ZAPQGnz43NnLCPorvurF3eYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050230_546257_6F8DAB20 
X-CRM114-Status: GOOD (  16.10  )
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

Il 24/02/23 10:50, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
>> with the platform specific vmin/vmax for the highest possible SoC
>> binning.
> 
> The maximum voltage numbers don't match the existing OPP table though.

The OPP table that we've got in mt8183.dtsi does not declare frequencies for the
highest binning for this SoC, I guess because there was no way to check fuses to
restrict the table to bin XYZ.

These maximum voltages are - true - higher compared to the highest voltage in
the GPU OPP table, but they're still in spec (check datasheets!).

Should I reword the commit description?

Regards,
Angelo

> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index de9778c85b94..63952c1251df 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -401,6 +401,9 @@ &mt6358codec {
>>   };
>>
>>   &mt6358_vgpu_reg {
>> +       regulator-min-microvolt = <625000>;
>> +       regulator-max-microvolt = <900000>;
>> +
>>          regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
>>          regulator-coupled-max-spread = <100000>;
>>   };
>> @@ -416,6 +419,9 @@ &mt6358_vsim2_reg {
>>   };
>>
>>   &mt6358_vsram_gpu_reg {
>> +       regulator-min-microvolt = <850000>;
>> +       regulator-max-microvolt = <1000000>;
>> +
>>          regulator-coupled-with = <&mt6358_vgpu_reg>;
>>          regulator-coupled-max-spread = <100000>;
>>   };
>> --
>> 2.39.2
>>


