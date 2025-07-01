Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DDC7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7+pl6c94GUxyVeJ3OxRzLtQb0Z3ijNuMV0CW++La/o=; b=LNpKwLjfqXWMXcSEVDHuRRazWf
	z2dqruk8FJFr8Czs0dRrI+NGK2PF6VkQVnJORsJzap+n86ZXPsByttvt20C7g7tZNAFRU2Bz3KIah
	Id1m+M6JSRW4zZIJGHnewj93sVANnhRMbJqtHUIwxAWu2wlL0AE33XVTGo077fq0sW1sujb+9yCZL
	Tn2YMd4k6aeOjtEx/X4le0F2bLsBsKhpTvGqL1ZDroaWRg4b7pqdcONKAef8bXHe6FMZecWMBkql9
	rRBYLk2XOoUHz206ag9FAgaM86L2JdqiuuAkBqmzpg6EwdUPXc02v9vg7fJO/C0Rnv8Z0p5DEXvab
	9cKuzuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeyq-00000006G5z-3TyF;
	Tue, 01 Jul 2025 17:41:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWceL-00000005qTd-3FAn;
	Tue, 01 Jul 2025 15:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751382715;
	bh=2t09DdntsxPr884QtHlaLbUrt+UbNTAKyIRNYDWRI+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=CD6290p49urWFIL34YNzHQ7Dcn6fAVDEGKnHOFbpH5Gj01+dud4SZLW3UW/YD8wBA
	 yhO4cIZ8JZzbQTYlHzVN87bKgG/WzzW44nCRaDsjMKj86xdZEuhXdGSDU0+YVYZ2Nd
	 0mJes2KwwqOvxMe9mNx7tunqpTHjiggUjAx9IfHn8AcBUZJ3ZztLtsVEvGQR7YttLv
	 MQs09TXp+z3+cp8YHhaSjBzD2Z7VFu8K29HfMyTvIkPSZlPCD4/zbh8SMHbBtCrGRe
	 UP44OU5dDlPNy9b49bixcmKcAjZuV1ImXWCdpgZlYEeSapUInJ/+l0uVvsw6BkKFwd
	 tIq84wRxarvaw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2B4017E0630;
	Tue,  1 Jul 2025 17:11:54 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	m.wilczynski@samsung.com,
	nm@ti.com,
	khilman@baylibre.com,
	kabel@kernel.org,
	quic_hyiwei@quicinc.com,
	pjp@fedoraproject.org,
	tudor.ambarus@linaro.org,
	drew@pdp7.com,
	u.kleine-koenig@baylibre.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	laura.nao@collabora.com,
	kernel@collabora.com
Subject: [RFC PATCH 0/3] MediaTek Hardware Voter driver
Date: Tue,  1 Jul 2025 17:11:46 +0200
Message-ID: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081157_962468_45671B89 
X-CRM114-Status: GOOD (  17.64  )
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

This RFC comes after public discussion [1] with krzk about how the
MediaTek Hardware Voter mechanism was used in the clock driver.

The logic with this implementation instead is to never write to
the HW Voter registers from external drivers, but to register a
driver to handle the voting with internal functions...

...as you can see, I've modeled the power controller to be child
of the HWV, but the clock controller still gets a handle with the
mediatek,hardware-voter property.

The intention for usage of that property now is to get a handle
to the mtk-hardware-voter driver, and call its clock en/dis vote
mtk_hardware_voter_clk_enable() function, which executes a HWV
version-specific callback doing the necessary register programming
for the available HWV version.

I thought about registering the clocks in the HWV and then get
them assigned with something like

	clocks = <&hw_voter CLOCK_HW_IP CLOCK>;

...but I opted for not doing that because the implementation looks
a bit messy as, on MediaTek SoCs, there are multiple clock controllers
located in different IPs, each of them having multiple sets of HWV
registers (from 2 to 8 sets of registers, which are not contiguous
and can't be calculated with offsets), for a total of, well, didn't
really count, but it's more than 80 registers.

Also, all of the mux-gate clocks need to be voted in HWV and after
enablement the "FENC" needs to be brought up with direct MMIO writes
to the clock controller iospace.
(so: enable in HWV -> write FENC enable in clock controller)

For CLOCK_HW_IP in the example, that'd be one of:
vlpckgen, topckgen, imp-iic-wrap-{w,n,s,e,c},mminfra,dispsys0,dispsys1,
ovlsys0,ovlsys1,vencsys,vdecsys (each having dozens of voted clocks).

I'm not sure if I'm forgetting any information but in case just ask....

Ah, "just in case"! ... I've pushed a branch here [2] that contains
the same changes that I'm sending as RFC. Perhaps someone will find
that easier to browse.

Please don't mind about some commits that are not really "presentable"
in that branch (as in, there's some dirty code around) - some stuff is
quite a bit WIP (and some other is quite a bit incomplete).

Also, being this a RFC ... this wasn't tested, it may work or may not,
but that being actually working is out of scope right now, I just want
to understand if I'm walking in the right direction :-)

Cheers!
Angelo

[1]: https://lore.kernel.org/all/20250627-ingenious-tourmaline-wapiti-fa7676@krzk-bin/
[2]: https://gitlab.collabora.com/mediatek/aiot/linux/-/commits/mediatek-hwvoter-temp

AngeloGioacchino Del Regno (3):
  firmware: Move MediaTek ADSP IPC driver to mediatek folder
  dt-bindings: firmware: Document the MediaTek Hardware Voter (HWV)
  firmware: mediatek: Add MediaTek Hardware Voter MCU driver

 .../mediatek,mt6991-hardware-voter.yaml       |  70 +++
 drivers/firmware/Kconfig                      |  10 +-
 drivers/firmware/Makefile                     |   2 +-
 drivers/firmware/mediatek/Kconfig             |  23 +
 drivers/firmware/mediatek/Makefile            |   4 +
 .../firmware/{ => mediatek}/mtk-adsp-ipc.c    |   0
 .../firmware/mediatek/mtk-hardware-voter.c    | 430 ++++++++++++++++++
 .../firmware/mediatek/mtk-hardware-voter.h    |  34 ++
 8 files changed, 563 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
 create mode 100644 drivers/firmware/mediatek/Kconfig
 create mode 100644 drivers/firmware/mediatek/Makefile
 rename drivers/firmware/{ => mediatek}/mtk-adsp-ipc.c (100%)
 create mode 100644 drivers/firmware/mediatek/mtk-hardware-voter.c
 create mode 100644 include/linux/firmware/mediatek/mtk-hardware-voter.h

-- 
2.49.0


