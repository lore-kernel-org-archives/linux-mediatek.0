Return-Path: <SRS0=DtK5=PE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 06:24:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23C061211
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 06:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D23C061211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gpdxIqcmwM06ijaiIOM7RD6o61ZvBX7bvw+/+7kPQNM=; b=po3IzHPoj1n0zz
	Q4dq6+I09TucQm0ORq80ftVMT6xb8jW4tgfC9XXm+Ub0OMA1qAxvYStvAhuByyeS6RIGObiY3mLN9
	nGKvG3RGnAqXRwvbkypaeF3h+M6++aXrxLTG+Ol3TaS8krxedJSlnJmlHAKQXRJeITJhsJegceYKc
	K/Sj9Tov765S92rXR1DfzmhqIau1LXeQDD1ZEyUg+hqH3qUL3RDBG+lJufa9O75u8OVrK+8M+0Gxf
	jFUYnz+nFVnoJJPuM4CfyT3QVOhsNn7gQD4qASHIlZPJo6st5mxubKX6Ui9+41sp+fNOcnyqzn2pW
	wQMT0guUo+b4Ceh/Uwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbd7X-009wGS-3t; Sat, 16 Oct 2021 06:24:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbd7K-009wE3-0E; Sat, 16 Oct 2021 06:24:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id n11so7746330plf.4;
 Fri, 15 Oct 2021 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvOvoZcvvH/Tx90si2pKJuiA/fIC5HYugtK+5A8dZIs=;
 b=adWh4ygPqc92epNkTraqhJCi7bUk4sjO5zyT+A14oTHay7XdUEdrusc0T7n4dkJWr8
 iuYo+Wx9Twyue8mGvq71xjUsiHbNgE07aZSGVxQhDBv7t2zmYCjzpcYDD0Lwa3Oewc1O
 ncs3GLLEsK2mqJt3jrezh6hJ7sDe7oub0C7Q2E0raaAzhpeRysyKDnS7ALzmIgSI7W5J
 iFVAeygq2FgIZqnuCK2xjln6M6LtSIXKitatPcbCy9tEQJGYyv77WE3dnq+eL+dPLefR
 Qoie4B4uSaOBdnXp58iT0M0aUVkp7uTxAaQegU6Jz6R/trZj//vVu6CTwYjfQSVd3cBv
 P12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvOvoZcvvH/Tx90si2pKJuiA/fIC5HYugtK+5A8dZIs=;
 b=yslAEYSa0Ow3I18WVkNUcsedLEsgU3WqJfrS70U6qAFtFBgS5TyoN9xpZ9E1KXyGEq
 xNQZbfKfY0XA933whq/+WBrkXENwEqcCbDKJBp9cEif9j2PJgQjkki3gGthVW6+qZgld
 +MwVh1bpJJoj6Lg5Ntk1GzKZLkYO9pM3VP/A+V8a5SZ3mocgHZqSHBrhjoz7HTHGEvPM
 qSzHDegAQFDCMgEQjVlOCLU9v5ST0ltdLrnkoVqV1q3SEcNiFAKq0tVIAsgXtJMDSJfZ
 sUU2lyXJtFo2ztt80bYgnk0Z9V7gCO5etSRmIdYLrH2DQpj4aM9iQvrYsjNU9tq/HYmA
 SR3g==
X-Gm-Message-State: AOAM532kY94QBciWf/w7xikdRhE3rqwDmWlha5dWeRQ9jrtUdqG8NprV
 JgRcYVpjszJg/yV2s/pQXNI=
X-Google-Smtp-Source: ABdhPJzaqUWxXy8civOeDMmAst1Ydj5bQI6jj4MORNLBbMI0BSepJ0kkZcvj9C/q3tDNOeRM/XNQXA==
X-Received: by 2002:a17:902:e846:b0:13f:551b:ba23 with SMTP id
 t6-20020a170902e84600b0013f551bba23mr14791681plg.77.1634365465100; 
 Fri, 15 Oct 2021 23:24:25 -0700 (PDT)
Received: from localhost.localdomain ([171.211.26.24])
 by smtp.gmail.com with ESMTPSA id z11sm13147334pjl.45.2021.10.15.23.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 23:24:24 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH net] net: dsa: mt7530: correct ds->num_ports
Date: Sat, 16 Oct 2021 14:24:14 +0800
Message-Id: <20211016062414.783863-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_232426_086566_D602909C 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
dsa_port's and call mt7530_port_disable for non-existent ports.

Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
port_enable/disable is no longer required.

Cc: stable@vger.kernel.org
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a3b49abd32f1..dbd15da977b5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1035,9 +1035,6 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	if (!dsa_is_user_port(ds, port))
-		return 0;
-
 	mutex_lock(&priv->reg_mutex);
 
 	/* Allow the user port gets connected to the cpu port and also
@@ -1060,9 +1057,6 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	if (!dsa_is_user_port(ds, port))
-		return;
-
 	mutex_lock(&priv->reg_mutex);
 
 	/* Clear up all port matrix which could be restored in the next
@@ -3265,7 +3259,7 @@ mt7530_probe(struct mdio_device *mdiodev)
 		return -ENOMEM;
 
 	priv->ds->dev = &mdiodev->dev;
-	priv->ds->num_ports = DSA_MAX_PORTS;
+	priv->ds->num_ports = MT7530_NUM_PORTS;
 
 	/* Use medatek,mcm property to distinguish hardware type that would
 	 * casues a little bit differences on power-on sequence.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
