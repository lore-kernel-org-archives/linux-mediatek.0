Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82201C624A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 12:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=abT7VqpybEgUMKiyUxYdksUtrvwhOjj1ImBvIGn0b08=; b=lGkBFuwesCVon5o5jhQa/TA24O
	B+FcKRL2fYy+mnLRsJw6Ph9Dga4ecquqA2jUSSEQMJjanlZYbuwwK4aFctSssCpSjYzu1zIts4tHC
	4N23GzDx1OHZJ6888xQ3a4gZiq1r4trgXdi0p8WJ/jWA1CP1BS95LalOalzPRnkiRx9wffLclIHlU
	xhrwiDoV7cGvWtCE97S0uWlbuIW2c79diVKsmZpx5GN1GEaV2VaJYdvOXeWXETPErehj24x2sO3WO
	g+SKP5rG52N+jMAwVGbwrUCrmTe8NZqb1ctcze9WgeRX8ElEhH2TbFLE/ETGJrZYOqft9bhA4l1rc
	G9RERs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26gW-0000000HJSM-0PJj;
	Thu, 03 Sep 2026 12:36:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26gT-0000000HJQa-1q5x
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 12:36:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso1143343f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439007; x=1789043807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=abT7VqpybEgUMKiyUxYdksUtrvwhOjj1ImBvIGn0b08=;
        b=PWT9klCjhna1SOqX9zxyQBpl3Uedt8gINzn/YZnFty7fdxg6/Fi6ldlmiuk0oAFsKd
         RYRhbvyYJKvbcejCswpzg4+iLX2k9DduGN8YSfnCFfNWkRH6C9eQKOVMTiQnnN5AHEXH
         023wwneMKjiAhOVsbYGeBq0nvY9P4Uckf0tVkyvbMNfIhOuCYyGYivCFK7wNx86i+TsS
         VFWm4BMse2EBOBn8RxCyNE0C9FXRmUfewzTYJbdF9YcqkCeex9jmd52FcgCQUWvoUMId
         dJNRWRsIyw8G+v/NB/jtVjOV2ED6o2kQ62aGauJwduZOpdsvfoUmYodS9krodr3zr9Ou
         RQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439007; x=1789043807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abT7VqpybEgUMKiyUxYdksUtrvwhOjj1ImBvIGn0b08=;
        b=lmSNJNeE3D/d/lD4mVkbccmuzmDcA9ohAoGRaMxAgSkbYZx6mqhG3IBN7l6Pci41l9
         Os813x4hY/VrSwOoQSV3fkvwcTahBkhhdnrtvtLW/QSQrZ7wGJTgO+71Syk6PXXjNy9g
         ITw23H4ITyrmi4qedw2VT8jFAMDOdBa8Hzsr0lN9PvxMHiKSfC2OylN2klFgSEfaZ5zm
         20vqnbqHpADtdmyKJ6OhsJBx3EeZJWUBGtcj8dDAO2k5314slKMmlm421b0XrOcH7WDn
         biD1jgvxLiraiAA5CYW/C2NJQKKfd1obF7b8FVwVEx0vimVHCI3FE+RElADfW7efv61T
         +nDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQOxDAam5RZo+zOJh2i7x/apJgzMZIpE4/no5ur3rvtJOOF5gIXlUl369d2W2iPVUgQcwcshiUchUheP6QPQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nPQ7Dy4RwOUqv2ZxWt0d6LuXXMhENaPnfVnHXiY2S8lWQDSpbX
	izPPPjn2j83JC1Io1aTysqx3V1nEXvA19XQNhCvRsfC0WDfZ51peHtNHCW+0IOM+5W8=
X-Gm-Gg: AYBFou1S6PRTcMWwLF/MHOVk1IgmKnlssHlJrulDzAL2u3D4Fe4mFWk3YgFJ3SiNG/B
	Sp8yzveupRWu47hFmgU0V8XWGCynQ10Ssewx59tl9+Qkg6CTuypPgQfpwx5ZtMm53OJYwL4ofGV
	/m/OvEuusJruuRhgO+gNxvIpxAqhftBkmIJRbxiUffoNQnfNDi+LFkX6s3Dz7Nj5nI6kmN16C8M
	gXz2eMliorEaUac6y88IsiCuP6mqAepkMmiDVha5+wWiyXY/pV4TZgpeJOXTnIx+xhZ5S9wwzjr
	Pd6PgEYDUbEoaCpHffNrekBbDesvhlV9yNdUtN7YKTQwpIJcfEo3+LY8wIDfPEb3dwpfb7IHTZu
	/hCGaYRZ2J7rLvEG5pIwb4ss2paVHEvXdthwDJXwN5+8Ls58zDOaPWCoozTFAmGiiIkzFKQDEiW
	q52u5wuF+wsuVsn6kxUZpP3dBy0J/jThXyRKUTToRmupio/W+SwPg=
X-Received: by 2002:a05:6000:98c:b0:474:530:9d with SMTP id ffacd0b85a97d-48488f20a10mr24494726f8f.13.1788439006829;
        Thu, 03 Sep 2026 05:36:46 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm12828927f8f.8.2026.09.03.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:46 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v5 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Thu,  3 Sep 2026 12:36:42 +0000
Message-ID: <20260903123644.23800-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053649_515128_F1860744 
X-CRM114-Status: GOOD (  18.57  )
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
MAC that uses mtk_phylink_ops since the two commits named in the
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

The SoC MAC patch fills lpi_interfaces only on SoCs carrying a new
MTK_GMAC_EEE capability. mtk_mac_enable_tx_lpi() programs wake-up times
taken from MT7531's reset values, and the capability marks the SoCs
where those have been measured to work: MT7981 for now. The others keep
today's behaviour, EEE unreachable from userspace, until someone with
the hardware confirms them.

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

Based on net-next at 91ec20351349. All three files touched are byte
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

On wan, cabled for this round to a partner that advertises EEE (a
BCM5720), the MT7981 GMAC's own LPI was exercised. With tx-lpi armed
the wan PHY's MMD 3.1 reads 0x0f44, Tx LPI indication set, so the MAC
is asserting LPI; it drops to 0x0044 with tx-lpi off and comes back
with it on. The same 30-stream test at 1 Gbps lost nothing over 9000
packets with the link cycling through LPI at every 1 s gap. At
100 Mbps the only losses were the first packet or two of some
streams, and those reproduce with EEE disabled on both ends:
neighbour discovery for 30 streams starting at once. The 17 and 36 that
mtk_mac_enable_tx_lpi() programs therefore hold on MT7981 against this
partner at both speeds. Its Tx LPI reads 1000 (us) against lan1's 30;
see the note below the scissors of patch 1.

lan4 keeps EEE disabled and never arms LPI, which is what dropping
2500BASE-X from lpi_interfaces is for. Forwarding through it was
lossless with no carrier change.

---
v5: in-code comments cut to one line each; the reasoning stays in
    the commit messages (Maxime Chevallier). No code change.
    https://lore.kernel.org/netdev/20260902080519.2211373-1-f@lex.la/
v4: patch 2: populate lpi_interfaces only on SoCs carrying a new
    MTK_GMAC_EEE capability, set for MT7981 after measuring its LPI
    exits; the other SoCs keep the current behaviour (Paolo Abeni).
    patch 1: lpi_capabilities is derived from mac_capabilities instead
    of asserting both speeds. Cover: the MT7981 GMAC LPI measurement.
    https://lore.kernel.org/netdev/20260827211652.63504-1-f@lex.la/
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

 drivers/net/dsa/mt7530.c                    | 16 ++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 +++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +++-
 3 files changed, 30 insertions(+), 8 deletions(-)

-- 
2.53.0


