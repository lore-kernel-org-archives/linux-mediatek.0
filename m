Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D8C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pq2o/rMDZcveu6CBIBMiqQbVdifVenwYFNXXMqMRjP0=; b=iiBxTCri6F2sjj
	1FQp0FA8DVeuxogIl7Lh1vxrtVOFTT9vLGktYqdQlZyTz4F5UBTaCZ5zNHTiujIcKXY21DGJvr4M1
	z7z6qvS3OAvEd2GkP50zqq5EmXpH5CJBn84a6/K1idIKuZJdKViVGT8K1xiULiK/IfLNL8fUw0aft
	K7/2BF7UQq+DKjyA5YsGKegwLI3dNw99IL9WVzo5hVzaWqM+KDWkCnYr3ISWffHd8hfWfYDLlfA+Y
	FxyBIZscUkm+DD+kSEZSTO23hfX8Fp1V3Ei6bzc7VMemZ+K1U3sqFkWXasVutjlmxnzK8oMwAFZ62
	SLwKlV9n1JRrBW85vWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14S7-006Ovc-1z;
	Mon, 22 May 2023 12:15:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14S4-006Oto-0r;
	Mon, 22 May 2023 12:15:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso613319466b.0;
        Mon, 22 May 2023 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757746; x=1687349746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq2o/rMDZcveu6CBIBMiqQbVdifVenwYFNXXMqMRjP0=;
        b=aQV+uq9SLVhx0nJCHct8trarx9Dq54SBVdoWRvsuUTTaAnagYq1jKKdRWhzRdICwCT
         7aRHHO0ugQDaIMQ9HZm05aSqhn8hRhtdSuxbozAOw/qQfVSmg+5Du+Wk9hkJ+Bz5coSv
         EkaGK8iVyauuODWx5MPHbpum5+hrbUQ/KdVkrtW4CGQeHB20BeRYtqIf7IBLi1Qj3YhD
         Yzj5y9XTDHwRvRLjC1rSC3vTyDLZd5KbkjU860F0eu9Dn4SyGMXoR8b8T1vsUrsKeLTG
         1lZwICVLVobeoQR5RMcskfakhJDj7w9BfGhGJxPUpVYN9R7U9aBtPibNPRYzl/LcERGK
         M6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757746; x=1687349746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq2o/rMDZcveu6CBIBMiqQbVdifVenwYFNXXMqMRjP0=;
        b=ayOPK3/2XiGG23qSveyFpq8y4naLqOrp5RcOdWo+Ys4wTGpFJtq9+q2i1hWmo9OF70
         Ohra/+lou8aJS8Xp9b5GKaTKa/2k3wnBTSRXPN81gZlZn3ZXE0K9XMiAARscUon4MG06
         OdYMLvTLNbtYDDEz6eFg9KNBtN+vGyt1rPVt30HnN5kpAoOutHn8AgZN+fsJcEvacTEK
         BTFBlplQDYlusfjZFJ0jQibzl2uXVvb3UXQ5Q/TbPPsPPofT8ZqRdM3tKHFkk3x96ng5
         KERXwDkbkHf75qPZm+G1WPsVqkFxjyK66l+PjETftbIs9xo+FD14V2A1kV7jfIp19aDN
         yHNw==
X-Gm-Message-State: AC+VfDz3Y4CmOA+B4M82QvUyS3YulCHglj07Su8FgkwQFNVmimLWlDYT
	3R6tL7RARPjc00gTzHWaud8=
X-Google-Smtp-Source: ACHHUZ44vhIRy0pCs3PauqSUYry3wOlKBzkbAJKp64q8ULc9bXdwGlhNnnOC2BplkNluNqyP2qH/Bw==
X-Received: by 2002:a17:907:97c4:b0:956:fbd7:bc5e with SMTP id js4-20020a17090797c400b00956fbd7bc5emr9630657ejc.64.1684757745526;
        Mon, 22 May 2023 05:15:45 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:15:45 -0700 (PDT)
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
Subject: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU & LLDP, and prefer CPU port
Date: Mon, 22 May 2023 15:15:02 +0300
Message-Id: <20230522121532.86610-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051548_301988_33ACAF5B 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series simplifies the code, improves the logic of the switch
hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
MT7988 SoC switches, and introduces the preferring local CPU port
operation.

There's also a patch for fixing the port capabilities of the switch on the
MT7988 SoC.

I have done a bidirectional speed test using iperf3 on all ports of the
MT7530 and MT7531 switches with this patch series applied. I have tested
every possible configuration on the MCM and standalone MT7530 and MT7531
switch. I'll let the name of the dtb files speak for themselves.

MT7621 Unielec:

only-gmac0-mt7621-unielec-u7621-06-16m.dtb
rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
only-gmac1-mt7621-unielec-u7621-06-16m.dtb
gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb
phy0-muxing-mt7621-unielec-u7621-06-16m.dtb
phy4-muxing-mt7621-unielec-u7621-06-16m.dtb
port5-as-user-mt7621-unielec-u7621-06-16m.dtb

tftpboot 0x80008000 mips-uzImage-next-20230519.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

MT7622 Bananapi:

only-gmac0-mt7622-bananapi-bpi-r64.dtb
gmac0-and-gmac1-mt7622-bananapi-bpi-r64.dtb
port5-as-user-mt7622-bananapi-bpi-r64.dtb

tftpboot 0x40000000 arm64-Image-next-20230519; tftpboot 0x45000000 arm64-rootfs.cpio.uboot; tftpboot 0x4a000000 $dtb; booti 0x40000000 0x45000000 0x4a000000

MT7623 Bananapi:

only-gmac0-mt7623n-bananapi-bpi-r2.dtb
rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
only-gmac1-mt7623n-bananapi-bpi-r2.dtb
gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb
phy0-muxing-mt7623n-bananapi-bpi-r2.dtb
phy4-muxing-mt7623n-bananapi-bpi-r2.dtb
port5-as-user-mt7623n-bananapi-bpi-r2.dtb

tftpboot 0x80008000 arm-zImage-next-20230519; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootz 0x80008000 0x83000000 0x83f00000

Arınç

Arınç ÜNAL (30):
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
  net: dsa: mt7530: properly reset MT7531 switch
  net: dsa: mt7530: get rid of useless error returns on phylink code path
  net: dsa: mt7530: rename p5_intf_sel and use only for MT7530 switch
  net: dsa: mt7530: run mt7530_pll_setup() only with 40 MHz XTAL
  net: dsa: mt7530: rename MT7530_MFC to MT753X_MFC
  net: dsa: mt7530: properly set MT7531_CPU_PMAP
  net: dsa: mt7530: properly set MT7530_CPU_PORT
  net: dsa: mt7530: introduce BPDU trapping for MT7530 switch
  net: dsa: mt7530: introduce LLDP frame trapping
  net: dsa: introduce preferred_default_local_cpu_port and use on MT7530
  MAINTAINERS: add me as maintainer of MEDIATEK SWITCH DRIVER

 MAINTAINERS                   |   5 +-
 drivers/net/dsa/mt7530-mdio.c |   7 +-
 drivers/net/dsa/mt7530.c      | 470 ++++++++++++++++---------------------
 drivers/net/dsa/mt7530.h      | 107 +++++----
 include/net/dsa.h             |   8 +
 net/dsa/dsa.c                 |  24 +-
 6 files changed, 289 insertions(+), 332 deletions(-)



