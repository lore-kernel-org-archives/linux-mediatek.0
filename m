Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7B5C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GGfIWOZzoS5FI6VacxBhh6eflIWOIAfi24KVKKdHfY=; b=pyLOdAAYsH/J2zOM5KF/EAxMUy
	YbwR15Bfvb93FXrX0veH8VrGNkbYaQE6lvJwVurt6uJ/sVw+Kgj5Y5Y0yc38AZd7sqtZmuI3vhOA/
	enFXj46e0ncJ33ZeBObbSrWCaUFfeypKLxDlrzfPvpKv5WEdFEeBZ0rxu+Zfh+HNIYXtFs2YEnOKq
	hoscpvSN89b+63doZt2WDCk9k5k5dtA8UmzHArwJfQHcuvXp8cWXyX8LUCgVMPBA79Ko3p9WhlUZ9
	OTDc5LEA6mVwASxHiXF792d4CeSPUmun38ltIxPWp7+jz1OeaZCLZ5FigOofOmPR501tKv3QcRtuy
	NdfzPOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjXk-00CBRq-0G;
	Tue, 16 Jan 2024 13:31:52 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjXg-00CBQr-2p;
	Tue, 16 Jan 2024 13:31:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C9760007;
	Tue, 16 Jan 2024 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705411903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GGfIWOZzoS5FI6VacxBhh6eflIWOIAfi24KVKKdHfY=;
	b=D1yNi7boiHKa08RmzfZ6e2rsRmm1OFbabWijcNnT6H2ifQWwEn128b8yg4R7A8gA5WJpjE
	DH8SgTCStZCT55yl2OIvuYFAzknW1ULVe2+Q91EpFHI8HUhx+ixb+2W/AuY+fI+sdTlSdS
	WU4MWcG//90J9h9sA6a+x6qTkDuByO2rldOp7ilHMedD6Wo+EiWg5QczidTE3SeXJmwOFv
	sEyJX6s8hd5sv+sOnng9NNXHn/5mJ5pU+f9P2O0N+SY9Vq0JDHkc+fFy/ehzs9B4Y/Ji5J
	+6hM5dD0FmABHXb/voX6CWeOTK8kTgnIc4INpgmiNnaPKpO1sIVUD7yyfsbsUw==
Message-ID: <656cf9e2-2ab9-48ea-9eea-7599f14f3a41@arinc9.com>
Date: Tue, 16 Jan 2024 16:31:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 7/8] net: dsa: mt7530: correct port
 capabilities of MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-8-arinc.unal@arinc9.com>
 <20240115214238.bnlvomatududng6l@skbuf> <ZaWtIMC9zqwjVewO@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZaWtIMC9zqwjVewO@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_053149_048633_0EA003C4 
X-CRM114-Status: GOOD (  13.86  )
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

On 16.01.2024 01:09, Daniel Golle wrote:
> On Mon, Jan 15, 2024 at 11:42:38PM +0200, Vladimir Oltean wrote:
>> On Sat, Jan 13, 2024 at 01:25:28PM +0300, Arınç ÜNAL wrote:
>>> On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
>>> Set the internal phy cases to '0 ... 3'.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>
>> For this patch to be obviously correct, please make a statement in the
>> commit message about port 4. It doesn't exist at all?
> 
> Correct. As shown in Block Diagram 8.1.1.3 on page 125 of
> MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open Version)
> Version: 0.1
> Release Date: 2023-10-18
> which is available publicly on BananaPi's Wiki[1].
> 
> Port 0~3 are TP user ports, Port 6 is internally linked to XGMII of MAC 0.
> Port 4 and 5 are not used at all in this design.
> 
> [1]: https://wiki.banana-pi.org/Banana_Pi_BPI-R4#Documents

Thanks for chiming in Daniel, I will include this on the patch log.

Arınç

