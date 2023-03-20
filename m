Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E1EC7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YykBqXCsqVFmj8+kisgWDwmfkfKS3HT+dd2C7bsfUoo=; b=JKUzwFkHEDWVw3PbuuHWbjCB73
	OBG6scFIMa7Qypval/UAoHnvLw7XFwHB17VnGbERBkHRFcOaC1LFPEQbeKF1YBwwmWCz499Vt2hDs
	Gp82mCewDZdwq3vBMrcOzXSgJTkjI9ZUBmjmh1p713OCNqTETKWaJ9Ch/oKpq+01yZ20YaeMoLe1c
	7H7XNrNF6UFgVCewts+BHk9G0v3hcQeN08PIVvdvvwPysm5esRbV4eHBt28YOFIrBhItMvvZuQLeN
	vnA76eU4ox9hqao5ywc0wSJ2bI3xGLh19GVe4NjKp9SIytHJr37GRs+Oe3/6xg8hWuI25Em/rGCS9
	nLvkK+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKp9-00ADqZ-2i;
	Mon, 20 Mar 2023 19:05:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKp4-00ADnO-1u;
	Mon, 20 Mar 2023 19:05:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id h8so50845976ede.8;
        Mon, 20 Mar 2023 12:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679339129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YykBqXCsqVFmj8+kisgWDwmfkfKS3HT+dd2C7bsfUoo=;
        b=jZ2KesgkC91l24IKaQadLFtqtYslMEdG2FjYTrbwtCCX9TMGr/C9ZtOb94aezroTPo
         T0aoIz7AAbLJsGXuwny3uLpqlJaYdpJ13ZwXZ/oZtgI6vt4ARJwxC7X5GMi5mXeyyU+X
         BndHFIyt3GanEmHztlupUMf5WPhkP/5kZndT0GmeeTJ6tJIijOf7+C2wJ6qp5J2CZIfI
         Xa2KEL7Wss9d3GN+AeO80Bemi9PnEGwAfRCulT0P9/wwFuTxhQcY1LSdtaaiPKXb8WE0
         bM4TIX7jktTCocYU+Np43ps22OWYKVC0vIOr0NM0wSmbSaxbHBFCkId+0c2CMKrnBBjs
         wJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679339129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YykBqXCsqVFmj8+kisgWDwmfkfKS3HT+dd2C7bsfUoo=;
        b=WGA8sLBY0t5pJKAYoCuf/Y6YOz6rRa23h2yXwrnC3UV4Lq1HJ4JDUvqHheHgRtP/i5
         IhUsfdNXxzfvwNKWJC0m3CFLvN3MJ9O5mQcmzh8F0IAWcB4SuXIrIsQDVDqpS679qNIG
         ZzvWZuna7/ZvQyd8u8sCrUtZeCkrE+pZtxWAI21V9XE2E0A0tKuc8/1RbpMjGJ6Z0NKl
         OMkz7F5nk6vhguJePpcD1PWX/DNEXtem2exeg/o7XTyNCLHJxWTiINdq4kHphsLkd0Y/
         Wj9BKppBElVgAMoaWIHE7qTExUJCru5NDkYc/Nm2zuJbSHBtvNU0p46OEbK0EUvTHeZm
         MLfw==
X-Gm-Message-State: AO0yUKW/A8kNiaRANfK/bPRHX0+fESh5TDzYbiJoYsuh6ZrIqKXh++/G
	WZAvEIdzfpFlgGBUEzJ89w0=
X-Google-Smtp-Source: AK7set9dVfGS7DvJfrsRnE0pnsR7d6zDTc3DJmsQZ5rE5ztbD5RzoICFU1n+w/Pn+oZEW0lmTuqGtg==
X-Received: by 2002:a17:906:2a19:b0:92e:efa:b9be with SMTP id j25-20020a1709062a1900b0092e0efab9bemr155015eje.18.1679339129158;
        Mon, 20 Mar 2023 12:05:29 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id hy22-20020a1709068a7600b008e53874f8d8sm4717848ejc.180.2023.03.20.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 12:05:28 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/3] net: dsa: mt7530: move enabling disabling core clock to mt7530_pll_setup()
Date: Mon, 20 Mar 2023 22:05:18 +0300
Message-Id: <20230320190520.124513-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_120534_628932_90894BEC 
X-CRM114-Status: GOOD (  13.05  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Split the code that enables and disables TRGMII clocks and core clock.
Move enabling and disabling core clock to mt7530_pll_setup() as it's
supposed to be run there.

Add 20 ms delay before enabling the core clock as seen on the U-Boot
MediaTek ethernet driver.

Change the comment for enabling and disabling TRGMII clocks as the code
seems to affect both TXC and RXC.

Tested rgmii and trgmii modes of port 6 and rgmii mode of port 5 on MCM
MT7530 on MT7621AT Unielec U7621-06 and standalone MT7530 on MT7623NI
Bananapi BPI-R2.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Link: https://source.denx.de/u-boot/u-boot/-/blob/29a48bf9ccba45a5e560bb564bbe76e42629325f/drivers/net/mtk_eth.c#L589
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c2d81b7a429d..d4a559007973 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -396,6 +396,9 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 /* Set up switch core clock for MT7530 */
 static void mt7530_pll_setup(struct mt7530_priv *priv)
 {
+	/* Disable core clock */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
+
 	/* Disable PLL */
 	core_write(priv, CORE_GSWPLL_GRP1, 0);
 
@@ -409,6 +412,11 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 		   RG_GSWPLL_EN_PRE |
 		   RG_GSWPLL_POSDIV_200M(2) |
 		   RG_GSWPLL_FBKDIV_200M(32));
+
+	udelay(20);
+
+	/* Enable core clock */
+	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 }
 
 /* Setup TX circuit including relevant PAD and driving */
@@ -466,9 +474,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 			mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 				     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-		/* Disable MT7530 core and TRGMII Tx clocks */
-		core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
-			   REG_GSWCK_EN | REG_TRGMIICK_EN);
+		/* Disable the MT7530 TRGMII clocks */
+		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
 		/* Setup the MT7530 TRGMII Tx Clock */
 		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
@@ -485,9 +492,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
 			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
 
-		/* Enable MT7530 core and TRGMII Tx clocks */
-		core_set(priv, CORE_TRGMII_GSW_CLK_CG,
-			 REG_GSWCK_EN | REG_TRGMIICK_EN);
+		/* Enable the MT7530 TRGMII clocks */
+		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 	} else {
 		for (i = 0 ; i < NUM_TRGMII_CTRL; i++)
 			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
-- 
2.37.2


