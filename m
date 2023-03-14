Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFBDC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7aPb9OOiczw1p7VOWvnhe1L3K0+a2uiqigSXulCgho=; b=DgJNaSIIRh8fv265M6h9jtTetT
	Jb9sKvAqGZnkX+jLBEc83hgg4ajArfeB0L2dfslWJjeu91VfxnmiFdi7EYPUqndGljH+ZmPeUvMS5
	Dkm984dqdeDED3kc8/DKNTqBjVsezJVPGsweeRXdoaRTHMA/vl/ykAYMQX0ByTCRqKWEy9hT1tFKR
	ZVMWAFPVloONLLBY+OpqBxq/3vTtAdW1xJlJ0o+d1/Atp4Ju8zleoB4fJyUprIzU81lOqKveN4PDg
	RM40qzXWLIHlZF72hwfMIZUlfrdFrFRID1YfdPcLcfrUlUuzlFr0prp+sw4QsbUU+WR7qs6CtmPXu
	CTKpsgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5BR-00ANcr-2X;
	Tue, 14 Mar 2023 13:59:21 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5BM-00ANaE-2z;
	Tue, 14 Mar 2023 13:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678802351; i=frank-w@public-files.de;
	bh=H5jSBsXfpV8vfbpCM7sa9WUmHavxWAwDYJRxSvRoQa8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CsNlR9dbIdycw2Btnq6aJpvHy0H/7syh9WpfeS5PaxMuRNnb5bj2n02dUV32Sb9bT
	 uAGkFJ5ne0RnK4vKo+LRky1RHeF7nu1vbfAP2isVhCLFdiNZ7hjRx6grLeK9XdPSez
	 W9O2UMNH4Dg9Z5r+EWwyI5l1NmL9mkRRDQXqKt1bI3xOngPPoancE6MJ5r+oVXLeXX
	 7tJsBbZhyXsP3ZptBLKlw/ezA7kbDn/vPjcQjcD3i0lP4svCBmqzaaceuK1W5/3IcF
	 S2AQAXghA814NiW5aVuxO9+helWRHpNQsOGr4g0UaiRVhTlKhclmU3inrmGk0dTHTB
	 fBfH23Kb6fWKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [91.64.11.45] ([91.64.11.45]) by web-mail.gmx.net
 (3c-app-gmx-bap50.server.lan [172.19.172.120]) (via HTTP); Tue, 14 Mar 2023
 14:59:11 +0100
MIME-Version: 1.0
Message-ID: <trinity-99c1353c-98c3-4608-8079-9a818909e6c4-1678802351739@3c-app-gmx-bap50>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 14:59:11 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <ZBBIDqZaqdSfwu9g@shell.armlinux.org.uk>
References: <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
 <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
 <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
 <ZA4wlQ8P48aDhDly@shell.armlinux.org.uk>
 <ZA8B/kI0fLx4gkQm@shell.armlinux.org.uk>
 <trinity-93681801-f99c-40e2-9fbd-45888b3069aa-1678732740564@3c-app-gmx-bs66>
 <ZA+qTyQ3n6YiURkQ@shell.armlinux.org.uk>
 <trinity-e2c457f1-c897-45f1-907a-8ea3664b7512-1678783872771@3c-app-gmx-bap66>
 <ZBA6gszARdJY26Mz@shell.armlinux.org.uk>
 <trinity-bc4bbf4e-812a-4682-ac8c-5178320467f5-1678788102813@3c-app-gmx-bap66>
 <ZBBIDqZaqdSfwu9g@shell.armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:NhK14wNUkflro3RqDPkDuJrdLBQ+eZgN416pIUJfkynHCgThTB1VAWOMSDrDZuikOQfUw
 1iciGy0pZl87hzyoa2smS3HyUnDQPs9bBwcrO/cON/Uivue46pBI03HuTw0D0u6TysbvXbo/Zbex
 +DTPgFHdcdlrlek9l+4Yf582x6BbnBefHFD/9UcMqT+Gt1aRSD/MaM+IiVlsu7buvcpWs0ZI+VBX
 KD1iuO0RP2o0Ldq0BoePuCnaKO8HGoPFw04vkbxnmHqS+e1RBqsJRVRvEQDkEzCYSdcATRGqWWjL
 2o=
UI-OutboundReport: notjunk:1;M01:P0:oxG0TvV7TbI=;gg5M9XZ+TKu0eW25vHrBYq/dDo/
 iuDYdMGNWW7vQtvEGJy54P4lvzMdLZ5aKHwGt/LWMI8eFZ0JnRY1/edDv/q/J9xj6/UvHfr5M
 Tl7nj/oQLlX5+x7NIp4I84gHM92BfZ9z7GaR/njg9gRpZ4f/QWJpuGjVGJhPW3FjnxpSgyY3q
 vhOSGx0P2hYy8LKjDGHSQ6CWUEe8ECdYSiy40Vy0mBCFf2d11LZ1n8TwI24NxF677rWimpAut
 JoZN+qa1JVoSwAjcBLsg1sx6bErG5JtEoYAzBSGs+8Fx6IIEmHPDf517+y8uQLcv6lioi1MhN
 1zLnATVr+L7ZzNKAYBHjsND6BueUnPsKYD/Q63fhGaCdYI2NjGD+2Sg6EHz2ZIG7fT7O1u61s
 310gBcnwVg8LoEfQIPXXFvHyVdXb1jIg24qgdf/XqzqOIX2XafnWuYNdqE3B9AEGPOWkv3M+q
 HRvW+4BDf39ZjEx7TvWhphLzbs8NCSkXeYRRkS5W/jPbkcLQUNgptRGc9TjyOyNhcflB7vA6N
 IXoUR9WEHKHi1Ac+W9Eqyv0pYmex3iOh7w0qBaOOjC0xHl46iD44q1e2aAeAvI7dRgDViMvU8
 t+l7qsVPkMl4MZJsp+DQP/QhOLT0YM7qYuo0HpDCsuS/yMzFfUbVI+zDzWEOPv0URmT4hvJTg
 4M4ju+gWI+2wZR0ftO9Z54QEVNTWv/fINjOLiVb7x/NcRFJKRIbK08xpN+qGuYxHXu6u7NucH
 61uYBoPDdjSQCYSMrBljiqSQXwwq/yjw1T1a3gM9doYqidO/zFogB93mzE1b7b0fScd5VsK42
 AjGOczVxs33e/3yhvn1k/HAg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_065917_272639_20ACECE6 
X-CRM114-Status: GOOD (  15.76  )
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

Hi

very good=2E=2E=2Edo not need the manual autoneg with the last Patch :)

> Gesendet: Dienstag, 14=2E M=C3=A4rz 2023 um 11:10 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux=2Eorg=2Euk>

> For 802=2E3z modes, MLO_AN_INBAND with Autoneg clear in the advertising =
mode
> disables in-band negotiation=2E This is exactly how "ethtool -s ethX
> autoneg off" works=2E

ok, this seems now correctly set=2E

> > > The patch below should result in ethtool reporting 2500baseT rather =
than
> > > 2500baseX, and that an=3D1 should now be an=3D0=2E Please try it, an=
d dump the
> > > ethtool eth1 before asking for autoneg to be manually disabled, and =
also
> > > report the kernel messages=2E

root@bpi-r3:~# ip link set eth1 up                                        =
                                                                           =
                                      =20
[   91=2E624075] mtk_soc_eth 15100000=2Eethernet eth1: configuring for inb=
and/2500base-x link mode                                                   =
                                          =20
[   91=2E632485] mtk_soc_eth 15100000=2Eethernet eth1: major config 2500ba=
se-x                                                                       =
                                          =20
[   91=2E639094] mtk_soc_eth 15100000=2Eethernet eth1: phylink_mac_config:=
 mode=3Dinband/2500base-x/Unknown/Unknown/none adv=3D00,00000000,00008000,0=
0006400 pause=3D00 link=3D0 an=3D0                  =20
root@bpi-r3:~# [   95=2E808983] mtk_soc_eth 15100000=2Eethernet eth1: Link=
 is Up - Unknown/Unknown - flow control off                                =
                                          =20
[   95=2E817706] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready  =
                                                                           =
                                        =20
                                                                          =
                                                                           =
                                      =20
root@bpi-r3:~# ethtool eth1                                               =
                                                                           =
                                      =20
Settings for eth1:                                                        =
                                                                           =
                                      =20
        Supported ports: [ FIBRE ]                                        =
                                                                           =
                                      =20
        Supported link modes:   2500baseT/Full                            =
                                                                           =
                                      =20
        Supported pause frame use: Symmetric Receive-only                 =
                                                                           =
                                      =20
        Supports auto-negotiation: No                                     =
                                                                           =
                                      =20
        Supported FEC modes: Not reported                                 =
                                                                           =
                                      =20
        Advertised link modes:  2500baseT/Full                            =
                                                                           =
                                      =20
        Advertised pause frame use: Symmetric Receive-only                =
                                                                           =
                                      =20
        Advertised auto-negotiation: No                                   =
                                                                           =
                                      =20
        Advertised FEC modes: Not reported                                =
                                                                           =
                                      =20
        Speed: Unknown!                                                   =
                                                                           =
                                      =20
        Duplex: Unknown! (255)                                            =
                                                                           =
                                      =20
        Auto-negotiation: off                                             =
                                                                           =
                                      =20
        Port: FIBRE                                                       =
                                                                           =
                                      =20
        PHYAD: 0                                                          =
                                                                           =
                                      =20
        Transceiver: internal                                             =
                                                                           =
                                      =20
        Current message level: 0x000000ff (255)                           =
                                                                           =
                                      =20
                               drv probe link timer ifdown ifup rx_err tx_=
err                                                                        =
                                      =20
        Link detected: yes=20

root@bpi-r3:~# dmesg | grep -i 'sfp\|eth1'                                =
                                                                           =
                                      =20
[    0=2E000000] Linux version 6=2E3=2E0-rc1-bpi-r3-sfp13 (frank@frank-G5)=
 (aarch64-linux-gnu-gcc (Ubuntu 11=2E3=2E0-1ubuntu1~22=2E04) 11=2E3=2E0, GN=
U ld (GNU Binutils for Ubuntu) 2=2E38) #2 SMP Tue Mar 143
[    1=2E658048] sfp sfp-1: Host maximum power 1=2E0W                     =
                                                                           =
                                          =20
[    1=2E663128] sfp sfp-2: Host maximum power 1=2E0W                     =
                                                                           =
                                          =20
[    1=2E812401] mtk_soc_eth 15100000=2Eethernet eth1: mediatek frame engi=
ne at 0xffffffc00af80000, irq 123                                          =
                                          =20
[    2=2E001796] sfp sfp-1: module OEM              SFP-2=2E5G-T       rev=
 1=2E0  sn SK2301110008     dc 230110                                      =
                                            =20
[    2=2E011307] mtk_soc_eth 15100000=2Eethernet eth1: optical SFP: interf=
aces=3D[mac=3D2-4,21-22, sfp=3D22]                                         =
                                                =20
[    2=2E020000] mtk_soc_eth 15100000=2Eethernet eth1: optical SFP: chosen=
 2500base-x interface                                                      =
                                          =20
[    2=2E028080] mtk_soc_eth 15100000=2Eethernet eth1: requesting link mod=
e inband/2500base-x with support 00,00000000,00008000,00006400             =
                                          =20
[   91=2E624075] mtk_soc_eth 15100000=2Eethernet eth1: configuring for inb=
and/2500base-x link mode                                                   =
                                          =20
[   91=2E632485] mtk_soc_eth 15100000=2Eethernet eth1: major config 2500ba=
se-x                                                                       =
                                          =20
[   91=2E639094] mtk_soc_eth 15100000=2Eethernet eth1: phylink_mac_config:=
 mode=3Dinband/2500base-x/Unknown/Unknown/none adv=3D00,00000000,00008000,0=
0006400 pause=3D00 link=3D0 an=3D0                  =20
[   95=2E808983] mtk_soc_eth 15100000=2Eethernet eth1: Link is Up - Unknow=
n/Unknown - flow control off                                               =
                                          =20
[   95=2E817706] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready

so you can see the link-up comes directly after the interface up

does the ethtool-output look like expected? i see speed/duplex is set as s=
upported/advertised but not active

        Supported link modes:   2500baseT/Full
        Advertised link modes:  2500baseT/Full
vs=2E
        Speed: Unknown!                                                   =
                                                                           =
                                      =20
        Duplex: Unknown! (255)=20

maybe because of the

@@ -3003,7 +3007,8 @@ static int phylink_sfp_config_optical(struct phylink=
 *pl)
        config=2Espeed =3D SPEED_UNKNOWN;
        config=2Eduplex =3D DUPLEX_UNKNOWN;
        config=2Epause =3D MLO_PAUSE_AN;

imho ETHTOOL_LINK_MODE_2500baseT_Full_BIT sets only the supported which in=
tersected with the advertised from the other side maximum should be taken a=
s actual mode=2E=2E=2Eso this part seems not correctly working at the momen=
t=2E

the "Supported ports: [ FIBRE ]" is also misleading for copper sfp, but im=
ho all SFP are shown like this=2E

full log if needed:
https://pastebin=2Ecom/6yWe4Kyi

next step:
is it possible to have pause for rate adaption (handling rx pause frames c=
orrectly)?

regards Frank

