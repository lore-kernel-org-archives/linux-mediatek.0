Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DC1C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogNqXL0ApIs13zC/uLEPr6wCJVu7uWiXb0gYZeNG97o=; b=o0oSRdOXAcdx8eUJ39+PdUDt3y
	eMONiXdEpJ8rD0UjymQymbnpXgy0+c22/hnfcLBPm8TKOqORgFNqzGvLzw8AFAHhcd3EzY6fKZlW5
	MJMt5zkmNP91pEIZsHhgkxQd9GQDlKZcy4ot2cQpujZ63yNFEHw9f3BAmHTN/YJHKLRu06uN3+S+2
	cIIZznAXlJ2njGd+EjyoMVWk/XwLbsbGZiMJRN9ailnrqDiyBZlqDSxM0t3N8kyeaKVFT4QfPYhNH
	pxiX87x/0AHxDvskQeAzIRYjbKg9p64cuiYoxHM5th7Vk0mDitXM75wmjDqxH/IylvACRgqJa2KJ6
	VSlFx+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCvUy-00000009MYv-0pPQ;
	Fri, 31 May 2024 06:12:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCvUt-00000009MXV-2OH9;
	Fri, 31 May 2024 06:12:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A12161C0004;
	Fri, 31 May 2024 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1717135930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogNqXL0ApIs13zC/uLEPr6wCJVu7uWiXb0gYZeNG97o=;
	b=D0mi+kUARIW/Xiq4qgyPzhxwk2SU672KDO6+AgpFmL1CaodK3HoZxficaZsRgKxd+Y6ld4
	xTgv207ezmVW/JUCqfr7ts5OZaIl9J62KLyWJ7Cw07ev+gknGRuxB9NOM86jV7jo+EOcEO
	qqGiFpFFJTtXWcAqdCTEvPvqvq7mf0K/UTxfjLED4uuP7pKMsCMIDkLGukpDiyCNa5t1Bt
	gSllCuRStlW+yiCQpv+e8AUZeYFKwwWeEeeImrUMsqncDGXSDplQAZg1ePVa2XxvR8zsrI
	oPgVCSLqGDIOiS9Undmxf6hCgATSJ29i/+f7ycdAjVYaVB/RkhPXXd6lCAl36g==
Message-ID: <aaaeb4b2-e57e-4d7b-b598-a664cc05b0cf@arinc9.com>
Date: Fri, 31 May 2024 09:12:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_231215_764979_57C37EA2 
X-CRM114-Status: GOOD (  13.02  )
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

On 17/05/2024 09.27, Frank Wunderlich wrote:
> Am 17. Mai 2024 04:17:47 MESZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>> On 16/05/2024 23:48, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> After commit 868ff5f4944a
>>> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
>>> the mt7531 switch on Bananapi-R64 was not detected.
>>>
>>> mt7530-mdio mdio-bus:00: reset timeout
>>> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
>>>
>>> Fix this by adding phy address in devicetree.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> I don't like the mention of the Linux kernel driver on the patch log. What
>> you're fixing is the incorrect description of the switch's PHY address on
>> the DTS file. Whether or not any driver from any project is actually
>> reading it from the DTS file is irrelevant to this patch. That said, I
>> already have a patch series I've been meaning to send the next version of
>> that already addresses this. Please wait for that.
>>
>> Arınç
> 
> Hi arinc,
> 
>  From my PoV it is a regression in next/6.10 because the driver change was merged (without "broadcast" fallback) and the dts patch [1] is not.

What is a broadcast fallback? 0x1f is just another PHY address.

Arınç

