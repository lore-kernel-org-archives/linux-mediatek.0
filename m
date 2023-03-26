Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3252C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE6q6p+dFTrGAKyKj7RnvQhsdIZfEftFuQ5+sKNAZxc=; b=q+lXI3ZX1ugkiO
	KZztC0UBMT5jZJdRgEspjReld4d3YHy3Rnqf3bb/aAu3d8L3R5TiGhjOZ+P6KgzoKdl3RUENEQ9tG
	j3NxzUl+yRBaHTNWnDnJ3Ft8nEZlVN1SAzUDZZEywJBr/mKWvBbqHcmK/5+0jgKXHmqtjod4DpEr9
	Ecu+THC80Y/KmHHOhOy71zLfRUuliT6SjP/5ZANgJdqON/ak1N/CThpbExtec1z5URGue5i5pjQNW
	wMMGk00lMtl4f0El+rDvc8j/mSXU7EnETr+dOGiffY3QyW+/z5B2SF1Fh+yMVkI4EP++9XxCfavU0
	hR4omUU4z7RjKkcaBDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3h-008Vll-0s;
	Sun, 26 Mar 2023 14:09:21 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3D-008VUT-0W;
	Sun, 26 Mar 2023 14:08:52 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id jl13so5053893qvb.10;
        Sun, 26 Mar 2023 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE6q6p+dFTrGAKyKj7RnvQhsdIZfEftFuQ5+sKNAZxc=;
        b=D76MU+xeNJzZVMvqN9aEJ1ImGKcrDzJVZlZFme9Q3QdJoQ9B/u7bQc2xY9xU4pKoT1
         tb7z1KGlHTGabEi5HyvKL8Br8kcZSf+lUmoyZg6wST2TKSwEC4kmk+/L5CtVekjC1imm
         IUtcob0hiVfbBhjPkFtS9NHg0mlLRyfeyJ6tWab6Qw9U0nDQZSsLQMtu3ABd3+Rc1iZ0
         x0p9R9twv0stKHFHlOuGHkolzkdxQFW+G8azSKEMkD9srJqFvgj6Xzna9Z1zVzPNyoZX
         W5gb5hvef0MtcoE9/8m8O3/ZWF1CixamuO1WSS3fFlmnTzC9N9kzCatkBY66YwFUy+Hu
         O3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE6q6p+dFTrGAKyKj7RnvQhsdIZfEftFuQ5+sKNAZxc=;
        b=Pr7khd1OEkXMdHTFQHvOhSMXpz44KFUTZneYFLjut8gayzA4iBbB0J0Sn9vQb7VPpT
         ZrVGd8SQFAm4J1fXAuI+JvK178HJLe0vWf450pI/z4DAksu4fRo2NtA5TBqkq/EBhmO3
         NjTLI8FlYIvhUMn+CC/H9o2ja+YrLrpvqEY5tYccP07cSJ07P38mw+iKPlz9y2KwG38k
         Zbm2isIkOLwL5WLjnFsNlDfaqcVjaSomPOHeRRPo+b/vvI1Tf0mwqjKBHVVw2v0NNd3M
         +ZQDbGqD5p427vLEDF6nL/7iW5RV4ji4WjUHpioRzw/cNSxLnqCyHD0gB3U5EuujvnLu
         VGKA==
X-Gm-Message-State: AAQBX9dy2fZQXB7txjebGaAGLycKTMACFlkWbYdwNVZqt5BLG6R8Syr9
	MlZnbdxblGEbC+JwdpnsOSo=
X-Google-Smtp-Source: AKy350ZXYJBESOoxkQUOuwbRFbnXJKrJen8y5qornJklJSyCE/pS7djMghLwkglOYXW7p2HrKG/5HQ==
X-Received: by 2002:a05:6214:29e4:b0:5a9:ed32:1765 with SMTP id jv4-20020a05621429e400b005a9ed321765mr14734612qvb.23.1679839730704;
        Sun, 26 Mar 2023 07:08:50 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:50 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net 5/7] net: dsa: mt7530: set up port 5 before CPU ports are enabled
Date: Sun, 26 Mar 2023 17:08:16 +0300
Message-Id: <20230326140818.246575-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070851_203132_179DE262 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Set priv->p5_intf_sel before the CPU ports are enabled.

This makes sure the 'if (priv->p5_intf_sel != P5_DISABLED)' check on
mt753x_phylink_mac_config() runs with priv->p5_intf_sel initialised.

Set up port 5 for phy muxing right after priv->p5_interface is set to
PHY_INTERFACE_MODE_NA.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 76 ++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3deebdcfeedf..2397d63cec29 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2209,44 +2209,6 @@ mt7530_setup(struct dsa_switch *ds)
 	priv->p5_interface = PHY_INTERFACE_MODE_NA;
 	priv->p6_interface = PHY_INTERFACE_MODE_NA;
 
-	/* Enable port 6 */
-	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
-	val |= MHWTRAP_MANUAL;
-	mt7530_write(priv, MT7530_MHWTRAP, val);
-
-	/* Enable and reset MIB counters */
-	mt7530_mib_reset(ds);
-
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
-		/* Disable forwarding by default on all ports */
-		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
-			   PCR_MATRIX_CLR);
-
-		/* Disable learning by default on all ports */
-		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
-
-		if (dsa_is_cpu_port(ds, i)) {
-			ret = mt753x_cpu_port_enable(ds, i);
-			if (ret)
-				return ret;
-		} else {
-			mt7530_port_disable(ds, i);
-
-			/* Set default PVID to 0 on all user ports */
-			mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
-				   G0_PORT_VID_DEF);
-		}
-		/* Enable consistent egress tag */
-		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
-			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
-	}
-
-	/* Setup VLAN ID 0 for VLAN-unaware bridges */
-	ret = mt7530_setup_vlan0(priv);
-	if (ret)
-		return ret;
-
 	/* Setup port 5 */
 	if (!dsa_is_unused_port(ds, 5)) {
 		/* Set the interface selection of port 5 to GMAC5 when it's used
@@ -2294,6 +2256,44 @@ mt7530_setup(struct dsa_switch *ds)
 			mt7530_setup_port5(ds, interface);
 	}
 
+	/* Enable port 6 */
+	val = mt7530_read(priv, MT7530_MHWTRAP);
+	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val |= MHWTRAP_MANUAL;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
+	/* Enable and reset MIB counters */
+	mt7530_mib_reset(ds);
+
+	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+		/* Disable forwarding by default on all ports */
+		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
+			   PCR_MATRIX_CLR);
+
+		/* Disable learning by default on all ports */
+		mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+
+		if (dsa_is_cpu_port(ds, i)) {
+			ret = mt753x_cpu_port_enable(ds, i);
+			if (ret)
+				return ret;
+		} else {
+			mt7530_port_disable(ds, i);
+
+			/* Set default PVID to 0 on all user ports */
+			mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
+				   G0_PORT_VID_DEF);
+		}
+		/* Enable consistent egress tag */
+		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
+			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
+	}
+
+	/* Setup VLAN ID 0 for VLAN-unaware bridges */
+	ret = mt7530_setup_vlan0(priv);
+	if (ret)
+		return ret;
+
 #ifdef CONFIG_GPIOLIB
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
-- 
2.37.2


