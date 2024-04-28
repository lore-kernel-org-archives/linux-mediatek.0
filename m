Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0459BC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Apr 2024 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5HSvMVslMnajCAWIXREsnGHSI9KjaWJctg/dQdBxPjw=; b=qciF404e1T5sZnjBc/8vbqqQXn
	w/JqQEF/gpxE2SUEzO1i6oGxvrT22gIwrBsCaiR7jLuTuM6k8eUtRhxx8gtf+j8pHsz7XssRIpIiI
	j06AnwWSIqjBEpzS+tuDUIJeNK1OkAVo2ZWRHQo9Ge0geY2c71PUt36mpYBLXChZF4eIVqvS0UUr6
	KorLwDoCQ/dJ4EiwHrI1GlE8jkjaUh19beQy2nuazBfRpjc9jx8wx0rV9rzlqHYmisOVKb8HH5yDz
	e/hfSPT8Mg96m+PnmTZMWozOKVSchyNVCiq5TbvUCopCit+0vgM80/bI+/1Z1j27IaCTXANWbYdYL
	Ms0yMO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s10hx-0000000HF3P-3c4l;
	Sun, 28 Apr 2024 09:20:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s10ht-0000000HF2E-3Kwm;
	Sun, 28 Apr 2024 09:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FD89602DC;
	Sun, 28 Apr 2024 09:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FCC3C113CC;
	Sun, 28 Apr 2024 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714296022;
	bh=tTcSI2He67CI3Bx08DQeboEo2tW7XByRd7BFoSlFVNI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XZKXGUVwBO3S/f+J33iIx2bUkBDqcBhVQNzXpdKlZHIXBp7tHqCinBxD/4a3uUXEq
	 oVb0wiN1anfd9DWl3LtauefrWiszXFknLYEiIRhHkK78HeP5s1SOiz5Xfl+/7Sp1fh
	 3R3dHd9u3lJZINnAEQBQOV3BzCCS+XSDOXpwdtIZNcda+6ODZVhguXm0q6Dudv7/hu
	 hrKVaQPUEokY3oz4qpHEhz2HkJ6Q1hETt1zVaH38dydhIz5p27YduGZVsokX0kytJp
	 0gMxJy2W07ZdirlDbmW1z7Nu6oaAxv53XuiwSJyfye0wOLNHWs4Pb2JGUSZ+uw+/Md
	 VsqwZaY1CJquw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A01EC4345F;
	Sun, 28 Apr 2024 09:20:22 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sun, 28 Apr 2024 12:19:58 +0300
Subject: [PATCH net-next v2] net: dsa: mt7530: do not set MT7530_P5_DIS
 when PHY muxing is being used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240428-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v2-1-bb7c37d293f8@arinc9.com>
X-B4-Tracking: v=1; b=H4sIAL0ULmYC/6WOQQqDMBBFryKz7pQYlZCueo/iwpqJDtREktQq4
 t2beoUuHx/e+ztECkwRbsUOgRaO7F0GeSmgHzs3ELLJDFLIWtRSofUBHSVHa8IpqaYSaDw6n9B
 w7J4vwtmH1OBnJIfzuOH0XtkNqKxtrBFaN0ZBts+BLK9n+QFZiD8jtHkZOSYftvPSUp773/Wlx
 BKVrnpjtVFKqHsX2PX62vsJ2uM4voIqUjcJAQAA
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714295997; l=2134;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=mooBBatpyIktEez2DpRO7+tS0DbjK7qafqYlayMk1R4=;
 b=EH/F59K96vk3QVfn9tauaQDX4oX1KGLZrhENnMQ3zPIzdDGpVuG9d19WaDUmDkSL9oXlKYEUD
 RqTQzjjJFslCKXPH20Nulu1HorEX1WU6Kmh1q5sJpvuvG/541ly6mX6
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_022026_005237_96279389 
X-CRM114-Status: GOOD (  14.80  )
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

DSA initalises the ds->num_ports amount of ports in
dsa_switch_touch_ports(). When the PHY muxing feature is in use, port 5
won't be defined in the device tree. Because of this, the type member of
the dsa_port structure for this port will be assigned DSA_PORT_TYPE_UNUSED.
The dsa_port_setup() function calls ds->ops->port_disable() when the port
type is DSA_PORT_TYPE_UNUSED.

The MT7530_P5_DIS bit is unset in mt7530_setup() when PHY muxing is being
used. mt7530_port_disable() which is assigned to ds->ops->port_disable() is
called afterwards. Currently, mt7530_port_disable() sets MT7530_P5_DIS
which breaks network connectivity when PHY muxing is being used.

Therefore, do not set MT7530_P5_DIS when PHY muxing is being used.

Fixes: 377174c5760c ("net: dsa: mt7530: move MT753X_MTRAP operations for MT7530")
Reported-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Hello.

I've sent this to net-next as the patch it fixes is on the current
development cycle.
---
Changes in v2:
- Add a comment to the code.
- Improve the patch log.
- Link to v1: https://lore.kernel.org/r/20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v1-1-793cdf9d7707@arinc9.com
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b9f904a98f0..2090f34e5289 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1220,7 +1220,8 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
 		return;
 
-	if (port == 5)
+	/* Do not set MT7530_P5_DIS when port 5 is being used for PHY muxing. */
+	if (port == 5 && priv->p5_mode == GMAC5)
 		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);
 	else if (port == 6)
 		mt7530_set(priv, MT753X_MTRAP, MT7530_P6_DIS);

---
base-commit: 5c4c0edca68a5841a8d53ccd49596fe199c8334c
change-id: 20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-7ff5fd0995d7

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



