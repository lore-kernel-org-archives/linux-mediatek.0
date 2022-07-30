Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4C2C04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip/n8l6suEtbm+49thEhP6FKGtcYyDNRdjrTqyl8UVM=; b=osOpFzgg9zMwss
	yJIcfxFnNhVOZeKsNtwAJfMHt08lnJZ6cDlxhj4xc+wKbFm/qjcnuVJNyqvaTj2EF18CcaK19ZGM0
	dx1P4ADPSmPvdQPSVFSK4JsFNCzKPE+/p3EhOYP3VRlA32Sh8I1QPZkVDPRgp2RaTrto6W/ecCDiS
	/px2XHYiLZFc0oLp3wyadhaT8VGn4e1ClW5bMHbW1l8TVSPFABcoBVGp12ARO13NwytVah4s/AIFN
	uH6F0ALaqN9ht8QE6B3H2Y5Hels6pBlvEppakPMp7v29ZVZz5ih8ZRZMDAbuUM4o/6AMrgo7H+CVZ
	GLP0ObU+3zYQq2TpRi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiZy-00Gv6k-SR; Sat, 30 Jul 2022 09:16:14 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiZZ-00Guqf-PY; Sat, 30 Jul 2022 09:15:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1659172525; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZiQy66cF6l7rF1Kk0Ro+K7FCFJUDhDRzik60PYhZU+9K7FnYPvvmcwM3DXhpFGIPnOwUgKsXgYLmRqlGzVQwdlVTh7MJPK3pw5KlsLzUZa5W7NsjyAu6X5cyhyRJKuFlK3w/s/i/UJvYP7w8sFUm4sWv9IN7VBnGVUe5a9SzUg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659172525; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ip/n8l6suEtbm+49thEhP6FKGtcYyDNRdjrTqyl8UVM=; 
	b=ct/2ZTeeaj+LRzWYAeDMwMUOZx4tFbT4uFDUlWGqJtk5YoJjuMPjXoip4scruo8dyHeyKhnDwABtAOMdWNizyaqkFLFF5+BJgYvMUUPfx9kkE93KbXMyyTAHvISaE1p1HeQ87HbsdvXPic59M6WBp9m1pEB/8zPiHzDywOzJVRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659172525;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ip/n8l6suEtbm+49thEhP6FKGtcYyDNRdjrTqyl8UVM=;
	b=WinEmM44Ykvb7Xh+Iia+e46vquGVfpvZZeBTUmUZsWtYacUymSxrXNJDWhlCGqRJ
	34j8ZZEkILDcdkwm3vTLGzvu4WPoLhnGczFMG0CEkCQksmoDaYcM4YyKdFlVRMJ4azH
	NwoRQD1ZSa/3nhr3jrlpWb8ntgY1D+AYIy2xkjak=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1659172524609562.8091071134861; Sat, 30 Jul 2022 02:15:24 -0700 (PDT)
Message-ID: <980c9926-9199-9b6e-aa65-6b5276af5d70@arinc9.com>
Date: Sat, 30 Jul 2022 12:15:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
 <YuK193gAQ+Rwe26s@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <YuK193gAQ+Rwe26s@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021550_241743_983B6032 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28.07.2022 19:14, Daniel Golle wrote:
> Hi,
> 
> please see a minor comment inline below:
> 
> On Tue, Jul 26, 2022 at 03:24:06PM +0300, Arınç ÜNAL wrote:
>> [...]
>> -  CPU-Ports need a phy-mode property:
>> -    Allowed values on mt7530 and mt7621:
>> -      - "rgmii"
>> -      - "trgmii"
>> -    On mt7531:
>> -      - "1000base-x"
>> -      - "2500base-x"
>> -      - "rgmii"
>> -      - "sgmii"
>> +  There are two versions of MT7530. MT7621AT, MT7621DAT, MT7621ST and MT7623AI
> 
> There are two version of MT7530 **supported by this driver**.....
> (MT7620 also contains MT7530, switch registers are directly mapped into
> SoC's memory map rather than using MDIO like on MT7621 and standalone
> variants, and it got FastEthernet PHYs for Port 0-4)

Thanks Daniel. To be precise, this is the case for MT7620AN, MT7620DA, 
MT7620DAN, MT7620NN, MT7628AN, MT7628DAN, MT7628DBN, MT7628KN, MT7628NN, 
MT7688AN and MT7688KN SoCs as all include a 5p FE switch according to 
Russia hosted WikiDevi.

I'll update the description accordingly.

Arınç

