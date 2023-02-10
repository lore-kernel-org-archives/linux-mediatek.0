Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED2C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/Rg7Y2Cd3DV/2GRO230U++3RvJzdHwXmYI8F8wAihQ=; b=oJxXZnJjmSHePbPpwVfT+GPDVZ
	s+2BCmE4XGaSf2b8pJKwJp0qk+qpDnn3accNMVHGRy0rDkPEFY6mg/wiDDmbsn6Zyhau6cSO6wqra
	Qt5DCjT36JWAGUlcclgC9IsOi5TI/0bsNqe+BYo6mBoGFLWBNXKZK3K5huqV5+ySdwDe+trBBtSsT
	fc1W0/LwpplqKmUfMV1M0MGAhXXFlWijz5GZbjgp+V/EeNUwcArKVvTeiB7/4cPn9le2e6oh17Llt
	aZYDhOH3hV9bauXwQxasHEKAoTn5HuDz/0+CzgdawEohjaf5ItP11PHFsbJEwLGusjVfJGINjnmNr
	ZSi1054A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXDu-006jHG-44; Fri, 10 Feb 2023 17:30:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXDj-006jDK-RP; Fri, 10 Feb 2023 17:30:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id dr8so17705687ejc.12;
        Fri, 10 Feb 2023 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/Rg7Y2Cd3DV/2GRO230U++3RvJzdHwXmYI8F8wAihQ=;
        b=IE3QHEw9KsJ7k3KXpeht2hSePlfSCcLFuPDa4FkyH7H0VUy3rfQbOLsC6yJYoHfxSX
         OiwMXwi+rZ71+iEIQm79QPoB0F2ELJT6OHFHvf5C9vOL8occKcSDvmeQymhTmfVvWryt
         g1wlTRsVY+Kn48Cs+Y8axQzsANT1+W26aGtzTvguCm/0uYG8KjFPNnRC2LKINM/eRrLW
         NEuskPHjbYiiMJB627QdRlE15wlnHrpHPFhWZBcxVbF7Urhi+BZKPvJnDJhPFLQdcWR7
         sdjgBZgj5YYoS/l1VilZ6WvAZ0wpMi/XeGqDmVjht9f4OEUpCXhjUtm7O8S1/7LE2p+o
         Cy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/Rg7Y2Cd3DV/2GRO230U++3RvJzdHwXmYI8F8wAihQ=;
        b=kKXi3BEKdVnBbN2HQKmkGQX/4CMe2eBjd9Ck/R9o21bRPChsg+CQK7Qem5Rec2ZIaH
         +EbNxF5A4olMn7TX8CNYVt1TfQssbahudoITzfYgMvLBfRTgumulxqAzrJRv6TLRaNyb
         QNmwL6Uqe5PEsZj+CRsibJJL3a3bj9gXKbV5i8itEI2OZ1uJv5aU8ckNzhA0//6GZVXa
         Qc7NWpw2fUNx+5F7gniTilzr8rcM2cOrHlNmUeWGv9YzRBFTADSRLeUc4T9gAs3sGAsf
         yyX/0UBUcRkoL1vpoIumddaqq/rLWiwgISKwn8M6V/xUbGzXPo3vEmB5C07Hplb3/HS5
         nv4Q==
X-Gm-Message-State: AO0yUKV6S9/TWIq0IH34eWMqgMRaYFE2xCFkMLzKlAK84up/6cpXjoo+
	xBm3ldfTlko43Fvzof1UR/Y=
X-Google-Smtp-Source: AK7set++lLCPWpCH3WbC2pUXuZJG0NEFE1TSogb4t4CmGQevcuwiO9xdmyic1hbqdqcVh/rNSWkTxQ==
X-Received: by 2002:a17:906:ca2:b0:887:7871:2b2f with SMTP id k2-20020a1709060ca200b0088778712b2fmr16348414ejh.61.1676050197130;
        Fri, 10 Feb 2023 09:29:57 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906859800b0088c224bf5b5sm2660729ejx.148.2023.02.10.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:29:55 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: richard@routerhints.com
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Richard van Schagen <richard@routerhints.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH net-next] net: dsa: mt7530: add support for changing DSA master
Date: Fri, 10 Feb 2023 20:29:43 +0300
Message-Id: <20230210172942.13290-1-richard@routerhints.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_092959_906941_1C7CC413 
X-CRM114-Status: GOOD (  13.40  )
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

From: Richard van Schagen <richard@routerhints.com>

Add support for changing the master of a port on the MT7530 DSA subdriver.

[ arinc.unal@arinc9.com: Wrote subject and changelog ]

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Richard van Schagen <richard@routerhints.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b5ad4b4fc00c..04bb4986454e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1072,6 +1072,38 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 	mutex_unlock(&priv->reg_mutex);
 }
 
+static int
+mt7530_port_change_master(struct dsa_switch *ds, int port,
+				       struct net_device *master,
+				       struct netlink_ext_ack *extack)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct dsa_port *cpu_dp = master->dsa_ptr;
+	int old_cpu = dp->cpu_dp->index;
+	int new_cpu = cpu_dp->index;
+
+	mutex_lock(&priv->reg_mutex);
+
+	/* Move old to new cpu on User port */
+	priv->ports[port].pm &= ~PCR_MATRIX(BIT(old_cpu));
+	priv->ports[port].pm |= PCR_MATRIX(BIT(new_cpu));
+
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
+		   priv->ports[port].pm);
+
+	/* Move user port from old cpu to new cpu */
+	priv->ports[old_cpu].pm &= ~PCR_MATRIX(BIT(port));
+	priv->ports[new_cpu].pm |= PCR_MATRIX(BIT(port));
+
+	mt7530_write(priv, MT7530_PCR_P(old_cpu), priv->ports[old_cpu].pm);
+	mt7530_write(priv, MT7530_PCR_P(new_cpu), priv->ports[new_cpu].pm);
+
+	mutex_unlock(&priv->reg_mutex);
+
+	return 0;
+}
+
 static int
 mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
@@ -3157,6 +3189,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.set_ageing_time	= mt7530_set_ageing_time,
 	.port_enable		= mt7530_port_enable,
 	.port_disable		= mt7530_port_disable,
+	.port_change_master	= mt7530_port_change_master,
 	.port_change_mtu	= mt7530_port_change_mtu,
 	.port_max_mtu		= mt7530_port_max_mtu,
 	.port_stp_state_set	= mt7530_stp_state_set,
-- 
2.37.2


