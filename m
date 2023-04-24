Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878CDC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 07:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQqjbCgFWcdyX9SgGq83k8uijHZuLdrf5kVtdt7mk9I=; b=ySe2O8877nlGcecyznlthInew1
	lOz5Maa2wHzpg4+ZRLjCPVeTV0gd0fTLneKbJLOQhi8YNlH0/wiRvcjvBiuHmMxiEzaTIsbiZu+1G
	PoDReo5h0tr/CvlCPAB7aol8oKtexRNORohgfMQBf87Z3jwXiLmhIxm4jOOScnYPr1CaogeK/dC5t
	sugQOlhQyWGWKakUGJ1u2NgO8OyXxFeFoYrlxqF9Q8TKCdfYMYR8gAZzZ62RfI4do0hheQd6XM05z
	9EvPjzyGtCRwKxojlUZ7xNDQZKaSu9L+jxvZPOIvGcl0x3owuZbRsTk54X/HNfuKFxGiC3FSSgDb7
	TbGFwDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqU1-00FYqt-25;
	Mon, 24 Apr 2023 07:19:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqTx-00FYpu-35;
	Mon, 24 Apr 2023 07:19:31 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C9B2A6603230;
	Mon, 24 Apr 2023 08:19:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682320768;
	bh=y2Zd2mcukyD5xgMKFFTPfcFPwvNeasLimenGu+uA/Bo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbvwbiGw60azOUiU1kTbXJHXAXuV05mA6I3vJ7dRUYev2CdCIpTgKaYSjvOiyGvrq
	 5DYVyhRCZUu2UvkC4imr198sHrFU81/DUXdXYW1P/x8r9UWEvdSNIlB5QK4KtTmZDv
	 gDH6ib5uJZS+HVKRWfLCzMJvOHDSzkkgnc+Sh1pdxs0vLl7ikPYKjP2CRJRLlRHvif
	 sYqOQ2+775SJOVbCTmeqWIiYgwv1lynzqZNfmeNg8VgoGrFqLS34EFh5dKkSei945H
	 uQhDAUGJ+L5MW7gbxpddNxyhVSBWQgjLTuCUIIynjAuZJm2GR8aN6jE8d7N+UVLDeO
	 wYAoK7oNTqX2A==
Message-ID: <8a3c0e35-b581-3405-ea2d-f8f8d9e432d9@collabora.com>
Date: Mon, 24 Apr 2023 09:19:25 +0200
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
 <0a0917f9-756f-6926-8ede-2b087cb0b716@collabora.com>
 <CAGXv+5FMEphksTSLAy8=hDPGjC364dxD4_9qmw6aV4en-2d3ig@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FMEphksTSLAy8=hDPGjC364dxD4_9qmw6aV4en-2d3ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_001930_126427_BB86D969 
X-CRM114-Status: GOOD (  19.66  )
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

Il 24/04/23 09:17, Chen-Yu Tsai ha scritto:
> On Mon, Apr 24, 2023 at 3:03 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 21/04/23 08:46, Chen-Yu Tsai ha scritto:
>>> On Thu, Apr 20, 2023 at 5:45 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> On Cherry boards, the IP at 0x1c015000 (dp_intf0) is used as primary
>>>> dp-intf, while the other at 0x1c113000 (dp_intf1) is used as secondary:
>>>> assign them to dp-intf{0,1} aliases respectively.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
>>>
>>> This should be applied at the SoC level. The display pipeline is fixed in
>>> MMSYS, so it applies to all MT8195 devices.
>>>
>>
>> It's fixed in the MMSYS configuration/driver but - as far as I remember (I can
>> recheck on the datasheets) - the dp_intfX function can be inverted meaning that
>> the MMSYS paths can be configured such that DP_INTF0 becomes secondary and the
>> other becomes primary: this is why I am putting that into mt8195-cherry and not
>> mt8195.dtsi.
> 
> Maybe that's possible, but the diagram in the datasheet suggests a fixed path.
> 
> Either way, it's not actually the problem. My original reply is probably
> inaccurate. AFAIK the aliases are used to identify the individual hardware
> blocks, which otherwise have the same compatible string. So the numbering
> should be the same regardless of the design and/or routing.

Ack. Will move to mt8195.dtsi!

> 
> Ideally this should be described with a proper graph though.
> 
> ChenYu
> 
>>
>> Regards,
>> Angelo
>>
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> index 0820e9ba3829..918380697a9a 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> @@ -10,6 +10,8 @@
>>>>
>>>>    / {
>>>>           aliases {
>>>> +               dp-intf0 = &dp_intf0;
>>>> +               dp-intf1 = &dp_intf1;
>>>>                   i2c0 = &i2c0;
>>>>                   i2c1 = &i2c1;
>>>>                   i2c2 = &i2c2;
>>>> --
>>>> 2.40.0
>>>>
>>>>
>>>
>>



