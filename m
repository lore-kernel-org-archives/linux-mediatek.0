Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C2EC43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zLQoqPPcfbSVabfiloqaQboxTOY5hjDi7McFC+NKIs8=; b=kW990SMAM76gF4PquskuM2mWVp
	EMEv2qGprNEv0jZOcRGq/jIyvlSXeFbVQq+EJHNa2ehK+Ke1aJqPx67MZ++H4oRH/2LaHwmZA8hzO
	mceHsOntj6dwsBzrNjdEs++RgOzNPbNLo0sW86D9zOXMCpSxul0Fmmaohe0fA58uYXBdjjt+lKZY4
	kYKLUCUUDcLX8haHP5z8Wi6W81ausg2ziApSf1Kxp2ma6d+6JhoXtp2AnhbvYtkKmEEi6LJuMH2m8
	nPosQYjfHZjSBFuy+ruAvWAinJIDwp3CT6sjA/SPZvrr/8IvyhJ7fRhlde0gQfWgTz8yQpjbg63Bv
	RmNZ7ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW59-00000006UpH-3Q2j;
	Sat, 11 Jul 2026 11:41:19 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW56-00000006UoW-1bvi
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Jul 2026 11:41:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3811f512167so2256659a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Jul 2026 04:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770075; x=1784374875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLQoqPPcfbSVabfiloqaQboxTOY5hjDi7McFC+NKIs8=;
        b=hUDBIqKvN09NLCQ9iYIwmmbOWOhmWdP/tYnfBzlsLwccibs5Wzer5uXiOtboI+f2/y
         6lFuHNep/GJvf9dhF18aOZSTCTciEZSl1cfyX6vM2aaw420/RM8oWZ0D4Ddp94+ZuaVP
         Gxr5ddKRrFjkurmg9Xr8uRHfUNLo3k+MXCkYoKuuB3P7I1yjfCvdv2c/7V10/+qHgrbD
         Gw7uNwlnjiMfjI9ImmANT97Hlq/UDNN+95xl5euea0rpjh3AG55hEzLFckYHzSsKEd/O
         E/KNGcYaVkQbazKAJmGttQ02RVi2vVSep7+Vg7PLOiXCxs8CayOyGg+4X7l4I+QsyeF6
         8puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770075; x=1784374875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLQoqPPcfbSVabfiloqaQboxTOY5hjDi7McFC+NKIs8=;
        b=rC/CKqvnssfc93iwqV/FI67fvHkpLQoOvw6v9DDoAE7urLVbgF+uN/T2ziwuFVi6E7
         mn/I6Bbij7xHquiJyJZJBzXMbHm3HpjJSRG4Aj7Uww3ah2BJlVR/K3etybbYUQOWTWbt
         11rgI7REP0r46dkCf+EZ1TlXnsmRRGLGjIFlUIW3A7fWcLb2iOVZSWRpz72Xk61X7/9X
         seQ4OpGhfO75FMcVL+lVAt7CNXOuMixy7xeuA+tJShcFXDsbMADQYnj67XaYMjr6/Qsn
         mo0NelPTl15WOqEZ4mFLZ6JzxB29GuHgQG8dzR4LhUBYy0frrcurAmMKNNR8sND2QsFl
         ++2w==
X-Forwarded-Encrypted: i=1; AHgh+RosqzBHITAZMr5DIiYAPEoYfzXFlg/zJ7u6OH1fd3f4PHfHsi0nsSrWPNmXfpListeTmEZcRfrto3Txi6TP/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPIrGjpOjNt/yCyoQ2RFWdaoEPDA7dNiHXyKKukNy2zxpRApmf
	Rga/S745toXgqyJ4DprdLS4ij91Xn2TYPE4BJaBTvQHQi+NdUxYqScAF
X-Gm-Gg: AfdE7cls+k9uq2wtq8B0yYKhAPEPxGr9bZl8yeiatRoafv4dknHTxvxKrXhefdIUxxe
	VE/BvqeYSE1nr5C/qBEwMqYlymr+jK8qzhs6GIME4XrG1jk6ZCoOrZbFsXbRBU3493dhCyDot1I
	5RhzwpUH7uvU/5klDimlkI8TwuY+byEFFv7dxl+aaWIxz3/AvV7pFgJmaYnOA7aXQCnausnknMV
	IkA3mW78Ha3CvL79BHZsnJxaqEqawKZ5XqJ0DUrtqC2+rF39ZkCL2ztJ1HHlagbA7cSInTMKD20
	17HcCVXyv6ElTX454qmtUPYAiKQZYIzbY63KO0oGQsxhlPv60EKRe45LHkQnpf4+78V75GlHcqQ
	QOB358suro5uKfhKk0j1X2jUhZO8NvaE/vGTgfS2EHdnOM2t4xngnEFC4MbvmqwUgzYAOO8FAT7
	ZYmoPllR5gcdAT9Qa2p79s
X-Received: by 2002:a17:90b:2241:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-38dc73c330fmr2515609a91.8.1783770075031;
        Sat, 11 Jul 2026 04:41:15 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm32390087eec.24.2026.07.11.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:41:14 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next v2 0/2] net: dsa: mt7530: add EcoNet EN7528 built-in switch support
Date: Sat, 11 Jul 2026 15:40:59 +0400
Message-Id: <cover.1783770059.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_044116_440716_E4EED40C 
X-CRM114-Status: GOOD (  23.72  )
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

The EcoNet EN7528 is a MIPS SoC whose platform support is already
upstream. It integrates an MT7530 switch, memory-mapped like the built-in
switches of the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs, but with a
true MT7530 core, four Gigabit PHYs on ports 1-4 and a CPU port at a fixed
1000 Mbps full duplex link.

Patch 1 documents the compatible, patch 2 adds the driver support.

Changes in v2:
- patch 1: reword the commit message to explain what distinguishes the
  EN7528 from the other built-in switches and why it cannot fall back to
  one of their compatibles (Conor Dooley).
- patch 2: drop the setup-time EEE advertisement register writes. Instead
  leave lpi_capabilities empty for the EN7528, so phylink disables EEE on
  its PHYs via phy_disable_eee() and rejects enabling it from userspace
  (Andrew Lunn).
- Link to v1:
  https://lore.kernel.org/netdev/cover.1783680864.git.naseefkm@gmail.com/

Ahmed Naseef (2):
  dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
  net: dsa: mt7530: add EN7528 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 ++
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 58 ++++++++++++++++---
 drivers/net/dsa/mt7530.h                      |  1 +
 4 files changed, 57 insertions(+), 8 deletions(-)

Range-diff against v1:
1:  68e85666b6df ! 1:  2133035bb22e dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
    @@ Commit message
         are connected to integrated Gigabit PHYs and its CPU port is connected
         internally to the SoC Ethernet MAC.
     
    +    Those three switches are MT7531-based, whereas the EN7528 has a genuine
    +    MT7530 switch core (its chip revision register reads 0x7530). The two
    +    generations differ in their register programming - for example the CPU
    +    port is selected through the MT7530-style MFC register rather than the
    +    MT7531 CFC register - so the EN7528 is not compatible with the existing
    +    switch compatibles and cannot fall back to one of them.
    +
         Add the econet,en7528-switch compatible, with the same constraints as
         the other built-in switches.
     
2:  1865eaedef97 ! 2:  8c7dfabd860a net: dsa: mt7530: add EN7528 support
    @@ Commit message
         an ID_EN7528 variant bound with the "econet,en7528-switch" compatible,
         reusing mt7988_setup() and the indirect PHY accessors.
     
    -    The switch core, however, is an MT7530 and not an MT7531 derivative: it
    -    has no MT7531 CFC register, and the CPU port to trap frames to is set
    -    through the MT7530-style CPU_EN / CPU_PORT fields of the MFC register, so
    -    add it to the MT7530 handling in mt753x_conduit_state_change(). For the
    +    The switch core, however, is an MT7530 and not an MT7531 derivative: the
    +    CPU port to trap frames to is set through the MT7530-style CPU_EN /
    +    CPU_PORT fields of the MFC register rather than the MT7531 CFC register,
    +    so add it to the MT7530 handling in mt753x_conduit_state_change(). For the
         same reason the MT7530 mirror and force-mode register layouts already
         apply to it as the default of the MT753X_*() macros.
     
    @@ Commit message
         EN7581 switches, whose CPU ports run at 10 Gbps.
     
         The LAN GPHYs advertise EEE by default, but negotiating EEE with some
    -    link partners results in an unstable link with dropped frames. Disable
    -    EEE advertisement on them at setup time, like mt7531_setup() does for the
    -    MT7531 switch PHYs.
    +    link partners results in an unstable link with dropped frames. Leave the
    +    LPI capabilities empty for the EN7528 so that phylink disables EEE on
    +    these PHYs and refuses to enable it from userspace.
     
         Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
     
    @@ drivers/net/dsa/mt7530.c: static void en7581_mac_port_get_caps(struct dsa_switch
      static void
      mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
      		  phy_interface_t interface)
    +@@ drivers/net/dsa/mt7530.c: static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
    + 				    struct phylink_config *config)
    + {
    + 	struct mt7530_priv *priv = ds->priv;
    +-	u32 eeecr;
    + 
    + 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
    + 
    +-	config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
    +-
    +-	eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
    +-	/* tx_lpi_timer should be in microseconds. The time units for
    +-	 * LPI threshold are unspecified.
    ++	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
    ++	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
    ++	 * link with dropped frames. Leave the LPI capabilities empty so that
    ++	 * phylink disables EEE on these PHYs and refuses to enable it from
    ++	 * userspace.
    + 	 */
    +-	config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
    ++	if (priv->id != ID_EN7528) {
    ++		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
    ++
    ++		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
    ++		/* tx_lpi_timer should be in microseconds. The time units for
    ++		 * LPI threshold are unspecified.
    ++		 */
    ++		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
    ++	}
    + 
    + 	priv->info->mac_port_get_caps(ds, port, config);
    + }
     @@ drivers/net/dsa/mt7530.c: mt753x_conduit_state_change(struct dsa_switch *ds,
      	 * forwarded to the numerically smallest CPU port whose conduit
      	 * interface is up.
    @@ drivers/net/dsa/mt7530.c: mt753x_conduit_state_change(struct dsa_switch *ds,
      		return;
      
      	mask = BIT(cpu_dp->index);
    -@@ drivers/net/dsa/mt7530.c: static int mt753x_setup_tc(struct dsa_switch *ds, int port,
    - 	}
    - }
    - 
    -+/* The EN7528 LAN ports are integrated GPHYs at MDIO addresses 9..12 (switch
    -+ * ports 1..4) on the switch internal MDIO bus, reachable only through the PHY
    -+ * indirect access registers. There is no mdiodev to derive the addresses from.
    -+ */
    -+#define EN7528_GPHY_BASE		9
    -+#define EN7528_NUM_GPHYS		4
    -+
    - static int mt7988_setup(struct dsa_switch *ds)
    - {
    - 	struct mt7530_priv *priv = ds->priv;
    -+	int i;
    - 
    - 	/* Reset the switch */
    - 	reset_control_assert(priv->rstc);
    -@@ drivers/net/dsa/mt7530.c: static int mt7988_setup(struct dsa_switch *ds)
    - 	/* Reset the switch PHYs */
    - 	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
    - 
    -+	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
    -+	 * with common link partners (e.g. Realtek GbE NICs) results in an
    -+	 * unstable link with dropped frames. Disable EEE advertisement on
    -+	 * them.
    -+	 */
    -+	if (priv->id == ID_EN7528)
    -+		for (i = EN7528_GPHY_BASE;
    -+		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
    -+			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
    -+						 MDIO_AN_EEE_ADV, 0);
    -+
    - 	return mt7531_setup_common(ds);
    - }
    - 
     @@ drivers/net/dsa/mt7530.c: const struct mt753x_info mt753x_table[] = {
      		.phy_write_c45 = mt7531_ind_c45_phy_write,
      		.mac_port_get_caps = en7581_mac_port_get_caps,

base-commit: fe3e786ef4eb6e47d2901f568a27bd920477bbe9
-- 
2.34.1


