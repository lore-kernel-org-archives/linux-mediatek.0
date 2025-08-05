Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F80C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/o0NXSE35UAGaz+MnNo++3Nxte5LyAAuSsdlB3rfKBE=; b=eaXJWQC2TcIv1EtJDGp7tt5z07
	PXrBdzE2g05UFPNWpXOHSdV2pSDD7mgBb3WZQD8K0P7mS7gsIAQfeAX2kSWPLMdfNlt/zvDH2Tkkg
	IBwGcy78B/TbTjdf/tTPpTRgkQjXQwFmyN4auoRV49Dak7o1NEm6q824YFADpt27BZbhUjVbuZyrw
	mAduKe/nPMfkFV0Ksy8kd2A7Q4JSpPCxMrlq08tjtCf5eFRYzd1JCgq9mDBQaFt5rOBMiWdU5iZWJ
	sIHbyo5TBmfob1BbZP/e7jkIoXc4x5i4Lp108zd4+aK4QBOC25x0AqIQ7xH23xI8fGnbyY07qLKut
	cshJVPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIBP-0000000Cupe-0xE3;
	Tue, 05 Aug 2025 13:58:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI8j-0000000Cu6v-0ytp;
	Tue, 05 Aug 2025 13:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754402139;
	bh=JPcbvjRPjjNe9bbbbk11sMxPdeYwCinklYCS9ZsYp2U=;
	h=From:To:Cc:Subject:Date:From;
	b=nPkAnAf3AnmP+5CJ3pdbEsXE+vs+Dgbg1j5iblS/SeGjwcEnJWDmbVaTzROY2tUpM
	 qgYjtKg0Wv1gTDxZWj1w8URCSWLxfZuhSI9HYiDn+t8NdfTgIZsBatu9GuaOGmSspi
	 iZSZ8zO1QZMeuVv9gRhvPOAVDPYOat4BGjPVNRWuhNQ42WcbgD6k35N4JjmeBQWJQ6
	 m/A/MFfzkU/Z5qv+7GmyiukO82xaWJZcB5DqhIwxgjhOWSXvUrZDCkps+0gwr7UfFy
	 4/hSiUQMHOO2UKh/sdppRvZpBmLOyGfP1bPQedSsQ3QVjfM9HvlmUki3kfEeOI9zsh
	 2DjL4LC91ezBA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1976:d3fe:e682:e398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 307A317E0506;
	Tue,  5 Aug 2025 15:55:38 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v4 00/27] Add support for MT8196 clock controllers
Date: Tue,  5 Aug 2025 15:54:20 +0200
Message-Id: <20250805135447.149231-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065541_428251_30DAA002 
X-CRM114-Status: GOOD (  14.01  )
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

This patch series introduces support for the clock controllers on the
MediaTek MT8196 platform, following up on an earlier submission[1].

MT8196 uses a hardware voting mechanism to control some of the clock muxes
and gates, along with a fence register responsible for tracking PLL and mux
gate readiness. The series introduces support for these voting and fence
mechanisms, and includes drivers for all clock controllers on the platform.

[1] https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/

Changes in v4:
- Expanded the commit message for the clock controller bindings to include
the addition of the hardware voter handle
- Extended the description of the mediatek,hardware-voter phandle to
explain the limitations of the HWV implementation on MT8196 and justify the
use of a custom handle instead of relying on generic APIs

Link to v3: https://lore.kernel.org/all/20250624143220.244549-1-laura.nao@collabora.com

Laura Nao (27):
  clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
  clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
  clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and
    FENC
  clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
  clk: mediatek: clk-mux: Add ops for mux gates with HW voter and FENC
  clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use
    mtk_gate struct
  clk: mediatek: clk-gate: Add ops for gates with HW voter
  clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
  dt-bindings: clock: mediatek: Describe MT8196 clock controllers
  clk: mediatek: Add MT8196 apmixedsys clock support
  clk: mediatek: Add MT8196 topckgen clock support
  clk: mediatek: Add MT8196 topckgen2 clock support
  clk: mediatek: Add MT8196 vlpckgen clock support
  clk: mediatek: Add MT8196 peripheral clock support
  clk: mediatek: Add MT8196 ufssys clock support
  clk: mediatek: Add MT8196 pextpsys clock support
  clk: mediatek: Add MT8196 I2C clock support
  clk: mediatek: Add MT8196 mcu clock support
  clk: mediatek: Add MT8196 mdpsys clock support
  clk: mediatek: Add MT8196 mfg clock support
  clk: mediatek: Add MT8196 disp0 clock support
  clk: mediatek: Add MT8196 disp1 clock support
  clk: mediatek: Add MT8196 disp-ao clock support
  clk: mediatek: Add MT8196 ovl0 clock support
  clk: mediatek: Add MT8196 ovl1 clock support
  clk: mediatek: Add MT8196 vdecsys clock support
  clk: mediatek: Add MT8196 vencsys clock support

 .../bindings/clock/mediatek,mt8196-clock.yaml | 112 ++
 .../clock/mediatek,mt8196-sys-clock.yaml      | 107 ++
 drivers/clk/mediatek/Kconfig                  |  71 ++
 drivers/clk/mediatek/Makefile                 |  13 +
 drivers/clk/mediatek/clk-gate.c               | 106 +-
 drivers/clk/mediatek/clk-gate.h               |   3 +
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c  | 203 ++++
 drivers/clk/mediatek/clk-mt8196-disp0.c       | 169 +++
 drivers/clk/mediatek/clk-mt8196-disp1.c       | 170 +++
 .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    | 117 +++
 drivers/clk/mediatek/clk-mt8196-mcu.c         | 166 +++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c      | 187 ++++
 drivers/clk/mediatek/clk-mt8196-mfg.c         | 149 +++
 drivers/clk/mediatek/clk-mt8196-ovl0.c        | 154 +++
 drivers/clk/mediatek/clk-mt8196-ovl1.c        | 153 +++
 drivers/clk/mediatek/clk-mt8196-peri_ao.c     | 144 +++
 drivers/clk/mediatek/clk-mt8196-pextp.c       | 131 +++
 drivers/clk/mediatek/clk-mt8196-topckgen.c    | 984 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8196-topckgen2.c   | 567 ++++++++++
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c      | 109 ++
 drivers/clk/mediatek/clk-mt8196-vdec.c        | 253 +++++
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |  79 ++
 drivers/clk/mediatek/clk-mt8196-venc.c        | 235 +++++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c    | 726 +++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |  16 +
 drivers/clk/mediatek/clk-mtk.h                |  23 +
 drivers/clk/mediatek/clk-mux.c                | 119 ++-
 drivers/clk/mediatek/clk-mux.h                |  87 ++
 drivers/clk/mediatek/clk-pll.c                |  46 +-
 drivers/clk/mediatek/clk-pll.h                |   9 +
 .../dt-bindings/clock/mediatek,mt8196-clock.h | 802 ++++++++++++++
 .../reset/mediatek,mt8196-resets.h            |  26 +
 32 files changed, 6212 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mcu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8196-clock.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h

-- 
2.39.5


