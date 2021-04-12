Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF0CC43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4627361244
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4627361244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xa56/On2YXW+cc12Bx4mf7A+b2oZpgS+JUdOll/1x9U=; b=DPShncziSYUK6eIhHGXVuSJ1+7
	zht51fXQWd68tLbtwedtu0Hn8Y4Mw+BFXqfu/yu5Z/O+CrY4j9pnpqkqrfEpg3UoeHDMrP0Yg4n8b
	WoqX/U1cxHw9A0GcmZmfFydm4Wa8SaIVk4VOhwD67/PgpJxC7tl78V1kALf0zDMAOqmgxUbfHtHNn
	uf3lHGvmWoSmFZ7leUDwy0RoQ/MjrTZEqfaSbx9UofdxRmr9n4zkFU4yIo4j/oCVKd1LoJ6BiwMDj
	zDcBJe3q3FmHpzRnJzhF8reZU2rFngV2la8hYL27H+HeZ2y8PJApD0T9qhGcZy7N1t7a5p46ulBiK
	IvXknCFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVnTT-005cAj-MA; Mon, 12 Apr 2021 03:42:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTQ-005cAc-6A
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 03:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TbV7aHs7TaIhyV0H0KiEJQJbVjhXqA5DKHSoe6+ECPw=; b=O5uiUqs3Pgn9pmzLP55QUfjqkR
 UQRFrME3GEB/MISZ8ai8zOP1KQ6qoCruyYZjc0GHVarvvlg/06clSF5atWJ5tTbQgoldRiHYHd0eW
 Uby0f98kNdkVQ2C+XhS6119ZyYHZ0Vz7Z/aGokQ9otWsxQan5rfD4i/rTlHuWGNiZcl+Q6aTJaq1D
 H4yrsd0Mrgz55uh2Ej2VWjIvxOdXnRWnjtgAp39F2lOQJlR71HfBbSH/Lac9sTL6g2Ck2yhpKpTpW
 f4UIwMKBILaqFHFLimch1enE7eizqq9K4EXRxujIAiqjfpJH9UWeslJ1GvARxDvXjudk/I4dsdtEw
 3hnv/R0w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTN-005rQf-Gy
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 03:42:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id j7so5637481plx.2
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Apr 2021 20:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbV7aHs7TaIhyV0H0KiEJQJbVjhXqA5DKHSoe6+ECPw=;
 b=P49so0HJzAqTv6dJXeU7iuIOm7fDFNyyZSoqpw0IGgN2WT+OcbM9TVUJvnSps2D6FV
 ocO0sEZhJJMEU8qIE/a51GoTocEhwzbbkMoH0Cbmf+i9p+bbVlTM5qiDzKSJ37wOZC3+
 2pUZyv/F3wPJPIoqSvt0bd2RN12rfYLYmzhOb5YGyAoZm8uFGpsriEsX+57HU1yUB7Iy
 mI8w5yu0620bLR90MrBddwfrU7ye/05QYa9LKIlsWV9iWDE99DJJVsYSU6B4PcYuMQgd
 59B/WiVnFR7obFfZ8ZEmiSr7tMKT1M3t95asjWXeRUB4DUBYPIf4toqvDlwXT924+iyM
 MxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbV7aHs7TaIhyV0H0KiEJQJbVjhXqA5DKHSoe6+ECPw=;
 b=Eysp21aLOv33JU4bPXrOxOXgxvrybhOc81GR7RiYqR18fZSnCLDgADJXkpQUUVDjfU
 wlOGCnRNqfA/yn91HcEkp4Ns7YuyVOwdhlSv+Y05iwWtrvqliCHyDOtoosd6oQ0w5YEu
 h8+WZ7VZhcgqgeJN1GwViZO6srG1a9Gvue1dSd1O7FzDXMTZNF9xV3kvp0BLAhP0wDEi
 KG05uRucz7Dt6kGrEdo4BuoVXSiy+frZsO0q/7EzGVYi9r99X75WTf2wSq3Lp4+EpiW7
 i1i9APGIyM3MTA4KsEdhhpgGQ/EdcUl4V+r89MQqlxBQUfLX5Tn8Opo4rcjemRXkTkDV
 2xDQ==
X-Gm-Message-State: AOAM531k9HhXXHq0wWT05tPwO1/RX3gmNeuGnAc1eH88rT2PRg4suwFl
 mgA2EiQl9QFUDn+Z2Q9dCgY=
X-Google-Smtp-Source: ABdhPJwdVRYU3h0l1OFzieG7ZRMhsfTOWmdz910QyVB1NKZu1Di8amy5CJ8Q0tY3NgFMgooSH6PiMQ==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr1860487pjb.100.1618198967574; 
 Sun, 11 Apr 2021 20:42:47 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id v22sm5387185pff.105.2021.04.11.20.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 20:42:46 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [RFC v4 net-next 0/4] MT7530 interrupt support
Date: Mon, 12 Apr 2021 11:42:33 +0800
Message-Id: <20210412034237.2473017-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_204249_582842_30C64535 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for MT7530 interrupt controller.

DENG Qingfang (4):
  net: phy: add MediaTek PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 266 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 111 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 8 files changed, 385 insertions(+), 29 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
