Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6B5C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqizc6/ZjAWz90A3jk7+7u+bSaPAPILOhNROkch9Cc4=; b=xN7JJJbvwcZe6MMB1ZIgxUqfX8
	tkeGgXieO2jpQbAp7qB0YOmxdXdTh/YXz4T4XXoJpxmhpdCZaiYWOcjJtVJYmDlVb7SKIR/MIBVFD
	argECF+Br7BhgrvjQLWFhc9y2J+LGkcGLFDQ2NsCq+6JAAD7iyTxnRkh/0FCgcBWfce9Xl7zMBozM
	qS7WgB89ADCta6ZqDYf7fQN/FnSvbDW7hHAY2L5f8iEbDoWmosjBcDB0OJ21Hue1T2QglMwrh1Qm0
	plYpa/mwX+AVLHXpGuJQCdaYaDoqk7C0Rw6OAr7y2ujGic5QB4Fg6j+JFsgKxeJu2LccB/yNs7rJo
	TwyKwLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYDm-000xGH-1Z;
	Wed, 29 Mar 2023 16:00:22 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYDg-000xBU-1U;
	Wed, 29 Mar 2023 16:00:18 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phYDc-0003S1-1W;
	Wed, 29 Mar 2023 18:00:13 +0200
Date: Wed, 29 Mar 2023 17:00:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [RFC PATCH net-next v3 12/15] net: dsa: mt7530: add support for
 single-chip reset line
Message-ID: <0f696278bd8d13121a500f80cfe2f806debe4da5.1680105013.git.daniel@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_090016_519213_972B9F70 
X-CRM114-Status: GOOD (  12.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to multi-chip-module MT7530 also MT7988 uses an internal
reset line instead of using an optional reset GPIO like it is the
case for external MT7530 and MT7531 ICs.
Add support for internal but non-MCM reset line in preparation for
adding support for MT7988.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c6fad2d156160..fd55ddc2d1eb3 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3066,6 +3066,12 @@ mt7530_probe_common(struct mt7530_priv *priv)
 			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(priv->rstc);
 		}
+	} else if (!priv->bus) {
+		priv->rstc = devm_reset_control_get(dev, NULL);
+		if (IS_ERR(priv->rstc)) {
+			dev_err(dev, "Couldn't get our reset line\n");
+			return PTR_ERR(priv->rstc);
+		}
 	} else {
 		priv->reset = devm_gpiod_get_optional(dev, "reset",
 						      GPIOD_OUT_LOW);
-- 
2.39.2


