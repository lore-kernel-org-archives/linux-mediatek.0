Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10375C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npb7Ao9l/CLZkgjFezpnANfonUh9O2A/ZCJPtfUfMnI=; b=O0YIN8hO4lnSMx
	VzmHkk2H3XkQwzJCuLs6I0qV9mOsXCZuS9be7qKL4qw77T09PTFWV2O5RG0+V2k9SOwsRD14NAife
	iLVkv/dnkQQlVhLPPWl35D87Gl5485YR1PbUj3tJa85aUrvsO/13vdNfIkJ2e7oYaXuAutcfvDfPl
	JnmrGjqhPF8dPJ4LaRGtX5fetJaTTPM0X8hNk2NhOQMOY8NhUyvzQUbwd8nznQ9ouhEhW5KA+F0Qg
	T4hWbbTgoT+/DssMoEwd86bRr/vGdpIx6td+IdycvvTkCeN0EFsAlRhW/V3GRFXZj8XFhp83lB1qb
	4EAYD7qfNuOH0IXCSwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVs-008Sqe-2l;
	Sat, 18 Nov 2023 12:33:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVk-008SgM-0w;
	Sat, 18 Nov 2023 12:33:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2158E0004;
	Sat, 18 Nov 2023 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npb7Ao9l/CLZkgjFezpnANfonUh9O2A/ZCJPtfUfMnI=;
	b=U5+l9TZ+IK7Yr4bv4g7PNSGI+PdeW+RAX4GjrUWhyFECmwYBtD3svr2LibDejYXIC2ILmb
	uHzdGChysXMg0QlAyuejFx6heK9wGeYLx22o5oCNc/lMC/QyG9FCx8BbaA1wJgXfVsWs+B
	7skVxzBgdlefCDfkhZ/VlC7NTDbcPYNo04UrXmJVqdH8dcNmXewhboEAws8IDhOLWSWsL2
	9yDTKB2ilnc6GS3t4smTELZ9sq0334//12fMH11bkITtIQFrlpmdVCd9dVUMUKp15lRnuE
	YozDG4VvK1cgk90RTu9tdjmM+p0M3WAHOpVXI/Vf1WJiWyZfs8aAFQQIkszG7g==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [PATCH net-next 05/15] net: dsa: mt7530: improve code path for setting up port 5
Date: Sat, 18 Nov 2023 15:31:55 +0300
Message-Id: <20231118123205.266819-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043320_611151_4A674272 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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

Therefore, mt7530_setup_port5() will never run from
mt753x_phylink_mac_config().

Address this by not running mt7530_setup_port5() from mt7530_setup() if
port 5 is used as a CPU, DSA, or user port. This driver isn't in the
dsa_switches_apply_workarounds[] array so phylink will always be present.

For the cases of PHY muxing or the port being disabled, call
mt7530_setup_port5() from mt7530_setup(). mt7530_setup_port5() from
mt753x_phylink_mac_config() won't run when port 5 is disabled or used for
PHY muxing as port 5 won't be defined on the devicetree.

Do not set priv->p5_intf_sel to P5_DISABLED. It is already set to that when
"priv" is allocated.

Move setting the interface to a more specific location. It's supposed to be
overwritten if PHY muxing is detected.

Improve the comment which explains the process.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8623742b35ee..069b3dfca6fa 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2308,16 +2308,15 @@ mt7530_setup(struct dsa_switch *ds)
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
@@ -2348,6 +2347,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2358,8 +2359,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.40.1


