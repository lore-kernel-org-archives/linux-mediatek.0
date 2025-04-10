Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A3C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MakTm+mA1fpNDVeIzuOsBcS2fDHTnn32kc6a2G11xuc=; b=LTV+YoRW6Y4lA6/WRDxQFn4kCT
	SSifu03/77zRAjTYajAoK2XB1ecGc9a20FlGpeH17qqKut9p3G7LDvHOPMCUHDVkiMYviFrB0toUE
	94CfUY0pBPAIO7fWqYfNzLOHrw81VDWCrOFdQ18Sm/IsZ4xCtJMG2FMYstPzzpzRlP9b1tMc9SH2c
	b0zP6cOT1qHZL1pID1ssqD79LliFxBcb+nLQd3J88JzP9V2m52kT9SIoOie9qdunBVOcAefnBCigu
	aNmcVK4NCfFH2G3rmmNEvDCP4SDVI19YTfi3ZmvOat29UiXg5s6kVvJD1onswaxOf+icN4fh/2c1I
	Gga3MVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tgN-0000000AzNM-1E83;
	Thu, 10 Apr 2025 15:19:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t5g-0000000Asdl-2K2P;
	Thu, 10 Apr 2025 14:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296075;
	bh=Hp3v8LN4A5+QVMzwAdZ4iPfXStPLVBeC7NDy7+rOdy8=;
	h=From:To:Cc:Subject:Date:From;
	b=Tykq51qn6woO5tWehK6YJwnrJ7yny3aNaCh3wchpjk8++P8e4+Ae72oCH/bircXrI
	 1SxggmfocrEVLsr3nXAnKmuNkhq/qwHS9VHzmzKghcb9RZhOHjKn784gVBIrrjQ1Ig
	 EeXVqUomQUWgrqMXycqQCO7msASIrskD+z8BdbY7S6vJEnlG8nOzWl2nTQxRrF15ux
	 orKJBIQD201NiTVOGN/HpwZVpfhel34F583/A7KvMbGFjQbZgHs1w874+9Z0qkZpNG
	 4nlC5u3lL2/+g/nyBRYKBOeG/2MDg/jRotodtnDiOXbdVXEHv56ZD0cCOsuqRZlTW+
	 oZttIeNoshJ7A==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B4F817E0CA7;
	Thu, 10 Apr 2025 16:41:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	y.oudjana@protonmail.com,
	lukas.bulwahn@redhat.com,
	u.kleine-koenig@baylibre.com,
	geert+renesas@glider.be,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Clocks support
Date: Thu, 10 Apr 2025 16:41:07 +0200
Message-ID: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074116_752884_59D94F7B 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for main, multimedia,
and MFG clocks of the MediaTek Dimensity 1200 (MT6893) SoC.

Main blocks are required for console boot, while multimedia clocks
are required for display support, and MediaTek Flexible Graphics
(MFG) clocks are required for bringing up the Mali-G77 MC9 GPU.

AngeloGioacchino Del Regno (3):
  dt-bindings: clock: mediatek: Describe MT6893 Clock Controllers
  clk: mediatek: Add main clocks drivers for Dimensity 1200 MT6893
  clk: mediatek: mt6893: Add peripheral and multimedia clock drivers

 .../bindings/clock/mediatek,mt6893-clock.yaml |  56 ++
 .../clock/mediatek,mt6893-sys-clock.yaml      |  68 ++
 drivers/clk/mediatek/Kconfig                  |  58 ++
 drivers/clk/mediatek/Makefile                 |  10 +
 drivers/clk/mediatek/clk-mt6893-apmixedsys.c  | 137 +++
 .../clk/mediatek/clk-mt6893-imp_iic_wrap.c    |  94 ++
 drivers/clk/mediatek/clk-mt6893-infra_ao.c    | 185 ++++
 drivers/clk/mediatek/clk-mt6893-mdp.c         | 116 +++
 drivers/clk/mediatek/clk-mt6893-mfg.c         |  51 +
 drivers/clk/mediatek/clk-mt6893-mm.c          | 129 +++
 drivers/clk/mediatek/clk-mt6893-scp_adsp.c    |  52 ++
 drivers/clk/mediatek/clk-mt6893-topckgen.c    | 880 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6893-vdec.c        |  98 ++
 drivers/clk/mediatek/clk-mt6893-venc.c        |  72 ++
 .../dt-bindings/clock/mediatek,mt6893-clk.h   | 449 +++++++++
 15 files changed, 2455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt6893-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-venc.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6893-clk.h

-- 
2.49.0


