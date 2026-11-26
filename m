Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224F606A331
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=giAC6S1q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqF3Z4eS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uHOK7KrGkaPUSjstehlKPZRXCrxWsl59afQRh8DG1TE=; b=giAC6S1qzoQNrMqp6fjhy7059f
	2u4PKdwQDTkEaHh/bviOqD+h1FvcqdRf5bWqnQ5PkddyDGWH/l5MtJWKcOAUaEx3MyoThzvT//XzK
	N94l4Bkw3f7kIXYSz/63aHj1Oi3S/5h+gFIDY4q5e2TP2BhXuKd+kIIdbHW6Y6xcSMQKAhG93tVTQ
	sKr5PqC2NaPGiAX8HlHhxWwF9HgiHn0uZbo2H5RTYo1d8GskBKbHDFTL8az+p0Hdtv2YiNAu3BGZm
	n78dZLpHjRnyqMoFoC9OOMlHy/rmG0sf96GOCb4xVL5BduRAq+Y8uvw87GDPqtc2wmS3wbyOfn4JJ
	M7ixVl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPs9-0000000BxzD-0jut;
	Thu, 26 Nov 2026 03:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPs7-0000000Bxys-2bfX;
	Thu, 26 Nov 2026 03:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B16642E2C;
	Thu, 26 Nov 2026 03:10:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662607;
	b=tQ88yuCnMKrRjJ3QuD2J2j/7d2OpChzcduaFsWuZ2mtNXjn7mASOhv5B01T8Q92MMDyR
	 0QAhobUldUZ9b3QfEZJewav7cuyeTS8NVfUKkx3EA66IYPyo8kJwyX6UCYaZ+/ARDHbXj
	 6TVe63XtCJQx7U1Ybm04ZoYjQe+Cwcjyq8hz37Ty2G/JsBX7iKLglx8sdVJrrdqmtbw+O
	 y5XNW7whOLMhmICijmudST+WL0zOz/KUD3Dfcs9aJuxHr46D7YjQV89AuOCntAlhPijJZ
	 6YuDSPzEnipT00PtnXyXwmdkL2ghDgY5Ty0D9NQlY57/AkG6lbMTRYdwhr9wIPWrFVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662607;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uHOK7KrGkaPUSjstehlKPZRXCrxWsl59afQRh8DG1TE=;
	b=Dhk2Jp1JZmluu44YEwRkfeVeplIVONjV8spuqBvr99xGIFkmglvzkwBAF4Kd6pJCY1nG
	 jB4HzsOykY6QSr6ccYumrx2DA+Z+BnVT3ZU/dlVE6TetP7lI0MNDYjj99EDhvuArkLkXf
	 KI7464EAHT/e61i6GQs1uxFECwmExSsx6ZqDLHIrndDpvlX5/X1SR/krjBz1gSWLEPZqc
	 q1E57e/TBQrBIhGyESn53/WmmnZV1hKTznAgTZaZG/bzJ6J/rPykTliJ5GcoeHtlk9cXy
	 ubqGRM0BLf/ix0BWQ00fGolopXg5kKK3l5mf5molMq7OtHW4Cj2lytJoWhF4Hof0oOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3B71F000C0;
	Thu, 26 Nov 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662607;
	bh=uHOK7KrGkaPUSjstehlKPZRXCrxWsl59afQRh8DG1TE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=NqF3Z4eSMg4cbcNV3n90ddbF5nojdjAS/bGFj9+y2HJEnzuRLcFC1vnu63PAhg5JO
	 xdCAQqGGte98ElXBp4dAZT/bTSfMOZyXR6N7LwznUk0BgBo36H19okR713JggxbGke
	 5K09kDG7yuSflZ5zWiLZcvL0YyiHfDr9fl20WjGsVwvL6YXxLKsGIKoXu8sixiRpjh
	 pJtNXWVZ1GPgrmkN4uwcq1adfbiqzXWSSe4ATDBmFKaxkEtB94cID9AeW5iw40AlZ8
	 sLXd3yUlfSc/WHRwzG/AknNgOOqzcV3zfhqRkBcmA2OxVj6z/SUir4kH7hCQ0CZzzx
	 Thw34N1tddtQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF89A4D1D9;
	Thu, 26 Nov 2026 03:10:03 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI
 support
Date: Thu, 26 Nov 2026 03:10:01 +0000
Message-Id: <20261126031001.27288-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662602; l=1679;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=SSX2MYOf3hgS1EqmIn9zqqUiKL7h1Rp1ieInLyB7OCU=;
 b=kZ4V4FHt5o6RJ84Bp3g3s0xjpvWPzQOsDjGML3O1B52VHOCFPMhhOum+G1PN6q3ETTWrCUKcU
 ZUq2vfVPek7BUFMMOgYFhTO4q6ONCAGHkmYUEs1mxts+L7MRvCsmp34
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the stalled July 2025 MediaTek MT6789 (Helio G99)
initial bring-up patches originally posted by Arseniy Velikanov (on CC):
- pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-me@adomerle.pw/
- spi v1:   https://lore.kernel.org/linux-mediatek/20250715231921.4527-1-me@adomerle.pw/

Original authorship and Signed-off-by are preserved on patches 1, 3,
and 4.

Changes since v2:
- Patch 2 (new): guard PWRAP_WDT_SRC_EN, PWRAP_WDT_SRC_EN_1, and cold
  pwrap_init() with !HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) so
  arbiter SoCs (MT6873, MT8195, MT6789) do not write wdt_src to offset
  0x0 (PWRAP_INIT_DONE2) during probe.
- Patch 3 (was 2/3): add [PWRAP_INT_FLG] = 0x458 and
  [PWRAP_INT_CLR] = 0x45C to mt6789_regs[] matching PMIF-SPI bank 3
  (INT_EN at 0x450, int_en_all = 0x180000) so pwrap_interrupt() does
  not clobber offset 0x0 and leave a level-high IRQ asserted.
- Patch 4 (was 3/3): renumbered to 4/4, unchanged.

The v3 rebase and fixes were prepared with an AI coding assistant.

Base: torvalds/linux master 4dce97c6c265.

Arseniy Velikanov (3):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
  soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
  dt-bindings: spi: mediatek,spi-mt65xx: Add compatible for MT6789

Ilia Snezhkov (1):
  soc: mediatek: mtk-pmic-pwrap: Skip WDT source and init on arbiter SoCs

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
 .../bindings/spi/mediatek,spi-mt65xx.yaml     |  4 +++
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 44 ++++++++++++++++---
 3 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.54.0 (Apple Git-157)



