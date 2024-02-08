Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A811EC4829C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne7hOGU2S5DStLf3lgxkOQSl3E4nSb1cKjrcJ4FWwQ0=; b=VPiqkEE7bD3M+8I613NJf5ocpv
	0Fp9WibT1+Z1rRzXrYB/wSrYaU+c8jKEXpsH0uMeZMF8r5R6OYOxoC6mbbs5ZbKslKs4tZOaTZVbI
	k+LKsp/boAdGJ25siiT3MElaNt0bR3nO9mm4QVXvp+AUs0jSTTLwS7kvzOU3aN5PQGiw4JTCIdQ3l
	0yriahF1vKyMUex2ZEfmr9MhEgsF/Yn//W+PW8t0+ZaEXrG9jFJ9ohU60Z8PvHIo5HUhr9yeiBCYY
	UM5UWdL8ZIjEsNIZnLxQ5GP9naB26uwBy7lzGbJwrsnOWDap2eL3d8rzYFnPGsUtFTGFnETA+cq1a
	oRJmg0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxKV-0000000Chui-2hPO;
	Thu, 08 Feb 2024 05:52:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxJz-0000000ChX2-1Hpw;
	Thu, 08 Feb 2024 05:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 048C6CE1B8D;
	Thu,  8 Feb 2024 05:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 851BDC43143;
	Thu,  8 Feb 2024 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707371493;
	bh=bdj2sXbKKEcSVYU72hwdKppcUWhM0GPYmoe4dwmAPtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=duV/XThzlx5FOGwO0s+gVWnEFACGOOH9JyeIdcBl2dgbcf/ZMutPwU95YUxJ4iyCY
	 jj1N/PtkeAgrfabl4VgS6bSHcahoQKQR1s690LM9vG9D5M2WkCucG4hSZmTrpG9hOp
	 7BFDttsgSJeYIjSvYJNpw+9M9Ta3feM2wJLHBO2X1Gn6rp4gHpCJRG1bSDVtbCrvsx
	 7AUXrO6CkGcCW6GtbA0lb5EZwGt+P0xl3ZspfmD+hWuxd/pGr+uSPy8dDYf4cR4sRw
	 gwAdJYHHmcCECDZjrKfcBCUrRM9pov30cCQY9hwJ4XgCd9UDS9WBK7p4VjVB0FUq/s
	 /XuCaCIIlzuTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74549C4828F;
	Thu,  8 Feb 2024 05:51:33 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Thu, 08 Feb 2024 08:51:35 +0300
Subject: [PATCH netnext 7/8] net: dsa: mt7530: put initialising PCS devices
 code back to original order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240208-for-netnext-mt7530-improvements-3-v1-7-d7c1cfd502ca@arinc9.com>
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
In-Reply-To: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707371489; l=1570;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=/2CkKGukm0R4V69WhBvbbIMKcr0CwYye/LAy2VcbSV0=;
 b=cgYWWkSZCAhdXnX66ltsxkY85bNLVeKuY+rvkDi7qWt0AaUJl007QE1+K/VOCDyRWB+gn74zR
 AWtK+mJWyxICShfCxhlkB4+HkAyHCmc7TQzDaC61rogpfRYrm6NcEoh
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_215139_745417_64C9D465 
X-CRM114-Status: GOOD (  11.77  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The commit fae463084032 ("net: dsa: mt753x: fix pcs conversion regression")
fixes regression caused by cpu_port_config manually calling phylink
operations. cpu_port_config was deemed useless and was removed. Therefore,
put initialising PCS devices code back to its original order.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e353c03dd1db..5c8ad41ce8cd 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2812,17 +2812,9 @@ static int
 mt753x_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int i, ret;
-
-	/* Initialise the PCS devices */
-	for (i = 0; i < priv->ds->num_ports; i++) {
-		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
-		priv->pcs[i].pcs.neg_mode = true;
-		priv->pcs[i].priv = priv;
-		priv->pcs[i].port = i;
-	}
+	int ret = priv->info->sw_setup(ds);
+	int i;
 
-	ret = priv->info->sw_setup(ds);
 	if (ret)
 		return ret;
 
@@ -2834,6 +2826,14 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
+	/* Initialise the PCS devices */
+	for (i = 0; i < priv->ds->num_ports; i++) {
+		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
+		priv->pcs[i].pcs.neg_mode = true;
+		priv->pcs[i].priv = priv;
+		priv->pcs[i].port = i;
+	}
+
 	if (priv->create_sgmii) {
 		ret = priv->create_sgmii(priv);
 		if (ret && priv->irq)

-- 
2.40.1


