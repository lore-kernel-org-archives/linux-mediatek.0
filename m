Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15EEC55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=; b=VOrJ3J6qUGa2HIfLoCqnqWi/4q
	E9Z/gk1jpGen8Szw5NkX0JJ+Ib7SAuw56TJ50QNSUp64onKt4qvH4oLtnqbjkuISj5bqVNG9GUfmd
	sL+Tv55lNDyX0+4GGtgrhA/XWepTI1c6lys/epJ17atAAxo3JWBCSz8LiIcmXsvpMr3LxpVtJFUYw
	Ka29yXJ79JVbbkYExS+IkHnnYlyZwMnNWoeo35+rvk2SvZeWIp43EANBxShVudfa5Eawcvo3gJlR7
	pdRp7bNP0iYorYbYl9W4u+9y7FbGlDeDhZ4MWTFQgLL3yJfIwIKWPhVYY0EArH/eUeFxeOHPqP1YW
	CU7Z780w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTv-0000000HJcK-14Yv;
	Mon, 03 Aug 2026 14:17:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTs-0000000HJb3-0X9R
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:29 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38101f85591so3263890a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766647; x=1786371447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=;
        b=sDJsMLLKqKeIgZXthZXVJj4qZxXKZeyfIs8BZS7lCqikbWyOfys6G9oeP6DammD+n0
         Zde/hZRYvEnyOJ1AxYWsYLLzmoCZg4AYe3WmBrqz2AgXmF22ro7bo7cLwBDr37twIi2n
         MLlzysL3vbxDwQP6pKtJpT7+a6xFcwaxkLnxj44i87HQVsL21NyR/CaHZAoPAaoFc0uu
         6Qf4nSAYNkVzpvqUA0AyDxKGDnrjMGwSz18MeSfB7RzYzCXY8IFqznVWT/Sq3it35rvL
         GJGITnfpr8o+bBhOQqSDVNQp7LloF449LtJ2WDUFt6ddRTFrNtFri/MTitpxbnjPPREL
         Eraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766647; x=1786371447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwjgtRb3Tj4kbI2i//w6Ka0+luCbAxG+sRZKCn0g9Uw=;
        b=s0738ZA33AM6k8apMWMDc1ts3SmsGcwxAt6oExLgjtaCZbkEemFwY8J5QGfywfOO2t
         c+hJfzNneFmaKUkIMUkXSnAMrjSzuB5KdL66d4oU3l+AKuF6Ei02LxG6LjLKZwwQnBTX
         ClzsfehJyK8trJj5timeNckn6AVw6wdYC1c/vKVLouIPeMr1gfJ+uQXdPAd9z6fcz0bk
         j9Je7VpyL04uRaAnIKA6iV1FQR74hOUSmOdVtgt6aa5Ba6l9Uu5mE9SypuIB0cLATMX7
         fYCnOF8xEZl6SYjfq8fa0U3oCiI7YytVDmLp5+Ld4cldOLI6UjVZURNAbl9bwDFOTJwg
         cIkw==
X-Forwarded-Encrypted: i=1; AHgh+RriY9GT2geH1LDZ1wBkzizNdKgz3D5sDZEnSw1E9v4qCITSCmmcUKn4L3sVxXJ5hkPz49Vgyr116oWj1wcXZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7sr2cyKqAbWwjwFiUGvLrM1QO7CIJTs4lB9gvDEyU8fQAuhZ
	zzeQ2G6jH/CzoH0eQOuyOgDPhw3Uu8bTrA5RuzuyMh2RmMWj0YEdU2ib2I3Ppnht
X-Gm-Gg: AR+sD134MvFnARQx4zMgPkQspb/R44km9sv+9WIVtp4bpzXjxVFwk21wOCrM6G35sgR
	R7AOjpPQYJzdr/sHYkMo5SPtcabg8BFmz5oONr8Dj6vnHzcBVJ0NBoDncs4BA7jRXpafweyVzdR
	NZQCi/FfLp9b9QJRP1ohxxsBgxuk/OiP4NyT0y5r9UjZmMHCSxVMSgbOwlC1oeAa2D1P5Nj6SFM
	YlOICCDkthIDqjzoy1MoK4jYQRvzUj2EpbGd1lUR0bYSe/d7CMYvSSVdKPxF+HwJmrgrMLy0pGq
	H5Ngrx17q4vwjVs+l40Ky8QXXXqsNWI8wtLqBwJkeU9V3lwFVg5AdjKfatePCR05PUdNB4rIAM5
	wZZ617nOohJw78CRgFe3NWRKDfOq1/EYnDFsCdpx7Lvfd2Cd7sujitrjd+o8sabM1KXQJ2CykBu
	PVhksPAoVmb05fu05RW47UFv4LYU3md8I0dPQoSymev1vGegQe5HN7S3qavvoZkZEb0Ur2ixPIV
	NE/gyxBKMqMZil+yDB5
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr7249914a91.4.1785766646430;
        Mon, 03 Aug 2026 07:17:26 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:26 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 00/32] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Mon,  3 Aug 2026 23:16:27 +0900
Message-ID: <20260803141659.559129-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071728_178270_7C782AA4 
X-CRM114-Status: GOOD (  10.38  )
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
- Add missing support for cpumux, PLL, pllfh, and sub-device
  auto-population to the common helpers (patches 9-12).
- Convert all compatible clock drivers to use struct mtk_clk_desc
  and mtk_clk_simple_probe/remove (patches 13-32).

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

Patch 9 is based on
"[PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers"
https://lore.kernel.org/lkml/20260304181024.738391-1-akkun11.open@gmail.com/

Akari Tsuyukusa (32):
  clk: mediatek: mt2712: fix memory leak on module removal
  clk: mediatek: mt6795: fix memory leak on module removal
  clk: mediatek: mt7622: fix memory leak on module removal
  clk: mediatek: mt8135: fix memory leak on module removal
  clk: mediatek: mt8173: fix memory leak on module removal
  clk: mediatek: mt8192: fix memory leak on module removal
  clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: Add cpumux support to common probe/remove helpers
  clk: mediatek: Add PLL support to common probe/remove helpers
  clk: mediatek: Add auto-population of sub-devices support in simple
    probe
  clk: mediatek: Add pllfh support to common probe/remove helpers
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
 drivers/clk/mediatek/clk-mt2701-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt2701.c            | 233 +++++--------------
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-imgsys.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-vdecsys.c    |   1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c    |   1 +
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
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  50 +---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   |  98 ++------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt8183-audio.c      |  26 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  59 +----
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  67 ++----
 drivers/clk/mediatek/clk-mt8192-aud.c        |  26 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  49 +---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  96 +++-----
 drivers/clk/mediatek/clk-mt8196-mfg.c        |  84 ++-----
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  42 +---
 drivers/clk/mediatek/clk-mtk.c               |  76 +++++-
 drivers/clk/mediatek/clk-mtk.h               |  12 +
 38 files changed, 472 insertions(+), 1596 deletions(-)

-- 
2.55.0


