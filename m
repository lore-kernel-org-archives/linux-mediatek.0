Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA63CA5FD9
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=; b=aZ2M80qEuT6lia+j7sUZgS/TOj
	5qxj9LooFhkeJwF8ubsRg2zeaocQlc9lZCPwk2QqmZ75oswEAsYZGQYKb6AITbfKaCuTXwqDnfFFu
	z3dPcQnfPD2EUKspTwzEn2x7tz/8nQXu/dIgXHagSsCr7zEIZn3o5GfJoywZF+JGkW2wjb35bAwl1
	5ae5ett9Jsh2ME11R/0Xc0WwbDe3dVT8F2zPR2JiP1viL7DVT2HRYYKATw5MmGRvRNq+vD4DxA9/w
	2YWKQU0R4TrSzlzlmGcUhUSr9vRdZ6P28jaHoSpZSYPyVkMaZzYOXYSUUfCWPXEsWvVPXGtA0dph2
	kOeRCYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQb-00000009AHg-0OKk;
	Thu, 01 Oct 2026 13:02:25 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQY-00000009AD0-11sG
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 13:02:23 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so5056351f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859741; x=1791464541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=IPmB7CAh/VjCMI6iXzR7Kc6elFdtuTwLd/ewsgo8OaWp3v3xzh+SGZ5jCmQ3UrpPjK
         n8Me2QtyPJwG8Q8DliFZEOJSeWv2VV9GP3Eqbqgng0I++aiW7lam/bp3lgnY0Ncs/QID
         jlItSL6Bjp/K96W/SIzrDEBJkADsIs4+B3S2wZi/VHESiuZzXW5yZ0MCBjF4gbeRrf7R
         w/qxtmr+2rLEYQoKpnq2NMPtmsgxBmny8pRL54bc93NfryKt7POyqJpZosbStSqsRbqO
         fgT94eF/zFPLSODZYG3u6flHWM4kOn2Nf1rQ63uHxG3Q57SgGerByfKsqjExOzytIr7j
         tVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859741; x=1791464541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=rBvpZB+PP8clDLAz+o1DcPdqXKjmIHX9q01w7aQUgRnCuARgOcQRuAOuqnEZyDP9ow
         1hdFQ5qqBmBrWP+sd1SleXkOjv/dM4c0rWLsSorkm5juX5bQxsWf6ZZ7zhXhSKsAnH4b
         MWd78M7VL27RQXemLcxu6MAKj8G/O9TdV93nFo2SPOOPxW0F3xw6yEze4VcasjKyjEly
         VrS0Zl9mwMzra98Qg794XEfqBf4O2pZ+Qhdr29jiVEvu8LSuDvH3E3CTpljIJkjNfGiu
         c+4r10Mx8L8dqI6JQrdTAflFQVNcs8jh96qDgNtrUehR070jE91a9SVepwyrhWbwSFxT
         3S+g==
X-Forwarded-Encrypted: i=1; AKwUvBzMFgPCwkeT2NAomswyMwkLhABvFxhg1NBY8p3qozCH1rsMKdYwxp0ypBCLS75hNxO+TIlnDrK2ZcDVtfsUCQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKCS1HO1vfwGI+9/DChRSzNGViiD8WmLpmkdY9NxAV5pZifpFGR
	Ku0GXJW2YWOJ8D/ane8+CHsvXRShzb2Ssc+wsTITn/l5bjFq0zX6fcENZ/NQAp2w+tA=
X-Gm-Gg: AYBFou2im19uJOOz1K3f9kvkDNkCm5xYKSmV4qrNzywLYfeAb/wCBt40LwBeCHITZar
	cN2HAmRiQBsQnPgW+emqCc7M6Q5tq+VWdFOGNrFcmLJW1PuZSP6y8Tf7YvtGE9tyAra42fyUd9H
	ICpuovWvd6Ez5D/eeieBag4MD6tsbdk+BSOOIrEwm3Ago/xaMOWXfUuUaaFLQIkD1BgYbTgfqr+
	1RSPT8EJVDqpXwvfS5oickZr0zpFa9wAog5qyonhTe2gjQ40Ln9ASmRBvL1RuQeBR5AF6nq+XsK
	xI89Nu0pp9K21OOOZe9heekzW4QUzfxUnqEvw/z5BluySHRG+NyvxCs96ixCjYLYRq5QzyNxgDi
	Ty4e5/rK8bBoMDaDqOF2fGQEVHxo+WOSw2oJaMev/rkI4D5yI/SmI6eLcrQK0cZ+PfazT5Ki7h+
	//5PGxLWQLU+7SE2vg/ldZcRrpskHeHwavuk2ByaOCsewI/XPKVw==
X-Received: by 2002:a05:6000:29c3:b0:48b:10af:f85a with SMTP id ffacd0b85a97d-48b10b000e3mr1098553f8f.42.1790859738771;
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
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
Subject: [PATCH net-next v5 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Thu,  1 Oct 2026 16:02:08 +0300
Message-ID: <20261001130208.105558-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060222_970191_CD2A659B 
X-CRM114-Status: GOOD (  15.44  )
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
New in v5.

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
index 5d12191b6f6f..f7e78c3a123d 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable copes with a NULL phy may set this to
+	 * let user ports wait for a PHY that needs host firmware.
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


