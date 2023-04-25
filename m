Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA73C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaUHbduLvT7VglteyNVg17dxlefVbbFzI2gkZnIc6Vo=; b=daO01W4qMa3+4O
	hDPkYtheBP+DFygyWAhs2/Jil+UeljuWlNpMMlPJBBwE4ga/b3qUlaNYuV+HN8B0nq38oVUekV3JG
	e+v+L98Hhac2I2ftIw7OV4VV5pjmDHZDch/261Hm4D+EqTARx/CzhCIiSF+C4DJzWZU8gge37o22q
	WHuHaGqdt7YnkBb+AEdV0H9HsQRUGgFcroJG0y6k91P6MwoemwM2JAOYhdInYhd50G+Rcv8SLpsh+
	E4P+x1y2LjUA2zot57YF3aYKaZ7cbwv/Vyzs0XQltPUGbAHIjrWSXhOJ8f4FZf68UuNz1NN3WrK+N
	qqo+HmodNTPRRC0VmkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3t-000UeT-0D;
	Tue, 25 Apr 2023 08:30:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3j-000UXd-2j;
	Tue, 25 Apr 2023 08:30:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94f910ea993so813386966b.3;
        Tue, 25 Apr 2023 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411395; x=1685003395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaUHbduLvT7VglteyNVg17dxlefVbbFzI2gkZnIc6Vo=;
        b=RNg4TxdpaoPZ75DhJpNTUsxQOiUNBEwwOvkaIQWV8Rxmv/cHH1Dc82zums7p9O3nRc
         vAZxcKkZn+OEy45IZctFwMls7KpJ5HjXE3g6otBXRmxU2d+0Lo3vz8aNIYKc26tjQXVy
         sBaB3/y8BGC2+G1lEhFDNqiHd2nk0ybFiccl6vbt8F0YP9Z0Pj42VzNzg6OOQyVxRdz9
         /WsI1HJw8kHWsjgsIT3dJeQcGSqzCgNAttBIFba4LAk79cYqE3iS2my2tSCtAqg320ik
         pAz6D0wVmNdovtJqEpLGlpEUu7ug9cIb1mtFcy1MzC/jSsss1hYlRZkGNfpYC+mGICgV
         B60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411395; x=1685003395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaUHbduLvT7VglteyNVg17dxlefVbbFzI2gkZnIc6Vo=;
        b=OwrvN6rlsRWgdqPndxycWgVmjk4Z7Z4lCWsrHTr93EuIR3vz7HovLaEbhb/A2p/o1D
         tkFkdsDJTlW+rgFwU8lDx6OYDOvcZ0ReYzT+vF9unaKqKYaFAGunJWeZpTT+sP+eQla+
         vq+ITXpMI23TUBZU1MUJFDO5vpNbavGAPXh3j9QOD6X5V76/9Dn9XvANdJhGsI905YvS
         q2p9Y3oFiqBnFRpLoGxIc0bHaIcCwvU6rNgmbFXzsHm1RhTBXcT954YHfzshXXnpe/pi
         ClfeElBjEs07jYOk6MEzxkNM6OiLaLJ2tsxmGwAl6E/urSGVlOKZ8lFxlzTPsMYXXkAl
         BrWg==
X-Gm-Message-State: AAQBX9dzxp6nQXc59jSD2/6/hoJ7k8qwg48U31SyGIaIiLClbCA/SXkV
	9wO1AM7IXr+jaUEJPTX7Rvs=
X-Google-Smtp-Source: AKy350Yap/bGcpQf2xq4sCbut3Oh2Si3tTlDY/j7jrRF8KfM8Fk4Vn3KlifqbJVaeCl1FeMEUphp1w==
X-Received: by 2002:a17:906:300b:b0:951:756d:6542 with SMTP id 11-20020a170906300b00b00951756d6542mr13114494ejz.32.1682411394759;
        Tue, 25 Apr 2023 01:29:54 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:29:54 -0700 (PDT)
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
Subject: [PATCH net-next 01/24] net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
Date: Tue, 25 Apr 2023 11:29:10 +0300
Message-Id: <20230425082933.84654-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_012959_889926_AA954091 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
Cc: stable@vger.kernel.org
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
2.37.2


