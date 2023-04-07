Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1ACC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=; b=nY0uNyNa3CUg7P
	BMbOLC1ykOCU3RIY/dCVehErEXxfSU+sbndQmcaanpHqpwKKVvFEKlHy8mlE5qrCabVyEp7s2pFmr
	gEYVlnQ2G1puA7alCrEKyO6keNapZD+giwq2PykzEX5gpHqFQB5iDOQoZu+gqWa52uFyTZ3CrIdYQ
	g9IrC09HprYoNhYeSTieSb+cgByTAzSfaIFGMSfhPS8lgeUasgTZt/Fl/2qwdLpjVgTw2717qMvP8
	qgV9yzMc6JDsZY0zaJ33lCm/x/6mGCYkyV9b/+2f68IWCwtDuR9avBLuyoKoiU8Mb63DTh2X/aIff
	/xFbxAKBKwEYQdoq4WKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQz-00ANnR-0h;
	Fri, 07 Apr 2023 13:47:21 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQi-00ANYZ-09;
	Fri, 07 Apr 2023 13:47:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54bfce685c1so128057427b3.1;
        Fri, 07 Apr 2023 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=;
        b=nvabayHRaa0wJNq5xr3lp6l3ZDlC5KFNMNjRRnz9aSNijFWOS7QmbHM8oCFQcscqD9
         Iv7GTUuGeVdhLvDRMdfL3jidQZa+qM+MmavROSLl2te5yMbpSNhMCNiAyaa6QkjckIlv
         +yQDAOjsc/6p5XsmUd5MmhRumvNYA50UAvy0EbG0rsN9SKtXJYePV6anYLe7eaPEiK9o
         0njzayi/bq+89C+fdmkavyuzb1deC+SI+RlVOt8rnvsu5mVdq4DWohClqH6GppHEPGub
         5TtoANm2RKrWq3pVkGvXNU5a5dvMwKzDSeUQmlsNtJLY3I3QIPxmFdWGuHbd1xPYu8gv
         Ayfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=;
        b=iZpi2S0ZsEn/MPBZCOGEg9GBygIXHsZNWUAj96qNfUN5NY04GnUtiOf1ixCgmc5S2N
         vyNqAgpPorDS4B8tb1tP5WO2IDrwkAnXqW87v1gpmRUNs+tSscw0IJnGiIUzojawViF/
         vyTuaYeF/Ekq6InSzPOzn5nM6OAwYIAKfo6oBoIAGnn7ZsruGd+pjWtJgBxUNZNdc4a7
         nZ43+gZWqNT4nKowiwyql/cnQO7cxBfn0FVuDyFTqN/ER3K+8+nxchYeXv6nqoF/ilZo
         vdm6yYxV6HS+oMUQuFmhgIvPlOox6mxee5wLaFpZyv+xuX0YG68maHBGViTxjoyvdKsM
         OzzA==
X-Gm-Message-State: AAQBX9cLbiTBXt+GOCbXu779DEGqquxqZAP9bwI5ZWl09oY06JAKqXN9
	dDUHn3M954RyNaC55ELgXW4=
X-Google-Smtp-Source: AKy350YW7y265QatP/CV0i11Fyx7KsB2qxeRvdCVwy2fI9QdnVPoo69cQtD3E9zcZyaw2/YvhyONFQ==
X-Received: by 2002:a81:9105:0:b0:541:a151:fe72 with SMTP id i5-20020a819105000000b00541a151fe72mr1793803ywg.39.1680875222720;
        Fri, 07 Apr 2023 06:47:02 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:02 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 06/14] net: dsa: mt7530: do not set CPU port interfaces to PHY_INTERFACE_MODE_NA
Date: Fri,  7 Apr 2023 16:46:18 +0300
Message-Id: <20230407134626.47928-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064704_159033_642FE196 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There is no need to set priv->p5_interface and priv->p6_interface to
PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup().

As Vladimir explained, in include/linux/phy.h we have:

typedef enum {
	PHY_INTERFACE_MODE_NA,

In lack of other initialiser, the first element of an enum gets the value 0
in C.

Then, "priv" is allocated by this driver with devm_kzalloc(), which means
that its entire memory is zero-filled. So priv->p5_interface and
priv->p6_interface are already set to 0, PHY_INTERFACE_MODE_NA.

There is no code path between the devm_kzalloc(), and the position in
mt7530_setup() and mt7531_setup() that would change the value of
priv->p5_interface or priv->p6_interface from 0.

The only place they are modified is mt753x_phylink_mac_config() but
mt753x_phylink_mac_config() runs after mt753x_setup(), as can be seen on
the code path below.

mt7530_probe()
   -> dsa_register_switch()
      -> dsa_switch_probe()
         -> dsa_tree_setup()
            -> dsa_tree_setup_switches()
               -> dsa_switch_setup()
                  -> ds->ops->setup(): mt753x_setup()
            -> dsa_tree_setup_ports()
               -> dsa_port_setup()
                  [...]
                  -> dsa_port_phylink_create()
                     [...]
                     -> phylink_mac_config()
                        -> pl->mac_ops->mac_config():
                           dsa_port_phylink_mac_config()
                           -> ds->ops->phylink_mac_config():
                              mt753x_phylink_mac_config()

Therefore, do not put 0 into a variable containing 0.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8a47dcb96cdf..fc5428baa905 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2247,8 +2247,6 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2466,10 +2464,6 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
-	/* Let phylink decide the interface later. */
-	priv->p5_interface = PHY_INTERFACE_MODE_NA;
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable PHY core PLL, since phy_device has not yet been created
 	 * provided for phy_[read,write]_mmd_indirect is called, we provide
 	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
-- 
2.37.2


