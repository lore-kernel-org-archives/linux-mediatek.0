Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6C606A31E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XMj8Psgu;
	dkim=pass (1024-bit key, unprotected) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=W3h0nqAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gB/Z9NJB203HpM97qKLY5FRg+PZOBrzFwW/lhg9M7Bg=; b=XMj8PsguwlPfC2W97PgZgpr/Dd
	Fr3UEqiRZf7Q+XU7v1nKVTnhpEwfiZJifUhLM468HQKfeQ9B7wJrvbyGwGfiYY6GURcOyQ2AXj0ir
	b1ioJtiZjOjGhYfhr625gGDQXqhHX33dS/74v6g6C4NrmRtVsidjFwxVxGciwl0Nt2ywZhnU4E4Br
	162vCgkN82liDmuOOmYrtT9KBADNxF6rSh11rmSfMPcH+lceVPhiIj17iOHX06KCZnaftH4A3e5gy
	j0K+IdSojngzs4DnI6J/42vZFqbHyYZzSPTF17iUjLpSdC+STSeMr0xAHEnKvoo/dOaqTEwafhQcY
	yfkvG+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRvZ-000000035QD-0cDm;
	Mon, 23 Nov 2026 11:09:41 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRvU-000000035Ni-0kGc;
	Mon, 23 Nov 2026 11:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gB/Z9NJB203HpM97qKLY5FRg+PZOBrzFwW/lhg9M7Bg=; b=W3h0nqAe8FAEq
	pacUpflTAH2LnmsWDZbmu+PHeBB6T2QIf60TA6hHgF+eLp9ND30G4F/rR8LOGh+U
	6dc8yLUbyzi+hZm8hSKhz+lVkkIgbQg08Fk+4ArUHk2BCHcvPhyR7t1omAUyvd/g
	04O2b/fSTAbCMB5P5nMDE7JWuB3ruc=
Received: from mt7530_v2_final.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQAHeDjeHgRrnF63Ag--.6493S2;
	Mon, 23 Nov 2026 19:09:18 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: dsa: mt7530: disable the power rails on setup failure
Date: Mon, 23 Nov 2026 19:09:13 +0800
Message-ID: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yAQGZQAHeDjeHgRrnF63Ag--.6493S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WryDJr48GF18GF4ktF47Jwb_yoWxAFWxpa
	y7uF95trWvqF10ga9rC3W8Zas8ArZ3Jay7Jay7KwsYyw4Yyr4Dtry8tFy0vF1fKrW8tw4S
	k395A3WruFWDZaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4kMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5drcPUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgEAD2sD8Z1NfQAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_030936_885752_B066EE50 
X-CRM114-Status: GOOD (  22.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7530_setup() enables the core and io regulators, but only
mt7530_remove() disables them. A failed probe never reaches .remove(),
so the rails stay enabled on every setup failure path, and the regulator
core warns when devres later puts an enabled regulator. The common case
is mt7530_setup_irq() returning -EPROBE_DEFER, where each re-probe
enables the rails again.

Tie the regulator lifetime to the switch setup/teardown pair. Disable the
rails in mt753x_teardown() and on the mt753x_setup() error paths after
sw_setup() succeeds, and drop the now-redundant disables from
mt7530_remove(). This also avoids an unbalanced disable when a switch in
a multi-switch tree fails setup while already bound. Move
mt7530_setup_gpio() after the FDB flush so the gpiochip is not left
registered when the rails are dropped.

Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---

Changes in v2:
- Address the High severity finding (incomplete fix). Tie the regulator
  lifetime to the setup/teardown pair instead of using local labels in
  mt7530_setup(). The rails are now disabled in mt753x_teardown() and on
  the mt753x_setup() error paths after sw_setup() succeeds, and the
  redundant disables are dropped from mt7530_remove(). This covers the
  -EPROBE_DEFER case in mt7530_setup_irq() and the post-setup
  dsa_switch_setup() and dsa_tree_setup() failures.
- Address the Medium severity finding (unbalanced disable in
  mt7530_remove()). Disabling in teardown, which only runs once the tree
  is actually set up, avoids the second disable for a switch that fails
  setup while it is already bound in a multi-switch tree.
- Address the Low severity finding (gpiochip left registered when the
  rails are dropped). Move mt7530_setup_gpio() after the FDB flush so no
  failure path leaves the gpiochip registered after the rails are disabled.
- Leave the other Low severity finding (assert reset before dropping the
  rails) out of this fix. It is speculative and matches the existing
  mt7530_remove() ordering.


 drivers/net/dsa/mt7530-mdio.c | 14 +--------
 drivers/net/dsa/mt7530.c      | 67 ++++++++++++++++++++++++++++++++-----------
 2 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index e85ef2aceee5..faefbcad293f 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -227,23 +227,11 @@ static void
 mt7530_remove(struct mdio_device *mdiodev)
 {
 	struct mt7530_priv *priv = dev_get_drvdata(&mdiodev->dev);
-	int ret = 0, i;
+	int i;
 
 	if (!priv)
 		return;
 
-	if (priv->id == ID_MT7530) {
-		ret = regulator_disable(priv->core_pwr);
-		if (ret < 0)
-			dev_err(priv->dev,
-				"Failed to disable core power: %d\n", ret);
-
-		ret = regulator_disable(priv->io_pwr);
-		if (ret < 0)
-			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
-				ret);
-	}
-
 	mt7530_remove_common(priv);
 
 	for (i = 0; i < 2; ++i)
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d5a199293f78..5bbeed0491c4 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2376,6 +2376,16 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	return ret;
 }
 
+static void
+mt7530_disable_pwrs(struct mt7530_priv *priv)
+{
+	if (priv->id != ID_MT7530)
+		return;
+
+	regulator_disable(priv->core_pwr);
+	regulator_disable(priv->io_pwr);
+}
+
 static int
 mt7530_setup(struct dsa_switch *ds)
 {
@@ -2425,7 +2435,7 @@ mt7530_setup(struct dsa_switch *ds)
 		if (ret < 0) {
 			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
 				ret);
-			return ret;
+			goto err_disable_core_pwr;
 		}
 	}
 
@@ -2447,20 +2457,22 @@ mt7530_setup(struct dsa_switch *ds)
 				       val != 0, 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
-		return ret;
+		goto err_disable_pwrs;
 	}
 
 	regmap_read(priv->regmap, MT7530_CREV, &id);
 	id = FIELD_GET(CHIP_NAME_MASK, id);
 	if (id != MT7530_ID) {
 		dev_err(priv->dev, "chip %x can't be supported\n", id);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_pwrs;
 	}
 
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_20MHZ) {
 		dev_err(priv->dev,
 			"MT7530 with a 20MHz XTAL is not supported!\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_disable_pwrs;
 	}
 
 	/* Reset the switch through internal reset */
@@ -2527,7 +2539,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Setup VLAN ID 0 for VLAN-unaware bridges */
 	ret = mt7530_setup_vlan0(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Check for PHY muxing on port 5 */
 	if (dsa_is_unused_port(ds, 5)) {
@@ -2554,7 +2566,7 @@ mt7530_setup(struct dsa_switch *ds)
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);
 					of_node_put(phy_node);
-					return ret;
+					goto err_disable_pwrs;
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
@@ -2575,20 +2587,31 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
+	/* Flush the FDB table */
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
+	if (ret < 0)
+		goto err_disable_pwrs;
+
 #ifdef CONFIG_GPIOLIB
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
 		if (ret)
-			return ret;
+			goto err_disable_pwrs;
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	/* Flush the FDB table */
-	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
-	if (ret < 0)
-		return ret;
-
 	return 0;
+
+err_disable_pwrs:
+	mt7530_disable_pwrs(priv);
+
+	return ret;
+
+err_disable_core_pwr:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->core_pwr);
+
+	return ret;
 }
 
 static int
@@ -3205,11 +3228,11 @@ mt753x_setup(struct dsa_switch *ds)
 
 	ret = mt7530_setup_irq(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	ret = mt7530_setup_mdio(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {
@@ -3221,15 +3244,23 @@ mt753x_setup(struct dsa_switch *ds)
 	if (priv->create_sgmii)
 		ret = priv->create_sgmii(priv);
 
-	if (ret && priv->irq_domain)
-		mt7530_free_mdio_irq(priv);
+	if (ret) {
+		if (priv->irq_domain)
+			mt7530_free_mdio_irq(priv);
+		goto err_disable_pwrs;
+	}
 
-	if (!ret && priv->bus) {
+	if (priv->bus) {
 		mt7530_stats_refresh(priv);
 		schedule_delayed_work(&priv->stats_work,
 				      MT7530_STATS_POLL_INTERVAL);
 	}
 
+	return 0;
+
+err_disable_pwrs:
+	mt7530_disable_pwrs(priv);
+
 	return ret;
 }
 
@@ -3240,6 +3271,8 @@ mt753x_teardown(struct dsa_switch *ds)
 
 	if (priv->bus)
 		cancel_delayed_work_sync(&priv->stats_work);
+
+	mt7530_disable_pwrs(priv);
 }
 
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,


