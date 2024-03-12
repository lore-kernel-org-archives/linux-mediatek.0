Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB09C54E66
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdkWCD3hZwupMMVzJhySvDh1Pybc6meJFttYBQGL9NM=; b=k757m+kZMG+qJqWNI25EWOEwEK
	9PPg7B47PCNwPodjzieAdCYx8GKqxmK2wbKBMCW/C0xejUOymUvc83jirAmBCYGckwBRBmnPxfnxt
	61wUa6wwrl3R+DtfnKAN8uAarmRqjoTI0yOlj7Jox8rRB94Lw5WvvgQMwUMaJFU2qHeueIxosc47T
	L+yRULStRvcrAIOUKczOG0NUyjs+nYhRlD3eBh+6D36mm1vPj6Ec8vRGS2T+F441ORD57KhAcfvl7
	daaqovhbfoAXuLzKwgAS41rTNJKZKIVUkPxHugMmIGktlTwYcHwsdRjzQ8m9LTeowvVkL9//Hoh6Y
	4sbL92xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyC6-000000052vH-2UVN;
	Tue, 12 Mar 2024 09:13:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyC2-000000052qS-2xz1;
	Tue, 12 Mar 2024 09:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710234776;
	bh=hUK9GKxZcqwSKCCM/G5VBf6KN+AtFWuXgVSp0rInAbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AFTEPtwt7N6hWovL7mBHbeTD6vKYsE9vI9nfgS9jjnF6czX5W0q8fLc5W638qcjHP
	 eeL4zfrhocVaFUsEsJ1KYDGsiIrjAS35apSECSppKgkFVY9+MzmOBUAxFTr77nTzd/
	 xazwIKA+mZu63G6UXPcm1xoM57l6Xa2QY3dRxOri+Tq6kYltQ2wKmqlFu3BNvp9arp
	 BJq/vDV4/vGfLZh+Dx3X6UrE3frebdJS6vi4ZrK/iy+DjertMOM/2gRQDz1Tjf3nh5
	 k+D65UxAcclepGTLsrFKiXoNxBQBBU+722oQDTAxtFu7KEEvUHTnGRjRT9i/etZ5VC
	 cGUGpWjAnfRkg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 737983780029;
	Tue, 12 Mar 2024 09:12:55 +0000 (UTC)
Message-ID: <56fe79a2-8c39-455c-a402-06c9ae7b5bd1@collabora.com>
Date: Tue, 12 Mar 2024 10:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.1 12/12] arm64: dts: Fix dtc interrupt_provider
 warnings
To: Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Chanho Min <chanho.min@lge.com>, Arnd Bergmann <arnd@arndb.de>,
 tsahee@annapurnalabs.com, atenart@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, rjui@broadcom.com,
 sbranden@broadcom.com, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com,
 magnus.damm@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20240229204039.2861519-1-sashal@kernel.org>
 <20240229204039.2861519-12-sashal@kernel.org> <Ze9x6qqGYdRiWy3h@duo.ucw.cz>
 <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
 <ZfAUgYj0ksDmGuhN@amd.ucw.cz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZfAUgYj0ksDmGuhN@amd.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_021306_969866_46BE8D08 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

Il 12/03/24 09:38, Pavel Machek ha scritto:
> Hi!
> 
>>>> From: Rob Herring <robh@kernel.org>
>>>>
>>>> [ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]
>>>>
>>>> The dtc interrupt_provider warning is off by default. Fix all the warnings
>>>> so it can be enabled.
>>>
>>> We don't have that warning in 6.1 and likely won't enable it, so we
>>> should not need this.
>>
>> Still, this fixes issues in DTS that were not noticed before because
>> the checks were disabled.
> 
> Is this patch known to fix user-visible behaviour?
> 

No, doesn't fix any user-visible issue.

Cheers,
Angelo

