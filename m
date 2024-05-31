Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69876C27C44
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 06:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRRofHQN+sZ3zin7XoMAEcDEOOv/eiLPcfVn0mruNPM=; b=U8woWuiK5msWZe
	3VQMWECg2kHEZwy1TVSD/G5/cTcOn24vyfIRq4Mj6QkshihQtj4HvX4U+fYGKrDbue4PttXCCfX8o
	PrCGy+LadfCY+iyaBm22/cCOMSC1hvJZVt/+uYNQOnLf3PMqM75ltXAje9Zc+Jy4CchKOm9OUq2Gw
	DQX7CXFEUS7zZBVmrW5YXADqtNcPFfDC1J6GI5XEuEONB+a1Hwzfdinu08R+zUwnI1yi4B0WplrYV
	PWfG/bs7d1NHEoxJyyJTSm45Juunhj+cawmSOINoxfW0LpkMPOhhzKxxRKUrMAIl3fJnjDygNGYGZ
	hfC2Hoobtlxnhktkm7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCvTc-00000009MG5-0muB;
	Fri, 31 May 2024 06:10:56 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCvTX-00000009MEN-2FSM;
	Fri, 31 May 2024 06:10:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79D5340006;
	Fri, 31 May 2024 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1717135843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRRofHQN+sZ3zin7XoMAEcDEOOv/eiLPcfVn0mruNPM=;
	b=P+sqDvazmpYhlGevEVypSVw8Pj094VUJ2WN0YqIf19IvIOFP3PX+uciDmOd8nSBrklIM7l
	+QM/YROYMmNiXG6JXSmCXDu060ENb3Px7vAUzyjVHfaNhxCb/A5Mn+c7yWnrZI7KfBgqzn
	f9KeYKpjgA4nMVvxCGrZjW3kIVgExJlJP3V3i0m19tD03rVukVBO6A6m8Y3m9RQsXLTx3C
	G56yQl/I/0oua7UVUfQzVcDytm5sTVb6Sxj/PhzAxKgzeZ9W/t8ZOFMM8TtKi25LydePc+
	IT6pqusy5gI14Tzgz5A56iLmcwdDtKRxYtOq786wEEcPT/zHTr381qbLqEqHAQ==
Message-ID: <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
Date: Fri, 31 May 2024 09:10:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_231052_305483_8C07BE2E 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2024 08.40, Thorsten Leemhuis wrote:
> [adding Paolo, who committed the culprit]
> 
> On 23.05.24 12:44, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 17.05.24 08:27, Frank Wunderlich wrote:
>>> Am 17. Mai 2024 04:17:47 MESZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>>>> On 16/05/2024 23:48, Frank Wunderlich wrote:
>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>
>>>>> After commit 868ff5f4944a
>>>>> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
>>>>> the mt7531 switch on Bananapi-R64 was not detected.
>>>>>
>>>>> mt7530-mdio mdio-bus:00: reset timeout
>>>>> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
>>>>>
>>>>> Fix this by adding phy address in devicetree.
>>>>>
> 
> Frank, am I right assuming the regression is still present in mainline?
> As from here it looks like for two weeks now there was no progress at
> all to fix this (or I missed it, which is quite possible).
> 
> Makes me wonder if the maintainers should revert the culprit or if the
> arm64 dts folks should accept your fix despite Arınç ÜNAL's (who from a
> quick look on lore hasn't posted anything for two weeks now) comment.

I'm not against the patch. I'm against the logic it entails on the patch
log. I had already submitted a patch series that would've prevented this
issue back in 14 March 2024 [1]. I've asked numerous times for the patch
series to be applied [2][3][4][5].

Eventually Daniel asked for some changes [6]. But I won't have time to do
that anytime soon and I think the patch series is good enough to be applied
as is.

[1] https://lore.kernel.org/all/20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com/
[2] https://lore.kernel.org/all/ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com/
[3] https://lore.kernel.org/all/a60fc16d-4236-427c-b4a8-ec6fdf62d9f0@arinc9.com/
[4] https://lore.kernel.org/all/facb8204-c2b3-4084-a2e3-4fbf3a3fdc9d@arinc9.com/
[5] https://lore.kernel.org/all/44e366ea-964a-4515-9027-2a2edfe12512@arinc9.com/
[6] https://lore.kernel.org/all/ZixU287DdhvRyZBe@makrotopia.org/

Arınç

