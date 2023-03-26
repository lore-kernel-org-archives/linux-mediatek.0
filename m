Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F0C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WREep/uFgN/eq+sZNlJgQLhID1K1IK3LPV9/PpCfqc=; b=diU/BJ0ZiolDYm
	hYCyBk9wlI/em0X33QiE47Pr4MFfjtamJE66bf/f9WTqT8eGN0aAE3/GbgLD+ZzNfBfZ3QlJkrS6G
	VEykmzHU/Ej/emeVe8+Suhw8olQ27Rx6KYfGHmTglw6IF03jo7zyAcv2dw4Jjb2uIrysquWtv1N2F
	BLbbIbmmYJ1xuv+hNKczvWb0qdbYXQVoYGbDHlZQDf+P68/TYuuYjY01T0pm9TtmcUYuiPj79CT1N
	ZOts441//jaTBRFJn946meAVUUm5hwZX9xG0og+UGL901uaD++ciLf+HoUSgbgbm+GY3OO+Zamu9q
	9FGM2Ttrp1mmifwP+2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3D-008VZe-33;
	Sun, 26 Mar 2023 14:08:51 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR2z-008VUT-1o;
	Sun, 26 Mar 2023 14:08:38 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id jl13so5053510qvb.10;
        Sun, 26 Mar 2023 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WREep/uFgN/eq+sZNlJgQLhID1K1IK3LPV9/PpCfqc=;
        b=Q2l7rBPanCOROqiRzww4lARkg9ZAg9Bapi3rbhQW/IkFYT837uziBPuG1BziEFS89f
         laRZiicNLo/9ulN9PV/DhIZY+mnS9gmbfDjvCF+Vz9eBnT5orhN/vfiMoh/VdZ34wQXh
         TDlbawItGu4+/5LhY8Rb6fv6TERsFcWxh8maWE35D4VJSIKePaqsgLnqwcHZOEWDKoCz
         OQAidwTXP7li7rERK7lO+UMePBSmIqrYbyJNG6D5ZVcaOgHBX7wNXQDWnAKsOJ6avYO0
         Y9oZ8oelx4wtuKkl8XHqph74loxHZeh5RtA+C+hCP7/AffrP6PtW+3sbFvpfMSozLmg+
         mEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WREep/uFgN/eq+sZNlJgQLhID1K1IK3LPV9/PpCfqc=;
        b=dF4FUKy40KpN8Uldt78EFLoba2//uuyFF5DGogiyKmmJL+zJHec1AaymC8UIgPPtaq
         UTOx1m+FZw0eEdzwAH8k4GiT7DZFx2YvIGbeMvVVIm4FdhqUXQpDXD7V1VzbiVaoVOHN
         t/3wQ87WKTczjSoqy5VnDNwc4QIusN7oAEWZVvc5HtUA7sURmuSYc5uoM8dTsAVrSt1T
         RwVgIoP7l2IoGYQ0FP3g+2Z2zRnYaspWkrKp9gqRurCSfRRNR+HsJOUIZqN5teN1cM3Z
         CRg+Li5R5NGwemA4oGgpXFqlhHA24Kaykbz2p4zGa86iXf6Iq+fYIcdR73MBP75qwb6B
         J8PA==
X-Gm-Message-State: AAQBX9fMimbg329zODGKC9PJB7XXdGT7FsY6A6M3lYikSQwpfnlTvXPA
	Dc/SKs/reK+oQraETfoj/pQ=
X-Google-Smtp-Source: AKy350ZS8/EBgNW/qhv77gSkv3ALYbhI1UnitVz4DKT8orb8a12B2BcJsnGRHFuhE51Orjd/Hx6arg==
X-Received: by 2002:a05:6214:c2c:b0:5aa:43c0:9cdd with SMTP id a12-20020a0562140c2c00b005aa43c09cddmr15287399qvd.45.1679839716258;
        Sun, 26 Mar 2023 07:08:36 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:35 -0700 (PDT)
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
Subject: [PATCH net 2/7] net: dsa: mt7530: fix phylink for port 5 and fix port 5 modes
Date: Sun, 26 Mar 2023 17:08:13 +0300
Message-Id: <20230326140818.246575-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070837_604158_F3FF082B 
X-CRM114-Status: GOOD (  20.03  )
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

There're two call paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

The first call path is supposed to run when phy muxing is being used. In
this case, port 5 is somewhat of a hidden port. It won't be defined on the
devicetree so phylink can't be used to manage the port.

The second call path used to call mt7530_setup_port5() directly under case
5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
new hardware"). mt7530_setup_port5() will never run through this call path
because the current code on mt7530_setup() bypasses phylink for all cases
of port 5.

Leave it to phylink if port 5 is used as a CPU port or a user port. For the
cases of phy muxing or the port being disabled, call mt7530_setup_port5()
directly from mt7530_setup_port5() without involving phylink.

Move setting the interface and P5_DISABLED mode to a more specific
location. They're supposed to be overwritten if phy muxing is detected.

Add comments which explain the process.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 62a4b899a961..eba356249ada 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2247,16 +2247,18 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Setup port 5 */
-	priv->p5_intf_sel = P5_DISABLED;
-	interface = PHY_INTERFACE_MODE_NA;
-
 	if (!dsa_is_unused_port(ds, 5)) {
+		/* Set the interface selection of port 5 to GMAC5 when it's used
+		 * as a CPU port or a user port. Let phylink handle the rest.
+		 */
 		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-		ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
-		if (ret && ret != -ENODEV)
-			return ret;
 	} else {
-		/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
+		/* Scan the ethernet nodes. Look for GMAC1, lookup the used phy.
+		 * Determine if phy muxing is defined and which phy to mux.
+		 */
+		priv->p5_intf_sel = P5_DISABLED;
+		interface = PHY_INTERFACE_MODE_NA;
+
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2287,6 +2289,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2297,8 +2301,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.37.2


