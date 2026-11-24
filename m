Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5E606A684
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOidJbGv;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TugWUPBE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a6ICK4FXQIh2L5/mytbLTap2GRa0tIY/nWGOF7Su888=; b=hOidJbGvIuXY1e
	5cAvA6iBl1xrE7ttDIWKQKQK1RwLNZrCVbwhNszeX9BfQM0rWe57R8Yp6czOf7//Ut733SQbPwf1A
	uYeXlzZWvA6TxurTf+YcG4Vtopq54aUJ7BW9SuT7CM0DD8Hw1E/Y5mbTWpB6Xdamg3zUpXqOZxjPx
	iI4JgkZ7mWFxT6Nj9WhnQdNEslX6GjDv4K+k4MSipjgy/4ejM3TgKbXS+LSw0O3gkoUQEvlvnym+S
	aqx1pKOBmM0nRQR7wu6lOBTgz7e19apQ9QB4EQH8jW6WlW+weRdMQKDYEfopHy+/jQqwuQLuunCGf
	hITtkcxBdnaPnwRF/eNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVls0-00000005t7C-3oEn;
	Tue, 24 Nov 2026 08:27:21 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlrr-00000005t1v-3Bdv;
	Tue, 24 Nov 2026 08:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=a6ICK4FXQIh2L5/mytbLTap2GRa0tIY/nW
	GOF7Su888=; b=TugWUPBEREMTnrAISy6UiAQ5q9rXJJtErjTEvXHuBaDZCjQI/w
	/UcXFI+2Fa8DlSNJ3j1XccffBtIGcCz+dScI7+DnjZ6E+T4uH9QtofI2NXj61kwi
	MrrrEmZsXyXeUkC/5MWxM2edN1jkBocVkYDkiye1nM0xO2eejcCvgCzy0=
Received: from mt7530_series_01.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQD3JWpJSgVrxLNjAQ--.26356S2;
	Tue, 24 Nov 2026 16:26:49 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/5] net: dsa: mt7530: disable regulators on switch teardown
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yQQGZQD3JWpJSgVrxLNjAQ--.26356S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15XF4kur47Wr4xGF18Grg_yoW5Jw1DpF
	y7ZF9ayrWUZa4UKa17Ca18ZFy5X3ykGa4Igan7W3yFqw1ayF17tr1kKFyUZFyrKrWrta1S
	yF98AFn7CFZ5XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5vPftUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQUBD2sFSI8DnQAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002712_229759_599ECC2E 
X-CRM114-Status: GOOD (  15.04  )
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

mt7530_setup() enables the core and io regulators, so they should be
disabled by the matching teardown callback, not by the driver remove
callback. teardown is the counterpart of setup and runs for every switch
that was successfully set up, whereas remove() only runs when the whole
driver is unbound.

Move the regulator disable from mt7530_remove() to mt753x_teardown(),
after the stats polling work is cancelled so that no poll can run against
an unpowered switch. This is a plain code movement, with the error
reporting kept for now and cleaned up in a later patch.

A switch in a multi-switch tree whose sibling fails to set up is torn
down without its driver reaching remove(), so its regulators were left
enabled until now.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530-mdio.c | 14 +-------------
 drivers/net/dsa/mt7530.c      | 13 +++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)

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
index d5a199293f78..c2f12ae2c6d7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3237,9 +3237,22 @@ static void
 mt753x_teardown(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
 	if (priv->bus)
 		cancel_delayed_work_sync(&priv->stats_work);
+
+	if (priv->id == ID_MT7530) {
+		ret = regulator_disable(priv->core_pwr);
+		if (ret < 0)
+			dev_err(priv->dev,
+				"Failed to disable core power: %d\n", ret);
+
+		ret = regulator_disable(priv->io_pwr);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
+				ret);
+	}
 }
 
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,


