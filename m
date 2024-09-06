Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B1CE7AE0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm5QgIUDubpUiQhLY8w6JKvukEqggEJqRqgvQGf/pV0=; b=w+/glpZRVl/K/yft7md5IospjO
	owZzt7filBTbd5tLOZI5kLpWqi7a4gWT1a32orxCwT8gGIfRmtQjT7YnLgrn31Wu0rtJqu3ifyY1h
	NKp35dwim3ADLIgeUfCr0pK/C2YZRU9nu8V+zFHugTEfMaMPuJRjdKHABEypzpXc8HxhkTMILWxHw
	78wkZMlUXGm+cXy+uV4MN9I4TzwVB6jBIjF+xUa5gLXQdAzTQiFZqyXFgo0MihRCtvROhIYI7pQqr
	Axjvn6HD7Wor/8KpUPLLnDZ40GtpmfZCwgc1gy7XrS2OIqQfKuIThJqsWpdSpZ96joZ/jNAY/lDJB
	bHWSZL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU2T-0000000BErp-25So;
	Fri, 06 Sep 2024 08:09:53 +0000
Received: from a7-45.smtp-out.eu-west-1.amazonses.com ([54.240.7.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU2C-0000000BElb-1KHj;
	Fri, 06 Sep 2024 08:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610171;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=d2LTvAUD73W6H0PO0+ppRV5eODWlqhokYf0EPpLmO1Q=;
	b=hvtHqYIsN1LHSFz/I3+79Xl2J7ynM7CbbXjY/i/+GU37GtFt5YFGc78rDX6zpCb8
	YWDK+vL58wDBybNZKe9wHNlmW30/cvd6eiR2AXQJV0x1zv5KYaS6GdLghNieAhYkH4A
	fxRhOw93Ro2YDHqdsVibNl3ieUFjJyksjyvEEFpErDG/ilsktiXXNnn9oLlrDKSrQPj
	NIpB0fE7EFYQKdz3cf9SVrjr1mP2E+/MG3Hw1SLK+cgezPwesEsw4ip94oNmS+PqER4
	wePQ1YPYIlgbI6iAJMIwNU72vO7uJOak6DNVWFGA8ohSNDYRCNc12KqMX0SdA4fG76J
	Yk+4/TiLBw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610171;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=d2LTvAUD73W6H0PO0+ppRV5eODWlqhokYf0EPpLmO1Q=;
	b=FvEBveOvYs0V7K/ZbTWOigQcdyphONs8KWEIpmWwnRnQJH6K3BwulfwmVgECm/u5
	6Vi7hIyAtQae0lNSJUkyV/EQNm11afexP6D9+HRXgkWHbeo7AwJCYuNP2dUQpXWWXQD
	67oAWNU9w5okwpa2WBjgvbkt0wgEOkW7IEHQj/ok=
Message-ID: <01020191c6619a72-e5b5627b-9094-4737-8333-28d2e0837303-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:09:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Fix supported-hw mask for
 GPU OPPs
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	wenst@chromium.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
References: <20240725072243.173104-1-angelogioacchino.delregno@collabora.com>
 <9aec2480-5b49-4fd0-8ad0-9fd87c865630@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9aec2480-5b49-4fd0-8ad0-9fd87c865630@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.45
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_010936_964656_A9DBFD6A 
X-CRM114-Status: GOOD (  13.85  )
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

Il 02/09/24 18:07, Matthias Brugger ha scritto:
> 
> 
> On 25/07/2024 09:22, AngeloGioacchino Del Regno wrote:
>> The speedbin eFuse reads a value 'x' from 0 to 7 and, in order to
>> make that compatible with opp-supported-hw, it gets post processed
>> as BIT(x).
>>
>> Change all of the 0x30 supported-hw to 0x20 to avoid getting
>> duplicate OPPs for speedbin 4, and also change all of the 0x8 to
>> 0xcf because speedbins different from 4 and 5 do support 900MHz,
>> 950MHz, 1000MHz with the higher voltage of 850mV, 900mV, 950mV
>> respectively.
>>
>> Fixes: f38ea593ad0d ("arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency 
>> scaling")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Patch got applied and is queued for v6.12 (v6.11-next/dts64 branch).
> Somehow no email was send to inform about this.
> 
> Angelo, not sure if it's worth investigating what happened.
> 

Thanks for that, yes I checked and I know what went wrong - shouldn't happen
anymore :-)

Cheers!
Angelo

> Regards,
> Matthias
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> index 4763ed5dc86c..d63a9defe73e 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> @@ -731,7 +731,7 @@ opp-850000000 {
>>           opp-900000000-3 {
>>               opp-hz = /bits/ 64 <900000000>;
>>               opp-microvolt = <850000>;
>> -            opp-supported-hw = <0x8>;
>> +            opp-supported-hw = <0xcf>;
>>           };
>>           opp-900000000-4 {
>> @@ -743,13 +743,13 @@ opp-900000000-4 {
>>           opp-900000000-5 {
>>               opp-hz = /bits/ 64 <900000000>;
>>               opp-microvolt = <825000>;
>> -            opp-supported-hw = <0x30>;
>> +            opp-supported-hw = <0x20>;
>>           };
>>           opp-950000000-3 {
>>               opp-hz = /bits/ 64 <950000000>;
>>               opp-microvolt = <900000>;
>> -            opp-supported-hw = <0x8>;
>> +            opp-supported-hw = <0xcf>;
>>           };
>>           opp-950000000-4 {
>> @@ -761,13 +761,13 @@ opp-950000000-4 {
>>           opp-950000000-5 {
>>               opp-hz = /bits/ 64 <950000000>;
>>               opp-microvolt = <850000>;
>> -            opp-supported-hw = <0x30>;
>> +            opp-supported-hw = <0x20>;
>>           };
>>           opp-1000000000-3 {
>>               opp-hz = /bits/ 64 <1000000000>;
>>               opp-microvolt = <950000>;
>> -            opp-supported-hw = <0x8>;
>> +            opp-supported-hw = <0xcf>;
>>           };
>>           opp-1000000000-4 {
>> @@ -779,7 +779,7 @@ opp-1000000000-4 {
>>           opp-1000000000-5 {
>>               opp-hz = /bits/ 64 <1000000000>;
>>               opp-microvolt = <875000>;
>> -            opp-supported-hw = <0x30>;
>> +            opp-supported-hw = <0x20>;
>>           };
>>       };



