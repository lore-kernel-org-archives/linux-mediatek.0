Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A48C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 21:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TCKW3GcfxPXY7mkB6iKCrbvfraXmwfBiRi821WTxUyg=; b=j25Q4z+6HhhBGL
	0ssYVnXnMwnwXUzfrE2ct0S+Rhubq2dMgZ54Wr4uhbMFZBahCvOuGZk7PWUTEJZOEdcduQ6S4siYU
	mmqQXicAV8k8IxRBc13/M17O/TvLNhGgzxnsLHf2L5RKUt0on5BlkCQchdvXKav+IWw+JtGOycNgQ
	WmTRXnGm+EMmppTS39zuc/QkEf34VXLbIkRbWbsQAhz4KXw2twp79Kb292dk6eHS2DxX1oc7UA4da
	AEODp1NRW1CrRc2TxVpZdIMRM12MueLynWxHokt4Vir+Mgsmgs22bQi/2ZQhBoAOeCm86Q0lb/NuL
	2NBK4m+Vy4GVPlWw5OiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptxGL-002eNw-33;
	Tue, 02 May 2023 21:10:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptxGI-002eMk-1M;
	Tue, 02 May 2023 21:10:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so5612698a12.3;
        Tue, 02 May 2023 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683061812; x=1685653812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCKW3GcfxPXY7mkB6iKCrbvfraXmwfBiRi821WTxUyg=;
        b=J9p1R7S+L42qJOIxO6GBgRityXwTaHOK0sN1u1gr+Y0AFRQSdDM8XEGBb29sCrpCtv
         WodQ2uzEBRGGliynmStoU8rUIRDAHGJ2+tgeGeQ03q9L5cJT70AKcVoc/cD8rIaTwmYo
         WEIS9VOCQMNbLyqbcsVkS+9vpEW50W6vpqiov/gH4LozJV2Vs9JlV10ARrXTQHnh0nnj
         +aoy77JBfPG+93JU57uR8MmEua+aXMrIv+Tb6HrzY0yDdsGXSuvrgFrIbaLRvZcxbvOq
         LcpWVZ6p0BrG1WOUR+tnnrjsOXN7KCU+sO/dpEoRrojJi9vhppc1Ge/LkJXLEImYzJZF
         OqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683061812; x=1685653812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCKW3GcfxPXY7mkB6iKCrbvfraXmwfBiRi821WTxUyg=;
        b=drDHk6+59tCDI6sEVbPA0kJqUJYxHKy4BeW2FboHP1zpjDC2D54c/Z6+fmWLWlpWGh
         KwlCy1TouZOUeOfFn515fKoZ2POsmtC24/uhVU25C+Qi2+9+TgG1vi4uKcCt4yOS66uf
         KPeHb5YU3txdNISvER5vqO4DWl0fiXCSe0i5YBdU4J1bZqXGbZEYEMKee/wB4AyKvuem
         I889c9KqmRx9HBBL0tEJEjMZJbZ+BUeL0/CIIuSM3g7b5VVQJmIOMAwkDJ9jhHBhVTsW
         6KKCMzztu8t+fayUgwHrCPk39KtalmsDED4grbZc2unB5pekA/BZYx6yuuWxvvHv90DU
         iRsg==
X-Gm-Message-State: AC+VfDwWwHJhz/1HJWeHFEjsD7PsUOvo4W5r/4fNmuhX15ZsbpFPZL0F
	ssz34C84OOlVSm7Nsz1jQSI=
X-Google-Smtp-Source: ACHHUZ5giVFQBJDdgxXGEeryqm1QPaPTd/U+SD3+3it7wKm+bC42p+sg5P+s40TGBPKTwJ/m8HoR7w==
X-Received: by 2002:aa7:de11:0:b0:50b:c981:1fc7 with SMTP id h17-20020aa7de11000000b0050bc9811fc7mr5680216edv.19.1683061812116;
        Tue, 02 May 2023 14:10:12 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id a24-20020a50ff18000000b0050bd19ec39bsm1178620edu.83.2023.05.02.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 14:10:11 -0700 (PDT)
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
Subject: [PATCH v3 net 1/2] net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
Date: Wed,  3 May 2023 00:09:46 +0300
Message-Id: <20230502210947.6815-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_141014_454312_89FCCE93 
X-CRM114-Status: GOOD (  14.75  )
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
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---

v3: Remove my tested-by tag as Florian pointed out it's implied with my
signed-off-by tag. Add Florian's reviewed-by tag.

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


