Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OBFRwGVB51F7oMT52uYzifRaAQ62qSXNHwOU1uaMlyU=; b=g1Lps2nxUqSwQp
	ANZ5LtX568inSk5g48QoDSSH109Bix5dOr7S5YilQBfQtk37gr1EauHXl3GvARUlG1FCaDta9sTEj
	gftIy32wKzG8t48Npb1CjI9OfE4jgS/P5BUsE+ptYzp0PgAIBERcBmNd4k4dAJ0U2tCyXdj5wui9Z
	nUO+X1SK9y0jxgsX0G2iIiMBN7z5WXn9r70befPkvFx3O1sgG7WKS4il2Y++WkXVTVixroQ6JuzuL
	l4Q0Bp9RVXtst5BRDPnDnmILz23kNFheelA7u6o4aLKGr2wAg/IkLri/tpICucY7EQgeo6g56Wn+m
	+DT6ToLZ0s4Zyj6yhWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4s9-0033iw-IF; Mon, 23 May 2022 10:01:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3ud-002dhh-Ea
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:59:41 +0000
Received: by mail-pg1-x52c.google.com with SMTP id a9so11090328pgv.12
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMEwaRdkK6gE09/mmANscyqoJ+JW8Xoy8gSdws+X3CU=;
 b=mkNY3d+5RlbDWdouuXPsy1WvOh+zU87uNKtUTkm9AcaCWm0r9V283zxllQK6aSJoKQ
 Ucs1qBRgu/49mmaFA5seFi/iJq6QCbChfS2b7YwFwaXDRy1MIYOlLE9ekoe27o4nQtan
 EYO88bor9rTAR40gMFXe1fFcDUiNgsEuJjG1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMEwaRdkK6gE09/mmANscyqoJ+JW8Xoy8gSdws+X3CU=;
 b=fK8SdjMSJKZVEfaFaNcb51j0fklUyUZCB6O174AH+wNELV22tikW2ZFW07ZqhEjJeI
 nx6ythN74Q6xxoFW0IV0jEBhFLwqEh0ewsLtSIscycfNuoOWIbwhjuaCnQEGA8FXGLys
 qqAvuHe4b0soxMENDDUO12yAkbl8g1q78kXC8NloHQyYLrZowpha6WajQHgyFXOS50gN
 v4p/rFmahVWeC9+t7BxkMKlGztSVmBgJpKUxHU25AqYRKl3lBySh1nos4GLCBjemXZrg
 8TX4/HTIC8RKJLmCG3VQyQJQqo6WeZelLzd2xzfuv/UUYKiZLi+cPPBXacpgEWU1W2sv
 +QVQ==
X-Gm-Message-State: AOAM5309pPJ7VAHLO1wJZOu6Wu2e8tFoqezampV3h6atDSgM1ZmWAKR/
 Ieda6Tq4hsXEZKHOV9Qukc0BCg==
X-Google-Smtp-Source: ABdhPJzNLddUk7ipQY1wuXRZkYOdiG4wWOnnnSjuM50zWAjN7OkfYPxwabHbECLBOj6SZkTW6IPA+A==
X-Received: by 2002:a65:6413:0:b0:3f5:f306:d2f7 with SMTP id
 a19-20020a656413000000b003f5f306d2f7mr19551046pgv.341.1653296377785; 
 Mon, 23 May 2022 01:59:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b8:7eae:9793:ff95])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:59:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: mediatek: mt8183: Fix GPU/MFG clock rate changing
Date: Mon, 23 May 2022 16:59:19 +0800
Message-Id: <20220523085923.1430470-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015939_516303_217ECFC4 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi everyone,

This is v2 of my MT8183 GPU clock rate fix series.

Changes since v1;
- Moved clk notifier registration into separate function
- Fixed comment style

This series fixes the clock rate changing for the GPU. This work came
about as part of adding DVFS support for the Mali GPU on MT8183, to
support efforts in testing the SVS patches [1] on MT8183.

This series fixes a couple things:

1. Fix the clock reference for the GPU. The device tree incorrectly
   references the top level PLL, when in fact it is fed from the clock
   gate in the MFGCFG block. Fixed in patch 1.

2. Clock rate requests on the MFG clock gate aren't propagated up the
   tree. Fixed in patch 2 by adding CLK_SET_RATE_PARENT.

3. MFG clock needs to be temporarily muxed away from MFG PLL during PLL
   reconfiguration, to avoid glitches. This is done using a notifier.
   The framework is added in patch 3, and added to the driver in patch 4.

This is based on my "clk: mediatek: Move to struct clk_hw provider APIs"
series version 3 [2], which was just merged.

Please have a look.

The GPU DVFS stuff will be sent separately, as that part is a bit more
contentious, and the changes span more subsystems.


Regards
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20220516004311.18358-1-roger.lu@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20220519071610.423372-1-wenst@chromium.org/

Chen-Yu Tsai (4):
  arm64: dts: mt8183: Fix Mali GPU clock
  clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
  clk: mediatek: mux: add clk notifier functions
  clk: mediatek: mt8183: Add clk mux notifier for MFG mux

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  6 ++--
 drivers/clk/mediatek/clk-mt8183.c        | 28 ++++++++++++++++
 drivers/clk/mediatek/clk-mux.c           | 42 ++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h           | 15 +++++++++
 5 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
