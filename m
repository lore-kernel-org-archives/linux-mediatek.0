Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDA8C5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 02:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQDlZUqXKTPfwqBY8N8tCdcmyCJmkDuzU6UtMMpoHKM=; b=Q3710fumtxuGonwHTk4GkjBW7b
	efEYqKhDsXgv+9/q3akVlYaCrYAlvnsEL1zcVpvIux2aORoTx8wARiKTAI03wq+QrntPQg6x/L/ch
	AyJIxbwcjc9m8nMxX0kCWdH5DldDq6k+Wqe5bWctwODgjnKSlAOf1HP2q0paYpJUR+3nBLT6BwADX
	99GIGR6WOwavp5y/+X/TZ1CzbX3YK9cry4YsEezXq7jMiqw5xPNzLoGJQqck45lNo/DrE166sHymd
	Ma0fnyH6Co1/M5DeSykAo4VLrqjzEQ4jrIct2TyokQPw+1nkXwaFv3d48WjYGf315qXHIkmRNSWIG
	po4pstyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKcp-0000000FoRQ-0Qz8;
	Mon, 24 Aug 2026 02:41:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKcm-0000000FoQO-3kpY
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 02:41:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c214e625259so412463166b.2
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 19:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787539282; x=1788144082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQDlZUqXKTPfwqBY8N8tCdcmyCJmkDuzU6UtMMpoHKM=;
        b=N41htkx0UfOL5kiq/HAfv3IqlNaEdyEvIyVwQ9BNvRFNlETvGcxFaqeSBN+4lge6zN
         Os+eYfVR8tTM98zpV8HA770fYmcoaC5v3MDcKWdfoN+qDL4/rAchW8xs6qbUebrbqKup
         GiLGixfYbW/fjWEG1wcnlVYnghC27t/QBFZ2XGg7N2wHZ4EfAFfIszQpWtbmOU6rIX/a
         K+v4GI+BaFyKzEdcj5Mc5TJOuYwPfKY0t4KHU5YWZuOrV6ds+LjDFuCw4L5UWLeTrzey
         KpoD7kP7Ls6wFZIEw4yi7KnpjGteCnNcWK1I/+c18kj9aqlgrDLIgnAZnfRgWea96dGn
         rj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787539282; x=1788144082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQDlZUqXKTPfwqBY8N8tCdcmyCJmkDuzU6UtMMpoHKM=;
        b=TcQvFTjRegoreeb7WEMbbrzL3VKjr1jnDdsniY0eEXJ+h75LVGEIX73cEGsoi1OmW9
         h40kfOCJsPgozt6bgXfwvduW6ZrZz//s9eql6I4IesTgHyy5l35f0PcD7fWwlQeY08jW
         WbIJA0lHPF/5M4RxscRcndKgiAI69N1a8RZv9lGjlXYhzpgr6EbsE9XmlRZWqL2orqm7
         wp2Sg+IWpDGmf5MdGUaHyTuScXIt+SDSGzTF7y6eD0pFIdhyUjI9Rgs8W092FNbukG5m
         9FleeVdmZFfverkajVt1PU2AqWHJQb5zBWbGhDD9mr2FYuU4H3WgeiRvYb+WD+RgG1S5
         Axig==
X-Forwarded-Encrypted: i=1; AHgh+RqRUzyMKycdrTjcJOGO8sKfCqjW58ymyfyYG5UGjuZghVrvGtXE8XU4jlpq6xAGc6KSQCrnaqrNvUAEjepWJQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nC7yjDc+n7FrdlFHkNWsN/UxvBKVzUDu/z2oTrJvYzbFzCAPnc
	sIqLadMkrsJZSPdNKRE/WLYhAdaqoQ1mHgZb4QOoxdMHIkvFEYJxMW2E8a6eJcytljU=
X-Gm-Gg: AR+sD10kbhat2lvohPfYHNBINPW37UMvcVoNIwSyxNINDj6HVi2kKLjSiYDP1ckaaNe
	sBAlEz+ErAx+MzHVeXLtttZqLh57rarmPh72AOMJbO7A2DY2Kp05VqsgOlX6ACw7NpCNwNgITV8
	Ar+/CMidQbMqfuy9DRzoKQlVtm2D2Qls8LVnnRIr0YTE2udlRS1qlareBSVMLhdbltuiSqMrnhF
	Oc3PsQ2OxHlr+jb0M4g4zuGlO7sOwHlqHk4KW+cn3jY4FBfcQclowUdZkr2gGBJpkPUbbbznmxc
	Duuygu2yO/cbz6LsmGXAL9rOqrIEPGdWiA5syTBNOM4erTiQtWVA/rDnRX5Ox9TJGNCA0+aYJGu
	fqKTHng48sHMR44qZgpgTqZIchyhZF18NmMtN8BUICC78tlg6/E7PC2so48huv7cfV6Iqfa4s4Y
	7C14hGAvmWJehuk275Sg2xaC5uLFUiGrsLdgPN9YPupor96vDGkmF8KmJL
X-Received: by 2002:a17:907:97d5:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c246a33ea8bmr2393322466b.8.1787539282331;
        Sun, 23 Aug 2026 19:41:22 -0700 (PDT)
Received: from ownbook ([195.181.160.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249686e37bsm949008466b.55.2026.08.23.19.41.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 19:41:21 -0700 (PDT)
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
Subject: [PATCH net v2 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Mon, 24 Aug 2026 05:41:15 +0300
Message-ID: <20260824024117.46154-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_194124_968172_9C79FA2A 
X-CRM114-Status: GOOD (  15.77  )
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

Both drivers fill in phylink_config.lpi_capabilities and
lpi_timer_default but never lpi_interfaces. phylink treats a MAC as
supporting managed EEE only when the tx_lpi methods are implemented and
BOTH bitmaps are non-empty, which phylink_create() decides once and for
all, so EEE has been off on every mt753x port and on every mtk_eth_soc
MAC that uses mtk_phylink_ops since the two conversions named in the
Fixes: tags. Because the tx_lpi methods ARE implemented, phylink takes
the other branch and calls phy_disable_eee(), which fills
eee_disabled_modes - so userspace cannot enable EEE either.

On an MT7981B board with an MT7531 switch, before these patches:

  == lan1
  Cannot get EEE settings: Not supported
  == lan2
  Cannot get EEE settings: Not supported
  == lan3
  Cannot get EEE settings: Not supported
  == lan4
  Cannot get EEE settings: Not supported
  == wan
  Cannot get EEE settings: Not supported

lan1-3 are the MT7531 internal PHYs, lan4 is an EN8811H on switch port
5 whose MAC side runs 2500BASE-X rate matched to a 1 Gbps media link,
and wan is the mtk_eth_soc MAC with its directly attached 1 Gbps PHY -
so both drivers are covered.

Each patch fills lpi_interfaces from supported_interfaces and leaves
2.5 Gbps out of both bitmaps for now. LPI above 1 Gbps is unvalidated
rather than unsupported: both MACs fold 2.5 Gbps onto their 1 Gbps
speed encoding, so the 1 Gbps EEE force bit is what would govern it.
MediaTek's SDK driver sets the force bits for 100 Mbps and 1 Gbps only,
EEE signalling on 2500BASE-X is outside 802.3, and the 1 us unit of the
wakeup timers is undocumented at 2.5 times the port clock.

Neither driver sets eee_enabled_default, so LPI stays off until
userspace asks for it with ethtool --set-eee. The EEE advertisement is
a different matter: phylink stops force-clearing it, so a PHY that
advertises EEE out of reset advertises it again and the link may
negotiate EEE, without this MAC asserting LPI. MT7531's internal PHYs
and EN7528 are the exceptions, for the reasons in patch 1. Devicetree
eee-broken-* marks act at the PHY level and keep working, so a board
that already distrusts its PHYs stays protected: OpenWrt marks all
modes broken on MT7621's internal PHYs.

The two patches are independent and touch different subsystems; they
are sent together because they are the same bug.

Targeted at net as a regression fix with an active userspace lockout;
can be retargeted at net-next if maintainers prefer.

Based on net-next at 91ec20351349. Both driver files are byte
identical in net/main and the series applies there unchanged.

After the series, all five ports report:

  EEE status: disabled
  Tx LPI: disabled
  Supported EEE link modes:  100baseT/Full
                             1000baseT/Full
  Advertised EEE link modes:  Not reported

No 2.5G mode is offered, which is the narrowed lpi_capabilities, and
nothing is advertised until userspace asks. On this board no PHY came
out of reset advertising EEE, so the case where the advertisement
returns once phylink stops clearing it is not exercised here.

Enabling it on lan1, whose partner advertises EEE at both speeds:

  # ethtool --set-eee lan1 eee on
  EEE status: enabled - active
  Advertised EEE link modes:  100baseT/Full 1000baseT/Full
  Link partner advertised EEE link modes:  100baseT/Full 1000baseT/Full

  # ethtool --set-eee lan1 eee on tx-lpi on
  EEE status: enabled - active
  Tx LPI: 30 (us)

With LPI armed, 30 parallel ICMPv6 streams of 1400-byte payload, 300
packets each one second apart - so every gap crosses the LPI threshold
and the link enters and leaves LPI thousands of times over 300 s - lost
nothing: 300/300 on every stream, tx and rx error counters unchanged,
carrier_changes unchanged, and no mac_enable_tx_lpi errors in dmesg.

On wan the link partner advertises no EEE, so enabling it settles at
"enabled - inactive", which is the correct outcome, and the link
survived the autonegotiation restart. Its Tx LPI reads 1000 (us)
against lan1's 30; see the note below the scissors of patch 1.

lan4 keeps EEE disabled and never arms LPI, which is what dropping
2500BASE-X from lpi_interfaces is for. Forwarding through it was
lossless with no carrier change.

---
v2: commit messages rewritten to carry the Why only, mechanism notes
    moved below the scissors (Andrew Lunn); comments and commit
    messages reworded so the 2.5 Gbps exclusion reads as unvalidated
    rather than impossible (Daniel Golle); no functional changes.
v1: https://lore.kernel.org/netdev/20260822195252.2934-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: populate lpi_interfaces to fix EEE support
  net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support

 drivers/net/dsa/mt7530.c                    | 24 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++---
 2 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.55.0


