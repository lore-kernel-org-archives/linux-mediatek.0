Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E9CC77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=; b=IbSaMtar0Ws9Fn
	cOgUnfb/REa+VcvMNYOB3+XFHZQ1QigbTE6U2+d5mkhTAuMOz/dRqG7mD61LpGajVdAUWHEsW0xp+
	bPaPO8dKq8ZOYhZkBntM/OZTp4IoPlkaLAfIVXEfGFqFC1BaP1fsLRqZ9HnY/S8DclBpuj3LLojhm
	2F503lkpPgwWy2ADgsmZEa3ki+XJTw/8ep60mImWdwy3JLoxmEZb97038cT58qmcwRxA15uHg7uzi
	nGyvO0dmHMB82kKjHxlIoIM5VaO3Kioj5Oe3rOihUu4NlcUrW14lQxbBES8tsyf90oXdM54urdkOv
	2w0AdFc/gAepyGz6OQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXdH-00GQrd-0T;
	Mon, 01 May 2023 17:48:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXdC-00GQqZ-0t;
	Mon, 01 May 2023 17:48:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94a342f7c4cso559681866b.0;
        Mon, 01 May 2023 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682963288; x=1685555288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=;
        b=lmE7WGlLGrME4epC57gTjPU0aUj16Grms5aQKdEtvi90ImHoewFujkBINSKYc9GXXI
         hvz+21dt6GXQsWG3BteSk9p1bJMqRVoEYZ/GRlR0jc6qjZArII9vyr0D3TvQpsrW764a
         iHeMjvuy/hr2cU6R1Au5Gc2pmHtgasxTWFSXf+oO0LpECeK+LRzaatwTRmvUBpTVO6JX
         9ir44g/tp/E0zr3w7zx8NO551T/d31QC4Kl7U3hQF5kvP4x8Q4r0Z4A4+MRqADFkv2Vv
         F6/k992ug7yMHiBnYIPgifHZb+ZUdJ6pJ6Q/MtPMd0jSB62S7LP+BlV1xuUJWnUp2aYA
         cZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682963288; x=1685555288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI1N6Zt1ichZ6d+bawiKp7X6Hia786Ixe1XzJA/8a1M=;
        b=UgXFzgj8vE3RWmp8hSCPs+LXrdlUtDAwjIP6+AFsNM/44qu4Lnh2A/Xa6Wl6YRccNV
         QcIEBArxusin9sVtcuP/bdvPI8VYTCG2qQv+DFpAPF3e48Oe2hatqbSq5kD0emZ954js
         hVYDF0DfiwYqAAqSZYK/hXjr09XdV62IL71FH4wGwsJOd5nXmthPmAF84fUvGm1i4xBh
         yI38Gx7RFyKGeRuoqhv/znkvD7JzkKRZY/FAF+F8Qz3xsh96uJWOWmtbjQ6cWzQGgRLI
         iD4wFPtE3GS+0hJdOiusFlBekg8h1tWA+Jyiuz8ZVqqiQt6Sy4LsyarXS6jCQ46EgKzt
         eBBg==
X-Gm-Message-State: AC+VfDz/QdtOEGySRkbcSM8Ix+kAGDXc2+f6WQx3nIzkDB2Gx/GHFK5U
	ZnAWjsNRsP9qh0c5iFjjspM=
X-Google-Smtp-Source: ACHHUZ51gmO+BlobpsctJj4Kl2cSXLWvxQ/F9MjBGUzNp9G/uelXavA5/b6R7ImxR6gMX7nKRSnn1w==
X-Received: by 2002:a17:907:c23:b0:94f:2852:1d2b with SMTP id ga35-20020a1709070c2300b0094f28521d2bmr13090056ejc.72.1682963288063;
        Mon, 01 May 2023 10:48:08 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id se20-20020a170907a39400b0095ef737dbd7sm7745282ejc.93.2023.05.01.10.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 10:48:07 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v2 net 1/2] net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
Date: Mon,  1 May 2023 20:47:42 +0300
Message-Id: <20230501174743.95897-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_104810_310482_13119F7C 
X-CRM114-Status: GOOD (  14.43  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The multi-chip module MT7530 switch with a 40 MHz oscillator on the
MT7621AT, MT7621DAT, and MT7621ST SoCs forwards corrupt frames using
trgmii.

This is caused by the assumption that MT7621 SoCs have got 150 MHz PLL,
hence using the ncpo1 value, 0x0780.

My testing shows this value works on Unielec U7621-06, Bartel's testing
shows it won't work on Hi-Link HLK-MT7621A and Netgear WAC104. All devices
tested have got 40 MHz oscillators.

Using the value for 125 MHz PLL, 0x0640, works on all boards at hand. The
definitions for 125 MHz PLL exist on the Banana Pi BPI-R2 BSP source code
whilst 150 MHz PLL don't.

Forwarding frames using trgmii on the MCM MT7530 switch with a 25 MHz
oscillator on the said MT7621 SoCs works fine because the ncpo1 value
defined for it is for 125 MHz PLL.

Change the 150 MHz PLL comment to 125 MHz PLL, and use the 125 MHz PLL
ncpo1 values for both oscillator frequencies.

Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/81d24bbce7d99524d0771a8bdb2d6663e4eb4faa/u-boot-mt/drivers/net/rt2880_eth.c#L2195
Fixes: 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
Tested-by: Bartel Eerdekens <bartel.eerdekens@constell8.be>
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c680873819b0..7d9f9563dbda 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -426,9 +426,9 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		else
 			ssc_delta = 0x87;
 		if (priv->id == ID_MT7621) {
-			/* PLL frequency: 150MHz: 1.2GBit */
+			/* PLL frequency: 125MHz: 1.0GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
-				ncpo1 = 0x0780;
+				ncpo1 = 0x0640;
 			if (xtal == HWTRAP_XTAL_25MHZ)
 				ncpo1 = 0x0a00;
 		} else { /* PLL frequency: 250MHz: 2.0Gbit */
-- 
2.39.2


