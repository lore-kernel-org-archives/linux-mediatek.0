Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D22C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jsn0NQ9CmWAx6uQ/GpiFpZY13AUB836GqLn0lOzSnMY=; b=1pYST57euvY79d
	3h0Dg1Rj8A3sSOC61MehkPJQlohOACfp4jicXOS2E21KK+eOV3o2aVMmV+N9B+8XVR9jqDosqZO8l
	FvSfigXZWMIhnlJWwzDteNtUWefHnWPnewWygV1c3PgSRDvDKPDV3Pr4y6PLDrFGR7UbfYKJ2Oh2O
	R276Hjd0jaluFWwc1CgtF+xbfTyf01vOMveYF2F4oLq6tYWl+bp8pbzcawAmaccQVNNLjAf3YV9ln
	j+djueIE13FRytXbu/5WHyU8YjVDd100AefcA7qa33H8ByBi3PVC6nYewsQwldYSlvWLDPp/LSMM/
	G0jpGotoqZJ0F/I/ND7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRJ-00AO5C-16;
	Fri, 07 Apr 2023 13:47:41 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQx-00ANkv-0g;
	Fri, 07 Apr 2023 13:47:25 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54c17fa9ae8so76368937b3.5;
        Fri, 07 Apr 2023 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jsn0NQ9CmWAx6uQ/GpiFpZY13AUB836GqLn0lOzSnMY=;
        b=dbhdUjb5Kx495YHbuaMUJ+xjTzf9UozTmMvu4Fpv2sLSGROC6B3CmnhQ2dGKQV0jCc
         8lvm1MEqANTyT3HXeuYMQdyMZYAxfnxgpc7n1e5VjMGNX8DFTJxfshel9hE45/A0mhGO
         1k4Oa/2WSb39LGib8igtf7MnAGRFXYzEWhQfHz4niOl6j1SZ3ZKTo/Q5XjcNJqc4LSYk
         SDRdgBcw7OJfMnwctk3/Z5y3ckC+lqqOnQ5ztpBm+68gWQo3Zb/MCdFHxg6fLXb0NigI
         cFGz/fzC8XyoDR+m2qJHQsQd5QwLW93/neCy2XUuNF2KPPFpuVqayNvihMZw9AgDswgL
         1GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jsn0NQ9CmWAx6uQ/GpiFpZY13AUB836GqLn0lOzSnMY=;
        b=BldohPqZSGxoh3wFAPSvbrvxPfjCK8ZJQxHCrTUppncp6NopzCmFkdOmrvoq3l9bTz
         cmFzxBjRvgQLfybaK7SxK7kTL1AcQK9EjByEeLb2BQ7wlBpwA8R8hK/P4gzNZB62XaDY
         a874+2SmutDU7V4gfxKM12kbweFb5L9cY51Cq6Zk1iDChjiR/VxY+qWJcjKH7DfR7mqv
         GgbJvSGc6wYTFkBFyqNunVrTVNpxhQGiVjqczQGJi5bd6CuLR2/By57ros/OdwwdA8q7
         Z9pZYkBxZqFD6HDcusUiOG5y96O7a1G0a+SJIXb9zEQblFsj9dQjFlzgPIzRCI0Il6Pz
         LrSA==
X-Gm-Message-State: AAQBX9e6Grk7kJbGxoIc3wWmLcclZIvYGObeiH3jho/S+UZ1CUCA19S0
	6OEBXjywdxyZ3Wzl7OOn+7Y=
X-Google-Smtp-Source: AKy350ZJABInmffON1tk4bbyZjkiUG1rYtVMdfnNMubLerKmw5V+zmQ0sucFY+D6OMcTnmtsevZGvg==
X-Received: by 2002:a81:484d:0:b0:541:9671:3169 with SMTP id v74-20020a81484d000000b0054196713169mr1867341ywa.39.1680875236297;
        Fri, 07 Apr 2023 06:47:16 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:15 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 09/14] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Fri,  7 Apr 2023 16:46:21 +0300
Message-Id: <20230407134626.47928-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064719_368306_12F4DCF8 
X-CRM114-Status: GOOD (  12.93  )
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

Enable port 6 only when port 6 is being used. Read the HWTRAP_XTAL_MASK
value from val now that val is equal to the value of MT7530_MHWTRAP.

Update the comment on mt7530_setup() with a better explanation.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0a6d1c0872be..70a673347cf9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,9 +404,13 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, trgint, xtal, val;
 
-	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
+	val = mt7530_read(priv, MT7530_MHWTRAP);
+	val &= ~MHWTRAP_P6_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
+	xtal = val & HWTRAP_XTAL_MASK;
 
 	if (xtal == HWTRAP_XTAL_20MHZ) {
 		dev_err(priv->dev,
@@ -2235,9 +2239,9 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
+	/* Enable PHY access and operate in manual mode */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-- 
2.37.2


