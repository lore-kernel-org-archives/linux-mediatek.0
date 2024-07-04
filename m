Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99257C3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 18:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNOwyJfeFW+rZWEfskpZ4fSkCUgp0l0+Lt+tt17+jPQ=; b=Zlex3uFBKqubi8DZl2JIWnzYT8
	yJIfGf/sUKFE2eEjeB+BpYazi8/uP5htEau9Pg7AL0Rj11OSqltdbf6MxLEtDKqgJNpfYyr7pkCbl
	0JpMGzCkdmYSw6oJVRMiMbMeOzdOVnJRBStFaLAokp6B7MJwIDKJ5cGAxk8iy51pPQd3qMffjFt2e
	agWEn2Qq85QU7sqI92G3Wxu/Rdv7xMnH3sp23JZOIJYIvSSkC7OGt0kz9dGIImVgJfcpge7HmKvUZ
	4PhX0H7Ny+ZRJvW/auqOnDLvSApB8BmA2YWlH1VJgsJUgfenz8mEElZiWriy7G9vFFZaJ8puJSJbn
	dASh8zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRSl-0000000EBiF-1HLf;
	Thu, 04 Jul 2024 18:45:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRSW-0000000EBgp-0xy7;
	Thu, 04 Jul 2024 18:45:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F59C0008;
	Thu,  4 Jul 2024 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1720118729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNOwyJfeFW+rZWEfskpZ4fSkCUgp0l0+Lt+tt17+jPQ=;
	b=a9fBAGlz/l8UtJponmhZWr5KHT+kH0qCfBjhofSQ1Bb24ju6JNhMv01pScmzIfiV97Vj8v
	X2GIojfgOL4hbD+sMWmuFmieJsExHJZ0Qk3MoCjsmVXT/RheXjPK4hnDlxFULGUvxfZ+F+
	sLeqMF9qZJPe/uD2A7m74u9NKgP0rmUrN70iqmddtuQ08PJVEcNPeHhS40qrHanIDMrm7q
	IH7eZNOzEkCeA43Y8WT2KZK7XNkTZIRUd4WEdjQgpkfxr7q2us5ucBz4Um967DOSW0IRWw
	PQOInov0/7+wuKCpAOh8KIxY1Bmxc7zTPq9AzG0g2L+FpqlDqH46fUH704iMcg==
Message-ID: <11d18c59-c995-4520-9d37-a7879c53bafb@arinc9.com>
Date: Thu, 4 Jul 2024 21:45:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
To: Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
 <20240704171604.3ownsxasch5hokty@skbuf> <ZobgcXm9-am7xX6f@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZobgcXm9-am7xX6f@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_114532_560269_C2BBD422 
X-CRM114-Status: GOOD (  26.25  )
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

On 04/07/2024 20:48, Daniel Golle wrote:
> Hi Vladimir,
> 
> On Thu, Jul 04, 2024 at 08:16:04PM +0300, Vladimir Oltean wrote:
>> On Thu, Jul 04, 2024 at 04:08:22PM +0100, Daniel Golle wrote:
>>> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
>>> using bootstrap pins. However, there are only 4 possible options for the
>>> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
>>> switch is wrongly stated in the device tree as 0 (while in reality it is
>>> 31), warn the user about such broken device tree and make a good guess
>>> what was actually intended.
>>
>> Zero is the MDIO broadcast address. Doesn't the switch respond to it, or
>> what's exactly the problem?
> 
> No, MT7530 main device (ie. the switch itself, not the built-in PHYs
> which on MT7530 can also be exposed on the same bus) only responds to
> address 31 (default), 7, 15 or 23 (the latter 3 via non-default
> bootstrap configuration).
> 
> MT7531 always uses address 31 by default and also doesn't respond on
> address 0.
> 
> See also https://lkml.org/lkml/2024/5/31/236

To address my incorrect "0x0 is just another PHY address" remark there; in
22.2.4.5.5 of IEEE Std 802.3-2022, it is described that a PHY that is
connected to the station management entity via the mechanical interface
defined in 22.6 shall always respond to transactions addressed to PHY
Address zero <00000>. A station management entity that is attached to
multiple PHYs has to have prior knowledge of the appropriate PHY Address
for each PHY.

The MT7530 switch has the function to make its PHYs appear on the MDIO bus
which the switch also listens on. This feature is controlled by the
relevant bootstrap pin or by modifying the relevant bit on the modifiable
trap register. The MT7530 DSA subdriver currently configures the modifiable
trap register to enable this function. So one of the switch PHYs listens at
the PHY address 0x0. I don't know whether the switch would respond to
transactions addressed to the PHY address 0x0, if this function was
disabled. Finding this out doesn't seem too relevant to this topic.

>>> as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
>>> switch from device tree") the address in device tree will be taken into
>>> account, while before it was hard-coded to 0x1f.
>>>
>>> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
>>
>> I fail to understand the logic behind blaming this commit. There was no
>> observable issue prior to 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY
>> address of switch from device tree"), was there?
> 
> Please see the lengthy debate here:
> 
> https://lore.kernel.org/linux-arm-kernel/af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com/T/#mc967f795a062f6aaedea7375a3be104266e88cc4

This thread may not directly answer the question. The understanding Daniel
and I have come to is that the fact that the issue appeared after commit
868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of switch from
device tree") doesn't make it the commit to blame. But rather, the commit
that introduced a hardcoded 0x1f PHY address which, in result, allowed
broken device trees to work is to blame.

> 
> I should have provided a reference to that in the commit message or
> cover letter.

I agree, it would be a good idea to put it in the commit message.

Arınç

