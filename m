Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55384C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HWppGB2ukMnIg2+wcrbWazO48KNrSz6gsvzeybPEy0=; b=v0dSSwuZU1Soq1oyai4mZuRCjS
	kR0rmZYcbi3oG4Th82wJB2NCqVsPvybVh5TAYcON9hxqyT8PWSYGPM0W1HLwahWXReH97v9hRaWIn
	EjOsnar0EKFrDotj2853etHCvM+UrW9xbf3wzNOHFTqtg7I7U2+rMVQq++GxiNYlnfuXG/In3zaOk
	oqNXLOcB2Qw2Z7Ah62O07piWOYbv1jRCbMM8FTeZLQVjKzqOYjh7aDqO7jDT6SSOK/iYw17epQSWS
	l18HcteUt+luP6JXiWz2dUqs/xHnZLoz4yKZWU6mz49B4th+jVTsxMMzUOgEiVe+n5dIpJzUZT32t
	JJVm3IZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqEp-00FX26-01;
	Mon, 24 Apr 2023 07:03:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqEf-00FX0g-24;
	Mon, 24 Apr 2023 07:03:43 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 77DC8660328C;
	Mon, 24 Apr 2023 08:03:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682319819;
	bh=BcRGcHyOxApaTa63eksxruQB/FnnfseF/8/KFtyoPuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lc8JE8CfgEckcQWb3q+06AfgNeh+wD7PqhlF225cKHtBjj3q6+JEjIvq18eeuTgZ4
	 Ox/fOnivwwITFtzRXmxCv5EQxSsAZelTGEREfiOrfzmM8b3edaSwjRXRgFKnlf2OvR
	 MoWT+Ro+8j3kfGHw+8anbz+TZY4O2F0bbdG0QI38cOR5YMocC7X45crXNqByTjnVdl
	 IJZVtUcHfS436enWDK8cx+ktt3VP3OS2nOHNL4czNn3I3fowWBrRNy6Dj1Sn0cr9Nw
	 iHy4mQbPJsr4FEIvvQvkMj2HKv82QUTur4zRBK/T7za1CgUsJ8LIVV1sxSyKAC9A0z
	 FfD8PlVjSJB0Q==
Message-ID: <0a0917f9-756f-6926-8ede-2b087cb0b716@collabora.com>
Date: Mon, 24 Apr 2023 09:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: cherry: Assign dp-intf aliases
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EtCdpXtq6q2Cv+QAZPUE6yJiSZhngSc0sftz-_uDrZXw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EtCdpXtq6q2Cv+QAZPUE6yJiSZhngSc0sftz-_uDrZXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_000341_824200_D87FFE11 
X-CRM114-Status: GOOD (  16.71  )
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

Il 21/04/23 08:46, Chen-Yu Tsai ha scritto:
> On Thu, Apr 20, 2023 at 5:45 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On Cherry boards, the IP at 0x1c015000 (dp_intf0) is used as primary
>> dp-intf, while the other at 0x1c113000 (dp_intf1) is used as secondary:
>> assign them to dp-intf{0,1} aliases respectively.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
> 
> This should be applied at the SoC level. The display pipeline is fixed in
> MMSYS, so it applies to all MT8195 devices.
> 

It's fixed in the MMSYS configuration/driver but - as far as I remember (I can
recheck on the datasheets) - the dp_intfX function can be inverted meaning that
the MMSYS paths can be configured such that DP_INTF0 becomes secondary and the
other becomes primary: this is why I am putting that into mt8195-cherry and not
mt8195.dtsi.

Regards,
Angelo

>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> index 0820e9ba3829..918380697a9a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> @@ -10,6 +10,8 @@
>>
>>   / {
>>          aliases {
>> +               dp-intf0 = &dp_intf0;
>> +               dp-intf1 = &dp_intf1;
>>                  i2c0 = &i2c0;
>>                  i2c1 = &i2c1;
>>                  i2c2 = &i2c2;
>> --
>> 2.40.0
>>
>>
> 


