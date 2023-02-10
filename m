Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50158C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIjALuEFa13JXGj7V7Nm8So7NrCwiihiQbHRyNEYwBk=; b=b/h8wHDHyyBUlW8RnN3e0RGFQH
	nHr+vG3gXglKGSE453Msxlk0VTib7GRxuEqH0ObUPCF6drP2JQsLViGCSn7a1XK8IU1ZYrSy8I0bU
	w5WajXpaYkTg89jfGunHwDPVUOWMl2hK7AZ9S88XBYYdvX1uqatw8/rUo3CLM16DCVwqNxOt6ms2T
	EZhwRFN4RM5sx0suR7MmdUfEznseDyTLlVWcPf3IFRC59CJya0Y520T9hlnjAOV8QFwux1tgBgNRA
	Y/gHJR2SxfkO1UeSd4u2U4qFH5c4DZUu/bxuKck/6QV0JCRqAIzdaYhqJ11Ij5GctOj3ekn7jy6vK
	ok158+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQScf-005iYC-Tp; Fri, 10 Feb 2023 12:35:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQScV-005iVw-CX; Fri, 10 Feb 2023 12:35:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F14B261DA7;
	Fri, 10 Feb 2023 12:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485F0C433EF;
	Fri, 10 Feb 2023 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676032513;
	bh=VE48/BFpY9oqV03SRPNJIzQxVKnk2kNg22dC8+ipOPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m3crUoVr31IK6DkF6r2xv+oUJ9j9szbJiXsY85GnpZZSagUplipp4rCZvRZAqDfD9
	 q0DJONooGPfKWdUqeXuRc58ZZE0p4ipgOurvU2N9R7Jau5JUVKSYsCgu6qlUtyUCVY
	 yseO1lXnIczQz9Nzv/bDYrfwf49NARJ6OJHTbVLV7hBLVjgRWNrdBGuRmKQj4MndYa
	 JW5QBP4mC0tBrFH3Kn7ggKwkDumY4J0RJ4PP7vtAFbcuFukekdMGqS1LyeE9gbcxZz
	 td0Ik1rZXQMDl/UljsItTQnHd7NnxqTn88nk3L5bjJJQKJNXHvt2mfROMJ9aXOOim7
	 peEq8UEVhjfkA==
Message-ID: <d789c9bd-82a6-5a63-cd98-b9e1e68daa2d@kernel.org>
Date: Fri, 10 Feb 2023 13:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: mediatek: add
 'mediatek,pn_swap' property
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
 <Y+Oo9HaqPeNVUANR@makrotopia.org>
 <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
 <Y+QinJ9W8hIIF9Ni@makrotopia.org>
 <c29a3a22-cc23-35bf-c8e0-ebe1405a4d94@kernel.org>
 <Y+YdqbJS4bDvTxuD@shell.armlinux.org.uk>
 <Y+Y3Lt4I5LPzlK5x@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y+Y3Lt4I5LPzlK5x@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_043515_557864_CA1200ED 
X-CRM114-Status: GOOD (  31.10  )
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

On 10/02/2023 13:23, Russell King (Oracle) wrote:
> On Fri, Feb 10, 2023 at 10:34:17AM +0000, Russell King (Oracle) wrote:
>> On Thu, Feb 09, 2023 at 12:30:27PM +0100, Krzysztof Kozlowski wrote:
>>> On 08/02/2023 23:30, Daniel Golle wrote:
>>>> Hm, none of the current PCS (or PHY) drivers are represented by a
>>>> syscon node... (and maybe that's the mistake in first place?)
>>>
>>> Yes.
>>
>> Nos, it isn't.
> 
> To expand on this - I have no idea why you consider it a mistake that
> apparently all PCS aren't represented by a syscon node.
> 
> PCS is a sub-block in an ethernet system, just the same as a MAC is a
> sub-block. PCS can appear in several locations of an ethernet system,
> but are generally found either side of a serial ethernet link such
> as 1000base-X, SGMII, USXGMII, 10Gbase-R etc.
> 
> So, one can find PCS within an ethernet PHY - and there may be one
> facing the MAC connection, and there will be another facing the media.
> We generally do not need to separate these PCS from the PHY itself
> because we view the PHY as one whole device.
> 
> The optional PCS on the MAC side of the link is something that we
> need to know about, because this has to be configured to talk to the
> PHY, or to configure and obtain negotiation results from in the case of
> fibre links.
> 
> PCS on the MAC side are not a system level device, they are very much a
> specific piece of ethernet hardware in the same way that the MAC is,
> and we don't represent the MAC as a syscon node. There is no reason
> to do so with PCS.
> 
> These PCS on the MAC side tend to be accessed via direct MMIO accesses,
> or over a MDIO bus.
> 
> There's other blocks in the IEEE 802.3 ethernet layering, such as the
> PMA/PMD module (which for the MAC side we tend to model with the
> drivers/phy layer) - but again, these also appear in ethernet PHYs
> in order to produce the electrical signals for e.g. twisted pair
> ethernet.
> 
> So, to effectively state that you consider that PCS should always be
> represented as a syscon node is rather naieve, and really as a DT
> reviewer you should not be making such decisions, but soliciting
> opinions from those who know this subject area in detail _whether_
> they are some kind of system controller before making such a
> decision.

Daniel switched to private emails, so unfortunately our talk is not
visible here, nevertheless thanks for the feedback. Much appreciated!

Best regards,
Krzysztof


