Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAA8C64EC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OP3X0Px61zMcqd95TfNq9/R7u4UHsIlHqoTH3i/TdQQ=; b=VOO9IFk7LnfuPK9T4zY3e+SRi+
	YvMRJh+MgwhSRB1sqW7oUuwX9WHQkl5Q8tOF/lmyhfzLgqDQ28oi/Pqu8Z52LUZ9JtYOH/l4BgzY1
	lTBm09uQsEgO5xqD/u2sGr96dH6FbCf/uSMTO7YbyNxdIhPdX6Rwv+XFYYcEmzdpsaQp4E65VQGHd
	CBJhDZEcJMAY95LK1BD7X4NPKk3Pn78PChAenxmHiO8WDJJf7Ei2MdBSYmvBoJH6A1LOt6LNr/4fF
	23fc0pQV1yaFNrEb50+y42386tBlKku3eaX8R91zf5puvTw0CaAnxklgvEijpbtsIk2Vv3mZVLzZR
	PvsuiKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTMAw-00Gy5e-8w; Sat, 18 Feb 2023 12:18:46 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTMAt-00Gy50-1j
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 12:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1676722706; i=frank-w@public-files.de;
	bh=OP3X0Px61zMcqd95TfNq9/R7u4UHsIlHqoTH3i/TdQQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KQRJu0DQuXUY6MhyMywcwbwVVVnh93d+Qk4nG3A0J0BdpxX0zS1k/4YMLQ1jVI4iH
	 DylkaUjRJ7ql9gavffrcws+s4sHGg84KYcZ2MyzOP0PUV9ETqm6sz8baINzTgLoqdV
	 F50SedxLHOvVsJaU+5N7dDVLnBbiLetgEFIxkMiWxca9UutoOtemX5hAYQsUDS23Av
	 yJCUTwS+sanp+Ws7Byk70BaTmggOHXbdE0rMqYppISwMNLoNQy5wAshTJtrJgRz1sc
	 l8Iy1FLmSxYT35OvVcrtTRtLH45RrJ7QqfA3mMPy/ZXr9XG5YT7A0JS96e1P7buh5H
	 FTeIfRDEBonPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.5] ([217.61.153.5]) by web-mail.gmx.net
 (3c-app-gmx-bap53.server.lan [172.19.172.123]) (via HTTP); Sat, 18 Feb 2023
 13:18:25 +0100
MIME-Version: 1.0
Message-ID: <trinity-dd260791-3637-4193-8f93-a9fcdb013dcb-1676722705920@3c-app-gmx-bap53>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re:  Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs,
 mt7530 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Feb 2023 13:18:25 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
 <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:v1DPPWM6A9oy60/IsAqYGoZGjhlhPcE08EPlTUQ7a9wHeBrXGvS7GB2Y1anKzv/dSghU8
 Q8g0r6DYi4VxL6MFqP0JSqYMC7v/f5utL4W4CO41vRcaabsvBGCd360RQh5Mu0DPSp6+DIE9RLuf
 1mquoXx3bvRPzdGhvbMx9JKyF9OEMFQ7pD+LQDieF1dnrQCqTMjPP3EJQvkl6e/ftYnJ36cI3DOG
 5K4/9eQxYMUlyafuIaF6/HvP2E9olsJtfEDi1TwwbKRRV0Oc5DAvh+cAybTZ2bnAMTCgsAyLtT03
 BE=
UI-OutboundReport: notjunk:1;M01:P0:VZV6dh1A5Ag=;Buw383pPwakwuXb/1j7tqGijIUR
 3iem6oEThCQ7VPv417sYU4cqM8eTKTxf9CiPBWZj0UVIEx5YqUC6qyjWfwzTKiFG9DV6fsCyW
 1L08OdWZk/WFkwhx+Yzszcl4xykEjrxGIe9VEaLQjGrSvQwvipUtUGKrLdz5zvz7RLpui7KEZ
 hZnyJoOlgB2HZPMz64EMhCfSHtraXEtk2yWOYPlaGFs+eN4BpBfsv6zpW+xJoN/dG3dAiagpK
 XeNygMNdfrW/l6umEVQpTfo2TKRkWsnnHbX9EVLLS4/7WfMsrh29cuG992KgIv0FS+BuNmnih
 cP3U/caOvlESKH1WGzpRzgavmcshBpvwPpNnjAepRmcg0iV28gm2yNefK/e5qVb4JbywWffsQ
 HD7xWCYpEl3gadxP8CeL3z0mdS0HlTFtjFEel0m4M2czy0XfrMNRFSSQ2gGafpbb11hHFaN1j
 g+eYQ1nep7Azz9tLxOzbjqPVZYCoEL4zrNU8lQ2MMl2gNJt9iOam7b55cwWcw4dob6OywGJwn
 6NS7i67/Xxmo7Jc46EfAUfXknUUZ8Pi27MFTruBIJnJNXr6kuG8Filbkqx8GZ3Sx5h6gWm8m5
 Pv2+qw9lTrqAksnDCEdeiYPqf2xekLAy7qpASheFkUDT65rPp+0wgeMqzkyNnaLXVPK6TY0AJ
 1eXEIIuRuW8O+KX3RbZm1XYUFWXD6w54jjw3hE4aRUr8pphpjd4PUKe3ofQ4ZwFe+yiyblyZa
 aLIMOsTfgmS7DeEwmowaJLIe+FPwC17LO5SS3OHxkYjh3G9mHGW8jhApjrtQU+/FCI0r1Jqij
 yf1y7MbtJcYwQvuRzjjL4J1wNpgKglbhp6PlrKMdzew3M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_041843_423495_7FE473EE 
X-CRM114-Status: GOOD (  26.02  )
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

> Gesendet: Samstag, 18=2E Februar 2023 um 11:49 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>
> An: "Frank Wunderlich" <frank-w@public-files=2Ede>

> On 18=2E02=2E2023 13:24, Frank Wunderlich wrote:
> > Hi,
> >=20
> > finally get some time to bootup with this series on my r2=2E
> >=20
> > I see that inserting the port@5 as cpu-port maps this as default-cpu b=
ecause dsa-core uses first found cpu-port as
> > default (dsa_tree_setup_cpu_ports in dsa=2Ec) and because of lower ban=
dwidth (rgmii instead of trgmii) not the best choice=2E
> >=20
> > But it look worse=2E=2E=2Enetwork is currently broken (set both gmacs =
up)=2E
> > I see arp-packets reaching remote side, but reponse is not received by=
 r2
> >=20
> > I have tested it on 6=2E2-rc8 (wan-port), maybe additional patches are=
 needed?=2E=2E=2Euserspace setup should be right=2E
> >=20
> > so i added series on top of net-next (no additional patches except som=
e basic like build-script,defconfig and such)=2E=2E=2Esame result=2E=2E=2E
> >=20
> > i'm not sure if i change the mapping from userspace back to eth0, so d=
isabled port@5 in switch, now port6 is
> > cpu-port again and it works=2E=2E=2Eso something is wrong with port5 o=
f switch or gmac1=2E
>=20
> That's a driver issue and will be fixed once an accepted version of=20
> these patches [0] [1] [2] are applied to net-next=2E You should have the=
m=20
> on your inbox, I specifically told Richard to CC you=2E

yes, i've got them, but not applied when starting these tests=2E Not thoug=
ht, that this change is necessary=20
as we use both gmac on mt7531/bpi-r3 with out problems=2E

with these 3 Patches network-connection works, but only at ~624 Mbit/s in =
TX-Mode (started iperf3-client on r2 without -R) and massive retransmitts o=
n first run, other direction is clean=2E

and these Patches need to be applied first (when fixed up) else network is=
 broken=2E

> This is devicetree bindings=2E We're here to describe the hardware=2E Th=
e=20
> way a driver works should not affect describing the hardware=2E

thats right, but it should not break/change behaviour like now all ports h=
ave only ~600Mbit because of
moving them all to the other gmac which has obvious issues=2E

> To address the lower bandwidth situation you mentioned, a devicetree=20
> property to designate a CPU port as the default CPU port could be=20
> introduced=2E I'm not aware of a similar conversation so I'll send a mai=
l=20
> to netdev to discuss this=2E Will CC you=2E

isn't there a way to leave ports by default on the the better gmac (gmac0=
=3Dtrgmii)?
maybe moving port5 below port6=2E=2E=2Enot nice, but then port6 is the fir=
st cpu found=2E
or maybe defined the default cpu in driver which gets picked up by core (d=
efine port6 if available as default)=2E
Imho additional dts-propperty is wrong approch=2E=2E=2Eit should be handle=
d by driver=2E But cpu-port-selection is=20
currently done in dsa-core which makes it a bit difficult=2E

I'm not sure how the multi-cpu support in dsa-core ended and how you use t=
he other gmac not used by dsa-core

set master in userspace-config? i remember you've sent a patch adding call=
back for it=2E

imho dts change should be applied if these points are cleared=2E=2E=2E

regards Frank

