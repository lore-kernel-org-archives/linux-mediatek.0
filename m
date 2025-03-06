Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C517EC282D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bPmTd2G6iYGW32X9voweHbq8hREhxyF/oHViITDF8w=; b=4+PM42jcV0tR9sbvpPWqvVrGz3
	8bPRGlNIibzemC3DF32zoFWwnhn4VCQ+nglRlY64JtklYakWbXA2Pj/1rjX3wrzFm2IeraCHYT4Zy
	oUeSQ1qcASOK6C4VRrhPik7mBMhF/PxPKObDNtDSlKVfZxSTK3SE0WGK6BsazhUauxOr38b/gmGmY
	G8cAJOxa9U0AvOTx6aqUhyeB1bqp0ZPGov1Vp+eWsSmZHkeRDzqKGbpMgc+xkbmD8CXxsScuma0m5
	2u2l14aUAeq4Si8M3uss8XXusO5GXvzh9LfhS1rCIsVzyjDGbFwrbDccVFWuSnKMBmbNqxaKHNR6h
	tJDXVICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAFx-0000000AuIO-3M9e;
	Thu, 06 Mar 2025 12:23:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9W1-0000000AnyA-45PK;
	Thu, 06 Mar 2025 11:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741260948;
	bh=0ZHgv7nRbD8P28kALnuW0vC0/HoWUjGwU/Ooe1oBnu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eEy4dZMQo3CVN+KP8hz/3SFgSYBv8/zSSzKnLzGTTODAS4QWbPLHmqASyWGSQYDCO
	 /ro8UzZHJYq5vfzXLmj5FUasZ+K1E13gsP8C2D+ausmWJmgC5lO2cEMQfwc6yjKeS6
	 6DW5+YjxDt20Aszcb6SfPvhHHaRX2U3X/tmgl58TbUTkcz4bIG7EMQRTW5kl3E0uGS
	 c9Tz1PLsL9nQdwxuTw/OivsQG+UlG66opi0Au4gcbDJjxR2pDgcEQIdAbtIVPjRtw3
	 WN6PHkTlG55G6piv9Ov868MaE4uYSIV2jYFWQxnjwm5ub+ccOr4VIqFDcWrvxJmaPS
	 eT8uv0we1+tRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3540D17E0649;
	Thu,  6 Mar 2025 12:35:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.15
Date: Thu,  6 Mar 2025 12:34:53 +0100
Message-ID: <20250306113540.148342-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
References: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033550_198281_7F93094D 
X-CRM114-Status: GOOD (  10.83  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.15

for you to fetch changes up to 1e12efbee8f3fe09d23ad75d2e38a6335ca2d159:

  soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200 (2025-03-06 11:54:21 +0100)

----------------------------------------------------------------
MediaTek driver	updates for v6.15

This adds entries for new and missing SoCs in the MediaTek SoCInfo
driver (MT8370AV/AZA, MT8390AV/AZA) and	an extra entry for a new
revision of the	MT8395AV/ZA SoC.

The MediaTek SoCInfo driver also gets its SoC attribute	information
restructured: now the family, machine and soc_id fields are correctly
populated.

MT8188 gains support for the secondary Display Parallel Interface
used for HDMI, and for the Display Stream Compression component
routing through mmsys and mutex tables.

All of the MMSYS drivers get an important overhaul: it was found that,
in multiple cases, the tables contained wrong mask/value pairs, hence
those were doing either nothing or breaking routings.
The mmsys tables were converted to use a newly introduced macro that
will perform a compile time check, making sure that each table entry's
value fits in the declared register mask.

Thanks to the new macro, multiple MediaTek SoCs got multiple fixes in
their MMSYS tables, addressing issues that were severely impacting the
functionality of the display controller pipelines.

----------------------------------------------------------------
AngeloGioacchino Del Regno (8):
      soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
      soc: mediatek: mtk-mmsys: Fix MT8188 VDO1 DPI1 output selection
      soc: mediatek: mtk-mmsys: Add compile time check for mmsys routes
      soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro
      soc: mediatek: mt8167-mmsys: Fix missing regval in all entries
      soc: mediatek: mt8365-mmsys: Fix routing table masks and values
      soc: mediatek: mmsys: Migrate all tables to MMSYS_ROUTE() macro
      soc: mediatek: mt8188-mmsys: Add support for DSC on VDO0

Fei Shao (1):
      soc: mediatek: mtk-socinfo: Restructure SoC attribute information

Louis-Alexis Eyraud (4):
      soc: mediatek: mtk-socinfo: Add entry for MT8370AV/AZA Genio 510
      soc: mediatek: mtk-socinfo: Add entry for MT8390AV/AZA Genio 700
      soc: mediatek: mtk-socinfo: Avoid using machine attribute in SoC detection log
      soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200

 drivers/soc/mediatek/mt8167-mmsys.h |  31 +++--
 drivers/soc/mediatek/mt8173-mmsys.h |  99 +++++++---------
 drivers/soc/mediatek/mt8183-mmsys.h |  50 ++++----
 drivers/soc/mediatek/mt8186-mmsys.h |  88 ++++++--------
 drivers/soc/mediatek/mt8188-mmsys.h | 266 +++++++++++++++++++------------------------
 drivers/soc/mediatek/mt8192-mmsys.h |  71 +++++-------
 drivers/soc/mediatek/mt8195-mmsys.h | 632 +++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 drivers/soc/mediatek/mt8365-mmsys.h |  84 ++++++--------
 drivers/soc/mediatek/mtk-mmsys.h    |  14 +++
 drivers/soc/mediatek/mtk-mutex.c    |   6 +
 drivers/soc/mediatek/mtk-socinfo.c  |  22 +++-
 11 files changed, 597 insertions(+), 766 deletions(-)


