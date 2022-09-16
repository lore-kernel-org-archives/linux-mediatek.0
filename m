Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06372ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESU1VgCvmDitc8MsVUItMU0bZbbhXMl1bxk3ZQKwmMc=; b=e1BOa+dzUfBw2i21sD4v3dtj2d
	u34AqrwhkzQwXvGNwiYpLmmIKEUSEXKj4E4Ci95n4qsgYFvsmGN1RiqggATibCCzVt0WIqMxYgkif
	oFooiZlmsVR+lkvoV4Q0JNBxoDMhy4TWnrFJiehwuKkNjmT746d8eM9M4ZtMnNanE0+B3WTjqp3Y6
	T3yxx8PxM7e3uNbRWtMrqRSpFYGyB0Vu+p1J3hmfaBCLqWIYOQQMy1p7046B5q2+IeO4Iz5FwQHHp
	IuV0Z+fhTNlCF19OuUqoWkHAHJCP8pxTQewPZ1FlCjiG37NelKiN6G+SIv71KP4uvtiV/qLxsuk4m
	VjwLw+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDEq-00EZne-5a; Fri, 16 Sep 2022 15:26:44 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDEd-00EZlD-Li; Fri, 16 Sep 2022 15:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663341960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jb1nJDvfJ2LIzVrHDWrucYstv3Y/i7xlX958Phr4TqCJaF/SUBWJiAIZURWWanv2JgOJYPXZNruqXv1De0k5uAeRNnx8kq2KQqSQL3M4QqtfxrEsqshfPYq6shhOIQVGb3+u6F/SQgDuR+YKEvAKHX1P115sG5/g75THa1z1Pcc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663341960; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ESU1VgCvmDitc8MsVUItMU0bZbbhXMl1bxk3ZQKwmMc=; 
	b=Cb6o/GoOjaktmWGaYMmbTIBtLTMbHIGjh48Oxly0cR4BR8YGG13S0le/GCXLUw6lZcqrLoVJWQKNQ0YhqtYUX5PP8VhIkOa9Z3wX09PvnAg9mVQe3sjGX6ZJpv6aNz6SmPAwr4R3BZXlzW7g0YlMPEfa8kWL38lXIpq6DqQ3hXY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663341960;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ESU1VgCvmDitc8MsVUItMU0bZbbhXMl1bxk3ZQKwmMc=;
	b=IqahRRDd7m72Xgk/TWR3GJzwBtDvmJSs79nlirwq2uXoeahRqEZofBE7M48BcMGW
	HYS0OROQfY4tDNrT8WoLWHB5XdSbpAUvgxwJsMCB1PtndsE95TOW9mZyaHBfPG+nqg8
	Nw2G7HIljtdt3N6e18sG5/fwPMbE1idPkj5MmyYA=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663341958192832.8150534180345; Fri, 16 Sep 2022 08:25:58 -0700 (PDT)
Message-ID: <dad09430-4f33-7f1d-76c7-4dbd0710e950@arinc9.com>
Date: Fri, 16 Sep 2022 18:25:52 +0300
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
 <YyKQKRIYDIVeczl1@lunn.ch>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <YyKQKRIYDIVeczl1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_082631_782724_C26198DC 
X-CRM114-Status: GOOD (  25.16  )
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

Hey Andrew,

On 15.09.2022 05:38, Andrew Lunn wrote:
> On Thu, Sep 15, 2022 at 01:07:13AM +0300, Arınç ÜNAL wrote:
>> Hello folks.
>>
>> MediaTek MT7530 switch has got 5 phys and 7 gmacs. gmac5 and gmac6 are
>> treated as CPU ports.
>>
>> This switch has got a feature which phy0 or phy4 can be muxed to gmac5 of
>> the switch. This allows an ethernet mac connected to gmac5 to directly
>> connect to the phy.
>>
>> PHY muxing works by looking for the compatible string "mediatek,eth-mac"
>> then the mac address to find the gmac1 node. Then, it checks the mdio
>> address on the node which "phy-handle" on the gmac1 node points to. If the
>> mdio address is 0, phy0 is muxed to gmac5 of the switch. If it's 4, phy4 is
>> muxed.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n2238
>>
>> Because that DSA probes the switch before muxing the phy, this won't work on
>> devices which only use a single switch phy because probing will fail.
>>
>> I'd like this operation to be done from the MediaTek Gigabit PHY driver
>> instead. The motives for this change are that we solve the behaviour above,
>> liberate the need to use DSA for this operation and get rid of the DSA
>> overhead.
>>
>> Would a change like this make sense and be accepted into netdev?
> 
> Where in the address range is the mux register? Officially, PHY
> drivers only have access to PHY registers, via MDIO. If the mux
> register is in the switch address space, it would be better if the
> switch did the mux configuration. An alternative might be to represent
> the mux in DT somewhere, and have a mux driver.

I don't know this part very well but it's in the register for hw trap 
modification which, I think, is in the switch address space.

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n941

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.h?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n500

Like you said, I don't think we can move away from the DSA driver, and 
would rather keep the driver do the mux configuration.

We could change the check for phy muxing to define the phy muxing 
bindings in the DSA node instead. If I understand correctly, the mdio 
address for PHYs is fake, it's for the sole purpose of making the driver 
check if there's request for phy muxing and which phy to mux. I'm saying 
this because the MT7530 switch works fine at address 0 while also using 
phy0 as a slave interface.

A property could be introduced on the DSA node for the MT7530 DSA driver:

     mdio {
         #address-cells = <1>;
         #size-cells = <0>;

         switch@0 {
             compatible = "mediatek,mt7530";
             reg = <0>;

             reset-gpios = <&pio 33 0>;

             core-supply = <&mt6323_vpa_reg>;
             io-supply = <&mt6323_vemc3v3_reg>;

             mt7530,mux-phy = <&sw0_p0>;

             ethernet-ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 sw0_p0: port@0 {
                     reg = <0>;
                 };
             };
         };
     };

This would also allow using the phy muxing feature with any ethernet 
mac. Currently, phy muxing check wants the ethernet mac to be gmac1 of a 
MediaTek SoC. However, on a standalone MT7530, the switch can be wired 
to any SoC's ethernet mac.

For the port which is set for PHY muxing, do not bring it as a slave 
interface, just do the phy muxing operation.

Do not fail because there's no CPU port (ethernet property) defined when 
there's only one port defined and it's set for PHY muxing.

I don't know if the ethernet mac needs phy-handle defined in this case.

Arınç

