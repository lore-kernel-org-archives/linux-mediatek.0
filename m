Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10334C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wT2zYWTahB2Hz1fERK10MZ0PBJ20Nx8YM0Tg8v/iXO4=; b=JRaJfyd7wBU5uDPd6LlJCG2qEa
	JRyTi1UI+KSrTtvb2xgXAgLr3kljnCFjnWjeOZ8/HEzyyjKukNNAlzADqmGUcETAw9FbfHQxgh/zN
	I33w3EgxAjml3Fzvv1DKodlHLE3VjrYHQi7GVdpJmQf+r+k2sDNAeLHSqFbqbPV6eveM2vg3OY7B1
	kGfQ8sgsXDtBUpLxy9M8CJJKQluFnjFK7jJeVwEV31PtaBOTbK7TkupOSOZ6UIm7HrHR03C0xqtAq
	FrTFSUwHx4iAiu4jIwzaU/ooxOtLrsHEmYpd2wRujWbhOjEUHJRB/lGSvQAkbaTmPRWwdfjXigaKD
	rSsTxUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaXq-00B3ar-Fe; Wed, 14 Sep 2022 22:07:46 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaXf-00B3SH-AC; Wed, 14 Sep 2022 22:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663193240; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ntOIGx6DEiNzbOLb4pSvnlDrwadQx/sqQvkTn0B01mZTh5t+v9tkVAbcGOx10bKe0KDBgDHTbBAU2aKzAYQQyQhwu+D6mMiTF6UnDbW5wG4epmz5WGFWz/GZ8ZI1c/qP2pCY/TKmE2p5spoPghm4DGO/ewU/Q5lJngj1BCN1Pdo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663193240; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=wT2zYWTahB2Hz1fERK10MZ0PBJ20Nx8YM0Tg8v/iXO4=; 
	b=ghcw1E29GCXXpZMrL0P4FNH40Iy3EmC841VXMfXPQPzyX8HAGkjobnmIq7WH7V61/I5AC7ju/ZSQVFApJKaH7Aep1vLRtylc8/SCXsFEK16h9S6AapgyVWKFe98KTpriS1Zni11tM8cdv5TBUXREff87CqJPR2+yGDFV0+r0MN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663193240;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wT2zYWTahB2Hz1fERK10MZ0PBJ20Nx8YM0Tg8v/iXO4=;
	b=GcPHFdRoV+srWMetz2fvUwz4hW4rIha7SCrpohTy+nBygwDsseG4/Lc/HKZgabvJ
	YA7ppvK0hhNea41lGeKlTBqr6FMd/Woo87LyH/1S0rGfUge3MJdpUPZ83B/saXUlH7t
	5T7x/gLYKnvRkd8U1cTVIE7BeKQhbAImM6E99pRI=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663193239443950.6869432993643; Wed, 14 Sep 2022 15:07:19 -0700 (PDT)
Message-ID: <0e3ca573-2190-57b0-0e98-7f5b890d328e@arinc9.com>
Date: Thu, 15 Sep 2022 01:07:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Move MT7530 phy muxing from DSA to PHY driver
Cc: Thibaut <hacks@slashdirt.org>, Andrew Lunn <andrew@lunn.ch>,
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_150735_431096_962E0F24 
X-CRM114-Status: UNSURE (   9.74  )
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

Hello folks.

MediaTek MT7530 switch has got 5 phys and 7 gmacs. gmac5 and gmac6 are 
treated as CPU ports.

This switch has got a feature which phy0 or phy4 can be muxed to gmac5 
of the switch. This allows an ethernet mac connected to gmac5 to 
directly connect to the phy.

PHY muxing works by looking for the compatible string "mediatek,eth-mac" 
then the mac address to find the gmac1 node. Then, it checks the mdio 
address on the node which "phy-handle" on the gmac1 node points to. If 
the mdio address is 0, phy0 is muxed to gmac5 of the switch. If it's 4, 
phy4 is muxed.

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/mt7530.c?id=1f9a6abecf538cc73635f6082677a2f4dc9c89a4#n2238

Because that DSA probes the switch before muxing the phy, this won't 
work on devices which only use a single switch phy because probing will 
fail.

I'd like this operation to be done from the MediaTek Gigabit PHY driver 
instead. The motives for this change are that we solve the behaviour 
above, liberate the need to use DSA for this operation and get rid of 
the DSA overhead.

Would a change like this make sense and be accepted into netdev?

Arınç

