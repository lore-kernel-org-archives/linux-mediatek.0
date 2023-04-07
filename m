Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CFDC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=; b=KPJbhvTeGdDUn0
	6DsQro+qQ9heSwaQti2Hvvedb3z6fE4BmdD7a9VTa9H4kyWCJgaJIpQ16UNpkUWeshG5nZjcKYJs3
	NdWqhB9i5ItkNHa8ou3hD4VpS7VxPZEV+LU53ArJhmLY7kyrCD1QAw2mgwFQt8wNxwf20nC3FytvX
	aE/4v0SS0aLemtAZvUsLztoaGVy7VxMQ2TGCxwmkCIA9aka01fO0sD0fIFCDl6rs4lUWswA6ryPfN
	fFTRUYHVZ1/PDrq+1lcTvVGOOFoVOU0AyS46B7m6f6vTanEF0fboHIg02rpT99I8Y41nrjRpCx0ED
	lbWGgIEbRTkQLgvVd6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRS-00AODG-29;
	Fri, 07 Apr 2023 13:47:50 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmR4-00ANs4-0o;
	Fri, 07 Apr 2023 13:47:28 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5416698e889so797312827b3.2;
        Fri, 07 Apr 2023 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=;
        b=Khq4lakPSKINAMHrDaCTMh8EeQ+V+eHwOuug8yWNtkFKqjdjWDbc2pmsVEAOLl7pOc
         Te7lJVbwGJgFDVT6Lu64E6hyKdmFqkkoYcwYpvrEbJcHtAKQucEM25hZHoue6SLvCcqw
         cmrYd7oFzoUgqC0H88H/Yo3V02LzLMyGZdWRDMa0x5JYnWsVo0WHmvDKlDRpgWcoGHLY
         Ka5pXwpf07gcpmTxO9aLrA7i9B+DeXGhTeAfPR8FbvK1Fsu++qdDBZv5HZOnWSI35f/f
         knmtij05XRWMbmq79iZtqawWhNKqPd+/NuWJFslMmCOsAjFccLgXjjK8CgKxjOEzclML
         QCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=;
        b=xacaf95hLR/NXDDdbGHcYEjhfPsQeenHpNOpZd3Tv6H+h+Lw8hRRxS2rgCN/Agzo7a
         fiVjoGDO+T1QZKJZ1EtTM696zQShbNne2jqlRBaEYxck0r0ykZj19w4nKPU7TSZQcym6
         geh8h1i79FN4ZbYFbzf5uqPoJM+1l7t1/C46kgYa4cca2z5DrbvskT7oY1nWFLmEpTSv
         C+n40wVL8xSEsdFX5ern3JoQjeudkSOVGNNoxT4zBZomVdCbFHwKMc0zAW/MbLXmDBml
         kNcNKvh78e4zhfji2duDt90Xc/CjCRhtP3ZaAhh582frXkSsRC4ioRV5BEokz2LBzWls
         bROg==
X-Gm-Message-State: AAQBX9dIiCj+oqhrCaM2eKYhWWf+EVTAhclVXvh7ws7YwmfvnuI03PZP
	jTrYlog/h6DQPdZ+uuA+rzw=
X-Google-Smtp-Source: AKy350ZGVEQhtTR6cQW7sfrh8ngPWG6L2Xbz7SIX9tT6TZ3YLGIyhfygmDD3zdBILQB8L9E9zHbl+Q==
X-Received: by 2002:a81:6d4e:0:b0:54b:fc07:c7c8 with SMTP id i75-20020a816d4e000000b0054bfc07c7c8mr2094391ywc.0.1680875245241;
        Fri, 07 Apr 2023 06:47:25 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:25 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 11/14] net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
Date: Fri,  7 Apr 2023 16:46:23 +0300
Message-Id: <20230407134626.47928-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064726_536064_17B9F8B9 
X-CRM114-Status: GOOD (  16.00  )
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

This code sets the Read Data (RD) TAP value to 16 for all TRGMII control
registers.

The for loop iterates over all the TRGMII control registers, and
mt7530_rmw() function is used to perform a read-modify-write operation on
each register's RD_TAP field to set its value to 16.

This operation is used to tune the timing of the read data signal in
TRGMII to match the TX signal of the link partner.

Run this if trgmii is being used. Since this code doesn't lower the
driving, there's no apparent benefit to run this if trgmii is not being
used.

Add a comment to explain the code.

Thanks to 趙皎宏 (Landen Chao) for pointing out what the code does.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fe496d865478..384e601b2ecd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, xtal, val;
+	u32 ncpo1, ssc_delta, i, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -464,6 +464,11 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
+
+		/* Set the Read Data TAP value of the MT7530 TRGMII */
+		for (i = 0; i < NUM_TRGMII_CTRL; i++)
+			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
+				   RD_TAP_MASK, RD_TAP(16));
 	}
 
 	return 0;
@@ -2227,10 +2232,6 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	for (i = 0; i < NUM_TRGMII_CTRL; i++)
-		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
-			   RD_TAP_MASK, RD_TAP(16));
-
 	/* Enable PHY access and operate in manual mode */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_PHY_ACCESS;
-- 
2.37.2


