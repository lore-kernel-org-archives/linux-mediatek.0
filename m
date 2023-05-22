Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897EC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9sUzeE3WCfQ+rJ/EsdfBikYVvHj1ppa8r6Hpeq3Xns=; b=HygAVVkedoj9a3
	fBss00wR4Nkuabl1OGdIQfcm+XtJcCdkbFMoaFERj+n5bBK7t//PUEAoNpVnLmjLgI+t6wm/dymmc
	SpetA5qZPrFzxGHe8XtglKB/VIMGQBUjOlbwH+1RqTWF+MPQcM8IID0fdhWtB/JKDZq7UC+H8Nrr4
	k5Hx1AaJ8eO7PABmu431CyZYB5de+HxXKyTIjtA6QagN7IWkjxzgbOQt4viS9hKxjTh4PMNBtG8xN
	u/vEb19AWxsHsSrabM3C0JiQATckHUJMxIvYEzfIK/aqmHmxiQN/XhMhisvk1C8rChWmlGhkhYa3t
	w9oCU1kbV5BHdpLyvO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TD-006PeF-0A;
	Mon, 22 May 2023 12:16:59 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SX-006P9O-1f;
	Mon, 22 May 2023 12:16:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96ff9c0a103so103011266b.0;
        Mon, 22 May 2023 05:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757776; x=1687349776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9sUzeE3WCfQ+rJ/EsdfBikYVvHj1ppa8r6Hpeq3Xns=;
        b=Lru3OuyMurIkYbxbLVEVMZ/Jo0Q1/ypDQXQjCZNIgIj7jLHaw7aIU41akE0EsFPrQX
         hHiBxYJUpAOmZIhjHqyOrm53kaBoH3P1/jqSqtR3Qi5aSc3BoE07iNMeBCx/E+2vd+3X
         akaBXJlboxM574/wtu7wBakkO/e8vpCpgcqXpQ71RQwCCrvrjXcN/TAobYVRUn6Qr7P/
         Y1c2EZNM+SVM2PPv03/+iiS8byBqa89rvt1nOpKrSUWT44Haf2eldP+S5hXB0y5DD9wL
         YcKVr0JMeVaJuQT0Ih1IHjlEDV4yhOxPyO1NR0PAOsAW2v/BsE4sp1oaoYqPo8Eu5OLT
         Ox9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757776; x=1687349776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9sUzeE3WCfQ+rJ/EsdfBikYVvHj1ppa8r6Hpeq3Xns=;
        b=UT1vIduny4Eaue3jPahzGChpywcPnYYvP5Ew7p749llu4Azk2czvS34Y9vk0mxF0oa
         KKx5C2kfAoHbut+p/+k/P7t72Z1/Os7qT+PxCnbgj91Sp/jmr0aH0fim02qT25WwpbjK
         Vt6wGo384OFylyqELvX5pCv9izpM83IqiepBR96I1CaK4BOZmJlmtw+74WvgNXNBxuaH
         1NDLUTIRsDP25HK7ixVnHuW4YpVfNMmrGRb4WGe+ymS+nGyktJKYjJkdwH8zdePLzzmz
         qMsbfAeuDfr1aJlAg3xaZhdJY5+iR4RgZlB8mSMEfos9MxJ5WyksYzAx3zZnmHz7ShCj
         P3sw==
X-Gm-Message-State: AC+VfDxH557bUEyVN6u7Pk5rpaPoAWvlnUHk7z/uusOt6alXlxHw535a
	61TDymIf05CTkTyAL/zLZpY=
X-Google-Smtp-Source: ACHHUZ5MU8p3F+UDBjC8RPaKb565fSlJlhmk4dmBGe9CiVj0i7SklbrLxSMJnto+s68zga+9h8C47A==
X-Received: by 2002:a17:907:162a:b0:96f:dd14:f749 with SMTP id hb42-20020a170907162a00b0096fdd14f749mr2811980ejc.23.1684757776077;
        Mon, 22 May 2023 05:16:16 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:15 -0700 (PDT)
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
Subject: [PATCH net-next 10/30] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Mon, 22 May 2023 15:15:12 +0300
Message-Id: <20230522121532.86610-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051617_552052_E6A7499C 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
things than setting up port 6. That part was moved to more appropriate
locations, mt7530_setup() and mt7530_pll_setup().

Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
and move it to a more appropriate location, under mt7530_mac_config().

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the code path for setting up the ports before:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup()

This is after:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 50f150ff481a..0b0ed1bd2afa 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -401,7 +401,7 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
@@ -473,6 +473,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
+	return 0;
+}
+
 static int
 mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
@@ -2571,12 +2577,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	} else if (port == 6) {
+		ret = mt7530_setup_port6(priv->ds, interface);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.39.2


