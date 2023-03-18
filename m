Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A0C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL+ywsc5oumC3HaY8sngFsWzR9AI3EgCT7wIdQGw3KM=; b=sqjLILgoU3TUdeVUoipmE63dvh
	pl0JDAHwRmreLoyGLaIxXqTKk9CR+BzukDRGaXDUYHEkdtWEcZ1n+qq1lYFCg0evPetrxMSUciiB4
	HNc8CIGoVmW96Cu+7u5q03oQ+gU7risYd6+gSIs+GOPM1u3xZ6CeGi4G7hV4Yhi9w6mjhoOcUgm7G
	VctRGz5fWVauXnneg6BGtNqmpMUgfxQ1HMFawSXaKHc78andj7bZYHYXeQPxUwjYazOGYG5PG6jue
	lm5kwws3rs7biAhP5qVkFrgzSfmAzxRRDoaocQSwjKZX0McMxKZBSKddTRqPwHL/VTnSnTyO3PzzL
	9XwAU3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdWIL-004lgU-1P;
	Sat, 18 Mar 2023 13:08:25 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdWIH-004lfv-1x;
	Sat, 18 Mar 2023 13:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1679144877; i=frank-w@public-files.de;
	bh=HL+ywsc5oumC3HaY8sngFsWzR9AI3EgCT7wIdQGw3KM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=t5Fk0enmXld4g4Y2NviXP9mWm9fnkAh5v/i6q3tUh/k47vY3yjCl1EGv47aANaNw8
	 a9FaYDIvQQD3yLZ21ZhDgyvvXk0gFXE9hhLu4BPjwzGBbRo5uf7ey/syWxwncn9YW8
	 VXC85+xGuu1hb35DHkhXf0nKA4cc3WcaxqkDh9Vr10GgX2gDi6CtanGvIK5ZyLDmWl
	 /LdenPS57ZUUu+jSyv9wg/Feya5Zx5OZIPaGe65DBCbFnb6dfM0gAyhKI6D8wBLBkQ
	 ltNcjVSoO4jVEsRUQipQKKtOzEh5+0GYxt89NXJsfYu3NRN16Mg/EOIjIQDzNXE//q
	 EUqfaZRQQpxiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.64] ([157.180.224.64]) by web-mail.gmx.net
 (3c-app-gmx-bs63.server.lan [172.19.170.147]) (via HTTP); Sat, 18 Mar 2023
 14:07:57 +0100
MIME-Version: 1.0
Message-ID: <trinity-e199fc72-77d9-47f3-acb6-e11fbf66360b-1679144877213@3c-app-gmx-bs63>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, John
 Crispin <john@phrozen.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since
 6.2-rc1
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Mar 2023 14:07:57 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-b2506855-d27f-4e5c-bd20-d3768fa7505d-1679077409691@3c-app-gmx-bap25>
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
 <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
 <ZBBs/xE0+ULtJNIJ@makrotopia.org>
 <trinity-b2506855-d27f-4e5c-bd20-d3768fa7505d-1679077409691@3c-app-gmx-bap25>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:TJHExnOMeRz5fapDUc0IpdMavobG6imcRwYME0auauoK3hoNuVIuzTh2pR8F/O9eR25ng
 0Yig/j7aQSrYP+D/gPpy57Ww09BxdEgZ8zPlYobCCgQz2rM3cb0dMBKH813Y20Euk8SOAYuGIB6w
 SX3KvCXXbSrAdj6xzXwfRkA82qyEc9/k7WTU/OSJ0RyPv7F7Oi61UQvNp3rIECi0u7MzELq6Ae9v
 mFwNKj5Uy0z5GnfGagk+NkADuCdVFXo1svhRYpiiem1V6XEgVb7C7fgzvUdM5c/F66CexcPOH2Gi
 RY=
UI-OutboundReport: notjunk:1;M01:P0:smH6RWLsCTk=;kDyG/QCPn2BAq0RojYGeAddj8aZ
 zcqdrlHNPX8/QIT+NUjh3eoI3En2KQbtWyEcoEDNs2yjeu9PdDh4OivUxL+gbDQvfwlSiwL79
 vP06cycOTI2Kxle+qKUn/RA9QTJq/E5bHYahv5wZHn8jDzKX8UQuFF8bIWqxf+Zz4r+Akyuk8
 qtnZ1clWwns7PiBUQ3Jmxl+lCcZPETG9COA2N4jjxa40OvCmOh+j9SUjQdySBMqGdL/sEGJnm
 2m1qP+H9kF1WdBT03+/qoRxGVSBEiHWEgIhxudF/40Tzu8SMp1aitDhWkJt6a04BVV/bQwVwO
 aASVEhQyOr0JRpckYfAvBa1873cRq11OjyQ13d4tgEt7OFDbRzfbiBvSON0g4UVxhAYlR4cGs
 HfrzRpRa6goCN6TZ5CKejtu4Cgv2BxhMld/zq2dAKRMs7RUbwMP5DG28ig37AE2KYtYppkZzy
 CrOm8gzfQM8dm+M7iF5uPNOcj5kfwFUryq1GObImSi+JWyCd7AIbMuYlU7662Huo6X+NCvhZG
 8lVAOODXAfSAo4yhzVsiafmeh5Z4K+nJgL2t5wglXD8uqImL+Umz1BNfLrOjyRAW62MENvlgN
 cCPTwad4U06Bu96OGky9fBCQg89hpd/j1yCpUpDPiCa67zjP+3xA2G3PFSKgFcx/v3akm8+7S
 mPpznUJsIceQk0KtUgQIpDQ3puhZ5PMcQlu/rAW9WEzVbU7yXFbamf/BpATbsexrtmOkUDxfk
 uXEbj3nfDD7MYHQj1beGbomCbkexMyR4exn3Vyht6qTLZpheJlgwbdV48nSvu85eJfrtSm4DI
 neOMs5AiUNbzhWTEsGmU+nBaGucqMLTDArtXOYQ2bTmvA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_060821_958485_4461DC5C 
X-CRM114-Status: GOOD (  25.88  )
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

> Gesendet: Freitag, 17=2E M=C3=A4rz 2023 um 19:23 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files=2Ede>
> An: "Daniel Golle" <daniel@makrotopia=2Eorg>
> Cc: "Felix Fietkau" <nbd@nbd=2Ename>, "Mark Lee" <Mark-MC=2ELee@mediatek=
=2Ecom>, "Sean Wang" <sean=2Ewang@mediatek=2Ecom>, "Lorenzo Bianconi" <lore=
nzo@kernel=2Eorg>, "David S=2E Miller" <davem@davemloft=2Enet>, "Eric Dumaz=
et" <edumazet@google=2Ecom>, "Jakub Kicinski" <kuba@kernel=2Eorg>, "Paolo A=
beni" <pabeni@redhat=2Ecom>, "Matthias Brugger" <matthias=2Ebgg@gmail=2Ecom=
>, "John Crispin" <john@phrozen=2Eorg>, "AngeloGioacchino Del Regno" <angel=
ogioacchino=2Edelregno@collabora=2Ecom>, netdev@vger=2Ekernel=2Eorg, linux-=
mediatek@lists=2Einfradead=2Eorg, linux-arm-kernel@lists=2Einfradead=2Eorg
> Betreff: Aw: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s si=
nce 6=2E2-rc1
>
> Hi,
> > Gesendet: Dienstag, 14=2E M=C3=A4rz 2023 um 13:47 Uhr
> > Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
> > An: "Felix Fietkau" <nbd@nbd=2Ename>
> > Cc: "Frank Wunderlich" <frank-w@public-files=2Ede>, "Mark Lee" <Mark-M=
C=2ELee@mediatek=2Ecom>, "Sean Wang" <sean=2Ewang@mediatek=2Ecom>, "Lorenzo=
 Bianconi" <lorenzo@kernel=2Eorg>, "David S=2E Miller" <davem@davemloft=2En=
et>, "Eric Dumazet" <edumazet@google=2Ecom>, "Jakub Kicinski" <kuba@kernel=
=2Eorg>, "Paolo Abeni" <pabeni@redhat=2Ecom>, "Matthias Brugger" <matthias=
=2Ebgg@gmail=2Ecom>, "John Crispin" <john@phrozen=2Eorg>, "AngeloGioacchino=
 Del Regno" <angelogioacchino=2Edelregno@collabora=2Ecom>, netdev@vger=2Eke=
rnel=2Eorg, linux-mediatek@lists=2Einfradead=2Eorg, linux-arm-kernel@lists=
=2Einfradead=2Eorg
> > Betreff: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s sinc=
e 6=2E2-rc1
> >
> > Hi Felix,
> >=20
> > On Tue, Mar 14, 2023 at 11:30:53AM +0100, Felix Fietkau wrote:
> > > On 07=2E03=2E23 19:32, Frank Wunderlich wrote:
> > > > Hi,
> > > >=20
> > > > i've noticed that beginning on 6=2E2-rc1 the throughput on my Bana=
napi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6=2E2-r=
c1=2E
> > > > Only TX (from SBC PoV) is affected, RX is still 940Mbit/s=2E
> > > >=20
> > > > i bisected this to this commit:
> > > >=20
> > > > f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_=
soc: implement multi-queue support for per-port queues")
> > > >=20
> > > > Daniel reported me that this is known so far and they need assista=
nce from MTK and i should report it officially=2E
> > > >=20
> > > > As far as i understand it the commit should fix problems with clie=
nts using non-GBE speeds (10/100 Mbit/s) on the Gbit-capable dsa
> > > > interfaces (mt753x connected) behind the mac, but now the Gigabit =
speed is no more reached=2E
> > > > I see no CRC/dropped packets, retransmitts or similar=2E
> > > >=20
> > > > after reverting the commit above i get 940Mbit like in rx directio=
n, but this will introduce the problems mentioned above so this not a compl=
ete fix=2E
> > > I don't have a BPI-R2, but I tested on BPI-R3 and can't reproduce th=
is
> > > issue=2E Do you see it on all ports, or only on specific ones?
> >=20
> > I also can't reproduce this if unsing any of the gigE ports wired via
> > MT7531 on the R3=2E However, I can reproduce the issue if using a 1 GB=
it/s
> > SFP module in slot SFP1 of the R3 (connected directly to GMAC2/eth1)=
=2E
> >=20
> > Users have reported this also to be a problem also on MT7622 on device=
s
> > directly connecting a PHY (and not using MT7531)=2E
> >=20
> > In all cases, reverting the commit above fixes the issue=2E
>=20
>=20
> made quick test with 6=2E3-rc1 on r3 without reverting the patch above a=
nd can confirm daniels test
>=20
> it seems the problem is no more on switch-ports, but on eth1 i have mass=
ive packet loss=2E=2E=2Eseems this caused by the same patch because i teste=
d with reverted version and have no issue there=2E

on BPI-R2 the eth0/gmac0 (tested with wan-port) is affected=2E here i have=
 in TX-Direction only 620Mbit=2E

I have no idea yet why there the gmac0 is affected and on r3 only gmac1=2E

But it looks differently=2E=2E=2Eon r3 the gmac1 is nearly completely brok=
en=2E

regards Frank

