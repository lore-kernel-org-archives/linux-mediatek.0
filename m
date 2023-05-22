Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E2C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09nd6fTFveBIw7H/yL3o+Sjulkglg9M/F+8IUrvwpII=; b=K0sOrOR7hWquPr
	DsDEgsEFc0/lOXeXfhEUzWHuW3UvUiaXU9sZya7R4ZlPs5liUI3J79dN3OF2aIvMwZO9AYVNwKgeb
	XJyJRVO6WSmH0oxXTL7EHXVrT35r4qwgnbvQ8B4n9w5OiNijJPb3hBlv/nbzfmHg4Z5OO+FjK+WZM
	bKgQPCEjGQDclBxi9e6NKe0WjGROfApbGNT0mnAr5ZerybgtAO4GGQF/ZJMGkvet5um43RPPI9v3V
	eTOm+djlIl+0GJWOoDx6x3Y9/W4fey+2twSCbe+sDz/SOKEzPKkso+sY9VgQ+GH+Kr/sIm20dZYuh
	Fo/NS/SNsWCbVzwYAMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q15cA-006fZe-2n;
	Mon, 22 May 2023 13:30:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SQ-006P0J-1S;
	Mon, 22 May 2023 12:16:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-969f90d71d4so899910166b.3;
        Mon, 22 May 2023 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757770; x=1687349770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09nd6fTFveBIw7H/yL3o+Sjulkglg9M/F+8IUrvwpII=;
        b=EnpEKFtOllWOIegh28dhFbPOFH/HrmzaHge/LOuCS9HUToi39rBRx2FNGrAZcvXM+T
         AZlW3o1QfFyb6Clgw1RJYXfBrM/2yqMfVl9DG6qebBEI4sSdIEhb1rcYxRvMiakpB4q4
         z07RkUSOb45BSrnYSg9fCLSyXOMFCykMXAvVb07Evbl7MkutAW3kWDtvUvo2mfC+yzht
         HyMDIGKR8mlinmJYbV9bxGWQki9RmN9IvFKg3V3i3dRhOEoNoetIJJddkAxA2svnfG5O
         FPWs7km3YkEBZqSg/eNKj4NChquNnmOsaiQ/3+dZfAZkM9crRMBhqymCeYX4APL7opEK
         HBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757770; x=1687349770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09nd6fTFveBIw7H/yL3o+Sjulkglg9M/F+8IUrvwpII=;
        b=RV87PG4+fGu4CMS0+JVLgWgsFK85Sh+l2BI/u9zP3tLflLqa/CCJeG+U20KFwugPtK
         qT7iYpL86aE3ueP18tOeXNfOL6dRYYm43tYAnfVNohMbRzmVso099w31lpCiLvBvjzdI
         A48ji4PpzPVdkbtZHxmQq5Y1aIISMwhwTSzcEbFu6Vff7RfDw5NVWeK//C5rDBZ5qxga
         1439KT5+B6qiQQeAU+uSn0OcroStl0ylpZ8lLGlnuJPg/tgjSGmG/LoKIixBnvevUzst
         r4dxGP92utszsQp+4NYWCogxNZ3UIQkSo0VA/tHiqJD2G6E8uopk+1vxyuXEa30h1qek
         /2VA==
X-Gm-Message-State: AC+VfDy1kPQuHb3sumElXNnx3DEjVidA6PCbEytWx8bG3bzcl90h8J/3
	rzJ8IzDNvW90QWHvxSqBfEU=
X-Google-Smtp-Source: ACHHUZ5hU+NOmEAdAFMlajNG3Yg1qbkVUC8BFFF3ClhNmgfBkSGyllIYy5W5FEVql6P6xiR8IV0xfA==
X-Received: by 2002:a17:907:7252:b0:970:c9f:2db3 with SMTP id ds18-20020a170907725200b009700c9f2db3mr1169157ejc.5.1684757769819;
        Mon, 22 May 2023 05:16:09 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:09 -0700 (PDT)
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
Subject: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface to p{5,6}_configured
Date: Mon, 22 May 2023 15:15:10 +0300
Message-Id: <20230522121532.86610-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051610_509800_80B9CACF 
X-CRM114-Status: GOOD (  17.00  )
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
index 710c6622d648..d837aa20968c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2234,8 +2234,6 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2455,10 +2453,6 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
-	/* Let phylink decide the interface later. */
-	priv->p5_interface = PHY_INTERFACE_MODE_NA;
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable PHY core PLL, since phy_device has not yet been created
 	 * provided for phy_[read,write]_mmd_indirect is called, we provide
 	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
@@ -2728,25 +2722,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2854,12 +2843,12 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
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
2.39.2


