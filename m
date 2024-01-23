Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B3C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6fGmupNWUJm36qawclh6EXAzq0IaFE4bccF4vM6NZQ=; b=bFLwCGw1Rw//Ln0OI86wGryvjg
	sSmOVDdAGWd64LXp6gqMUXoXOt2e2T7Z/Cvfh1DlypTBLy4IYlYcwNJryDpR7jxjGB8FZgnJmSF6M
	m2L6O5FMxaUOaYiqYB46pTZUoq0+yL51TcosUFqWn9UXI8KzpLLKro89AV9Nf9Fx05EGWWaE+wMt8
	YXhUTRmYrA4EOKZqyeYlpa9ZmJx9H79Rjypw9lBfPssjQXCbuxDcILw4Vi4+o0PTp1x7hMS9RzGCD
	CLPnDpm6xyYGV6uZnD50vS6Pb7va1DPMQMZBtJQmZ+kUW9Bv5VEpCwQKl6wNcbPBNX0Qd9z6Tpoic
	tDOzJehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEBA-00Fyd6-0X;
	Tue, 23 Jan 2024 10:38:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEB6-00Fyc4-0n;
	Tue, 23 Jan 2024 10:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706006323;
	bh=fwg7iBzcpslli0ryw+wtduKrPGzNpgD5nM2Zx1ePlms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZuLuyXebqQIG3hIBTdPltslzYWi3LxwHi0JJG2YvYJ6+6y5UJctBEG01QbcZTCcbN
	 c543IXvAmNSM9qIAPV0m+Neeqw6MNEVnDrv2FOtWaExL0sPflG6UmOghjGowu4EHOc
	 vFeSrVENN8IcvU9mz5airnhfaMnf2jmSuzmHFtD2FRzAExoAcIQq/NebZ2gyys5U+T
	 3OgF3UF+BEByuo9EAGYYjyPWlqSsCx1eYLYIlqk7NSI9WMtwMUjps5J6UxuEFF3OdI
	 diUJ4azfCCzcG7zodhGSX7SbyPk1vdb+WnU0kUMUWeuO3LKSVBAWaEwGMN4ZBoG7Ph
	 a59aoE63yQdTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9DB137820A9;
	Tue, 23 Jan 2024 10:38:42 +0000 (UTC)
Message-ID: <cfee57f3-5940-44c3-a93b-3a5160dc8351@collabora.com>
Date: Tue, 23 Jan 2024 11:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] arm64: dts: mt8195-cherry-tomato: change
 watchdog reset boot flow
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
References: <20231228105717.719624-1-yuanhsinte@chromium.org>
 <CAGXv+5H-mpXZ_0H_HchDWeTgx+4Nkxh6651DEs1C62mrXczTkA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5H-mpXZ_0H_HchDWeTgx+4Nkxh6651DEs1C62mrXczTkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_023848_468004_7858FD31 
X-CRM114-Status: GOOD (  14.46  )
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

Il 23/01/24 05:03, Chen-Yu Tsai ha scritto:
> +CC Nicolas
> 
> On Thu, Dec 28, 2023 at 6:57 PM Hsin-Te Yuan <yuanhsinte@chromium.org> wrote:
>>
>> The external output reset signal was originally disabled and sent from
>> firmware. However, an unfixed bug in the firmware on tomato prevents
>> the signal from being sent, causing the device to fail to boot. To fix
>> this, enable external output reset signal to allow the device to reboot
>> normally.
>>
>> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> 
> Friendly ping?
> 
> Also wondering if you folks hit this, or if you haven't triggered the
> watchdog at all.
> 

I have never seen any watchdog timeout on Tomato R2.

In any case - this commit misses a Fixes tag...

Cheers,
Angelo

> ChenYu
> 
>> ---
>>
>> Changes in v2:
>> - Limit the effect only on tomato.
>>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>> index 2d5e8f371b6d..a82d716f10d4 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>> @@ -23,3 +23,7 @@ &sound {
>>   &ts_10 {
>>          status = "okay";
>>   };
>> +
>> +&watchdog {
>> +       /delete-property/ mediatek,disable-extrst;
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>> index 2586c32ce6e6..2fe20e0dad83 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>> @@ -43,3 +43,7 @@ &sound {
>>   &ts_10 {
>>          status = "okay";
>>   };
>> +
>> +&watchdog {
>> +       /delete-property/ mediatek,disable-extrst;
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>> index f54f9477b99d..dd294ca98194 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>> @@ -44,3 +44,7 @@ &sound {
>>   &ts_10 {
>>          status = "okay";
>>   };
>> +
>> +&watchdog {
>> +       /delete-property/ mediatek,disable-extrst;
>> +};
>> --
>> 2.43.0.472.g3155946c3a-goog
>>

