Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD8FC4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4uIPG7Nra39EUwOvsm4b3NYu2+PD/eNW8/4vOlSOB4=; b=X07j1mFNBHK6B+4b8GyUhXmE5m
	WFJzWL7xxk8irw45hTVQ0TIrHYSAG0reR9knQzMpC/8uZZaRYOnZYlKQD2/6fKIxpa03mgX134Kcg
	ceGlZi5ipwfpKylpf1U/qyFVGAmP4Nf1h81PKoF1DtBPB8lxbgSsd50mTld8XR4MLlIkEaUgDEKzQ
	7hgQVsKS/6CyQgs8IbwIajsA7FNrewReCXpbqJwaViO/gbD+43a9Awm4HW4Dz2/gEMYMamA2O7DBm
	4V+8fkD8JztHe04xn/JFHcp5l7cxc/n4HXm1yf/IvrJWJV8fwkDxoFMRdutwHYBVG4+a0SaK002Jd
	3kgcNBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxaw-0000000CfZQ-061v;
	Fri, 02 Feb 2024 17:44:54 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxar-0000000CfWI-1OTd;
	Fri, 02 Feb 2024 17:44:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07E1E1C0003;
	Fri,  2 Feb 2024 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706895886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4uIPG7Nra39EUwOvsm4b3NYu2+PD/eNW8/4vOlSOB4=;
	b=gMnuts5Lxz0WzF6krO3ay2/xk9bENZ0R9500jzKTl6II5Pl1QNZQkV5+pvJEGddg0ljX4u
	nj5dYRWbMH/9KzOS7AeqcnQa7NuWabvlvrXgDHlsbcC25TI/r3OoxKStXMrc/M/YKNzF7e
	PC5M3035FEr3TMV/4SEkNirvrkfDpeWMskWmCei9MQiuMjpHR3Hhgu+ga8cfrXMNa2xHpF
	BuJfp6HqnLXt5fqP0KbeyaTnAVhwYGBfuX8xIqDpdiY0hrZVsaeRKTcKxoLcogNhQ6oDrA
	R4hfkShWlwy/zj1dyErgAi4P8/UGMGQOQ+GO6ki0xDDGtpnrwh6fFrAOW4xkig==
Message-ID: <e3b4add6-425c-46ca-9da5-8713055fc422@arinc9.com>
Date: Fri, 2 Feb 2024 20:44:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/7] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
 <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_094449_667605_40DA7DE7 
X-CRM114-Status: GOOD (  21.17  )
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

On 2.02.2024 14:40, Russell King (Oracle) wrote:
> While reviewing this change, but not related to it, I notice that this
> function sets the TX delay based on the RGMII interface mode. This isn't
> correct. I've explained why this is this many times in the past, but
> essentially it comes down to the model:
> 
> 
> phy-mode in NIC node	Network driver	PCB		PHY
> rgmii			no delays	delays		no delays
> rgmii-id		no delays	no delays	tx/rx delays
> rgmii-txid		no delays	no delays	tx delays
> rgmii-rxid		no delays	no delays	rx delays
> 
> Then we have rx-internal-delay-ps and tx-internal-delay-ps in the NIC
> node which define the RGMII delays at the local end and similar
> properties for the PHY node.
> 
> 
> So, if we take the view that, when a switch is connected to a NIC in
> RGMII mode, then the phy-mode specified delays still should not impact
> the local NIC.
> 
> Now, for the switch, we specify the phy-mode in the port node as well.
> Consider the case of a switch port connected to a RGMII PHY. This has
> to operate in exactly the same way as a normal NIC - that is, the
> RGMII delays at the port should be ignored as it's the responsibility
> of a PHY.
> 
> The final scenario to examine is the case of a RGMII switch port
> connected to a NIC. The NIC's phy-mode has no way to be communicated
> to DSA or vice versa, so neither phy-mode can impact the other side
> of the RGMII link, but should only place the link into RGMII mode.
> Given everything I've said above, the only way to configure RGMII
> delays is via the rx-internal-delay-ps and tx-internal-delay-ps
> properties. So, DSA drivers should _not_ be configuring their ports
> with RGMII delays based on the RGMII phy interface mode.
> 
> The above is my purely logically reasoned point of view on this
> subject. Others may have other (to me completely illogical)
> interpretations that can only lead to interoperability issues.

I will address this with the next patch series. Thank you for explaining it
in detail.

Arınç

