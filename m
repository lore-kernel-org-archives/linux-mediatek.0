Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A19C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddABH9fG2VjMLWultSfg9E06OsrkyggnR0DC0GZrPtE=; b=p+B76jnmAGjXod7WyFWFeCyN7B
	xch/HNtr6YLZ6OrLYqKB9IE8qudnrfjqKU/FKFTDWS8ie9q58qSywRVNHs8XOpQuFDSRgEiFrcYoQ
	gteBoo20VLVPgj1Tsczo1BWM2DPxZmHMMRBqu7YJkxsDhCn/ddeooph/kjQKICKxNZ/NScoLPy4IQ
	xn2KfPzRPkKmQQQxHwuvOVd3jGsnlsLlVXLpDMSTOuFLiu7DqE5EYGsKLxACdn/dSzbvZZHGLRIG6
	yRzdnUN3rSz1OT8Q2jL8WifPVk8lK+V1/1cSh+qAPLMymeU+4w5TpuYBD5miuLPSLXBf4xINMZAGe
	nBTSO1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXlg-002Wz2-5G; Fri, 24 Feb 2023 13:05:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXlR-002Wqv-6u; Fri, 24 Feb 2023 13:05:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EE386602FB6;
	Fri, 24 Feb 2023 13:05:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677243928;
	bh=aVfAm+nqbHeECjn7WiittCHTPKqgPS/pUH3qciDBBc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9nU2MjQbPZi2nc6yF9Aamrh8ompl8InKd/kvjIlJKM0IpQoh8tF1GSEr3IBRATpb
	 SasUgJJS4JsSuFGRl5Fx5jALhtvW5H5ODPQZydwYyU7MiwTtb0Qwnfwb1wYwsJP8WD
	 kHnR8EmFK1htn974GrQMziuFYrkMzrabEx4Nb4wvSqqz6BStoeoVDqEXF33GilUL/G
	 MUY7+08FDC1dbUQL7FL8eXAMPOSWbRW6u5k0wp2QLJ2DYV1eS+mHf8C+Bi8bN2CdAJ
	 E/up31yxCNi2dAZSEK73kS+xxicGSCoxlGWDHXcXq1SixncMx5sJU3B7rGJU0i1bO0
	 vLHpeXrwv/tdA==
Message-ID: <7a4653f6-c074-1bd7-718a-7754f56c5105@collabora.com>
Date: Fri, 24 Feb 2023 14:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/16] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
 <20230223134345.82625-12-angelogioacchino.delregno@collabora.com>
 <CAGXv+5ER-Z9WiRAKEbfKV3hzNQu0Xru-z5QUJA85wzrwzY7hcw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5ER-Z9WiRAKEbfKV3hzNQu0Xru-z5QUJA85wzrwzY7hcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050529_436226_4599A27C 
X-CRM114-Status: GOOD (  15.41  )
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

Il 24/02/23 10:58, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add coupling for these regulators, as VSRAM_OTHER is used to power the
>> GPU SRAM, and they have a strict voltage output relation to satisfy in
>> order to ensure GPU stable operation.
>>
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
> 
> Also fix the constraints here? And overriding the constraints should be
> mentioned in the commit log.
> 

There's no constraint to fix, though. The current ones are just fine.

I'll mention the constraints override for vsram_others in v3!

Regards,
Angelo

>>                          };
>>                  };
>>          };
>> --
>> 2.39.2
>>



