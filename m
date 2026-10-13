Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04E0CC6B1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpeZCtjtr3RFnVadMQBbI2r1C6CwdAtY8VnYl6TRGII=; b=1txjEhI9O0Em7ZJ4VeFourLZ/n
	aqofXaaACwnQcnMBlk122FV0LDbqoGK/8sqMv8yjlLzPci06zUl8Zy4oGpwKsCw/f9vN362l/e4hc
	Fcps0gY4xZnMiBC4SnIav/GZcyFCKgTXPbZsMRb/bjCJ4jLExEb3Fkft95IcHEBWHQVOPWUZ9iwlR
	wWHmfu2RXbQpqPr6RFDk4CHeeHgAsXf+CwzZ+zCeeA6FWRob+wEDDycR9Eh/fBFV49svDyKXMY6Qv
	hq9yWmBiBawX4+CE8aMUV2B0UNJ6IP+KDjjmUteYjndzr+e5ND8ZbDONwLutA/xLNsAITwfsU52Ez
	iQfI7bLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGZ-0000000DFse-26KY;
	Tue, 13 Oct 2026 15:18:11 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGU-0000000DFnt-24RC
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:10 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so1207691a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904677; x=1792509477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpeZCtjtr3RFnVadMQBbI2r1C6CwdAtY8VnYl6TRGII=;
        b=eGxmS//AQJo+tNkLkLApvjz5Gqkp1JXo5HrSAAb850h4OHnb0VWxGkaXGcQBcjwKuf
         e2Ql9/UulITh3gx8wSBXqyYVqhWNg4f9eva3nJJlM3fLmQr6ePTYDqrYhuHhOnoE9L42
         eRFtGPXip9qYOzmsCkPeHFMsEc2zLLV26ukMAzAFl+ev+y2Qvcg+Wvr3GqioMpKN0bQm
         6V0SCZAQargvrL98fcXZ0e6TCsML6aFEUyX3+DJUDU3fxG8OggK1SfPk9g1q2ODPMWXN
         8auv6agfXUHOfUlN7S0Ky/zEgGcWoAOujURJU6bBybVDNF5Lx1mcTh5m2KDicAWu8HR2
         +2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904677; x=1792509477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpeZCtjtr3RFnVadMQBbI2r1C6CwdAtY8VnYl6TRGII=;
        b=z9DYNGdj1gmm72i6l4FIh816914DqJPNs6LLfVZPRwDR097J4tX/nKwvFfVehZT0yM
         W6MOOG4Q8IRAFzMZafByi6yIlDiptIcWEYh+o43rnLb3e2A3uRuP3TLeuegt6mLV7Ehp
         ws02/nhVta8a0QE1yS2j5eJXYm4QHZtqOW7bzd/VPGkLpJ1lCgGaqwmolRkzInr8CbEX
         uKZa8ySK06dRxtJ+JgGuccIC2GQOvjpmaEdkD2bIGN4iMiXeISVOkzXWk7X91ETSQ5Ub
         Aj3djzry1usDIRd1XqKRpi5kySgnpCK+OvnFs5KriKnlLkK2+/vsiyNy3XmCKJa3q5U6
         YjZw==
X-Forwarded-Encrypted: i=1; AKwUvBx3xDiME3v3Wym+QZ6WchspfJW0KCd2RS9aDkt8CmCbB+tqGX9B6XMFvIjvadsvNPHxxIMYAFSbvfC4gL0uTw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLZcOHH2ToDF1QeiagdATlsmpWHvlZ1o8SAG+ZOi4DGPVlsLFrp
	I6VK1Dva+ategIbiZlctbbzJjyIMmCv35ed7rQSxdyq0Bjob58wJiWyA
X-Gm-Gg: AYBFou0EgMwtGRAdb8qLZHQW4fblhrHgU9Ge5v0uh5VFLO1kzbW5BwZ+C6w+QaPzo+6
	as8CCVDPE5bm9/Zf8zKXIIPtCYgQj33N1OGnaFu9YQyY1yuMQmAeQ+QYS3pv/hE+TFXdSgmxySY
	qhjaZGCiYO+wu8baMh4mB/eKMaeMe/MT8/wLSmXzqYxfdWm0ZAtctPriY4IO9vuExtYfJ2h9xWb
	Z+VpRGWXG5gw80rx0ddRtSsYPf46+fmq86fMSFk7FuHbA8hK3cGAl4RwnuuqCN+Hm+b6aGsd1W0
	A6Fvgf9fzqBZrs/BYkAF9E6iJaBxDo7s9H8c7sWn43qVvKqFidlmZrLqYZQc+c3Amy692kQs9ag
	f9funpsQQtrFLUqh+YEhvKKdUAZ2GomcCZRXOCUiia8vS+jrUae10JyWRHeyrga77UMoGJs0Nkn
	1/cXxOB/dcEm0oMg4CZwO1TKMU069xLkFZthzENreEoG74PuNo1QbgNVFU7rkqi5NLxBgp9OyQY
	n40iml3KLU6KjnuhAFxDJXfheAG
X-Received: by 2002:a05:6a20:c905:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e16bfa50dbmr12116690637.55.1791904677448;
        Tue, 13 Oct 2026 08:17:57 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:56 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 00/35] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Wed, 14 Oct 2026 00:16:59 +0900
Message-ID: <20261013151734.3177690-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081807_507851_DE74CA17 
X-CRM114-Status: GOOD (  13.34  )
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

This series migrates most MediaTek clock drivers to the common
probe/remove helpers provided by the MTK clock framework.

Key changes:
- Fix memory leaks on module removal caused by missing
  platform_set_drvdata() calls (patches 1-6).
- Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
- Add missing support for cpumux, PLL, FHCTL, and child-device
  population to the common helpers (patches 12-15).
- Convert all compatible clock drivers to use struct mtk_clk_desc
  and mtk_clk_simple_probe/remove (patches 16-35).

The memory leak and MODULE_DEVICE_TABLE() fixes are split from the
migration patches to allow backporting to stable.

Drivers not converted:
- MT6765 apmixedsys: requires direct register init.
- MT6795 apmixedsys: uses mtk_clk_register_ref2usb_tx().
- MT7629 eth/sgmiisys: uses a hacked probe sequence (multi-instance
  sgmii gates).
- MT8173 apmixedsys: uses mtk_clk_register_ref2usb_tx() and custom
  divider registration.
- MT8188/MT8195 topckgen: call devm_clk_hw_register_mux() and register
  a notifier.
- MT8196 vlpckgen: requires direct register init.
- MT8365 apmixedsys: uses devm_clk_hw_register_gate().

Patches 1-6 are based on
"[PATCH v2 0/6] clk: mediatek: fix memory leak on module removal"
(In addition fixed a compilation error in mt8173-infracfg)
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open@gmail.com/

Patch 5 fixes the same issue mentioned below
"[PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe"
https://lore.kernel.org/linux-mediatek/20261010160134.112136-1-l.scorcia@gmail.com/

Patch 12 is based on
"[PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers"
https://lore.kernel.org/lkml/20260304181024.738391-1-akkun11.open@gmail.com/

Changes in v2:
- Add two new fixes "Fix index in composite clock unwind path" and
  "Fix memory leak in mtk_clk_register_gate()".
- Add new refactor "return 0 instead of r in __mtk_clk_simple_probe()"
- Fix missing `.data = &apmixed_desc` in the MT8167 and MT8195
  apmixedsys drivers.
- Fix PLL registration and unregistration when
  CONFIG_COMMON_CLK_MEDIATEK_FHCTL is disabled.
- Fix child-device population logic.
- Clarify the rationale in the SoC conversion commit messages.
- Minor fixes to several commit messages.
- Rebased onto `24a19b953e2a ("Linux 7.3-rc7")`
  from `075b74841bd0 ("Linux 7.2-rc6")`

Link to v1:
https://lore.kernel.org/linux-mediatek/20260803141659.559129-1-akkun11.open@gmail.com/T/

Akari Tsuyukusa (35):
  clk: mediatek: mt2712: Fix memory leak on module removal
  clk: mediatek: mt6795: Fix memory leak on module removal
  clk: mediatek: mt7622: Fix memory leak on module removal
  clk: mediatek: mt8135: Fix memory leak on module removal
  clk: mediatek: mt8173: Fix memory leak on module removal
  clk: mediatek: mt8192: Fix memory leak on module removal
  clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: Fix index in composite clock unwind path
  clk: mediatek: Fix memory leak in mtk_clk_register_gate()
  clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
  clk: mediatek: Add cpumux support to common probe/remove helpers
  clk: mediatek: Add PLL support to common probe/remove helpers
  clk: mediatek: Add child-device population to probe/remove helpers
  clk: mediatek: Add FHCTL support to common probe/remove helpers
  clk: mediatek: mt2701: Switch to common probe/remove helpers
  clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6779: Switch to common probe/remove helpers
  clk: mediatek: mt6795: Switch to common probe/remove helpers
  clk: mediatek: mt6797: Switch to common probe/remove helpers
  clk: mediatek: mt7622: Switch to common probe/remove helpers
  clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt8183: Switch to common probe/remove helpers
  clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8192: Switch to common probe/remove helpers
  clk: mediatek: mt8195: Switch to common probe/remove helpers
  clk: mediatek: mt8196: Switch to common probe/remove helpers
  clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove
    helpers

 drivers/clk/mediatek/Kconfig                 |  34 +--
 drivers/clk/mediatek/clk-gate.c              |   4 +-
 drivers/clk/mediatek/clk-mt2701-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt2701.c            | 233 +++++--------------
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt6735-imgsys.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c     |   1 +
 drivers/clk/mediatek/clk-mt6779.c            | 124 ++--------
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt6795-pericfg.c    |  71 +-----
 drivers/clk/mediatek/clk-mt6797.c            | 140 ++---------
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt7622-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt7622-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt7981-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7988-apmixed.c    |  40 +---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  58 ++---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   |  98 ++------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt8183-audio.c      |  26 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  59 +----
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  67 ++----
 drivers/clk/mediatek/clk-mt8192-aud.c        |  26 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  75 ++----
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  49 +---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  96 +++-----
 drivers/clk/mediatek/clk-mt8196-mfg.c        |  84 ++-----
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  42 +---
 drivers/clk/mediatek/clk-mtk.c               |  90 ++++++-
 drivers/clk/mediatek/clk-mtk.h               |  12 +
 37 files changed, 496 insertions(+), 1607 deletions(-)

-- 
2.56.0


