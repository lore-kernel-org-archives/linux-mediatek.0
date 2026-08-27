Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB2DC61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=; b=YfyLht9FAoEprV7JyCpw9ZPRuH
	eh5PzUtgRkzOtEFbRdn9NOyUHgyPDwZdbSGPYXRQX6EAphC2AOFunyvnjjNaxM4TzfFITBwROY52f
	HSXvXvJe1YblW5j9zIeHQJaQu8r+RkyS2usyg/YgcEGSJ2y9YyUKafn2HA0h6G7iiKJcHYjyzASud
	ZkcQjpolenduvmmvrKm52yLzK9J3K95WItqonwJ6KRJk9KY58sFu0/Hajo8P603aQDoMZ1v3zNO+x
	LdlFbHFA2XlEFrGEhU3eCKtPg0tVcTAK1G7pycVeCmDqaOimJY5OBFqvEqqG63u0CZhBqYPZA8abY
	cAiVAZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhTH-00000004ngR-20IE;
	Thu, 27 Aug 2026 21:17:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT2-00000004na2-2vOg
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 21:17:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-482e5733a5aso183149f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865419; x=1788470219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=;
        b=YZaH2u9EPYNCB2NndIi/pkSKFUfIGH2Mm3UPVQmxiKeHYADACgg4XZGJrelPkB12Bc
         zCLjjSmktCBHM9AmMe+tPi0WmF2ucAhFGYmOLnZWsV8ViYGHZXFg2VNigeDFaWMgIZr7
         +4gtImDeQTrZy/zBKP/hhJDH1wXCuTGWDjZL31H8i6A/xrfHcmIFxOT1Zb+I3Kx2xWXD
         ChahzS6LASfmEcnrlT+CXdbZ2wK2afwc0UYl5bB77ge79Lo/mOMrWdx8N90ZtWtCJr8L
         1KoM7MbOra/ohJQ4P9dV9Akjyb9s0/Mxd3aZNBKMUzY5+BYRfGIvHGdWJC594+wC9H0P
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865419; x=1788470219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=;
        b=hVp/B1bqGG7Atj3ul2NQ38fqfugP7W8JW64QuSOOhfX7t2TrK+n5zsRkjft849K6wr
         10bnSUS2wmY6Vsj3vl0GfM8unLmtrHZVixJYaPgOj73VSMemxkO0vx0RIitu7cfmI3dY
         pPd2z86YKXO0vCsJIOWdIvmZKYtXv4tSoljB2DZo1TRwa+v8yM4nFtRT/+meRG/Jtrgs
         /1hDuko4peiFAM7UuL9sEnt/Xj3yf4al282vzZHYNJrYVp3++lAIUBzQ1kcm9Dl/NCfZ
         gs4pCDh/7nEo6zx83A2tJjgTUbVEOTceGMhwMHefDq4FQkRSBKTzyn2ELx2NfpCxJjo7
         evMg==
X-Forwarded-Encrypted: i=1; AHgh+Rqkw0f1DLBCreMawEqwERn6+HBIQeIb8v2ysHQLQ2eirc2aVa/GELD7piVs8HpNUR0qS4b5E8lP3IS6IawAtw==@lists.infradead.org
X-Gm-Message-State: AFuF++kS8TGxhQaJtzfmKEcCKLxzsb7e1mD7LfzcbnunDk0Q/qpkevYU
	O3NXzC0gy3W16ZhjMFhVrp5PDxHlf2mga9BQzgyH8euqkcSb7LP2z6HzSnTbGDcX3TYQL3N91Vb
	jEISiWKfaDw==
X-Gm-Gg: AR+sD10/jFYVb1witJDh3Pmad3OVX/uQIgg2MnXR5WFR/y6drdtyqc7Zv9sbEC0T9Re
	1hI+J/3bNHQpf3TXI7CeLompAtbaUIN/ueGGqwfpGXVfdOfN/ojYfl+V3f3hZBalHlrMxoODzdi
	4fP8rIIWq2eXEAXTn2nIa7UPSKOgCnl75401E5G8aGiRliZrAT0PR6nwEJ8DNHDfIuG2kSwuB3l
	p9YMVCUJLUhCu1iKkRDnTJHAsqRziGJ/WxLxQ5RFC4++bvHRS0s1KsZ5e1cI6lPPt6PB59ZA/Aj
	EOBlzT/vgIov8F8UAYgXR1a2De4wkh65aKoHtkDMkCc8L9ocv1N/E8npVqdk22qipWfGgQVmSzj
	VDg6XJKNdhztFFWFPP0vK/M/8PSe3Uxh6QcvtcsgIgBrl2ABBThS9oSj7dq4Wku5veIO2TJ3dHj
	6VAPRR4040/l/0KnthXPvnGokHKsCw7PXqL2IRK++VLCz7m53ESt3RuQ8=
X-Received: by 2002:a05:6000:40ce:b0:482:e2f2:19c5 with SMTP id ffacd0b85a97d-482f79cc09fmr1611455f8f.4.1787865418791;
        Thu, 27 Aug 2026 14:16:58 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:16:58 -0700 (PDT)
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
Cc: Aleksei Sviridkin <f@lex.la>,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Fri, 28 Aug 2026 00:16:51 +0300
Message-ID: <20260827211652.63504-2-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211652.63504-1-f@lex.la>
References: <20260827211652.63504-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141704_389152_8FFCA72E 
X-CRM114-Status: GOOD (  19.56  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.

So ever since the conversion to phylink managed EEE, ethtool has
answered "Not supported" on every mt753x port, and phy_disable_eee()
has locked userspace out of turning EEE on. That undoes what
commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") arranged: EEE off by default, but reachable
with ethtool.

Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
unvalidated rather than known unsupported: MediaTek's SDK driver sets
the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
wakeup timers is undocumented with the port clock at 2.5 times the
rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
alone cannot tell them apart. MT7531's internal PHYs keep the
advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
empty, so EEE stays fully off there.

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. ethtool now reports 30 for a switch port
  against 1000 for the SoC MAC, which is a driver constant already in
  microseconds, and mtk_eth_soc treats a structurally identical field
  as milliseconds. Does anyone have the datasheet answer?

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right.

v2, with the full argument for leaving the higher speeds out:
https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/
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


