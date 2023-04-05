Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61548C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=; b=jQXzxWcDESfX0J
	BtGm7JjJeIYyEEsv0MvZ/6n+C+IHNjMVlsLT3X2Ua2FU91qK9G3iPoTLTPkPF/v5PYUMkEEFhxyBU
	xAepWQ7nM2qOv/dHe1EzXJfdjWZmmPe8GaPb3AYDmHDkzU1EZ14DA0yb3BQfEyzMvnx14VtIVe5lW
	o+TExCza3mjrpuX/3rEghw0azXIA/bp1Y/7jFq6D1a6xLuwq+CIgBfp5PX78JtEz4qURDIdIaRLep
	3k/wjHo/4k2GdcPXjLFa3ETqkaR/Spf34/sOyE29sbYewI8xWaxzeM5BI/ZeH6T944hFvarDcJ9Cr
	hyUt69aaLhYoiCoGz48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9ua-005e0m-2L;
	Wed, 05 Apr 2023 20:39:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uU-005duM-30;
	Wed, 05 Apr 2023 20:39:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso1807726wmo.0;
        Wed, 05 Apr 2023 13:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=;
        b=NUID/3SHB8/f+dsCCRs5NOhEKlRmrlvR2/gaqz0uFHfg2i3hGoPFFRvyStNoW5zZkN
         j74ycpuzomX5x8hkFK5YWIy/PH0kwIym+LGPQs5CamG9sLVkgxj6CsgVsuYlHRcpuAgW
         8RegMLEEuzEG+IhhH4sduPF5eui8RBTNC1RD/Kq3aVNMC6XKTRIUeG4GloBaRenVr5rK
         XrMPvb7cAUCOaOtNJwUCKqXi7uakx3i0aI7WvsDgLeqao/1SERRg3T7ze3cDRd8/3opu
         wbd4Foh6bmsdiFMEzpfmZP1w4v27qNFMb3N6QQdbuvSK4DjFU/K7SlxgY4403yAGJfU4
         rP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=;
        b=zbEXRvZJWV3rsfjQWTDOEKD675gcgFix0oz47oI0DEHBWN5kCtlI98Dn90E42g81tL
         JeA6sGvKyIZNYmZ68S3Opz7OBuBxnETl9c7xatJlnRlCoMMxZJ/PqC+gRD6vVwO/scIP
         uPAuU31ldffD9KL4aZqJw+tGo0o1fuzHAgg3P66ux6HJNN0kLLIaw5/5jrGmI8S9+Uv7
         p1F6ieugWfsOFD7+k16HCBhHZqtaU8cIgPErBpQnJ76+YljkBNBeL4r+MvW1Nida2/z5
         r9Y7Nn0yjh2VPsOcUurLfQRd4Y4CRwuoQHfx45q0p7U0aUeooatGny2S8QpfUL4NNWyl
         QFrg==
X-Gm-Message-State: AAQBX9efhQJ8xgXCoaHf3zJvE2rbSghquJPBz+7KoHsCVSCJn37OblwO
	XsfaPSVLg42xX/o66kbBaP4=
X-Google-Smtp-Source: AKy350aOeNQ6tfVT0puoI7gxpg+h3SrBvwott00D1EYZCsPwaLM92MH+du16UkzqJTfoUgzlflZlpQ==
X-Received: by 2002:a7b:cc84:0:b0:3df:ee64:4814 with SMTP id p4-20020a7bcc84000000b003dfee644814mr5232090wma.20.1680727148705;
        Wed, 05 Apr 2023 13:39:08 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:08 -0700 (PDT)
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
Subject: [RFC PATCH net-next 02/12] net: dsa: mt7530: fix phylink for port 5 and fix port 5 modes
Date: Wed,  5 Apr 2023 23:38:49 +0300
Message-Id: <20230405203859.391267-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133914_969320_C89416FB 
X-CRM114-Status: GOOD (  19.73  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

The first code path is supposed to run when PHY muxing is being used. In
this case, port 5 is somewhat of a hidden port. It won't be defined on the
devicetree so phylink can't be used to manage the port.

The second code path used to call mt7530_setup_port5() directly under case
5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
new hardware"). mt7530_setup_port5() will never run through this code path
because the current code on mt7530_setup() bypasses phylink for all cases
of port 5.

Fix this by leaving it to phylink if port 5 is used as a CPU, DSA, or user
port. For the cases of PHY muxing or the port being disabled, call
mt7530_setup_port5() directly from mt7530_setup() without involving
phylink.

Move setting the interface and P5_DISABLED mode to a more specific
location. They're supposed to be overwritten if PHY muxing is detected.

Add comments which explain the process.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 31ef70f0cd12..a00aabe4987e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2288,16 +2288,19 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Setup port 5 */
-	priv->p5_intf_sel = P5_DISABLED;
-	interface = PHY_INTERFACE_MODE_NA;
-
 	if (!dsa_is_unused_port(ds, 5)) {
+		/* Set the interface selection of port 5 to GMAC5 when it's used
+		 * as a CPU, DSA, or user port. Let phylink handle the rest.
+		 */
 		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-		ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
-		if (ret && ret != -ENODEV)
-			return ret;
 	} else {
-		/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
+		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
+		 * Set priv->p5_intf_sel to P5_DISABLED first, then overwrite it
+		 * if PHY muxing is detected.
+		 */
+		priv->p5_intf_sel = P5_DISABLED;
+		interface = PHY_INTERFACE_MODE_NA;
+
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2328,6 +2331,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2338,8 +2343,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.37.2


