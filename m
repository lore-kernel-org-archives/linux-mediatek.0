Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC88C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXWcb5B2+vJzEM1ajF8yrjUWQCkaIrKdZXzgLh1rBzw=; b=zhPg4pi5D6hCpn
	DYZHGRVGv3QogffScNJWmGHquqwU3yse1IOPMq7GPVavAUwnCuNiM5M6r8wbdommx9lyy2x5vgjNW
	FAyZ1d/FWcQzcKF5tCNfBZLePOpoMPXD63c2a/pVsegMwGtnaPRHZ2efWA1HXseoJhqeYhv4+KtUz
	Z5wEsZp9doN2b48RBq2J+afZ2x7ltancWxnsb8Ho9kz22/YIMQCZ3obIFihgpWjKitHvi7OkcEpqz
	eKuoT8thEy3sKSP8uK+Ni6saJXzZ8y2VzeAKlEdwMNGUM8pfg2aO8Qam8oVSvnkkNwwDSD/cffuMt
	Q159Yigz3k1gXPXbdD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TK-006Plz-2b;
	Mon, 22 May 2023 12:17:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Ss-006PM1-1l;
	Mon, 22 May 2023 12:16:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96fab30d1e1so389086166b.0;
        Mon, 22 May 2023 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757794; x=1687349794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXWcb5B2+vJzEM1ajF8yrjUWQCkaIrKdZXzgLh1rBzw=;
        b=khhO8hLijzVbaNMGFVCDvnqJ4dImG84zrCI76PV6OxcquPDu4U5AhUaiUPnQN0WOsc
         EngublP0KhkERGpYyon51lVE+fhOh+8of5CCwMxQhUPiMGCUq4VPQxEOSB0rXpk2SzM2
         YnEX5WDiCQEQWLmkTNW0uLJokzkGu2rnCPKWJbRHtGPFf0lJvzlmc4q/AdrtIE74vtgD
         HHTrqENF4j5Gg+OuH/PA/YvVSaxCmU1rMvLBkcOl+qeY+jpYbcfOLTnLwgaBvkaHmWmA
         T95oNv4yY5OaB9kQ4FGFCIvBgZskr9F79dhpUv2RW3iy5DGWrKJlQAB7+9CTSIs2QNak
         Erog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757794; x=1687349794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXWcb5B2+vJzEM1ajF8yrjUWQCkaIrKdZXzgLh1rBzw=;
        b=SRGOlI/J/LFj+zN8Mr9BRtYwlK/OqAE7NQeekH8/Bq+X2UnxcjElvGnpR3T3rPS9GJ
         /pg2WfeZlFf7O5MqybRF8pKrcO35fD+x2aeMO4uNi5TKxWV71wsT+kYRW8eaiuOBCVu9
         mPTFHL628T7oIoWaLk692qhuruaEzd4pl3Y2LRIdLbePa2ke5ye20KRz0F+fYRSPdm74
         UNrs+eRe/4DqsjKfrz9xyqOYCXQEmubdztRU8bgHols8ARwnWJkmjc3FMEjHUs8GmBYg
         5pvcze/yu+Z99bu9+L44FlXQFT+/NWZSDg/oTyS8wtNggmRqMPIl3LF2Lh/6fhOc1lvF
         XJ/A==
X-Gm-Message-State: AC+VfDznW+MTHDM6Lp6rcYZjfeo0Z+yHXWYt3diGCLcsGsDgsg04vvJ6
	X+ZVOtjccfQbYGNf8qr63ls=
X-Google-Smtp-Source: ACHHUZ6QHJYC5GUYqWHlBjRvQ9wBEB0YxRBTmvWBroelqSxpoGapH/6RRzqmpJJv+ptd0XgHV+e2ww==
X-Received: by 2002:a17:907:7ea3:b0:966:399e:a5a5 with SMTP id qb35-20020a1709077ea300b00966399ea5a5mr8891079ejc.35.1684757793930;
        Mon, 22 May 2023 05:16:33 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:33 -0700 (PDT)
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
Subject: [PATCH net-next 16/30] net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
Date: Mon, 22 May 2023 15:15:18 +0300
Message-Id: <20230522121532.86610-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051638_601990_69850188 
X-CRM114-Status: GOOD (  11.60  )
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

Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
driving of trgmii on port 6 on mt7530_setup().

This way, the switch should consume less power regardless of port 5 being
used.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f2c1aa9cf7f7..514e82299537 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -933,10 +933,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* P5 RGMII TX Clock Control: delay x */
 		mt7530_write(priv, MT7530_P5RGMIITXCR,
 			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
-
-		/* reduce P5 RGMII Tx driving, 8mA */
-		mt7530_write(priv, MT7530_IO_DRV_CR,
-			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
 	}
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
@@ -2209,6 +2205,10 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
+	/* Lower P5 RGMII Tx driving, 8mA */
+	mt7530_write(priv, MT7530_IO_DRV_CR,
+			P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
+
 	/* Lower Tx driving for TRGMII path */
 	for (i = 0; i < NUM_TRGMII_CTRL; i++)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-- 
2.39.2


