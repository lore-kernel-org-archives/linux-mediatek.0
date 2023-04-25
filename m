Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5878C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9apq9TPQdd3PTXsAONZD+3EUXt2FjfI3dHgVxl0ILg=; b=d6zaC2Sjxc+K1j
	2VMchj/C/XId9V9vCJFm7Si0pJHLfmldQr2uXs4dqC69Dg3ydXQtojw+QgfC+D206OEDNNkfiYCKr
	OUUkklkVcmL0RfrSp25pE3t8lE+UpsvQekYkACirPixgCgysG/r9VETW0OWj9wjrC7QuMqb6qa9Xj
	vXq80C0LhUnBnLTvzYpNtC9nE8yL6ng15Vfc1bbaMgaV73gVOWFEyaOQuFRDWvQPjCWf1Mf/1GUOD
	LdQGZJWu3/052KD+PcQyLkyN9nULiKX5sQtQwZ7LR/RU9zCb7v25RAFJTm1MEZkKY74SIOMalLILV
	oa7eNzwbXY4Hxl/YRpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE49-000Uqs-1i;
	Tue, 25 Apr 2023 08:30:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3y-000Uhg-31;
	Tue, 25 Apr 2023 08:30:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5083bd8e226so8326189a12.3;
        Tue, 25 Apr 2023 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411413; x=1685003413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9apq9TPQdd3PTXsAONZD+3EUXt2FjfI3dHgVxl0ILg=;
        b=khGbo/D3U4zjnhtXvx72p4G9/VIdgAJBg3sQ+BZEAj8FIaLLZOejHV4kfL0xfLgp3P
         +Q4C7ap98BO/vC15GeppFmhhuc7LdsLwMvXvEeYiBXpUhCEcVGGtOA5BJmvXasi2J/ie
         NrP4viOHV7VoMvoU90Hx9lJ4Ql50hiNZ8Saae/W2fPKefRA/FVfml5L2+edJ6O0fyFoL
         mBNeZJuQ6mVOMpgczpuy7NytPz3JhRur/WLIrU2hDnEoUlVr8Bf7W4x4yoBRPXig2zrk
         4wptCICRUQrU8SC5BgKKNz/vOXsF5nHaymBwKmnrw4sHIYnC9rMvJzBpR5NgHG7Z6fns
         gz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411413; x=1685003413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9apq9TPQdd3PTXsAONZD+3EUXt2FjfI3dHgVxl0ILg=;
        b=NSEbthlAwHkTy+TDuw4Of4G9oWooX8jZRXgz2mJY0MfoA+UM8V0XfYrmz1ZNciE76A
         ovVAp32CWrz2VudqgUrUr7PlFpSYDOgWGH2wWdKUcM2yTSS+MdjsJ/OJghF8Vj5LqE8u
         5FOdUxzQrw3GQcZfacS4lUCcXqg0EJfMeETWgWwv9joZ5Z1noxloV3TnAGnUfE3U7Ly7
         78TMv3N+AIvPe7AEjEv38jyMwaN607NLdSKjSMM/GL84rg9XCOwR5+Do2irValPSCsHV
         EOOhDVORt1YlBKD12OODi+q7DD1vq5nJLeQJ9sVt3ahdajPUsP250qKlUIGDFOCzavkx
         V1IQ==
X-Gm-Message-State: AAQBX9fCLKn7/XvFX5c/2Mg7zz4RBfBpEdZOI2xg2zxXn7f/RiTIfVOT
	RshMFT+5TlcgPdQJagkYJw0=
X-Google-Smtp-Source: AKy350ZGqoo7GQeeSp2dqHa0n4V/z6iMCriDHZWhEtsodzBDMBu5CtUVKtp3P5D8vndAWw6eu4s3oA==
X-Received: by 2002:aa7:d511:0:b0:506:84e0:a78a with SMTP id y17-20020aa7d511000000b0050684e0a78amr14370575edq.3.1682411413624;
        Tue, 25 Apr 2023 01:30:13 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:13 -0700 (PDT)
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
Subject: [PATCH net-next 09/24] net: dsa: mt7530: change p{5,6}_interface to p{5,6}_configured
Date: Tue, 25 Apr 2023 11:29:18 +0300
Message-Id: <20230425082933.84654-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013014_987106_4A35A0F6 
X-CRM114-Status: GOOD (  17.68  )
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
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 19 ++++---------------
 drivers/net/dsa/mt7530.h | 10 ++++++----
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5ef348b6a4b2..aab9ebb54d7d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2237,8 +2237,6 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2454,10 +2452,6 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
-	/* Let phylink decide the interface later. */
-	priv->p5_interface = PHY_INTERFACE_MODE_NA;
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable PHY core PLL, since phy_device has not yet been created
 	 * provided for phy_[read,write]_mmd_indirect is called, we provide
 	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
@@ -2727,25 +2721,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2853,12 +2842,12 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
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
index 2602c95fd3a5..06037be5882c 100644
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
 	enum p5_interface_select p5_intf_sel;
 	bool			p5_sgmii;
 	u8			mirror_rx;
-- 
2.37.2


