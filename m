Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2DC7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=garNebGGDyvyBMATQaX/1lhxEv3banNkHxmIaDOYQf4=; b=KVII7X95lMZ7Y1iOOA8WuW0++Q
	g2NjIxkiTxpp1yd5NpUCHkqCMgvknmGM0kTA3DNWUCurwYyD+F5rJbUieRJ6HRkRfIjAh9wAjBNoZ
	P1ozNcTtf5EhxLM+lUE02QHFaQIGYB/RN1mfaiR16QYcswJNr1ReR1mw1qNFr2dPykvDPzy6o4ZXV
	wXvsuJrpt77Lmk0cCMH39eQlfFmBOQnFom2rZC+PEz4lIf88PWoSZemG7Kz/n1qBYlP55bfEbbsbj
	9JZ/LBsYYS2yE3ijpTC9wf0itpj04NExFgBLlY+5wi0QsDdwlRw9F1yKZuLoHLqXBZLj3lLlbx0yI
	wRMT7RPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKpA-00ADqm-0p;
	Mon, 20 Mar 2023 19:05:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKp4-00ADnv-2O;
	Mon, 20 Mar 2023 19:05:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id eg48so50757338edb.13;
        Mon, 20 Mar 2023 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679339131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=garNebGGDyvyBMATQaX/1lhxEv3banNkHxmIaDOYQf4=;
        b=LzdJDtIeTF7AZbGh4JgVbxVd9p4iLmSw0oJHgTEZonaQgV3vnRzql67y6AjYpCQx9Q
         dI2WSaLvHXfGQJjJFHCHVk2Pc+i1UJXTx0YgGiL5IMVghXjsolNc0u3ssqjNZuQuGGWj
         RH7D9RdYW4syYlDgJeTwWM0Ri8DZXvYNotFuaeJGIqUsPfEgqpkoTprySd5ug0Jn2Rcl
         MYIIjAiP7AgaR9TRnjfd8MBmGew+8PpZ27D+p9NvgWlxVSmBlZF4VV0HhX1kW/diiyOd
         uN5CEpdNhEfsBGtZwoR7/CGjh2DCX/zfPLZIzM6F52Ke3X1+9t2sd5pJRDbdNB7UxBGz
         PqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679339131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=garNebGGDyvyBMATQaX/1lhxEv3banNkHxmIaDOYQf4=;
        b=2GpV/D2kU7A6pidmQsdvis/5Yigl8wkkFJJIEqRQrc8dDy0t41BZitukVJFd5oOyKv
         UYxWckKA/IfmhzwItNWTUN+17xjxmUvGIXf/0XG+NFryBU9oj9s8ECU4xKvkAYMJxGAO
         tao1SInq+XbCuxvfU1QvHv1UkU9m+xs1EOn14XS334m09fq3yxtJ55xf4pZ32S+sGwYA
         rr5iJF2PXyur5xzQRc8IiW0WTWJLPx+zfKSqmS9alMUpyChZdl7uh8999QE2TtjP7zqT
         rDai88GuiVJTq0IuiPTxKyr2UK3SzbI7pUrH0cUw+4TCCSiIx1L6oG7qQQR8RJkqvOCq
         PfMQ==
X-Gm-Message-State: AO0yUKU2mdk9qvt3fgImFI++1g9mGquMKw8WVHdZX22cfbUTCNRAOOcL
	q2hunpjQerFa53nuis2/wuI=
X-Google-Smtp-Source: AK7set+fE9X45glHrxmqzs0a9utURfqo2TKrILqXwvMhSA4OriGwRzvmJAulLj6/G0utGQUQdFQucw==
X-Received: by 2002:a17:906:a855:b0:930:963b:63a6 with SMTP id dx21-20020a170906a85500b00930963b63a6mr87662ejb.66.1679339131404;
        Mon, 20 Mar 2023 12:05:31 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id hy22-20020a1709068a7600b008e53874f8d8sm4717848ejc.180.2023.03.20.12.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 12:05:31 -0700 (PDT)
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
Subject: [PATCH net 2/3] net: dsa: mt7530: move lowering TRGMII driving to mt7530_setup()
Date: Mon, 20 Mar 2023 22:05:19 +0300
Message-Id: <20230320190520.124513-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320190520.124513-1-arinc.unal@arinc9.com>
References: <20230320190520.124513-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_120534_781975_21958BD5 
X-CRM114-Status: GOOD (  21.09  )
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

Move lowering the TRGMII Tx clock driving to mt7530_setup(), after setting
the core clock, as seen on the U-Boot MediaTek ethernet driver.

Move the code which looks like it lowers the TRGMII Rx clock driving to
after the TRGMII Tx clock driving is lowered. This is run after lowering
the Tx clock driving on the U-Boot MediaTek ethernet driver as well.

This way, the switch should consume less power regardless of port 6 being
used.

Update the comment explaining mt7530_pad_clk_setup().

Tested rgmii and trgmii modes of port 6 and rgmii mode of port 5 on MCM
MT7530 on MT7621AT Unielec U7621-06 and standalone MT7530 on MT7623NI
Bananapi BPI-R2.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Link: https://source.denx.de/u-boot/u-boot/-/blob/29a48bf9ccba45a5e560bb564bbe76e42629325f/drivers/net/mtk_eth.c#L682
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

I asked this before, MT7530 DSA driver maintainers, please explain the code
I mentioned on the second paragraph.

I intend to send a patch to remove the maintainers, Sean Wang, Landen Chao
DENG Qingfang, listed on the MAINTAINERS file and change the status to
orphan if none of them respond to this question or review the patches.

I think a full week is a reasonable amount of time to receive a response
from a maintainer.

Arınç

---
 drivers/net/dsa/mt7530.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d4a559007973..8831bd409a40 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -419,12 +419,12 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 }
 
-/* Setup TX circuit including relevant PAD and driving */
+/* Setup port 6 interface mode and TRGMII TX circuit */
 static int
 mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, i, xtal;
+	u32 ncpo1, ssc_delta, trgint, xtal;
 
 	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
 
@@ -469,11 +469,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		   P6_INTF_MODE(trgint));
 
 	if (trgint) {
-		/* Lower Tx Driving for TRGMII path */
-		for (i = 0 ; i < NUM_TRGMII_CTRL ; i++)
-			mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-				     TD_DM_DRVP(8) | TD_DM_DRVN(8));
-
 		/* Disable the MT7530 TRGMII clocks */
 		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
@@ -494,10 +489,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
-	} else {
-		for (i = 0 ; i < NUM_TRGMII_CTRL; i++)
-			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
-				   RD_TAP_MASK, RD_TAP(16));
 	}
 
 	return 0;
@@ -2207,6 +2198,15 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
+	/* Lower Tx driving for TRGMII path */
+	for (i = 0; i < NUM_TRGMII_CTRL; i++)
+		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
+			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
+
+	for (i = 0; i < NUM_TRGMII_CTRL; i++)
+		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
+			   RD_TAP_MASK, RD_TAP(16));
+
 	/* Enable port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
-- 
2.37.2


