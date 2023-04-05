Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C2EC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=; b=Mp5n3SFnt0RI2k
	XqhFtxZX+NLRFQCeN7SslhVCc/ECopaOAm8qytSiPYXPOzyPXpHdFhvs0C0dFzVo4F3UVlV6fqsYz
	sD+leHaKkcfohN3Zux1UFLqC91I8SkjQGmUS9dF8pC7OvZgz5wdVclOOc9sM/claF+c1REzcxXy++
	rDgXTimPx4APHjv81Y4juUxruOYQibWhPf5/DnBzkFbaxrVlOmdek795czqw9o6cxAmb0DwiMSFP+
	/updaH9TR3E80wA8PboeiYP9oZByaw0OToIKQWT3SwZpe84amQq3lOZoda5yAFsBOu+y8WLpYD+jn
	4bgu5i/WVCXISBWIvx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAyn-005l9p-2Q;
	Wed, 05 Apr 2023 21:47:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uk-005dxd-3B;
	Wed, 05 Apr 2023 20:39:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he13so1969056wmb.2;
        Wed, 05 Apr 2023 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=;
        b=PkCe8EUwo59MuxO0b6KKI0EmM0HxoC38GvoQCL9HKBu3Pi5g9oGx43peL0MKckQs05
         9GTz+/qxJf8/I4YzJWNBHoxaqLYtCgzAi+4f3uduLglyaLnYD8bvZYKoMHf5SSvgNBrV
         7ASNECmnIIspbW3qf7+L4jOm3cisQ42pq0C2zRANZt9PBwUTXmU4HV2ZE31zBqtBO7T0
         Rnw7v6ZpKZdutrO2fHfH9Hi2hZ5dEftWF2d+Z73dcyXWJ3QsHayuBm8tzTjHTGb+ph/E
         JzpsdA2CZPlKGb0u5yldIRaZ8s5eu93/BO+XocnBJwc3GTWOQJ/rJXA1295X0tm5hTSs
         XDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9BgVJEEYWS/nr7ufBquG0YTtl1dQzZWs/MVrntK8ZE=;
        b=XQg0uXDtFfVu7IB4r+oxteGNRPDKIkq4VrNeIgvdO1YSL5oIiVYCrVxQ6NIZvFyoHM
         hyS1NQOlS8TmzQe4nJGMzhYHx/Y4/2OCB2IFzRGrI7KKk+c4YZZ3d301GSbTiRQwNTHv
         dE1mbI9/m6tjManpTzxN3GaAQnfQgqquPnHw2NvFGn7ourc4f1aDMnhJx8w5BihWRqQP
         jxWEVw38O4zG4yhNCagJ1+YmUf1cI00UTHnr+7P7oKAfwXu1t3WEOAhX8XxYfNNrRGTY
         8grVzw0ccnkKA4Z4GbtTeNXUXNQp94YtbC3n58ernugD1DWOYG/8ND0i/Jl9Lq7U9o0n
         /ipA==
X-Gm-Message-State: AAQBX9cJz5QrcTLuc6eIzgHn1Rw7AzvrOL5tLYLVSXKt67TauRD7QR3H
	DuZczpaDgHP1Xb0zpMZT5NU=
X-Google-Smtp-Source: AKy350ak9wGsiF9xXKquHuS6fiWGFlLoT/KizsEmKlqSw6wiiOnCOZh9KwtUQUXE/BoiyAZ5k1Hx1Q==
X-Received: by 2002:a1c:7211:0:b0:3ef:7584:9896 with SMTP id n17-20020a1c7211000000b003ef75849896mr5529893wmc.26.1680727170331;
        Wed, 05 Apr 2023 13:39:30 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:29 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [RFC PATCH net-next 11/12] net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
Date: Wed,  5 Apr 2023 23:38:58 +0300
Message-Id: <20230405203859.391267-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133931_037409_A3150311 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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


