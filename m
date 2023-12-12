Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71CCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jk84WGsPxmsmzI9SLrqM+8x6MApVFDVwR/Q0MXLeLQ0=; b=yWaBa1iDiMbQJD797RNHNRauAq
	LqEMmexHFNBuCrEumJa0zcqGPrsaWBO/BQB3PpOXi16lNM3sUcH6WbsLg1E3oZIqN7DwzTNQDv0tg
	3WsVxkCOQ/3saGMlTOKrqNTAeB24KbgHVx2reKztuhktSHxd5dXk5RQWyebZNlgtS0JZ6tgWife35
	5s7dkhNxPnsKJ1/BOPCdIzGEwzxgQryWJ+r49R3Tr0oRyCI4jga6uYJnw23McIzDCUT2vEBHNU3jW
	K0UWDs4y6EVbvJsYw0s77vATJ2G7SUeEMnaxqQkgoCDKhK+GXXBEfiRd8bzqtfC/80RUJhleR1lVF
	CThTGwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DF-00BZYD-2H;
	Tue, 12 Dec 2023 11:46:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DA-00BZWJ-2q;
	Tue, 12 Dec 2023 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702381560;
	bh=2Y3KVaSzJ8l1vh+CQj1Z22GPqsVVwxjVN8I5a3BrYuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=doWvRxNJ2HFSUoBWutbIziHnL5tT5WVWEfoR4jPR0JBu8xP6q1+HDARUKdowFzGBl
	 dAJLiEV1Yz8TdEDouMQ2Gz6yFR/dQQ0tZeHB54nzhjYIlzKeBZTAeVcZO6tsDxul3G
	 eGQxsWgDd7pY1CwnqyOzO1MfHLoh7q2jyMMg0SowzbEmMTJS/WGMRq3bQrcX0i4JB+
	 Ojc9Vc6olX+ULrjGpv7z5MVn9NVfVbCWHy3gdOkp7YaJ+/L5ffyX4AG3iG/crtVpxx
	 ZP169G2896AvDDnwakzzXIhd1Mj7rNIGWdFLywR5wLYHeUKs19195ldLrJ4ickwQk1
	 Wzt3F4Wyy/kTQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84DBB378145B;
	Tue, 12 Dec 2023 11:46:00 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek soc driver updates for v6.8
Date: Tue, 12 Dec 2023 12:44:28 +0100
Message-ID: <20231212114515.121695-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
References: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_034605_121523_387733D7 
X-CRM114-Status: UNSURE (   8.76  )
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.8

for you to fetch changes up to 2bfbf82956e2de75249ce83901800c68d17d9e62:

  soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank (2023-12-11 11:36:15 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.8

This adds a refactoring of the MediaTek Smart Voltage Scaling (SVS)
driver and the addition of support for MT8186 and MT8195 in it, and
adds support for the MT8188 VDOSYS and resets in the MMSYS driver.

----------------------------------------------------------------
AngeloGioacchino Del Regno (17):
      soc: mediatek: mtk-svs: Subtract offset from regs_v2 to avoid conflict
      soc: mediatek: mtk-svs: Convert sw_id and type to enumerations
      soc: mediatek: mtk-svs: Build bank name string dynamically
      soc: mediatek: mtk-svs: Reduce memory footprint of struct svs_bank
      soc: mediatek: mtk-svs: Change the thermal sensor device name
      soc: mediatek: mtk-svs: Add a map to retrieve fused values
      soc: mediatek: mtk-svs: Add SVS-Thermal coefficient to SoC platform data
      soc: mediatek: mtk-svs: Move t-calibration-data retrieval to svs_probe()
      soc: mediatek: mtk-svs: Commonize efuse parse function for most SoCs
      soc: mediatek: mtk-svs: Drop supplementary svs per-bank pointer
      soc: mediatek: mtk-svs: Commonize MT8192 probe function for MT8186
      soc: mediatek: mtk-svs: Remove redundant print in svs_get_efuse_data
      soc: mediatek: mtk-svs: Compress of_device_id entries
      soc: mediatek: mtk-svs: Cleanup of svs_probe() function
      soc: mediatek: mtk-svs: Check if SVS mode is available in the beginning
      soc: mediatek: mtk-svs: Use ULONG_MAX to compare floor frequency
      soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank

Hsiao Chien Sung (4):
      soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys
      soc: mediatek: Support MT8188 VDOSYS1 Padding in mtk-mmsys
      soc: mediatek: Support reset bit mapping in mmsys driver
      soc: mediatek: Add MT8188 VDOSYS reset bit map

Mark Tseng (2):
      soc: mediatek: svs: Add support for MT8195 SoC
      soc: mediatek: svs: Add support for MT8186 SoC

yu-chang.lee (1):
      soc: mediatek: mmsys: Add support for MT8188 VPPSYS

 drivers/soc/mediatek/mt8188-mmsys.h    |  210 ++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |   39 +++
 drivers/soc/mediatek/mtk-mmsys.h       |   32 ++
 drivers/soc/mediatek/mtk-mutex.c       |   51 +++
 drivers/soc/mediatek/mtk-svs.c         | 1678 +++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------
 include/linux/soc/mediatek/mtk-mmsys.h |    8 +
 6 files changed, 1342 insertions(+), 676 deletions(-)


