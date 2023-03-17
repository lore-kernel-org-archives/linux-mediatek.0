Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+knkoj6qEKMjKXAKwgtvEe9ARO682wX5BFyBkQMEe1Y=; b=U1kGjWl9FdzlxD8POgTcHe+4EB
	/GBwpHa4ZEl3fjtxY8bGQy4YnJ10rGpK1OOsU6k5knrO6P5aWiXLwJ+hyWTTkFEQSPTZoDQqC12X+
	yBoNRj9NQf0LSts40oFEt6cyZD6ZoV0h9PDB/mtAjxqKeDKH9PddcU3aM3m/T7Keivse8I6zjANng
	Bnu/+HDwxbD2TntoOsB5/tnOAZdVESpFl0MyoIOx+HSz97RpZtbfn+YqKLDT1K/qLBs+57iUncIjU
	WDkUGonCeYsuFpzotD91j4XmPjf55cgo9qeKVsJwQuZmgJpQkLgd5twNjGkbX4tV2LHHBhf/4q1Ha
	PBXSjpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdEk9-0030v5-1M;
	Fri, 17 Mar 2023 18:23:57 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdEk5-0030sf-1B;
	Fri, 17 Mar 2023 18:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1679077409; i=frank-w@public-files.de;
	bh=+knkoj6qEKMjKXAKwgtvEe9ARO682wX5BFyBkQMEe1Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bLVvOZcuT2d7cmBaWsJZPuWvylzPLWNjMOhxgOmblwEBmIYdpyhal7PuV0p0OAvEB
	 3897ABeHdauSoSn/d9NSF4GlAi91cgBEZIP097wP6tqbjKSoYIF8MCcaomwsutXFGE
	 S5EB1nbE+tmbxwPHv3YGf7O2DCWKNW7A6JJctq6kDf4emJjMcCtfG9L+HkJqOaS6HB
	 Bwn9iPZ2GlSsFmZGO3tnvr50s4UJbnNSNz5Pyrro/3XOsincfUfW5ppc+1UzX+tqRJ
	 R6e82krcPUrPyrjTSj9CpfnWrYpFUCSUhvMDXXwC+kgcytYoVaPazYZwBgrcBt506k
	 Jsn560OWIsGWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.150.189] ([217.61.150.189]) by web-mail.gmx.net
 (3c-app-gmx-bap25.server.lan [172.19.172.95]) (via HTTP); Fri, 17 Mar 2023
 19:23:29 +0100
MIME-Version: 1.0
Message-ID: <trinity-b2506855-d27f-4e5c-bd20-d3768fa7505d-1679077409691@3c-app-gmx-bap25>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, John
 Crispin <john@phrozen.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since
 6.2-rc1
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Mar 2023 19:23:29 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <ZBBs/xE0+ULtJNIJ@makrotopia.org>
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
 <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
 <ZBBs/xE0+ULtJNIJ@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:sdfRI46NqWw0uqvtc+Z/GHU/EZ7mLW2XJViuRX3yvpswiDLI+dZuZtNe+6Qbb40ffTboy
 KV2aohZ31q1zQNVYnLXSjoR3VWEBAlKl9wfyFvid4VVNsyz+PIDBBLBEEnKcP3DOr6BnwfNfMdK3
 Tj8rMdW/nJuCdIFNIMaAfh3abaYdCXYasAqEiBYtHz2qmp6qRYWlhJ7aYZgqVM23cmwAK3t1+mB3
 WFaNIYdn9x8Jj+CEZxq2CEyi49xI9noaR7rqW5veGF+4kzAm3dEGOfp+eiXMOqpfeWhZ+oUeOfUv
 tI=
UI-OutboundReport: notjunk:1;M01:P0:ZhA755+2qsM=;fKHKOtIjIyA+3CHIoQzz++3hRKF
 zAGF+zy2Zpkg+47qaGm8LWW3FWdYLrJ7QRFbRXWhjUCywW7J4orN5JBZvJdVmDZoMxCvLfQsz
 FjWJEqVOU/nsRwiBpCy0sk0Zccveum6CTKHJU9H5NV2QrBq2pQxiJ9IIVSU/WN+DCwYAWdWcO
 47lMtRd4gzyWvgwFc/v0DvkRO1Pnpysn9cWgkB+Yl8ZSNtQ6snc8A/laCx46+xZW90/PsHtUV
 nGA2frie5Z9drs0PbVUJr3fLJqCcx903bPOLMVpMbo2/Y8+d38CY66bKquqoinp6zK0DHozR6
 OKH9/qRy1Kc7twU4U6Zgg7ENFur0Ot1/adbMA0X2UwAsenpwnETa+Ewpauc9KSZrl7MKsloXD
 Psl6o+ZxZJ/9i9dBjD1I4XjiOR/964Y0C1i5co5Q9WQR2Kp3ZGYca6uUyFDIzAjiI3PuSK0sc
 kt4unotO81CX1BZJg1vetAxlKCDmGV1nIo8+bNBCh+ojxoKbFcGyrCDetMEFA6sWf4nabovQp
 W56gsMnFXWiSwJ1g+fwLCMnqG9/aqKAVCL8fqdIpPGcUMreIwBpVXz2xxBEjSTmVKSeHSNImI
 9/6qkoLRqcJCJetoB11e1D/s3SjYDZ18R0yXoCjwVZ1qS6pVDWXMln/4v5FXHGZN6nMcEcoz7
 7Vwg7q3bx4owrdF8guTRbsSSTwkwtLWQKAoh4pk9jGZC8TU56kLZa4kOKuBnb4NadNoNfYQzl
 0bAqPmEeNeRJ/6uDRYDcb3uJpbplszis3r7V1AJ9pYtjr5QUvbPIYKd3gvf0utxmtHd3/B8j/
 ryBqoVju06oXM9owy5tfr2zwZHtBHQJkLxa03nPqJZQYc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_112353_770640_4446F112 
X-CRM114-Status: GOOD (  23.49  )
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

Hi,
> Gesendet: Dienstag, 14=2E M=C3=A4rz 2023 um 13:47 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
> An: "Felix Fietkau" <nbd@nbd=2Ename>
> Cc: "Frank Wunderlich" <frank-w@public-files=2Ede>, "Mark Lee" <Mark-MC=
=2ELee@mediatek=2Ecom>, "Sean Wang" <sean=2Ewang@mediatek=2Ecom>, "Lorenzo =
Bianconi" <lorenzo@kernel=2Eorg>, "David S=2E Miller" <davem@davemloft=2Ene=
t>, "Eric Dumazet" <edumazet@google=2Ecom>, "Jakub Kicinski" <kuba@kernel=
=2Eorg>, "Paolo Abeni" <pabeni@redhat=2Ecom>, "Matthias Brugger" <matthias=
=2Ebgg@gmail=2Ecom>, "John Crispin" <john@phrozen=2Eorg>, "AngeloGioacchino=
 Del Regno" <angelogioacchino=2Edelregno@collabora=2Ecom>, netdev@vger=2Eke=
rnel=2Eorg, linux-mediatek@lists=2Einfradead=2Eorg, linux-arm-kernel@lists=
=2Einfradead=2Eorg
> Betreff: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since =
6=2E2-rc1
>
> Hi Felix,
>=20
> On Tue, Mar 14, 2023 at 11:30:53AM +0100, Felix Fietkau wrote:
> > On 07=2E03=2E23 19:32, Frank Wunderlich wrote:
> > > Hi,
> > >=20
> > > i've noticed that beginning on 6=2E2-rc1 the throughput on my Banana=
pi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6=2E2-rc1=
=2E
> > > Only TX (from SBC PoV) is affected, RX is still 940Mbit/s=2E
> > >=20
> > > i bisected this to this commit:
> > >=20
> > > f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_so=
c: implement multi-queue support for per-port queues")
> > >=20
> > > Daniel reported me that this is known so far and they need assistanc=
e from MTK and i should report it officially=2E
> > >=20
> > > As far as i understand it the commit should fix problems with client=
s using non-GBE speeds (10/100 Mbit/s) on the Gbit-capable dsa
> > > interfaces (mt753x connected) behind the mac, but now the Gigabit sp=
eed is no more reached=2E
> > > I see no CRC/dropped packets, retransmitts or similar=2E
> > >=20
> > > after reverting the commit above i get 940Mbit like in rx direction,=
 but this will introduce the problems mentioned above so this not a complet=
e fix=2E
> > I don't have a BPI-R2, but I tested on BPI-R3 and can't reproduce this
> > issue=2E Do you see it on all ports, or only on specific ones?
>=20
> I also can't reproduce this if unsing any of the gigE ports wired via
> MT7531 on the R3=2E However, I can reproduce the issue if using a 1 GBit=
/s
> SFP module in slot SFP1 of the R3 (connected directly to GMAC2/eth1)=2E
>=20
> Users have reported this also to be a problem also on MT7622 on devices
> directly connecting a PHY (and not using MT7531)=2E
>=20
> In all cases, reverting the commit above fixes the issue=2E


made quick test with 6=2E3-rc1 on r3 without reverting the patch above and=
 can confirm daniels test

it seems the problem is no more on switch-ports, but on eth1 i have massiv=
e packet loss=2E=2E=2Eseems this caused by the same patch because i tested =
with reverted version and have no issue there=2E

regards Frank



