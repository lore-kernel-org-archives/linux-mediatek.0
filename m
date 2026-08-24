Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2202DC5DF97
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 02:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG09oMeCLLGrjaF3KS0dxUwY4QMRP5eQuHdTPgxNNbs=; b=dvMrSiy3DM+Ks+jVgsFofDYPTd
	hYqW/PxxI3EvYk7MCzFHpTtFDjbRColShy4ALIyfSWOJRJWeccCROQdj873Q4CbJuorh8zOGp60yG
	j4I1T5Bpiz1Mw6kMxxxCnwJWAKAH8m8dvhKCe+R4+3VvQhp+K8SEC50WfyHWcmNTMNlimGm0gVhTm
	8lRCaoJ6rDrUjwVsIs0ezs9MDbmVjAHZSX8yPJ4DRmJ3AP5G/EmdqappY3nj6mj6sHvd2vxYIeTyT
	FXs5AZJ+uK3FXc6SD7mLsC0wqFFb3OZ2lpp59FqzxW05knBeRN5isWXYU9YlGSb7ROee80Yka/NKx
	9y2A7Kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKcs-0000000FoTY-0dKF;
	Mon, 24 Aug 2026 02:41:30 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKcq-0000000FoRL-0iWH
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 02:41:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso4361805a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 19:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787539286; x=1788144086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG09oMeCLLGrjaF3KS0dxUwY4QMRP5eQuHdTPgxNNbs=;
        b=WGZVoZmIioodUpe8E9WCBV5bYxofd8Rz0kjsgGtXG+2UycGaSQzYakp5i3DCCCPTJq
         9iWi/CAjjOEqTppGD3Q8Q318VZpKtMBjoh4UjTxcZ+o4VVGj3NonzjQi+mWa/tlA1ZgF
         SpyaMMy5wsx/xCeE9rHkSQu+jypWgTBzg8td7fnerE7AV8REQk3OAlXnJi8k4FHb4YCI
         HAr0agpHfWOJ6U7svS1mJQIiZ+aKk1OXTZqO9D9Zo7rda2eZ2T7sKCDjHfQ+rAM1vsI1
         i26Gx7b9EEfuYDSIwQAqxSnE6EUQmaI+gKv09YURzx9o/nWPYNRkHVlsyZk4NGcwiw07
         L3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787539286; x=1788144086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG09oMeCLLGrjaF3KS0dxUwY4QMRP5eQuHdTPgxNNbs=;
        b=B8QRy6YhAQY/u0MxjoSlETXRfPJrnKHLnPsALUF9/tn+TWtZHtCRvnZ7susde9Hil8
         Egtg5m3cAaVuuUITAC8HGaNknmK6RVBkxSk4kH81VNXZ87C/K9ACzotuKbyCT9nIKzly
         8ZkGy3bUqFO7gnn8AhVB3AS8JQcnI1OMj2mhplU/9XcXjlSrtn3VdSeDUgwI6wHMfQxr
         1Db4+vYJoz6tp0/BQRcE4ja89WMeQwz6VVZc8UzEYxi4XzSV/aian/Rp0/6IYexWLxqz
         NsUBw9ZG72y8o0r1FZv0fEsJxh+UTN/eySjCkfQNy+0XILUb6UqNmQ90kvOgQPPkAaWZ
         gupA==
X-Forwarded-Encrypted: i=1; AHgh+RrSYKJHBJuNuT8sUTJxRtE49EGhZbaHIAQoipYNqW1OoxWgob5IhZSMynE8kSTY5GhYeMqAJDjSqn5Z5tPD3g==@lists.infradead.org
X-Gm-Message-State: AFuF++mS8ZQXk1L7OYruRNwBZEVt8g1uojqcl8Qn9lCXIImvpEVfv5+H
	opxjYDjgv7izbqCUVdCmfOoL5hbyLqt7RkPIvnEPtpVSo0+rOLmxf4ckq59hZ1aKuQU=
X-Gm-Gg: AR+sD12RuNVJyfVKCfR3/6ixzL4uK3Zh+ob/8x/u+f5ovTOn7ScpiPZIHnsqz7jWd4Z
	F23sQcjrBy2DMlpZlWaM66sAQO0W8W0B0hHB94kl41lnHe3jQLnPuKrgtnAZGpcEN/ggv2C0wuB
	RkT89gGVNofNVbVgPe773Mok1j/7/YlVvf8NDK4JEnn1q5fj+nyyKoidkrWy8zoEopa1boVvhnL
	YJ/h3E7wR6gK94rVGop5Otk2EZ4KFYTBpafVwQOaFh9rhVLXHF2+GgRA5jQXbdoc9Lr74ev1IGK
	6CC4faGniRGA9TtOC7NOiNI4RaOXbvFvGvqHyJwJRgNGj7o3CFyZx/VW0Qo5joDa+52BFmVebAd
	ZvP3ovVOhaTQwQ1X2MHsNtfdlTKRYH8T1JwFS8g1eY7jITyTKQBk/Nhq97Cyg0sVHvoqE0+15M/
	yg1gv5z6ruHFFJzvd9bZRajRd5g7QftK+3XBEArild3kro3UfcM2UeNYsI
X-Received: by 2002:a17:907:d408:b0:c21:96e8:578d with SMTP id a640c23a62f3a-c246a684291mr2660691566b.15.1787539285591;
        Sun, 23 Aug 2026 19:41:25 -0700 (PDT)
Received: from ownbook ([195.181.160.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249686e37bsm949008466b.55.2026.08.23.19.41.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 19:41:25 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v2 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Mon, 24 Aug 2026 05:41:16 +0300
Message-ID: <20260824024117.46154-2-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824024117.46154-1-f@lex.la>
References: <20260824024117.46154-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_194128_271175_A084C366 
X-CRM114-Status: GOOD (  24.43  )
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

mt753x_phylink_get_caps() fills in lpi_capabilities and
lpi_timer_default but never lpi_interfaces, so phylink treats the MAC
as not supporting EEE: ethtool reports "Not supported" and
phy_disable_eee() keeps userspace locked out. That undoes what
commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") arranged: EEE off by default, but enableable
with ethtool.

Copy the supported interfaces into lpi_interfaces after
mac_port_get_caps() has populated them, and leave the speeds above
1 Gbps out for now: drop 2500BASE-X from the copy, drop MAC_2500FD
from lpi_capabilities, and skip ports that support neither 100 Mbps
nor 1 Gbps. PMCR folds SPEED_2500 and SPEED_10000 onto
PMCR_FORCE_SPEED_1000, so PMCR_FORCE_EEE1G is what would govern LPI on
those links, and it is unvalidated rather than unsupported: MediaTek's
SDK driver sets the EEE force bits for 100 Mbps and 1 Gbps link speed
only, EEE signalling on 2500BASE-X is outside 802.3, and the 1 us unit
of the wakeup timers is undocumented with the port clock at 2.5 times
the rate. Narrowing lpi_capabilities alone would not do it, since it
gates on the media speed a rate matching PHY reports rather than on
the speed the MAC runs at. On MT7988, EN7581 and AN7583 port 6 is
10 Gbps only and shares PHY_INTERFACE_MODE_INTERNAL with the user
ports, so the interface mask alone cannot tell them apart.

LPI stays off until userspace enables it. The EEE advertisement of a
PHY that advertises it out of reset does come back, since phylink
stops force-clearing it. MT7531's internal PHYs keep the
advertisement mt7531_setup() zeroed, and EN7528 keeps both bitmaps
empty, so EEE stays fully off there.

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. With EEE reachable again, ethtool reports
  that raw value as microseconds and writes userspace values back
  unconverted, while mtk_eth_soc treats a structurally identical field
  as milliseconds (DIV_ROUND_UP(timer, 1000)). Reading the default back
  reproduces the same raw value whatever the unit is, but a timer set
  from userspace in microseconds would be off by 1000 if the field is
  in milliseconds. On an MT7531 board ethtool now reports 30 for a
  switch port, the raw LPI_THRESH field, against 1000 for the SoC MAC,
  which is a driver constant already in microseconds; whether the
  hardware means 30 microseconds is exactly the open question. Does
  anyone have the datasheet answer?

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right; if that
  check is ever sent, it will warn loudly.

On leaving the higher speeds out: the absence of 2.5 Gbps EEE force
bits in PMCR is not the argument, since the same reasoning applied to
the speed field would say the switch cannot do 2.5 Gbps at all. The
masks say nobody has validated it, not that the hardware refuses.
Doing that here rather than in a separate patch changes nothing
observable: while lpi_interfaces was empty, lpi_capabilities never
reached phy->advertising_eee.

If PMCR_FORCE_EEE1G does work on the overclocked link, a rate matched
EN8811H port is exactly the setup that would benefit, so this is worth
an experiment later.
 drivers/net/dsa/mt7530.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..4ed6218df64b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,37 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	priv->info->mac_port_get_caps(ds, port, config);
+
 	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
 	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
 	 * link with dropped frames. Leave the LPI capabilities empty so that
 	 * phylink disables EEE on these PHYs and refuses to enable it from
-	 * userspace.
+	 * userspace. Ports that run at neither 100 Mbps nor 1 Gbps are left
+	 * empty too, since LPI above 1 Gbps is unvalidated.
 	 */
-	if (priv->id != ID_EN7528) {
+	if (priv->id != ID_EN7528 &&
+	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
 		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
-		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* PMCR folds SPEED_2500 and SPEED_10000 onto
+		 * PMCR_FORCE_SPEED_1000, so LPI above 1 Gbps would be
+		 * governed by PMCR_FORCE_EEE1G and is unvalidated rather than
+		 * unsupported. Leave it out of both bitmaps: lpi_capabilities
+		 * gates on the media speed a rate matching PHY reports, not
+		 * on the speed the MAC runs at.
+		 */
+		config->lpi_capabilities = MAC_100FD | MAC_1000FD;
+		phy_interface_copy(config->lpi_interfaces,
+				   config->supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    config->lpi_interfaces);
+
 		/* tx_lpi_timer should be in microseconds. The time units for
 		 * LPI threshold are unspecified.
 		 */
 		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
 	}
-
-	priv->info->mac_port_get_caps(ds, port, config);
 }
 
 static int mt753x_pcs_validate(struct phylink_pcs *pcs,
-- 
2.55.0


