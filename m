Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A1DC77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NqprM4j549SEj5PGLmZ1hb+z7DxjMV0RONCnIDIKuDU=; b=nXWa3HoeLPuiQt
	Vc6eUF1KQILoYJ2kRqSAY4eQTSBsQ6gOpYuavqk6762zJENQu69nGlpt2jSiOC9OjjmPlZkF5DF7W
	zwKW8Y5eqVl99iAOXqJQEiwaj3SMn2h2ItOF1md52iRGNtOGbHaKaoAoP0EQ2y/+XpYX1zTx0uupo
	YMjsgZ5e+AOG/ig9M1onLkiU6aTmy3qJmobvPRtwQRWZH2TiXZLpvOmgRU7U6UrR7AagGgcmvb6UD
	UjpzAr336TXxTndJXdXHMXT48a6EDQScn4Swc5uEwCBsqpluGiG/P6kIzEtnGmQCu+0IqiTAeaxbV
	L2hu3yvwoxZunn9z7alw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3l-000UZs-0K;
	Tue, 25 Apr 2023 08:30:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3h-000UXU-0W;
	Tue, 25 Apr 2023 08:29:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so785144066b.1;
        Tue, 25 Apr 2023 01:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411392; x=1685003392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqprM4j549SEj5PGLmZ1hb+z7DxjMV0RONCnIDIKuDU=;
        b=pEkw7S14spvkt5NISAw0C4+oNzPySVYl/MvbEPKRwfGL7imGuTnZO2B21h4xyQJaRG
         ooGEXHxCDQT/1Q/nM5Z/zLpm+DNWSx1CN82hydEqLaX2NxR+xuboylmDUEJV84X+2ctF
         Xz8EvODtFQ/iSDOyR8RYAI3WOwIdKlHJs4SmMMLrvzqRIsnRwlV+0d0iDwk/ujwgUKRD
         IMWRq4XDQ3kWXrlPjcPtk4L8pIAqPiG/B160N9oWTgH4gj8wgX3oh6vhOy4IhjBz0faA
         UCOQewOydBCZyzhJaYyOkIP7UPOf+tPZzylDkkyj2Exj9bb/pT03SppSeJNoOVt55QKX
         IEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411392; x=1685003392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqprM4j549SEj5PGLmZ1hb+z7DxjMV0RONCnIDIKuDU=;
        b=EtRGWD5vp+uhnhUal5JdMp3tzINODN7D4lwC6uls5bVDrtI/uZsSk0j4jy0FkY09en
         BS9I0bZWktZPkpSh48N4wb1F5JGz51+AIL9XO1sgjZQ5s9qOaWkLrrmI8cTl5JZ4a/Mh
         hG8fS2dqRIiZ8olHachjJwBg7Ptdj8TRhkMyMfKCHyCaxO8aogRL3hK8yMjoXT9Bq3R+
         ta4kVbhcJNNnOWFOCj96HTZvhz0xHiq0QfLrXY+6otdvxJ7AMgb80GBCqsTbA2owkNrD
         hhdkxdNi6S9kt4u6iqlRaU0D9nGtfrMfxEpk9Dfqv073oXrRvQ1zrOUtoCcZMmWyyGRE
         vAeg==
X-Gm-Message-State: AAQBX9dWohQdwQaWS7V1bwyXYQJkmmO6eifjIZ2lIui1qZ2vB7rUt+0v
	EXj+THyiYgDceJXJr49PNv6QB5wS9aROTfFs
X-Google-Smtp-Source: AKy350bmAiS/zfdqkRBA3U7z2tq+V3Tcvi18IZiqM8unXqQQDybRedf1t8QhcIPwUjxRt222iBPK/w==
X-Received: by 2002:a17:907:8a18:b0:94a:5c6d:3207 with SMTP id sc24-20020a1709078a1800b0094a5c6d3207mr16112893ejc.44.1682411392225;
        Tue, 25 Apr 2023 01:29:52 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:29:51 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 00/24] net: dsa: MT7530, MT7531, and MT7988 improvements
Date: Tue, 25 Apr 2023 11:29:09 +0300
Message-Id: <20230425082933.84654-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_012957_199083_79C46FF8 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series is focused on simplifying the code, and improving the
logic of the support for MT7530, MT7531, and MT7988 SoC switches.

There're two fixes. One for fixing the corrupt frames using trgmii on MCM
MT7530 with 40 MHz oscillator on certain MT7621 SoCs. The other for fixing
the port capabilities of the switch on the MT7988 SoC.

Currently, using multiple ports as CPU ports won't work properly. I am
working on fixing it.

I am leaving this information for the record, as I have not received any
comments on my RFC series regarding this. The register may need to be
protected from being accessed by processes while the operation that
modifies the MT7530_MHWTRAP register on mt7530_setup_port6() is being done.
I don't see this being done on mt7530_setup() but it's there on
mt7530_setup_port5(). My tests haven't shown any apparent issues but if you
experience any issues with port 6, this is where to look first.

I have done iperf3 and ping tests on all ports of the MT7530 switch with
this patch series applied. I tested every possible configuration on the MCM
and standalone MT7530 switch. I'll let the name of the dtb files speak for
themselves.

MT7621 Unielec:

only-gmac0-mt7621-unielec-u7621-06-16m.dtb
rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
only-gmac1-mt7621-unielec-u7621-06-16m.dtb
gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb
phy0-muxing-mt7621-unielec-u7621-06-16m.dtb
phy4-muxing-mt7621-unielec-u7621-06-16m.dtb
port5-as-user-mt7621-unielec-u7621-06-16m.dtb

tftpboot 0x80008000 mips-uzImage.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

MT7623 Bananapi:

only-gmac0-mt7623n-bananapi-bpi-r2.dtb
rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
only-gmac1-mt7623n-bananapi-bpi-r2.dtb
gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb
phy0-muxing-mt7623n-bananapi-bpi-r2.dtb
phy4-muxing-mt7623n-bananapi-bpi-r2.dtb
port5-as-user-mt7623n-bananapi-bpi-r2.dtb

tftpboot 0x80008000 arm-uImage; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

Arınç

Arınç ÜNAL (24):
  net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
  net: dsa: mt7530: add missing @p5_interface to mt7530_priv description
  net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
  net: dsa: mt7530: properly support MT7531AE and MT7531BE
  net: dsa: mt7530: improve comments regarding port 5 and 6
  net: dsa: mt7530: read XTAL value from correct register
  net: dsa: mt7530: improve code path for setting up port 5
  net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
  net: dsa: mt7530: change p{5,6}_interface to p{5,6}_configured
  net: dsa: mt7530: empty default case on mt7530_setup_port5()
  net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
  net: dsa: mt7530: remove pad_setup function pointer
  net: dsa: mt7530: move XTAL check to mt7530_setup()
  net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
  net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
  net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
  net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
  net: dsa: mt7530: fix port capabilities for MT7988
  net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
  net: dsa: mt7530: set interrupt register only for MT7530
  net: dsa: mt7530: force link-down on MACs before reset on MT7530
  net: dsa: mt7530: get rid of useless error returns on phylink code path
  net: dsa: mt7530: rename p5_intf_sel and use only for MT7530 switch
  net: dsa: mt7530: run mt7530_pll_setup() only with 40 MHz XTAL

 drivers/net/dsa/mt7530-mdio.c |   7 +-
 drivers/net/dsa/mt7530.c      | 372 +++++++++++++------------------------
 drivers/net/dsa/mt7530.h      |  35 ++--
 3 files changed, 145 insertions(+), 269 deletions(-)



