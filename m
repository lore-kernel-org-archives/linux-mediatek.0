Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EFEC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ckLWZcstPPxfSvC4qz7Ukfw1g9kry8h4VTkoUpZ7I0=; b=aJaEh3ItyrANdbpoXiSnPf4qwa
	36qO1iBMRmOxZKijkpseXHf8jNJ5ZX6Xg/jROcAO0x5JIXiNW1+f0JaU+HnF32V4VrIC5yBbw7dGk
	bE6roZ/6OWnNa2a1b2sAa14hmNoaKJwqLtQNjDCt/KG//tIAJQubjMPbuA1hYkWhs0EJPuygb2bS0
	G7kXF1HOTEZGy0xvuuTfgnsb6MpdqmDBtkZK3KKsp7RuwbOsPgoMrc7OzNhtDxlEGm0Y2KV+PIlwB
	HfwS03IFddpyRt3vjofalFXy6pQD0UDQSwVPtIPTqtG7Kb7JaB7C0+K0cKL7DmhcLo3vMiwkiiV3k
	KWkmpWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9007-0000000E6BT-0MQX;
	Mon, 20 May 2024 10:12:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9002-0000000E69w-3Inj;
	Mon, 20 May 2024 10:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716199929;
	bh=6NDH0z522me5vrgmflzfx3WQmnMcDdrAZ53MUWxQv/4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=3RKlVEnwwt+L5N6iv4pr5sMiBA1t3K7kWgvqTEz2d1rPQs0u9QxBIfxWjsU5Ch537
	 MwoEupaZcfEH4C6n5h8R0IDoqxWmROmYlaHoRlRJ7wjPrBZ/Q2kUZEOg5xMLmKHsni
	 LVSNEE08mvwsn0Jen6ElZtG6U57kCmUC11S4ghbAqW0cEyQAuYpJesHhj8ADRfXdR4
	 5qHAg0a9Wh0ytta1OEjeFBngPVBUthhT1DGluv2H5NzRfI/2ci45MZdCBWuUId4/nQ
	 TlCXVJzXpd2Jo6UUexOJwg2S72A7G0xA08/Z8OG9HNea6u1utU6oHEu+C8h44MZUUM
	 Ah+2Y+6LS3jtA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B0B037809D1;
	Mon, 20 May 2024 10:12:08 +0000 (UTC)
Message-ID: <cf8c87fe-7a4f-423f-9c97-3759eeee4894@collabora.com>
Date: Mon, 20 May 2024 12:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
 <f42ef151-6eee-418f-91e1-5ac08d161119@collabora.com>
 <2cc638ca-0add-4c8c-b844-606e22dbd253@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2cc638ca-0add-4c8c-b844-606e22dbd253@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_031211_148007_1235C76A 
X-CRM114-Status: GOOD (  11.34  )
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

Il 20/05/24 12:03, Krzysztof Kozlowski ha scritto:
> On 20/05/2024 11:55, AngeloGioacchino Del Regno wrote:
>> Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
>>> SoCs should use dedicated compatibles for each of their syscon nodes to
>>> precisely describe the block.  Using an incorrect compatible does not
>>> allow to properly match/validate children of the syscon device.  Replace
>>> SYSCFG compatible, which does not have children, with a new dedicated
>>> one for SCPSYS block.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Technically, that's not a SCPSYS block, but called SYSCFG in MT8365, but the
>> meaning and the functioning is the same, so it's fine for me.
> 
> So there are two syscfg blocks? With exactly the same set of registers
> or different?
> 

I'm not sure about that, I don't have the MT8365 datasheet...

Adding Alexandre to the loop - I think he can clarify as he should have the
required documentation.

Cheers

