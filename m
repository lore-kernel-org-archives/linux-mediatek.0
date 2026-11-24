Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B5606A322
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qeZvwJr1;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=WNsNd/70
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YKGKqGvlDx6/N1XO2T9kBBWtRBrnD3z7inHGvE3ANXg=; b=qeZvwJr1v1eIfk
	vXje4CZxqaMxH9HFOw1fmQ0K+hzIz/YTr6U5n94pwZh3cd1WFk04BqqPnlX7diI5wmwNconjMlZZL
	6acvdgbR3cWAw2Twm6kR+Sn4KlJFd25blZofQzH35jRxbk2wQ/ES2UQKvDSwTjECgzxtedMiy3Nfi
	sfZrJiBDI4xjEtlpkPtKlVrgAU3f+4ZBXnHl7LE5kgU7XC73jpXInM8erZK1LWwmr8sGG0N7RWTri
	KTNOm5myMKXZ9dOkiHuwzWeOo12+bo5mL+S905iem7l0ZLPn/mUITHO/6ER9JICPSxLZiQGBywkyM
	/xbTFKfqlDrBoAvsPgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlsE-00000005tEk-3AvS;
	Tue, 24 Nov 2026 08:27:34 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVls6-00000005t9N-0MBu;
	Tue, 24 Nov 2026 08:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=YKGKqGvlDx6/N1XO2T9kBBWtRBrnD3z7in
	HGvE3ANXg=; b=WNsNd/70Dllnb9y2xLQ984ZdJ2E1BdsBUjhjk47GT8RZE8hyrs
	4vbCwFs8sEgbkv3/uBq8fkNE3Gvrh/RS6M4FIyWNtRODl15WQyvnAoc0ZnZ7CDbW
	IyM+edE/aYVcFofIcuDnRnzQ2IvbLCROBzCl0XB9uv06iIegmWQGxJtfw=
Received: from mt7530_series_04.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQB37j5fSgVrq+e8Ag--.34257S2;
	Tue, 24 Nov 2026 16:27:11 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 4/5] net: dsa: mt7530: disable regulators on setup failure
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.6284290287819341762@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yAQGZQB37j5fSgVrq+e8Ag--.34257S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWkuF1rCr4kKFWUXr17GFg_yoW5XrW8pF
	W7uF95tryvqF1FgasFyr47Xas0yrWxG3y7Ga92kwsYyw4FyF4vvr18tFyFvF1fKF4kJw43
	A39xAF1ruFWkuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAV
	WUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgZXrUUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQYBD2sFSI8DtwAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002727_261515_CCE70B1B 
X-CRM114-Status: GOOD (  12.12  )
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

Once the core and io regulators have been enabled, every later failure
in mt7530_setup() returned without disabling them, leaving the rails
enabled and making the regulator core warn when devres later puts an
enabled regulator.

Route those failure paths to a common error label that disables both
regulators, and disable the already enabled core regulator if enabling
the io regulator fails.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e208d942b577..1ac4ac1a0566 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2435,6 +2435,7 @@ mt7530_setup(struct dsa_switch *ds)
 		if (ret < 0) {
 			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
 				ret);
+			regulator_disable(priv->core_pwr);
 			return ret;
 		}
 	}
@@ -2457,20 +2458,22 @@ mt7530_setup(struct dsa_switch *ds)
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
@@ -2537,7 +2540,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Setup VLAN ID 0 for VLAN-unaware bridges */
 	ret = mt7530_setup_vlan0(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Check for PHY muxing on port 5 */
 	if (dsa_is_unused_port(ds, 5)) {
@@ -2564,7 +2567,7 @@ mt7530_setup(struct dsa_switch *ds)
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);
 					of_node_put(phy_node);
-					return ret;
+					goto err_disable_pwrs;
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
@@ -2588,17 +2591,22 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-		return ret;
+		goto err_disable_pwrs;
 
 #ifdef CONFIG_GPIOLIB
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
 		if (ret)
-			return ret;
+			goto err_disable_pwrs;
 	}
 #endif /* CONFIG_GPIOLIB */
 
 	return 0;
+
+err_disable_pwrs:
+	mt7530_disable_pwrs(priv);
+
+	return ret;
 }
 
 static int


