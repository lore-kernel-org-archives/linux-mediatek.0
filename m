Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E2CC32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 11:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04ijFyWpNqjr0mVAOzrs4qWtbJFIYTunE57Md0QH6jc=; b=VclmXV2LI//QnfTrF4xgQS05Vu
	AVrMxKvwaoYRRwbcYCnX6wStfrS8simtzdkK5o/2xMDR1vwPoXCGaDYJDZV6YUA8+pj0LC7Y1mDrq
	7KKHjlsbMv0Zxs3TNYT5FWW0ya2fZihN/Z6DZ7he6bHRXsj7hb+1fJqKVAmV4btG9d6Mvbu88fvQR
	5Oq4pqH/28ejvUY+V9Al/kIXvnjmrL2ErS5dN/U1/fJb1wY/Vjmpn1sbfQPKTecxmIfZ955/Rzc83
	Emw5mKK4wD96RB8juFvBBz6jNcNp0meMH/fuWklQQMuno/4t7dmlXVBqW86xqYzSUcIyyV2xh7bOz
	c0uiOzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZsUM-00FJAF-0H; Sun, 18 Sep 2022 11:29:30 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZsU9-00FJ3z-BF; Sun, 18 Sep 2022 11:29:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663500538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZH7AKVMOwTy5jgBEvz7C3Kikf6uqzifTon+tLb0MxZ1Bh4l1grbzh/fDYOtZRpT6WLW2uxNeAc4ZBQmRSs9OnVytgibE/Lfuw78bA6QU0jA+JUWezJtN0fTMvxXUdene6fsP0DKiIBx02P6PnePnU2eMynSRpge72njjPqDYUA8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663500538; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=04ijFyWpNqjr0mVAOzrs4qWtbJFIYTunE57Md0QH6jc=; 
	b=GDHTfDz40RfWjuq1bTxO5t3NcQewILiyk4XH4qRKUP7jgpIOEI4vu2vdhsB4RmA/ZOuI2lFnupswcm6pR7fqUvufEbx2phgZvFx+C1LE/WUtz7gNPVzvpmuQnlw0RC8pFmJLSGPk0a//NJImIBZwIIKPZjyxZJsDXteIgZDjY/s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663500538;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=04ijFyWpNqjr0mVAOzrs4qWtbJFIYTunE57Md0QH6jc=;
	b=RHVPFeYv1mkXd2h3PfKWfNC6B6r6Y7JA7LZ1jNOfBNIkvzX9H+YQ2J9O8wikP1aO
	14HHjb9/fXn8wwtX/8gZNqIF3OLor+/vOkM6Hl/lgm+AkjMtQPvXm700edpJgYezO8N
	i8l2SpzUUE2xKLYyh6m4G5ZB/jNNvMaXS+N84hK8=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663500536617106.7364888322121; Sun, 18 Sep 2022 04:28:56 -0700 (PDT)
Message-ID: <4a291389-105a-6288-1347-4f02171b0dd0@arinc9.com>
Date: Sun, 18 Sep 2022 14:28:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Move MT7530 phy muxing from DSA to PHY driver
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Thibaut <hacks@slashdirt.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <0e3ca573-2190-57b0-0e98-7f5b890d328e@arinc9.com>
 <YyKQKRIYDIVeczl1@lunn.ch> <dad09430-4f33-7f1d-76c7-4dbd0710e950@arinc9.com>
 <YyXiswbZfDh8aZHN@lunn.ch>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <YyXiswbZfDh8aZHN@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_042917_474098_B9CCF646 
X-CRM114-Status: GOOD (  35.93  )
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

On 17.09.2022 18:07, Andrew Lunn wrote:
>>> Where in the address range is the mux register? Officially, PHY
>>> drivers only have access to PHY registers, via MDIO. If the mux
>>> register is in the switch address space, it would be better if the
>>> switch did the mux configuration. An alternative might be to represent
>>> the mux in DT somewhere, and have a mux driver.
>>
>> I don't know this part very well but it's in the register for hw trap
>> modification which, I think, is in the switch address space.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n941
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.h?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n500
>>
>> Like you said, I don't think we can move away from the DSA driver, and would
>> rather keep the driver do the mux configuration.
>>
>> We could change the check for phy muxing to define the phy muxing bindings
>> in the DSA node instead. If I understand correctly, the mdio address for
>> PHYs is fake, it's for the sole purpose of making the driver check if
>> there's request for phy muxing and which phy to mux. I'm saying this because
>> the MT7530 switch works fine at address 0 while also using phy0 as a slave
>> interface.
>>
>> A property could be introduced on the DSA node for the MT7530 DSA driver:
>>
>>      mdio {
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>
>>          switch@0 {
>>              compatible = "mediatek,mt7530";
>>              reg = <0>;
>>
>>              reset-gpios = <&pio 33 0>;
>>
>>              core-supply = <&mt6323_vpa_reg>;
>>              io-supply = <&mt6323_vemc3v3_reg>;
>>
>>              mt7530,mux-phy = <&sw0_p0>;
>>
>>              ethernet-ports {
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>>
>>                  sw0_p0: port@0 {
>>                      reg = <0>;
>>                  };
>>              };
>>          };
>>      };
>>
>> This would also allow using the phy muxing feature with any ethernet mac.
>> Currently, phy muxing check wants the ethernet mac to be gmac1 of a MediaTek
>> SoC. However, on a standalone MT7530, the switch can be wired to any SoC's
>> ethernet mac.
>>
>> For the port which is set for PHY muxing, do not bring it as a slave
>> interface, just do the phy muxing operation.
>>
>> Do not fail because there's no CPU port (ethernet property) defined when
>> there's only one port defined and it's set for PHY muxing.
>>
>> I don't know if the ethernet mac needs phy-handle defined in this case.
> 
>  From mediatek,mt7530.yaml:
> 
>    Port 5 modes/configurations:
>    1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
>       GMAC of the SOC.
>       In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
>       GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
>    2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
>       It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
>       and RGMII delay.
>    3. Port 5 is muxed to GMAC5 and can interface to an external phy.
>       Port 5 becomes an extra switch port.
>       Only works on platform where external phy TX<->RX lines are swapped.
>       Like in the Ubiquiti ER-X-SFP.
>    4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
>       Currently a 2nd CPU port is not supported by DSA code.
> 
> So this mux has a scope bigger than the switch, it also affects one of
> the SoCs MACs.
> 
> The phy-handle should have all the information you need, but it is
> scattered over multiple locations. It could be in switch port 5, or it
> could be in the SoC GMAC node.
> 
> Although the mux is in the switches address range, could you have a
> tiny driver using that address range. Have this tiny driver export a
> function to set the mux. Both the GMAC and the DSA driver make use of
> the function, which should be enough to force the tiny driver to load
> first. The GMAC and the DSA driver can then look at there phy-handle,
> and determine how the mux should be set. The GMAC should probably do
> that before register_netdev. The DSA driver before it registers the
> switch with the DSA core.
> 
> Does that solve all your ordering issues?

I believe it does.

> 
> By using the phy-handle, you don't need any additional properties, so
> backwards compatibility should not be a problem. You can change driver
> code as much as you want, but ABI like DT is fixed.

Understood, thanks Andrew!

Arınç

