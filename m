Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D3FC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDhIHtzgrt1JK0OHDfth9yreKDguDZ1mwE1kdBlBcjc=; b=39/atS2f3kFy98
	x6kvMDKkIyQOZOEgp+fvrM0Tg0AA9KNQBeStGU76cHfgiOiYRycrm+1fgfIldQ+yY3z0c+vPsV0Gc
	VB0YhF50L9UB9bU4SRfOevLJojUzzynNkXEPJqFYBJ26nzUszqfVQ0aiiy+d4PpmI015sHyXLXvNQ
	2TGDlesDGQ/5KDLMksR0vR6EQlaCj2Uwb8ltAt6m5//+Y69Y/n4y5O7c36ay7fWYHNEk7uI/euZCR
	OabChyaRbw1KsG2mi4hgBcMuOUT57Mn1HYAiHrwX37uoynPE/CsMkbTVeqiqBM0wCSqJpB3FgwMnG
	d0k+rbou8TzH1AfLQTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE51-000VXu-16;
	Tue, 25 Apr 2023 08:31:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4G-000Umd-33;
	Tue, 25 Apr 2023 08:30:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-959a3e2dc72so416383666b.2;
        Tue, 25 Apr 2023 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411432; x=1685003432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDhIHtzgrt1JK0OHDfth9yreKDguDZ1mwE1kdBlBcjc=;
        b=Vs7/n3A14u40HN1zzZMUGkdqqU9uVQOs1pjNjF0fMuwj/qtPPRYsXL8b4BPsX4RZAC
         srr/fOeNSSA3GQpurqa6UjH0SXhSXTUUDfXwDYOF/UeakUP8z1XSZWUrwNml3PlzJ4zY
         gveSaBym8bK7QvSbG9pEwPvdz1obEtHS/Nh9TK73tGzL2ScCyyXbn49Ulel2kKoTUs+M
         tPLK6wCoGlIJR0Q19k4rvJZJ3Cb0UEgOjWzkqOLqKOtVCbY34t0v6/PNeoFJ1m2wY08+
         qxOPb43iBf3jUBBmUynwG5OwA1xsMqWZd+raPGX5d1g2nBsSpzBez9f90x1cycfwA5mo
         xiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411432; x=1685003432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDhIHtzgrt1JK0OHDfth9yreKDguDZ1mwE1kdBlBcjc=;
        b=RJkL1mdKDDrr/w26xi8rjC2AaCZltF/QTByqH9Htl2O0fx2wWFn0EV1jbm/RR/RadH
         Ce4XkgwBPs6KvG5fgxTVmyxQI0DTQRzZPap2GokRyhEv2DeqG97oZR9+xRCb5tXvKoEM
         PF6EZYwBv490GDy0ujBJSH7uwOBipcgDd01loQgLi1UVDUxDOUK0xCNesn4+FkMsAflm
         0QpOCpyW6Phuu/ynSP7ndIisGIuxqtSrEPVyoim+P0A5pIRJxRETZoI/CR4u2l+4FoLD
         cYnAoKW/VlKI8XPiOLCPph9raNprx/3+sOB2Y8jHu+cvxDjNpdh92H7KwUFHEbqMSRgD
         7dpQ==
X-Gm-Message-State: AAQBX9fmkaHNFt3eny8/+s2Ga1oluWpvzLJ8UoqQJvnUw4RpbHGiefnH
	kaijPnKlNTZEwtppa1I2Kgc=
X-Google-Smtp-Source: AKy350aRWIhqNZBAvc3x7nhtFqt59Dfm4+hxInSRx/S8/Kxa5racJG5jce4um2W1h3R8yESoFZbBFQ==
X-Received: by 2002:a17:906:3086:b0:94a:8291:a1e3 with SMTP id 6-20020a170906308600b0094a8291a1e3mr11236909ejv.74.1682411432342;
        Tue, 25 Apr 2023 01:30:32 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:31 -0700 (PDT)
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
Subject: [PATCH net-next 16/24] net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
Date: Tue, 25 Apr 2023 11:29:25 +0300
Message-Id: <20230425082933.84654-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013033_004572_BA9797D0 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index ea023e32313c..0108af681d50 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, xtal, val;
+	u32 ncpo1, ssc_delta, i, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -457,6 +457,11 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
+
+		/* Set the Read Data TAP value of the MT7530 TRGMII */
+		for (i = 0; i < NUM_TRGMII_CTRL; i++)
+			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
+				   RD_TAP_MASK, RD_TAP(16));
 	}
 }
 
@@ -2214,10 +2219,6 @@ mt7530_setup(struct dsa_switch *ds)
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


