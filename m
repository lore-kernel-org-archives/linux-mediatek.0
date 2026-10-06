Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22354CA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=; b=zahiQDdsHrPHt40jafIqWl0D7S
	B+0Frx55rl8dfFLuJCZ3O1Q13cu5xdRlnpiO12ADlSLWTjycLIRuPFykovzv5fDPKvT8JcbdRzLrh
	2WlR/2pGqq74EDV75zuPg6xl6dZ+lmQUIWWjFzyMbYu2H+8/0NhFQk9RsW18gj6JLi5CFZF7CNzWc
	q/nuf6pVvxlXEqVt09dIzymScxkj/oHJhIJpnCi++Chkg/v/PWLTGANj2cAbrGZevjZ1c4c+xxxxO
	gEFMd8NnKQ0dCA6aiwfZrn+jN76g2y5TpmTvjidyoAQmxWocG/z5UU3/Vrl0Q78YTHYxfQs3nz+PD
	6Y2Y9hhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4aF-00000000nGg-2Z62;
	Tue, 06 Oct 2026 12:47:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4a8-00000000nAR-2F9c
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 12:47:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2898271f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290863; x=1791895663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=B85rdQK2EJGRBeKb3TPw5y/iDawaKsaremksfrSFoiJNrtkGaf4K6rw0wmLR13NtKG
         mBsUud69wueN6rp/sAyDqaHa7E3Fe3719VudeskN0vIButUiA+NwdQP48MB+Q3gJcJyd
         72OltA3T2mqPa0NiTDQOxhyQAO5O21etKZeBAu4SY73FQ7+2fPZ0bbD7apaQKREJccIb
         7D4NG1r3kGdUqDnqZe35JBhDSRotchKMIOr8CPHbLA8tHrDaGCRzZPJJzX2qnhcqAp0L
         bU7LFU7XN3c3CaByepO08FTTWoDgOVzKBkG0G2d7dp3oS0zY+XVhfoh4tCd+q1QvdDXX
         DXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290863; x=1791895663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=2gkUfnteD3c1KcA73wv3SaSLFPl9JdTKqlxSQcpcSwExD21ZI9hUjy9XX0kUQr/93m
         B25VsdjS+aHaaVao4W6iWVj8DQcSxDV+PpwM8JuD6WhEJPHS0VQ+plsqSeIRwyXcjo/B
         +NYTc/vTCMMNUU3r8F/G1q8q9u2BcKhN1S/FuUdXP/S6vhF5cjBN5l0XetPCgybjfdIF
         RwfMWLYrPmn9+mt64nKAQi4n9AbcWb92iLwMcn2gXYvf798OL4kOFoDvq7Tayfs8DopQ
         rnTMZbWT8LG6LL4xCqaFt1/ga74vBMuYGRx0cQwj1Gh0qXepDw3+HPDYgep/ZLTO00+c
         +HkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlmmlFfw+asJJQcSnJe3XC2HtLmMk+j55FIPA78pkTgorebONRTi64DOUxlmDo5UJMU4CEJsmQVyay81n4qQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJCemVplL1CMWzjrJMyhOYUSma0AQHI954Udg0cJpJrdBswrzq3
	gcsTaiok4EskndeJaf3aFvssU4R02Dzu3vhfXFv7/RCL+J5NN0W4QWvaVavNzyKhvCk=
X-Gm-Gg: AYBFou0/u0Gh3fI+PGS8TZwZ/9ag5OOAS3+8C34urWSmGw2+UB7RYbBn/WoUTAhJ0xS
	EpafYUHZWskxqduVsAq3BYDKfD99Y94HwaYbJ8OGsf+56GNZ8d4pxbt77Jjclp2S0BKrJ95gU35
	ilKFlPlRPsxc0nfFSWi3SZjouymkDg+3PpleWgdklgC5afwhdN1ouNkYrUvUNEqGxddYkfXRR89
	hx6evm1B6p0oLDEFWbnVNdIztOdWYlYDHbX6T23DFewIBOzwQ7UMme6nct+C7pSA2hBt2bN+0Du
	y+HJM9ENbPNYmLJHKPJIfaie3ZKv06qS7tNzmNWZOPBwnrAbN/FJ0UBqhdzoYzSmJFYMbT0y1U2
	+YuOYLdY8ygYOufWnI5AOfU6lxU00NC2BiKDtXK8/AWHrsTx+7E7G7xWJj8vDMhv9wAGTfwxvbD
	Wtj+LnTazcHMvHQbrdMhx1TVgdq2PzsnLmxSNm1th+rgTOOVD2rQ==
X-Received: by 2002:a05:6000:2510:b0:48b:2a1:dfc1 with SMTP id ffacd0b85a97d-48c6d17d529mr2163808f8f.22.1791290862711;
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Tue,  6 Oct 2026 15:47:31 +0300
Message-ID: <20261006124731.1528963-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054747_424496_50C098DB 
X-CRM114-Status: GOOD (  16.73  )
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

A user port connects its PHY once, when the switch sets up its ports.
If that PHY needs firmware from the host and its driver is a module not
loaded yet, the port gets no working PHY for the rest of the uptime.

Let a switch driver opt its user ports in to phylink waiting for such a
PHY, and opt in mt7530. Until the PHY attaches, .port_enable sees a NULL
phy, so the opt-in is per driver: qca8k dereferences that argument, and
gswip programs the PHY address from it at open, so a late attach leaves
it wrong until the next open. mt7530 does not use it. Shared ports are
left out.

Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch), where the
EN8811H behind lan4 has its driver on the root filesystem and lan4 was
lost for the uptime.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v6: the dsa.h comment says .port_enable must not use its
phy argument, rather than cope with a NULL one.

 drivers/net/dsa/mt7530.c | 1 +
 include/net/dsa.h        | 5 +++++
 net/dsa/user.c           | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4e6f..e4c155605e27 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3548,6 +3548,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	priv->ds->priv = priv;
 	priv->ds->ops = &mt7530_switch_ops;
 	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
+	priv->ds->phy_may_probe_late = true;
 	mutex_init(&priv->reg_mutex);
 	spin_lock_init(&priv->stats_lock);
 	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..04b151cd52ce 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable does not use its phy argument may set
+	 * this to let user ports wait for a PHY that needs host firmware.
+	 */
+	u32			phy_may_probe_late:1;
+
 	/* Listener for switch fabric events */
 	struct notifier_block	nb;
 
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..41075bb74193 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -2661,6 +2661,7 @@ static int dsa_user_phy_setup(struct net_device *user_dev)
 
 	dp->pl_config.dev = &user_dev->dev;
 	dp->pl_config.type = PHYLINK_NETDEV;
+	dp->pl_config.phy_may_probe_late = ds->phy_may_probe_late;
 
 	/* The get_fixed_state callback takes precedence over polling the
 	 * link GPIO in PHYLINK (see phylink_get_fixed_state).  Only set
-- 
2.53.0


