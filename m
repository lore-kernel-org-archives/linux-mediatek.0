Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8648C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAO/UWpVGrs48dAlqXXG53E/sGKyRkKaoaPPM0dGvgs=; b=QaAYaORsLjgZE+wTVDOmc2JSzY
	ZMX+EykAMU5ip0xI9KSjGruQgNk5CYnwzrjzZ36+5NH6T3qNe2+cYW7m/1mJgUyn13hY3bn7hYtXH
	Hki9qxpfxhULBIZBOkwfD9H6pQQGzGFBBWtKW6ti/STRJpTxtrq+zXbAWPJUJsjOSAMtz276fem0p
	GhQRiUjibIu6b2x4+88Y6+bXL3F4FcBLDA3kn0LvEbQclPy0j/ex1s+TuhhLWzoZV0Wt7pufCjo9F
	U4IK3gxEA+sPh8aARSmq7jwVzTJ7tYSndhsUKCSftnsNV3uSqnV8KxSo/2SF8YHkWbh8AFj2lSPnW
	MiGvou0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlB0-004yFK-2D;
	Fri, 19 Jan 2024 09:28:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlAx-004yEU-0x;
	Fri, 19 Jan 2024 09:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705656512;
	bh=Lhbql/RT2O/SWJDfGJ70KFwReffC1OnjFnXgYb8Q0nI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1ET+SY7K7XySrZyuXVekgjjQz1L29u/gNLqq8DRykljix0PWXmKfCEhw7nx8qOQ9T
	 qsth7UfW62Bg7siz/4nbAHpv/9b+QzVskY/tbaGfAIDKdBtFM8s8gPGfeH30eaWBMT
	 p78Or/RanDDOJ9pVaJRFXez0D/eQCOMTI0CkMcNft+Y+EAEz6uARYxmzOGvXdQUa+K
	 wbBxmjxAnSCk+77vnE2m6CaqGTCBEf9BiVcAPHvhTf4X/43ayWEOiT576soOJy1bvV
	 pN/d0B4adJc+4EPa2Mbo14esown6eDPApaz2KdD3h8gFT+VWGFcO+ZrqnI95sa5Wa9
	 NC7iCNCmReOYg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4B65837811F1;
	Fri, 19 Jan 2024 09:28:31 +0000 (UTC)
Message-ID: <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
Date: Fri, 19 Jan 2024 10:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988
 reset IDs
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>,
 Conor Dooley <conor@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
 <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_012835_531385_08C54816 
X-CRM114-Status: GOOD (  21.31  )
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

Il 18/01/24 23:00, Frank Wunderlich ha scritto:
>> Gesendet: Donnerstag, 18. Januar 2024 um 17:49 Uhr
>> Von: "Conor Dooley" <conor@kernel.org>
>> On Wed, Jan 17, 2024 at 07:41:10PM +0100, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add reset constants for using as index in driver and dts.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> v3:
>>> - add pcie reset id as suggested by angelo
>>>
>>> v2:
>>>   - add missing commit message and SoB
>>>   - change value of infrareset to 0
>>> ---
>>>   include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> index 493301971367..0eb152889a89 100644
>>> --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> @@ -10,4 +10,10 @@
>>>   /* ETHWARP resets */
>>>   #define MT7988_ETHWARP_RST_SWITCH		0
>>>
>>> +/* INFRA resets */
>>> +#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
>>> +#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1
>>
>> These are just "random" numbers, why not continue the numbering from the
>> ETHWARP?
> 
> i can do...basicly these consts are used in DTS and driver only as index.
> 
> @angelo what do you think? I though also in leaving some space to allow grouping RST0 and RST1
> when more consts are added, else the numbers are mixed up.
> 
> so e.g. let RST0 start at 20 and RST1 at 40 (or even higher, because RST0 and RST1 can have up to 32 resets).
> That will allow adding more reset constants between my values and having raising numbers.

The resets are organized on a per-reset-controller basis, so, the ETHWARP
reset controller's first reset is RST_SWITCH, the second one is RST_something_else,
etc. while the first reset of the INFRA reset controller is PEXTP_MAC_SWRST.

That's why ETHWARP has a reset index 0 and INFRA also starts at 0.
I think that the numbering is good as it is, and having one driver start at index 5
while the other starts at index 12 would only overcomplicate registering the resets
in each driver, or waste bytes by making unnecessarily large arrays, for (imo) no
good reason.

This is one header, but it should "in theory" be more than one... so we would have
one for each hardware block - but that'd make the reset directory over-crowded, as
other MediaTek SoCs have got even more resets in even more hardware blocks than the
MT7988. That'd be something like ~4 reset headers per SoC (and will increase with
newer ones)...
...and this is why we have one binding header for resets.

On the topic of leaving space to allow grouping RST0/RST1: -> No. <-
The indices have to start from zero and have to be sequential, with no holes.

Cheers,
Angelo


