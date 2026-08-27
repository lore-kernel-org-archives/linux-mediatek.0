Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24855C61DC7
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akfGOb5pkYggg80PmucZoF7nPoQ3Nyl03nn3uUvFbXA=; b=yWwZzc1GFJ9K78N8PTbhGmyzMT
	Am8P5PSEuqw5PmGffcMHYBML/3YwVmCqUzhwOQJH3RAPCaMUdCNlp62mB/eCwomY0yOblFpQiHidE
	MxKHMH91OP7I5CUXYEEnWHSZYPmW2x7jcdHA14RyABxHHTWvcI/EVBtmAPwBgKWjcQHOeBYU+gP7m
	XBkZw8woC/OJnj/1sCtckaMnWRNpbyQwMwGFYV8tbrczdUO1mXQx9mO08n6tTRy20P/YTib7PNGgx
	H2ux+KCiE5b78HJhUtpveIDaXpqHHJMb+hDtzdNkTrZaoOluKrHmO8c0LVHeoz9UKutrlHFcDLbn8
	2Yf4Jxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT8-00000004ncA-11jM;
	Thu, 27 Aug 2026 21:17:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT0-00000004nZN-2fRU
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 21:17:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so2322835e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865416; x=1788470216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=akfGOb5pkYggg80PmucZoF7nPoQ3Nyl03nn3uUvFbXA=;
        b=FXmBTF+xso32YTYfJ+yeZ68bufsUcVpDCSX0QzBfAsd3/sM0L2L5I/MEmLOU9hfUgf
         0Xme/KaSzS1FhbfEKtlM7DpsIUExSmNf3SHjQiFpF0xYCL1hDTU4v4gEn5rRueRa91Ad
         /CvvZlUTaqIBFHS0bKGl1H9OlDpOiauDstXDfH1U45pet+fK96vAc38ZaR9Z53HIb9ff
         aWJPEdCM4FyXDOM5LY81cLjWMqfchAX63yd1wMlfOhaYfsRmWU6PhyZ8O/45li5E/idw
         ELtt8cwolIKQi99fCrEZJTmITlrvhRz0EprFaZvStq1ZNvGitrxAUi7OqQdfC75i3llp
         rU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865416; x=1788470216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akfGOb5pkYggg80PmucZoF7nPoQ3Nyl03nn3uUvFbXA=;
        b=pYEWCdCdTOz4s8/zCGCJQafwUZ1G81ojjlFEPb9vJ5RUMzbSHES2nNLAXlxU3CyRXI
         IvSnzVCvjAz/Uspa+Cc7+AzZLv7rNkhpow596QCWLutS5+2klQMKjLGsJ+SqgMMmnil2
         aN5RPcfnHSWrCBjuFAHJFULrWcwpGMYBAxHAVezqK6pGx6i2JqTa1VX1+8uG99d9OshQ
         uOkOilUw3uSOlOxO6iWu2pKVbDPxOZPU8x5qN+MPc+JcFUikXhc7OToK0vX+yPLD+EhY
         LBqj0BneakOxwHygl5TiGzKuPsDf62BwgHMQFKSChvzWgxAXaFXaxYdlUPH5Vk1vlf0z
         2bZg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5MYGOnQ+HXI6bK8gOHlP+87G31vlm7nBRe/V92Xnc8JqUqwpS65boHFIkFakeZtWrl27e9zs71fe81TKJ5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nhx3ND2BHXXNWwMqMZgkQBQeho1W6/1UR7ugsCsG7ITWpe9ITe
	6VvEVXDwY0SW3FCqhUUHRCdHJxZZH9WdERKhDpuud5xwB0kHuKppTheGhdQ6wMrVu/o=
X-Gm-Gg: AR+sD10NNlK72Ms26gct19kmImOHn7IO9pYu9f5l+PGRcU4EPiuJzieUIM2z+pW+gQd
	KMn6UzfsKzW3xN/QSPjxoCfM3+pqX/hY0nsSwwW4rvP/Ckc01CgcT0KFFQjmkEK4id+iPxoWG/i
	WbAzVf9C0015t/wvv82OvnV1rGLvrI0s/5YxulKznhBToopj7fQ7J2jE9szLK9ndKjj2xq+zPjb
	91UtoDm0LimjenNuERShTdMABegn0ehsZKydwmcDhggJhbCuL3vQ3MhHcQGiWae6CIk3aMKYmXb
	iVdiqc2k8xHiJcJ25OUxDioGdbYKrUWbJr2MzIVWUqNs23JGdVpLy6t39Nhol/Uf3HjyUQOu7jD
	OB2t/H+rKOSA0JpenEppCRxRiCLLduht3w1qodQIU/xrqyIsZm7PhErFnEbLLg5nXGpo6R4bZZa
	q1tkL3VHlYYMbB2b7/An32MlxmiTkLSMSuBtt/4nmiZj0uG2w0p/K9QwMT3MSAbT+/BA==
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr26372755e9.2.1787865416128;
        Thu, 27 Aug 2026 14:16:56 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:16:55 -0700 (PDT)
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
Subject: [PATCH net v3 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Fri, 28 Aug 2026 00:16:50 +0300
Message-ID: <20260827211652.63504-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141658_714452_94080A85 
X-CRM114-Status: GOOD (  16.58  )
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
v3: both commit messages cut down to the Why, with the mechanism left
    to the diff and the detail below the scissors (Andrew Lunn); no
    code changes.
    https://lore.kernel.org/netdev/20260824024117.46154-1-f@lex.la/
v2: commit messages rewritten to carry the Why only, mechanism notes
    moved below the scissors (Andrew Lunn); comments and commit
    messages reworded so the 2.5 Gbps exclusion reads as unvalidated
    rather than impossible (Daniel Golle); no functional changes.
    https://lore.kernel.org/netdev/20260822195252.2934-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: populate lpi_interfaces to fix EEE support
  net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support

 drivers/net/dsa/mt7530.c                    | 24 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++---
 2 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.55.0


