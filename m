Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D7BC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me/5070ACKIQU4J+v2mhTC588oNjGg5pGKAJrtCPvhY=; b=jV3bF/P044PTkN
	3AJ9u/lyC5r1qA2ZfXqcLYKWIwGyMb+DSyq6JbwQHnX/xfCsSTKBmfRmgV/RQktlM7uc8o6ZjwHpy
	fYI7ZSQXdNWCBwEmJKhv3/+eED3FS20EkdQk896lIIJijkbZKy4xHTeoBIDSmlzGOpubUJ5ipsrCM
	aIOSReYzkjeTknXDGu/A6G7jV0+xnCREHs7xPtGchlvAreUPlC2wgf+OQKO34JQbXsaQlpiduk+8f
	udZO3Or7n+81rs4DevTbZYnbqJzH9BC6wC+dRT//D+mr+1uf8nyB8MBYCc7XPwSv7+MeTxGfuNhmP
	/g0nLdpLpRIG9f0Sle/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF0H-000e1C-1Z;
	Tue, 25 Apr 2023 09:30:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3v-000Ufk-1L;
	Tue, 25 Apr 2023 08:30:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-95678d891d6so958020366b.1;
        Tue, 25 Apr 2023 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411409; x=1685003409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me/5070ACKIQU4J+v2mhTC588oNjGg5pGKAJrtCPvhY=;
        b=cS6Oz6YVZPKIdLSoVVLMCRnoc3D9cg0nE5K2dSxoqeBYwOLJI8Myz0/aCi5MQ09y/8
         Bb9RBY+A67uEvB0HET36vE6K/F5516P1DFSUfZAfa7vIB7700QZkjazhffGKQSuPQxM6
         78r5Hy0OziBGPmgLs8Xg2mQjI9t/iNu/TIRTctJu4pWqAzHOxJvzzW/x8BuiBPejmr8b
         cI1PKZWSDNNzk7Pq4A5X5lkWiP4UGeXABIzLOh/lP4Cobxr9VO+ntWO7ghvoOBYV8WkL
         U5DaUD2qaf2wDZs53Sg3IEB7NXya1tX5hyKc5TUzzc/e0/MijhrXxOw3c47Z3VFRUo41
         Eu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411409; x=1685003409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me/5070ACKIQU4J+v2mhTC588oNjGg5pGKAJrtCPvhY=;
        b=dl1E9BGRqv3Tb0pWfxwfw78YiZXx6Wos63fCnzZbT3BKu4C+jzaIPA4fVUpvCYBI1K
         MBnQjt6LCoIoahOvgOYHimiG7o/T2kOG7UTatFz/1dcXBGHa9gmt+8wk+TfJhJJHUyJR
         6BGWWwc8+qcp0TYBs/DYVGYlF7a8KBoSLNASDCNd69aBcMrbhqNIHwjiQvVirxIMjXJL
         HNIjsdCvpkn+qrHl1GSpW2BrLOGHoQaDIGFxcY90YA6ZaRm11KnO0c3ewRvqgVf7XLCC
         ddm6/nSuIWa4yqYP2h/FQlgNxfu2NEVQwnYoARlSy22YqJNYU1EKevRKkR4vt82Lf2Zh
         KsYg==
X-Gm-Message-State: AAQBX9e9B1K7phIevRqFKnrTURE47YHlGFl+J1nPyPIvOY4kNiPaGWw/
	ULX0/EfheLFTqXkMnphwzZ0=
X-Google-Smtp-Source: AKy350ZxsjzJSESr4bMyY+44vc6B2jumt24xvk4np9MIyL9T8ndSUBp+t6EzrMaq/uws1qhkGbLA1Q==
X-Received: by 2002:a17:906:ecac:b0:94f:6218:191d with SMTP id qh12-20020a170906ecac00b0094f6218191dmr12652278ejb.32.1682411408919;
        Tue, 25 Apr 2023 01:30:08 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:08 -0700 (PDT)
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
Subject: [PATCH net-next 07/24] net: dsa: mt7530: improve code path for setting up port 5
Date: Tue, 25 Apr 2023 11:29:16 +0300
Message-Id: <20230425082933.84654-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013011_459166_3D5FB809 
X-CRM114-Status: GOOD (  19.91  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

Currently mt7530_setup_port5() from mt7530_setup() always runs. If port 5
is used as a CPU, DSA, or user port, mt7530_setup_port5() from
mt753x_phylink_mac_config() won't run. That is because priv->p5_interface
set on mt7530_setup_port5() will match state->interface on
mt753x_phylink_mac_config() which will stop running mt7530_setup_port5()
again.

mt7530_setup_port5() from mt753x_phylink_mac_config() won't run when port 5
is disabled or used for PHY muxing as port 5 won't be defined on the
devicetree.

Therefore, mt7530_setup_port5() will never run from
mt753x_phylink_mac_config().

Address this by not running mt7530_setup_port5() from mt7530_setup() if
port 5 is used as a CPU, DSA, or user port. For the cases of PHY muxing or
the port being disabled, call mt7530_setup_port5() from mt7530_setup().

Do not set priv->p5_interface on mt7530_setup_port5(). There won't be a
case where mt753x_phylink_mac_config() runs after mt7530_setup_port5()
anymore.

Do not set priv->p5_intf_sel to P5_DISABLED. It is already set to that when
"priv" is allocated.

Move setting the interface to a more specific location. It's supposed to be
overwritten if PHY muxing is detected.

Improve the comment which explain the process.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 98ef5ba0b19b..f3d238a46543 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -968,8 +968,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-	priv->p5_interface = interface;
-
 unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
@@ -2277,16 +2275,15 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Setup port 5 */
-	priv->p5_intf_sel = P5_DISABLED;
-	interface = PHY_INTERFACE_MODE_NA;
-
 	if (!dsa_is_unused_port(ds, 5)) {
 		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-		ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
-		if (ret && ret != -ENODEV)
-			return ret;
 	} else {
-		/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
+		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
+		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
+		 * is detected.
+		 */
+		interface = PHY_INTERFACE_MODE_NA;
+
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2317,6 +2314,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2327,8 +2326,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.37.2


