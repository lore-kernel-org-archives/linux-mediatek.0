Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBBC7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlwuz8s8MG9ZZ2zJmGEfllL6UDiR42hxKGeFHL77wpU=; b=pV48xMtK+zmsbg
	j5XcaT0EUGg3KKAUN+tjkB2FA4gySYXg3sO/7MRUXH7qemP9xMZ2DXySUX/J/FHrqyG46N/LbJY8g
	rH40iYlbK1c1fo0BtQCrn7VN3Il5CfKgaRkCBG1C2KFA6dvsx0Zz6sBPR+dOBYhnSCd0e6B4Ww4I5
	3sM1Bn6qLss4ouhi8hGQJVLI6cLH1pAyWsBuJBjhevEypXNm+NIec+cG/GFTJLAtI2teJBnV4cXLg
	lfE6FeKDtL4lJ88qbR8v5C1CisQEnT4kJBDonNzBk4gc84fHMQbr1PePXOH+1gRhQj38K39vHmt/P
	ljxwBXS16t3rb4kmzjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q15cB-006fZp-0x;
	Mon, 22 May 2023 13:30:19 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sq-006PKc-1n;
	Mon, 22 May 2023 12:16:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-970056276acso83450366b.2;
        Mon, 22 May 2023 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757791; x=1687349791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlwuz8s8MG9ZZ2zJmGEfllL6UDiR42hxKGeFHL77wpU=;
        b=UEIShbHZWhZsbZeQbvyhXu/8Kq1bhc3dzJxhf5mfe6olRkFTrfLEijjwFLQKWL97YC
         5WStn3RP1m8lgVuDZ1p+umTtHFVh4UwI8Nl0wmhKbHSUXJqDRtVH9lpHzpiQswkEw8vS
         EoYmqxNQgxt0os1uzsopMY3dPAgjhDyR8rdHEFFAlLKg7UBx+LJzSJm9YoEQ78XhCyd1
         JfslVUBJrtI6Wc3++0vzZz8VSO4eGWNl2mm/AdqCy/yo3eFxEdVPjM2r9H1S2HPi8IQe
         rdMHeufvf8xKWlPY0LnoN3pkY6nDoL+O71K61V5a+batec74NzjJnpRXiSGwFUjCjTjs
         XVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757791; x=1687349791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlwuz8s8MG9ZZ2zJmGEfllL6UDiR42hxKGeFHL77wpU=;
        b=KPfZT0JXUYxTR7kNJX+xeSzL3tmvpCwKYtZumN2xEiI6ql9ieCxgQg3BSCVOL07ab2
         PifZn0ztXEmxQzqVmMXNmAMqS3OZMbMETnSoMTeITdfEKraitm20iDNSEdPcIPuMPGL8
         LwAnjwbR8j9NmI9Na0E9+A5/UPoecjGe4G5/5FfnrkHkZAaUqZ70cAUfX5WzydBJlIDG
         7Dn+YfmaZ2GWsLB7B9FllDZqvS+HyKtc/hXiMvLr8z4tGQ4nQJ9SMUDomhNDL3Wy046R
         iV48hqcYM7l8izBiwAHT4AztolaB6Ej+0Qdl4vKMhUjYora+SxKHbMx4Pry7/VgaEynb
         4kYw==
X-Gm-Message-State: AC+VfDz/FN1gS0iQ6URgDGC0q9hh41mft3ZprF4EGL7iboM30ElW8Bmp
	GTXNKFPmx1Wm2UF/vGK3Jj0=
X-Google-Smtp-Source: ACHHUZ5K0fPYC0TlTCr56XwGyY9dtgGsEV/w/6Bdf+rf3wZGm0fO0vJJ3i0TQL/6KIzBTJ8yzBpuIA==
X-Received: by 2002:a17:907:2ce4:b0:966:a691:678d with SMTP id hz4-20020a1709072ce400b00966a691678dmr8553648ejc.51.1684757790936;
        Mon, 22 May 2023 05:16:30 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:30 -0700 (PDT)
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
Subject: [PATCH net-next 15/30] net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
Date: Mon, 22 May 2023 15:15:17 +0300
Message-Id: <20230522121532.86610-16-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051636_593000_5616B270 
X-CRM114-Status: GOOD (  16.33  )
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
index 744787e38ecc..f2c1aa9cf7f7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, xtal;
+	u32 ncpo1, ssc_delta, i, xtal;
 
 	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
 
@@ -455,6 +455,11 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
+
+		/* Set the Read Data TAP value of the MT7530 TRGMII */
+		for (i = 0; i < NUM_TRGMII_CTRL; i++)
+			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
+				   RD_TAP_MASK, RD_TAP(16));
 	}
 }
 
@@ -2209,10 +2214,6 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	for (i = 0; i < NUM_TRGMII_CTRL; i++)
-		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
-			   RD_TAP_MASK, RD_TAP(16));
-
 	/* Directly access the PHY registers via C_MDC/C_MDIO. The bit that
 	 * enables modifying the hardware trap must be set for this.
 	 */
-- 
2.39.2


