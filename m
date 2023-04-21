Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3EC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D5CVRuG0AkI1whb77i+Oe8Xqsts657oAGXoFJ4Cxpuo=; b=0AbzufOrHSbcmj
	M9B+9ztfg954EqjB/aGycLM1bCWdmdqNU54sb8xFanIK4pd6Y1Zk0auo6D4rJDwXizzlBbAAbwTxY
	lrqy1JdShvVPMmj6AvpfBj2pN5EJ8p0HmJymgkdapRoSs6Xb5eohlDd4y+yiKj6jgm9DJniMzS343
	z8S3bbvSc6As3h1WbFCp86EZZ7+Z9wQTWMseCzeb/g7rr1Hpz7NwtPoi/eSAhaoSosN4598F9Xu5Z
	waOFQTzToX17ZQljFVyxLK0Hcm9yG1+7fSd13ICadyvaE47AGkPxpoO7YIpo9F+hTQUGvyjTRGaOR
	w5jwmlzw6P6lIVn28H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsj-00B7N6-2s;
	Fri, 21 Apr 2023 14:37:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsf-00B7Lz-18;
	Fri, 21 Apr 2023 14:36:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-95678d891d6so239453666b.1;
        Fri, 21 Apr 2023 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087815; x=1684679815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5CVRuG0AkI1whb77i+Oe8Xqsts657oAGXoFJ4Cxpuo=;
        b=qJhQ6rEyPc2fkWSA3OfsymjYtkl2SVP1W11ajjrzyqR0HT5CfgnDdtedf9wBvDYSN7
         pPJun0w5fy/zr6H+jAtw1z3OnCr22AqoPmwISuqBtLQ1jAuEq1UVR/CuaD9xyIxWP6ZL
         EWGbU6f62rq0GguVuxkfilu2u5Rb5X4barj7cnbz9KbwZWF8mA+rbyRyhV7DWRVIw6TS
         Y7+vnVq8Cox5LROMMOKdNrFWFL1NLG8SeHESR5cnSxN/VBjMyPoO6VYu4ZCICvKMHUsg
         Gm9h8byaskPIkyW28lJWOXSBEoQyVdDw0Id6j0jesh4QlPpigY8EIB1Lb1iyyHNZ2LXM
         cpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087815; x=1684679815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5CVRuG0AkI1whb77i+Oe8Xqsts657oAGXoFJ4Cxpuo=;
        b=ZLDHTvfTv0IL5mxAT6MB6xKqvlrHaKBxH2d60EERLvTn2ssTK2mlJkSxBYMwlHMAVi
         gPZWXW+Y2NjXVjcNTedIjmiK1XNh0jCvH5jTbVguy/dcTHOY4aBRapHU4NZ6fAHYuXX1
         /Zmzfncsj+daH5Y2peaXH/YJmcnuBNPdU4sdgL19js6KwXJ6KHYe05Tsi0dNx55zs5R9
         4eQrNPgcCBH6rvnbEOSX/KzF6nwNDVdBlbqnL9mbnxIEDZtZxOiWMB0PbolE7tJNqSBj
         z3az5U6Uat2ZKhBUSS912fwNbSbfpVFRItKDVdP8pePkIxvWf1cD3LIlPtFSvlAusH01
         0oOQ==
X-Gm-Message-State: AAQBX9cyTpmvwLgueWdWsJ67h5C/GBQA2LrvF0u5g5Z39lzQ5GGAmKFE
	JB1W2DdxMhaEGVqCRfee1jQ=
X-Google-Smtp-Source: AKy350bG/pBS/ZMJcgrEd1gKDYlBFcy5jEFdaeZYNySZLVF3YaKe7Jv6ROXswYKibACjieK4vRraBw==
X-Received: by 2002:a17:906:32c9:b0:94f:7d98:a32d with SMTP id k9-20020a17090632c900b0094f7d98a32dmr2657525ejk.10.1682087814841;
        Fri, 21 Apr 2023 07:36:54 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:36:54 -0700 (PDT)
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
Subject: [RFC PATCH net-next 00/22] net: dsa: MT7530, MT7531, and MT7988 improvements
Date: Fri, 21 Apr 2023 17:36:26 +0300
Message-Id: <20230421143648.87889-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073657_393716_3B432D12 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

This patch series is focused on simplifying the code, and improving the
logic of the support for MT7530, MT7531, and MT7988 SoC switches.

There's also a fix for the switch on the MT7988 SoC.

Daniel, can you test this series on the MT7531 and MT7988 SoC switch?

The only missing piece to properly support multiple ports as CPU ports is
the fixes [0] [1] [2] from Richard.

I've got questions regarding patch 13 and 19.

For patch 19:

Daniel, does the switch on the MT7988 SoC require the register to fire
interrupts properly? The code uses an inclusive check which was untouched
when the MT7988 SoC switch support was added.

For patch 13:

Do I need to protect the register from being accessed by processes while
this operation is being done? I don't see this on mt7530_setup() but it's
being done on mt7530_setup_port5().

I have very thoroughly tested the patch series with every possible
configuration on the MCM and standalone MT7530 switch. I'll let the name of
the dtb files speak for themselves.

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

[0] https://lore.kernel.org/netdev/20230212213949.672443-1-richard@routerhints.com/
[1] https://lore.kernel.org/netdev/20230212215152.673221-1-richard@routerhints.com/
[2] https://lore.kernel.org/netdev/20230212214027.672501-1-richard@routerhints.com/

Arınç



