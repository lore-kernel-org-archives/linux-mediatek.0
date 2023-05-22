Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D40C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVScU3zTASH0j+hzCtGsuJpxvVIRAa/zOAQpgtqJqxM=; b=hbUYADoN5Jxg5B
	80jB1olK9hMCYJ5HKwWd4MLU24Cn/1eb8/F+eIjFkGNbFtNAVEKtCG8A97Bk5/C2q1Q0OLSileieT
	BjiOCs5tRwg6z5hHttFVnGAkMrtxEwWV9WNpSMKIzRev2K7HnsdDMBKv1pRYyekpKC/gw9R4PBlbi
	Li5m1NyQzaJioMZeFh4BgmW6xOnL0gBkuRpS9BKzfkU5ZH9xaT8E8/PhNzoyXbNBuslWcuLwX0qZN
	3PiGxvv1dNfbnxIUq66XGmSddiC9ypL6uq9aMLJZPgkkBJXrTYJKChyBZVDwhtS/wG1lYjmEMIhq3
	HcZ0zSC0BS1Bc7nrWzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sl-006PJt-0D;
	Mon, 22 May 2023 12:16:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SL-006P2I-0J;
	Mon, 22 May 2023 12:16:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-510eb980ce2so6796008a12.2;
        Mon, 22 May 2023 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757764; x=1687349764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVScU3zTASH0j+hzCtGsuJpxvVIRAa/zOAQpgtqJqxM=;
        b=m/51O7eeNxXRxZobtDWnfuSbXiWtJSC0wvV80vnFvNFADKAIc79e3DbvcYWkIX0Es+
         lnG2avO/BMV0hllT+W42afHz3Bfan3SuBZjmKwuHvMgw9DE6OpI616Dbct9VIbmpguXz
         SGWfkJXGT1JURJ/lAVs/9MQLC60uK7NeuICC0FWMcbqxceDzDm05F3x/a2JbDZ9cnoWg
         42E4NzsRza43iy8ttDxLLC9XImCHDBq2LjbXeeh8i97UidmlBVnDMNYFho7FWe1F0ASd
         kE+JSZ5hkRl5iAM2m1hCfCw4Io260THp2c2D/KMV6Mm7ebSiTTyFRlxmJUr2jHvokQsJ
         xgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757764; x=1687349764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVScU3zTASH0j+hzCtGsuJpxvVIRAa/zOAQpgtqJqxM=;
        b=Lwf3E86VkhJMoFsLuMmeX2zth3BlN5BSr8dmZ8cQTiVIB1LI+4Q8aBFC5knBkrSBEi
         xQL4jw2Ek2lPk0jiHasqaH0D4DKfFQS9EuL9jzCoKVDpx71dBKZmu/FfZExmwWuaFilA
         R5RZLaJqHwmvZfv18r0plEyK0KT7VHMKtIiBjXdu4GKmXqg64JvvBpmmJd2IAArcijZw
         EA1+NM5uA0FjEJredymNz/TH2lLIzLeJ6bscevTMemHaqR4JZVQ4aEUWgbWcb8V2LPyO
         C3l1/R8EgWozeIez3XZy79dlU5m/h3Lw+/8EXw8gHkLhLLOk7qvA8NT6WOFcIWivMqF7
         ay4g==
X-Gm-Message-State: AC+VfDwm5ED9/BcAoD+KgHiZ8k9y6vAitOLHUCo/IgB7r/lqWgTc0tW/
	T1HkyWQhzIqZ6mY3/rRG7gA=
X-Google-Smtp-Source: ACHHUZ6nI3Y3aSr0F4aJBr62iBc2SfSRXIfMW/88mqvOgFDT7L584mwB8aklUVOYhZxsTd11d+L5jg==
X-Received: by 2002:a17:907:7e81:b0:966:3114:c790 with SMTP id qb1-20020a1709077e8100b009663114c790mr9442040ejc.37.1684757763663;
        Mon, 22 May 2023 05:16:03 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:03 -0700 (PDT)
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
Subject: [PATCH net-next 06/30] net: dsa: mt7530: improve code path for setting up port 5
Date: Mon, 22 May 2023 15:15:08 +0300
Message-Id: <20230522121532.86610-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051605_135405_D4D1D940 
X-CRM114-Status: GOOD (  19.35  )
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

Improve the comment which explains the process.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1a842d6fbc27..b8f159afcd45 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -965,8 +965,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-	priv->p5_interface = interface;
-
 unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
@@ -2274,16 +2272,15 @@ mt7530_setup(struct dsa_switch *ds)
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
@@ -2314,6 +2311,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2324,8 +2323,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.39.2


