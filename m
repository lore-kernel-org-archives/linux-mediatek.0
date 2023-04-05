Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04EAC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=; b=F1gqTzI8VSn7tY
	t47QMV0d+7KebGI78KWMjp9HOBiUNXaGqVkG6D7W1whgEN0wK0ezicRcX9D7K+f7ScBDx2TrL9EhS
	yUQQ7ICKzITMvdC7xRiLe4yw0AylNK0EgEq+iylstgiel4kfh3gRV1QeZG4DRxLZU2LkFVSG6096b
	NqkoLtBQP/hb5MjxUPlBYh5Odr1RKzEYuDDgz2wGYmILj5UuOZ63DxSA0aELIigFbtCYEx0/+HyHh
	g6UG4ljb9DYaUMg8mzeRorj8sQ6on1ZbkugCUEgEAiD39Oefo1YklNOEMYiKhSY9LOPwCU4Q+iUxZ
	0cs/AfEkDIeenCUlhM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAym-005l8I-0L;
	Wed, 05 Apr 2023 21:47:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uj-005e8O-0p;
	Wed, 05 Apr 2023 20:39:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so24132493wmq.2;
        Wed, 05 Apr 2023 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=;
        b=Nbp9QixTsTqXq+nlznFJzTPRU25T0EZ9MfYB0i3Bd1kaz5zF7jLHuPO4ztD5MflGWR
         AN5suyxWvODfN++LkEf+UECj7CDSevmkzrBgi2ZCzKzZ/BV4DYNWV8zJjeenQrSm4KbQ
         aQIZRGNJMAzD+Omq1Z53JJ9iH6Jah9w3XpnoC0d0WC9bXqgfFK+UtRuDJIBPJzAenZ4S
         0JGtpgmFd1p4bI7KdW7XrBjdmn7NVm3SGGDWZP8BDs9IqegGqmd4aQ/WgMsbzzRhJP0E
         W/WQeSkfeB/wwl9yl+SR4cGk2VknUiNU07J2Ua0LjagY+kM6F+4lA47K4LU7affatRR4
         +6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=;
        b=w4YEVKPYA8RGZdVZe4tfixL5ZlAiQKJP12TR3RoG2kKe4zijNdk292qz9U2ZHHxa0U
         O9inJMc0YzXd8Gi0s4FzCmWiitJOeiDYWXQPsPjPzjfU6xQoUJfAyNWuoT2OyuvilE1S
         BsCbnt5h7aoregFaoZu4Zi877Qq+MKoxcJycFIOpOv8hMQqVC9YZrycFcZ5pgSGeuuHT
         JiOaFMQaRK3zd9J3Vs9WabMU7+fzQbxsRQLqIjuwkGey1mTniCcnQhGLbJOT0dCjeFEP
         gghkrRB0v3rqLXAyn9ISDNAOsL1akdx+rmi/Rewbry5Nz1KHE0tzSzm473BuxCUTGAHf
         +2vw==
X-Gm-Message-State: AAQBX9dIFeGbTPMWyyf66vZ23NPuNRpMBTRifwQ7EcOJRO27AiTYodHP
	WO1v102kLpGcZR+OzKbkkFo=
X-Google-Smtp-Source: AKy350aFpJYsbdWGizzfVNQlwDH+aMdywoXrMBy75yzELYvUe4GwnL9XMmWJ89kOSD/km6FgxUxAYg==
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id s10-20020a7bc38a000000b003ede7151784mr6432135wmj.15.1680727167948;
        Wed, 05 Apr 2023 13:39:27 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:27 -0700 (PDT)
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
Subject: [RFC PATCH net-next 10/12] net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
Date: Wed,  5 Apr 2023 23:38:57 +0300
Message-Id: <20230405203859.391267-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133929_297535_AEACD170 
X-CRM114-Status: GOOD (  13.37  )
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

This code is from before this driver was converted to phylink API. Phylink
deals with the unsupported interface cases before mt7530_setup_port6() is
run. Therefore, the default case would never run. However, it must be
defined nonetheless to handle all the remaining enumeration values, the
phy-modes.

Switch to if/else statements which simplifies the code.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 70a673347cf9..fe496d865478 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal, val;
+	u32 ncpo1, ssc_delta, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -419,16 +419,18 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 		return -EINVAL;
 	}
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-		trgint = 0;
-		break;
-	case PHY_INTERFACE_MODE_TRGMII:
-		trgint = 1;
+	if (interface == PHY_INTERFACE_MODE_RGMII) {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(0));
+	} else {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(1));
+
 		if (xtal == HWTRAP_XTAL_25MHZ)
 			ssc_delta = 0x57;
 		else
 			ssc_delta = 0x87;
+
 		if (priv->id == ID_MT7621) {
 			/* PLL frequency: 150MHz: 1.2GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
@@ -441,17 +443,7 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 			if (xtal == HWTRAP_XTAL_25MHZ)
 				ncpo1 = 0x1400;
 		}
-		break;
-	default:
-		dev_err(priv->dev, "xMII interface %d not supported\n",
-			interface);
-		return -EINVAL;
-	}
-
-	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
-		   P6_INTF_MODE(trgint));
 
-	if (trgint) {
 		/* Disable the MT7530 TRGMII clocks */
 		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
-- 
2.37.2


