Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7BCC7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CpE3G81EGn4kbCwrb3Lg35kP6vgfybZjy8KICU3Qkk=; b=J+h69MnhfQxLVB
	K11ugWvigOHIwF4datreMMM1sg1vF3LL0BdDk4hVe23HlIqsLBNrphHEbMZIKuKKRy1Ue8k8eaELk
	iN6EONm614O5sd2GiT2fH/51XD6MDlnwWyNXj7ZAab+zWEB8Dj9bRM6CYmuvUi+Idzp4JwNtwR56v
	1EBqplSzLIiigSojnelM1+BWFixsH9m/jbWJshOhoYHl8Aq/+GZ+QmqK2ym0LGAM5h9XM62/81IzY
	LJa4679n0mPHcBIJI0vLu/f7MbsorFAedDDVuD6diYmsw/LY90pl/LBMDTqi+yWzmoEVZHTRatUDO
	KwzhKSoaoDvP+iPZ2qNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lGy-00BycX-12;
	Sun, 04 Jun 2023 10:47:44 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lGv-00BybK-0p;
	Sun, 04 Jun 2023 10:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685875620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l74JK4QshxL/UBAapJGNaqWB+hhBu7Q+e0TTtkWRMHyCbPc+P7Y5RYpgqSV/ZkLlSn2Ujbn1t2HHGef9Qa/aRGUYQ9AJr6OjPyWYl0ZQRP2mu+nCFsYwN3LQeDfdkYlaeya3ftClKUm1L83sJK1VjmvCtnXIj2O02Aja9c4bbak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685875620; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5CpE3G81EGn4kbCwrb3Lg35kP6vgfybZjy8KICU3Qkk=; 
	b=fPsZDhzxDyE4La8mlUGpPywqc+aefiGSBe0U6Zq0pFn3bYET9A85pzzjtWCJiSIcMlgOOSantBjkzpoiVHlRZYKNDqI2ejwh5ZpP2OhMz3t58+6YW0JN6qWqdbbC3qm3SbTImg/JqOvlDnJ9iGNJ+a6B+xQuPkYZdBGVKbxmgxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685875620;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5CpE3G81EGn4kbCwrb3Lg35kP6vgfybZjy8KICU3Qkk=;
	b=BP44qi/99Wb4tyuFqD0glUZaYsSL96WIDdMjJGAndTdkAC7LAeh15RhteFHEEWXr
	4bnjiAd/utzzZag6TwAKJm6HQfB2vyenuTeCg4DS54HA8a1ab9HjlGXoZuYgENfOfdD
	EV/N+CPxzmSgyEZ/aVWsoioi1RRKGHne7Yp9cV7w=
Received: from [192.168.99.249] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 168587561947163.66753033579096; Sun, 4 Jun 2023 03:46:59 -0700 (PDT)
Message-ID: <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
Date: Sun, 4 Jun 2023 13:46:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
 <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_034741_346135_B4D96CC3 
X-CRM114-Status: GOOD (  19.74  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3.06.2023 15:26, Russell King (Oracle) wrote:
> On Sat, Jun 03, 2023 at 03:15:52PM +0300, Arınç ÜNAL wrote:
>> On 26.05.2023 16:01, Vladimir Oltean wrote:
>>> Ok, but given the premise of this patch set, that phylink is always available,
>>> does it make sense for mt7531_cpu_port_config() and mt7988_cpu_port_config()
>>> to manually call phylink methods?
>>
>> All I know is that that's how the implementation of phylink's PCS support in
>> this driver works. It expects the MAC to be set up before calling
>> mt753x_phylink_pcs_link_up() and mt753x_phylink_mac_link_up().
> 
> First, do you see a message printed for the DSA device indicating that
> a link is up, without identifying the interface? For example, with
> mv88e6xxx:
> 
> mv88e6085 f1072004.mdio-mii:04: Link is Up - 1Gbps/Full - flow control off
> 
> as opposed to a user port which will look like this:
> 
> mv88e6085 f1072004.mdio-mii:04 lan1: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> If you do, that's likely for the CPU port, and indicates that phylink
> is being used for the CPU port. If not, then you need to investigate
> whether you've provided the full description in DT for the CPU port.
> In other words, phy-mode and a fixed-link specification or in-band
> mode.

Yes I do see this. The DT is properly defined and the port is properly 
set up as a CPU port.

> 
> Given that, you should have no need to make explicit calls to your
> mac_config, pcs_link_up and mac_link_up functions. If you need to
> make these calls, it suggests that phylink is not being used for the
> CPU port.

Your own commit does this so I don't know what to tell you.

https://github.com/torvalds/linux/commit/cbd1f243bc41056c76fcfc5f3380cfac1f00d37b

Arınç

