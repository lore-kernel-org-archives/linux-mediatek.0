Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1109C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YU6rpOHgI5rCTSanBtDhEgZn5rjE5E40MEHy5D5+gA0=; b=Bg371tRE6ZaU4j
	iwawuy8UnL76iJimEx7iFW5GbLooZf1LeXti2WEt/hCgYZkDC2uCwsQDLalQ93E+LDBLqnD2hvpRX
	Na0SFuRxEFwxT1x3OBHRorALvcWNdg8vPNZ6wae11NDQr2zy5gjTF2Mi9rC/0dFHPWE5x85STRXOm
	CDtWdKRJhXsx3/yqwebEXMXDu+2WmNiow7MEvx/pCLuJQjbKDIxhiY+yvKBJMZhyltaqaS2kG8VZu
	ESCKhNFlOGN5W62NUzV4HQwTUVpFxLwX15xYWLzD6mp/8CiXiWurt/5cs9SDN2bLfg3wfhH69Nsmp
	ZZLNiOEGyqRKjXP5Bl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhVJ-007bYk-Kw; Thu, 19 May 2022 14:51:53 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgWn-0078Ke-5m; Thu, 19 May 2022 13:49:25 +0000
Received: by mail-qk1-x731.google.com with SMTP id x65so469236qke.2;
 Thu, 19 May 2022 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBqh7Tk2z2K1YwGYzAH4brkfEyxgFWvHmBvnWHs1Zp4=;
 b=flFbqmZxx9iM5vRGY/4eQBnTHrzZe9ShyTGtUfoI5IhkuVrEkViYFtkY0ApjDpQSma
 NKGWwmHhnQwHti46okHFeiW/Vtm17DAPZJx4zvDOTHmG7cBoWd2e0yPyDTGquH+Qw0d6
 PIZzIC09nejA7WeWV0LroOLgNA0Hl2CcBLAa6vurXGShpfQxd3EoHmP9jF3cK9bC7Gnb
 //ytY6uTxONFx3cQLZKrymmAgwdIYRK9wXCtm+RqcY2rS1IXl+TQa9gpzDfLsvfIOamZ
 RM+kXX+Eb/JQ8cqxn9PD7HkJ80bnOMwV5J44IX4C0C/z80B65gpi5bxua3DxtdUtrUV5
 484g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBqh7Tk2z2K1YwGYzAH4brkfEyxgFWvHmBvnWHs1Zp4=;
 b=loG6x+VFk4BqQ8CP+DOkZKTSz8FGFWLWJn4rzVxfxi6qSGYRs6iENzu8t2hILndvU3
 11iUdMpgx7yMiHYUPORMRTf256fXGnO4I/UvvUazTsT6HlwS7VlirBjc1gqiuhRl1vQF
 dGIY9EX64Rv3BpQVc4f7+ctdeKhPXhNUK2y6yGNAiC+xEMiQJdMqHTTSDXkBdWvR8w2q
 lMQFWUceEKKCqZJIGp29/51CKNp6ady9hFdyOjg5eC+Ry9pL4y1ijU90FF1xiL7L9b2E
 UHSkQVgisrKwNE6vZ1faxgReW6Jekpj4bgQAPd7BOQ1wbZNzF+tIDCDjpIzvaMYyK4+8
 Oalw==
X-Gm-Message-State: AOAM530LdGSAWdovwSGK8LKG3CDraQtgJ5jo9e8v2Kxen3MsoNfIQEYD
 aBjWrSkeToSZ08s8okKfufQ=
X-Google-Smtp-Source: ABdhPJy0wt0R0C+qdbicIKHg86HWjUDyYZscDjDdlgPI+3OgR1c1hrYBu5g+wbK5WOVdKMQ9Sqfrpw==
X-Received: by 2002:a37:8641:0:b0:67e:85d1:f5e9 with SMTP id
 i62-20020a378641000000b0067e85d1f5e9mr3195651qkd.128.1652968155429; 
 Thu, 19 May 2022 06:49:15 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:15 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/6] clk: mediatek: Improvements to simple probe/remove and
 reset controller unregistration
Date: Thu, 19 May 2022 17:47:22 +0400
Message-Id: <20220519134728.456643-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064921_281642_3B81B5B6 
X-CRM114-Status: GOOD (  13.13  )
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

This series started as part of an earlier series adding support for the main
clock controllers on MediaTek MT6735[1]. It has since been split off and
expanded. It adds a new function to unregister a reset controller and expands
the mtk_clk_simple_probe/remove functions to support the main 5 types of clocks:
- PLLs		(new)
- Fixed clocks	(new)
- Fixed factors	(new)
- Muxes		(new)
- Gates		(supported previously)
This should allow it to be used in most clock drivers, resulting in reduced
code duplication. It will be used in MT6735 clock drivers in the upcoming v2
of the MT6735 main clock controller series.

Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

Yassine Oudjana (6):
  clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
  clk: mediatek: Use mtk_clk_register_gates_with_dev in simple probe
  clk: mediatek: reset: Return reset data pointer on register
  clk: mediatek: reset: Implement mtk_unregister_reset_controller() API
  clk: mediatek: Unregister reset controller on simple remove
  clk: mediatek: Add support for other clock types in simple
    probe/remove

 drivers/clk/mediatek/clk-gate.c   |   1 +
 drivers/clk/mediatek/clk-mt8192.c |   7 +-
 drivers/clk/mediatek/clk-mtk.c    | 123 +++++++++++++++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h    |  22 +++++-
 drivers/clk/mediatek/reset.c      |  41 ++++++----
 drivers/clk/mediatek/reset.h      |  20 +++--
 6 files changed, 167 insertions(+), 47 deletions(-)

-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
