Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167FC77B62
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ih5QT8Ee7yYAcHkFKgIrf6VHRThaccKYn0ouyxLK294=; b=VOiOv3A5SSwmK+
	lrqdABdmPd16LAOubMKFVPuVeZGbHePlWKy6XD0hop/L/x5RCQF0XQ3Tfb3dJumxY3PNcYeKxD1Co
	YtsCPg4WScLVK27kgOI0ePfo7E/cZW+/VTLs7LiDQDi2MGEzav+jDwK+6/HuCZMwBLYrJ8g4KsOIk
	PBffxLoYF5JF4mEXH+5pAhTNRcjrQdU0+U7PUrHNho7xRlOt9HzsQzhbcOvR8Ee6SboJr4LZ8OccN
	SAm6m4Q13RdHdMBUKeIJNXX5VfZSh9NgR10Xh25WFnncyanwkRVYcLamYVC1QQH5HcNxv/oSKMn3S
	R1JnnJdr0I8A4xcnT6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uS-005dvY-1V;
	Wed, 05 Apr 2023 20:39:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uO-005dtm-0y;
	Wed, 05 Apr 2023 20:39:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso1903601wmr.0;
        Wed, 05 Apr 2023 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih5QT8Ee7yYAcHkFKgIrf6VHRThaccKYn0ouyxLK294=;
        b=XWN2t1JqM/F5A/mul8DGE7DcZYG4DiP3Q3YyXwSb0Bc7lunuTE8WZKeNaoGpfrmPID
         goseeJrXh9/ERf6v796J0RjASFbZvZ3nM2SBnJWHp0Czm37pWmluWK/xyeixO8XZwpLg
         eXIUIG+5UNEnMsXiimVXRjPeeUk2OqWzt0hW6X7ODlnG0fHkzRwMaPXBBUctY4clZUp6
         5ImCH1bciRg8/vvpu92DsnXVekn27CO0vttLARxfD76hwq8RjBuVyYkvpxKXxtP8e5B0
         l/xbjm+QXlenZTmyev5Whv64JWjD+UeuVpArdvDI+e1tKapQxCIXGkByJb//OoazREwz
         Tn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih5QT8Ee7yYAcHkFKgIrf6VHRThaccKYn0ouyxLK294=;
        b=sacMcpiA/A7deiE3Sxv989xXIOC9EhJ8IVlfqxfKINDWUNx8mxKrbNkQnKvJ/Rywit
         ss2HvW9E+CMb7pv2Ht/4N+Zm86QdIXG7dd40ggx4z1mH/GR/kT4r2hoMusZWBs8BvqHh
         63xjc9L7RizXCNj44vFxKMHEH1yHxwz35U+OZwd1+OkC4awDQuxSElX0Zo58U9gGxPLp
         7TIOKIZerZGFIknYjbQ+q+6Sj718xDqGmtXOMQnq7UH3SzWIJIqvlLSugYzQvfcu8FSx
         B7tLmt38sDJOx2iQE3pUtqfxYS+d4/79bODLW2lFJfgTdk8BbOMkXqyA5EcnR695qZdy
         qN2g==
X-Gm-Message-State: AAQBX9czeqP8BSjLEKFgp82rm/D9tiH9JaLaoVWrsDEwtuxgDpfWax69
	Upfpy9En2ploHuWKozW7qtU=
X-Google-Smtp-Source: AKy350aQpmAuEz4xnXn3BfBxrWaBDey1yEmmuFzVTtpMQ6JQIzXhv+z4Oz1KKsR5jK4vTi7hrPBp1Q==
X-Received: by 2002:a7b:ce16:0:b0:3ed:4b0f:5378 with SMTP id m22-20020a7bce16000000b003ed4b0f5378mr5711811wmc.27.1680727143977;
        Wed, 05 Apr 2023 13:39:03 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:03 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [RFC PATCH net-next 0/12] net: dsa: mt7530: fix port 5 phylink, phy muxing, and port 6
Date: Wed,  5 Apr 2023 23:38:47 +0300
Message-Id: <20230405203859.391267-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133908_336432_64349614 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series is mainly focused on improving the support for port 5,
setting up port 6, and refactoring the MT7530 DSA subdriver.

The only missing piece to properly support port 5 as a CPU port is the
fixes [0] [1] [2] from Richard.

I have very thoroughly tested the patch series with every possible mode to
use. I'll let the name of the dtb files speak for themselves.

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

Current CPU ports setup of MT7530:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup() sets up port 6, rename to mt7530_setup_port6()

How it will be with the patch series:

mt7530_setup()
-> mt7530_setup_port5() runs if the port is not used as a CPU, DSA, or user port

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

CPU ports setup of MT7531 for reference:

mt7531_setup()
-> mt753x_cpu_port_enable()
   -> mt7531_cpu_port_config()
      -> mt7531_mac_config()
         -> mt7531_rgmii_setup()
         -> mt7531_sgmii_setup_mode_an()
         -> etc.

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7531_mac_config()
      -> mt7531_rgmii_setup()
      -> mt7531_sgmii_setup_mode_an()
      -> etc.

[0] https://lore.kernel.org/netdev/20230212213949.672443-1-richard@routerhints.com/
[1] https://lore.kernel.org/netdev/20230212215152.673221-1-richard@routerhints.com/
[2] https://lore.kernel.org/netdev/20230212214027.672501-1-richard@routerhints.com/

Arınç



