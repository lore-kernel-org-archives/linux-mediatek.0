Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C8C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPwkHbG90MMag3udWd8Nd7NzcljugUL4IhPuLknTpZk=; b=K03njHSbTrA8YoBMM7ej8wChPZ
	vUrpnBjzmLouw370fpS23PyAYibOORzQn9Pb3b3Mqa28H16ZAEFr4+34A2nhz0sCMr6mgNacqZgnd
	pp06IfLbeMB/uIK4oKk60IRK1mCWCK9gZ/q5XUwlZFIyyNs0tgOGwchly7Ep9AUb7VRYOdOlX/5iP
	J88qnTvWabkxvVfU0XDYLhageAdsX4ezPqjlPorvS0C23iQuTeo5TqkQ9NfewDTEMq0sRohlpxng/
	PEzQTiEoV6vIbUToX7AAqDhFvHwjTkE3c0QeEcLfd8NsV2QLN/dKpY4DvneYfQZahN77o1N8O1b6V
	NOGqgU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlgb-007zzE-Q8; Fri, 06 Jan 2023 12:19:01 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlgY-007zt1-Fo; Fri, 06 Jan 2023 12:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1673007511;
	bh=LPwkHbG90MMag3udWd8Nd7NzcljugUL4IhPuLknTpZk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hsf9ULlT5d5tKMS8KCUR9Utv8s9blFYpRDu7JZ9yQ8q/iWqlLPBkwII/4B5Gu+DAS
	 csAPstC1L8vzOkcLGc6Ym+iz7QSoK2KWVSSdjPKr2QEyvYJmS/rqAmGiEpGr4yumwP
	 ZshUdMno08DE1ZaQvYwGfN3AyxD2gDV8wDnfE/+1fKVZAW1GS53nKGNqoehrK/FuQq
	 MNsMKjlvoF2pl6QEW6pQLFC8LipvlQ6uW7r9u2ZS8665JD78KV/hccD6ABucWWiNAx
	 r9qdF8y+eh6Hkl8/SprozHgKiET7hPXU4eQfFcURo+IJgmvPoyPBdMFGo0yaLXm39J
	 6cgSetetuP6OQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.159.6] ([217.61.159.6]) by web-mail.gmx.net
 (3c-app-gmx-bap25.server.lan [172.19.172.95]) (via HTTP); Fri, 6 Jan 2023
 13:18:31 +0100
MIME-Version: 1.0
Message-ID: <trinity-fc462dbe-05a4-4a4f-b79a-7d79a2922dd8-1673007511120@3c-app-gmx-bap25>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re:  Re: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc:
 drop generic vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Fri, 6 Jan 2023 13:18:31 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <904dfc35-ecae-97dc-e9d9-a7df83ff89d4@nbd.name>
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
 <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
 <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
 <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
 <trinity-01eda9f9-b989-4554-ba35-a7f7a18da786-1672414711074@3c-app-gmx-bap18>
 <904dfc35-ecae-97dc-e9d9-a7df83ff89d4@nbd.name>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IloZCD58vBRizja9ZIJXP1vXGLP44GZuQsyUaCe1AKEnLmf0KQJMCIt5w1yzyULi3na1Q
 EvN+1F3Awjl0KwXgKIEg5C3ETeIBl/paX6ok9Y6Z4c3AqN3wvnSyAFehd7Ukfbu+3kkao8DYzypZ
 zHaXCynVcOnpPfp20dFg9DXXy2nxS5kKQ/PBVboYyIx54PFoOYy8pLQpv/SEscJtjqtcGAZpMJVK
 OomIs+BgZ3jnwXgyxhwz6AX6FACEQQTuABkzp0Xgqvh9kuI1CIbNZjS6MoRibMjqiepYyLHxxs+A
 mQ=
UI-OutboundReport: notjunk:1;M01:P0:DEJSVC2G+f0=;rh71YAevLudKgvM9rQblLL1yIxQ
 9SFChwyb8SyDCesVz6Eh1VcxQxNpKe6aZY17Ay7jnAGzs5pXYqxv7xjD3o/5Vw3L87VTxir0c
 3WqewLy4Mqwi53T3lkBG1Qe+BNxkJdWZ3HTJ7DiFe99TLCaCHPRHbomVS4eyLku+zMjQjRcTS
 NWZs58qObuzkVt3NNDWVNJQJDa5hD95Rixm2tbUSffTIkmCkd5qi2N9v3VJF55eRbiarquGeM
 cWENablThdhIAvphje7ROaIGp947SEr46dvivwZKl6FNkTiAEVDyfLbCltvr6e4Fmx/xmIqct
 fnNVjPnnKY8paimmHTmiqDe3U75L8K18XItRyhY6mkniWRjfgESm58j0zCCOWh938Zlt4+YpE
 fGrh9nyEYKOicHYLAaVdMFzMdm/HMMbqkFXVI7XAbO+FR5+qHWjJki6Go0QjchjMtWSRHk3DW
 EDf5rbB7S0F7pygakjc+HYKUbBsixRvG15uLvELM+Lr0vKHuQvFuPzjUS1MPg1O0p58iRhIjL
 A2DTzhTwvsM/ONU2QVyu2lQ9z6ItjeTCzU1o6NNUkU7yDHTMbrMLXRTQ+qPc/7WrM1nqtESZW
 9PHknm5PBkbXVtGP4VANptIrQrPPcWrU1Rzb0MsthTTjfG1pL6F8kJz2UbVaWaRpKHYMInsqm
 ONFQyuMZELBraSzCwNNW6I/trJza9IPwWvSWSf1UJGBwoGqwSeFviBkJ47tq3YDD8rNl+yJgp
 2e53n0B4egC7dmW3aq75ZGv5aauDqe/1oFTvzP2KOftOCw/K+qIoCGhFl9JAi5ibRzJYlcxd6
 y819OgqIJ9xczkAjm1IZicIg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_041859_026280_3F8C77DA 
X-CRM114-Status: GOOD (  14.14  )
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

update on my tests...something in my systemd-networkd breaks vlan on dsa-p=
ort.

if i boot with this disabled vlan added manually works on dsa-port and gma=
c too. so felix you can keep my tested-by.

if vlan is working and i activate networkd afterwards vlans are still work=
ing...i guess systemd puts the wan-interface into some kind of non-vlan-mo=
de (vlan-filtering?).

this is my basic systemd-config:

/etc/systemd/network/15-wan.network
[Match]
Name=3Dwan

[Network]
BindCarrier=3Deth0

#static setup
Address=3D192.168.0.19/24
Gateway=3D192.168.0.10
DNS=3D192.168.0.10

IPForward=3Dyes

/etc/systemd/network/20-lanbr.netdev
[NetDev]
Name=3Dlanbr0
Kind=3Dbridge

[Bridge]
DefaultPVID=3D1
VLANFiltering=3D1
/etc/systemd/network/22-lanbr.network

[Match]
Name=3Dlanbr0

[Network]
BindCarrier=3Deth0
ConfigureWithoutCarrier=3Dtrue

Address=3D192.168.1.1/24
Address=3Dfd00:A::10/64

[DHCPServer]
PoolOffset=3D100
PoolSize=3D150

/etc/systemd/network/05-eth0.network
[Match]
Name=3Deth0

[Network]
DHCP=3Dno
LinkLocalAddressing=3Dno
ConfigureWithoutCarrier=3Dtrue

/etc/systemd/network/21-lanbr-bind.network
[Match]
Name=3Dlan0 lan1 lan2 lan3

[Network]
Bridge=3Dlanbr0

/etc/systemd/network/10-wan.link
[Match]
OriginalName=3Dwan

[Link]
Name=3Dwan
#MACAddressPolicy=3Dnone
#MACAddress=3D08:22:33:44:55:77


regards Frank


> Gesendet: Freitag, 30. Dezember 2022 um 17:13 Uhr
> Von: "Felix Fietkau" <nbd@nbd.name>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: netdev@vger.kernel.org, "John Crispin" <john@phrozen.org>, "Sean Wan=
g" <sean.wang@mediatek.com>, "Mark Lee" <Mark-MC.Lee@mediatek.com>, "Loren=
zo Bianconi" <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>=
, "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>=
, "Paolo Abeni" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmai=
l.com>, "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.inf=
radead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.o=
rg
> Betreff: Re: Aw: Re: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: =
drop generic vlan rx offload, only use DSA untagging
>
> On 30.12.22 16:38, Frank Wunderlich wrote:
> > seems only tx is affected on r3, as i see packets on the vlan from my =
laptop
> >
> > tcpdump on R3 (e4:b9:7a:f7:c4:8b is mac from laptop):
> >
> > 13:47:05.265508 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1=
Q (0x8100), length 577: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50=
.2.59389 > 192.168.50.255.21027: UDP, length 531
> > 13:47:05.265548 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1=
Q (0x8100), length 577: vlan 600, p 0, ethertype IPv4 (0x0800), 192.168.60=
.2.59389 > 192.168.60.255.21027: UDP, length 531
> >
> > regards Frank
> I don't have a setup to test 6.2 on my MT7986 board right now, but I did
> test latest OpenWrt with my changes and couldn't reproduce the issue the=
re.
> I checked the diff between my tree and upstream and didn't find any
> relevant differences in mtk_eth_soc.c
> Not sure what's going on or how to narrow it down further.
>
> - Felix
>

