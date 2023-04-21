Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B36C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqdViajAeNRKoM+fdqJjjwXsteiyCgJeOZmgusmlzx4=; b=kFr3TuYXhwxb0j
	hdBaBF5jERxLl8VFppgi6TJ0pDMbDGyVxbOXYiEgH5YN0ZpzxmaE/lA7xFe8zla9JaTVBJomLV2xD
	4HSgrR3maMzee4dK+KU2c9XT3mLxY3y4pa9j/CTlO8gd2eDioO912lQLPAgpUjnOwDytu2bnQCTD9
	2hVe4IrqiSTt1NWLNUI9JdjAoUkRaFZ/iJ/eESf0XrPr0S0yK7qEouSFQOF9nsQuIAbZDf+egWtO0
	UqmHAizaSOBmpe+lsKyR6f7Eyhv+P6jMZRkL3dBcvSWKeO1q64Wq11RK+pWTcfZW9GZzpetqacHNn
	HjOMUmOtkozKIVTuiwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtx-00B8DT-1k;
	Fri, 21 Apr 2023 14:38:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsw-00B7Sh-2t;
	Fri, 21 Apr 2023 14:37:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94eee951c70so250017966b.3;
        Fri, 21 Apr 2023 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087832; x=1684679832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqdViajAeNRKoM+fdqJjjwXsteiyCgJeOZmgusmlzx4=;
        b=Dg80eefg4baD6Cj47D57vpBsiKF6d5o7WWzYvZ3aouHw/GUuVslih+JSx5ay1XFeIy
         M82YmVWKmCFIDuE/rilLhKwuaUaBOQPWzQstA7BDz6kGsLdQTQQMmVaDuCrfoAn27Bx3
         DOParXeqagyhjSNTuWSKYBPbOLwbGS6MYx++RZHJvW8amQ1f1sCNc4dQhH7x3eE0MXDF
         B/rUMIXebo2VzzbV4AbASrA4l3ImcoTVY1flXg4qEY2tgO8WKFppGP0Sowouzqseuq16
         Cn6Wb/UyXitsxZzfcQv4zqmzLRSrt5WH8Y7ypwkygMJtQVF3hYn38STGe/A6/We9KDqf
         X7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087832; x=1684679832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqdViajAeNRKoM+fdqJjjwXsteiyCgJeOZmgusmlzx4=;
        b=AFIQk3gk7Pub9apQPzbeb7Rs2Kj6N9gaLKu3vqort980va3EIpj/KIg875lOEOzIDu
         P/LkQtPmIDcQDvtzrEjks76Lk/ziT0DoUraVtdF8jbCY65yO0qIVSZ+lQ6dQGlABsp0O
         H2WQivBXQ12Y0BduEDS9xZUsqf0X9/0gyLQKbWYNnLfJVXy1FbWgvkbcgkSR27288Fcm
         E8RP6dnB1AjhUrIreboWb3CO3DIP5iu1SNbE72VlykiTzqIljWdgtz1iY4s8Bv8t2AqT
         Sz3gPSjrbePTNUiEcawpnOVOPTbcwiz8tkIfBikLmKUCyyEGTeQ/+U6sxnRzJoBKc0Hb
         IurA==
X-Gm-Message-State: AAQBX9fMgZs32T5+Vbi1I/p1L7pV+WDuId7QIfFvsOpyZMN9PY6KbLP+
	llVvDsAzm2Djlt/ZvsD5irY=
X-Google-Smtp-Source: AKy350ahf3obWs94ix/YXjEXuZI1y8KeY5KkZOuNplbHTOqwHwb07LMntJ96k+NtedAjVDrnzuuMpw==
X-Received: by 2002:a17:906:fcd4:b0:94f:50d:e16e with SMTP id qx20-20020a170906fcd400b0094f050de16emr2808682ejb.12.1682087832574;
        Fri, 21 Apr 2023 07:37:12 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:12 -0700 (PDT)
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
Subject: [RFC PATCH net-next 08/22] net: dsa: mt7530: change p{5,6}_interface to p{5,6}_configured
Date: Fri, 21 Apr 2023 17:36:34 +0300
Message-Id: <20230421143648.87889-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073714_973470_5B43C715 
X-CRM114-Status: GOOD (  17.45  )
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

The idea of p5_interface and p6_interface pointers is to prevent
mt753x_mac_config() from running twice for MT7531, as it's already run with
mt753x_cpu_port_enable() from mt7531_setup_common(), if the port is used as
a CPU port.

Change p5_interface and p6_interface to p5_configured and p6_configured.
Make them boolean.

Do not set them for any other reason.

The priv->p5_intf_sel check is useless as in this code path, it will always
be P5_INTF_SEL_GMAC5.

There was also no need to set priv->p5_interface and priv->p6_interface to
PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup() as they would
already be set to that when "priv" is allocated. The pointers were of the
phy_interface_t enumeration type, and the first element of the enum is
PHY_INTERFACE_MODE_NA. There was nothing in between that would change this
beforehand.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 19 ++++---------------
 drivers/net/dsa/mt7530.h | 10 ++++++----
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index bac2388319a3..2f670e512415 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2237,8 +2237,6 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2460,10 +2458,6 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
-	/* Let phylink decide the interface later. */
-	priv->p5_interface = PHY_INTERFACE_MODE_NA;
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable PHY core PLL, since phy_device has not yet been created
 	 * provided for phy_[read,write]_mmd_indirect is called, we provide
 	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
@@ -2733,25 +2727,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 			goto unsupported;
 		break;
 	case 5: /* Port 5, can be used as a CPU port. */
-		if (priv->p5_interface == state->interface)
+		if (priv->p5_configured)
 			break;
 
 		if (mt753x_mac_config(ds, port, mode, state) < 0)
 			goto unsupported;
-
-		if (priv->p5_intf_sel != P5_DISABLED)
-			priv->p5_interface = state->interface;
 		break;
 	case 6: /* Port 6, can be used as a CPU port. */
-		if (priv->p6_interface == state->interface)
+		if (priv->p6_configured)
 			break;
 
 		mt753x_pad_setup(ds, state);
 
 		if (mt753x_mac_config(ds, port, mode, state) < 0)
 			goto unsupported;
-
-		priv->p6_interface = state->interface;
 		break;
 	default:
 unsupported:
@@ -2859,12 +2848,12 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 		else
 			interface = PHY_INTERFACE_MODE_2500BASEX;
 
-		priv->p5_interface = interface;
+		priv->p5_configured = true;
 		break;
 	case 6:
 		interface = PHY_INTERFACE_MODE_2500BASEX;
 
-		priv->p6_interface = interface;
+		priv->p6_configured = true;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index f58828577520..c3a37a0f4843 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -745,8 +745,10 @@ struct mt753x_info {
  * @ports:		Holding the state among ports
  * @reg_mutex:		The lock for protecting among process accessing
  *			registers
- * @p6_interface:	Holding the current port 6 interface
- * @p5_interface:	Holding the current port 5 interface
+ * @p6_configured:	Flag for distinguishing if port 6 of the MT7531 switch
+ *			is already configured
+ * @p5_configured:	Flag for distinguishing if port 5 of the MT7531 switch
+ *			is already configured
  * @p5_intf_sel:	Holding the current port 5 interface select
  * @p5_sgmii:		Flag for distinguishing if port 5 of the MT7531 switch
  *			has got SGMII
@@ -767,8 +769,8 @@ struct mt7530_priv {
 	const struct mt753x_info *info;
 	unsigned int		id;
 	bool			mcm;
-	phy_interface_t		p6_interface;
-	phy_interface_t		p5_interface;
+	bool			p6_configured;
+	bool			p5_configured;
 	p5_interface_select	p5_intf_sel;
 	bool			p5_sgmii;
 	u8			mirror_rx;
-- 
2.37.2


