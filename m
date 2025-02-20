Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F524C021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ny7bhpn00Ly6BIl8F1IWZPB/0Rmu55iPoKi9YsgQedg=; b=S4hpLigicPgLb7Qc6oWBuGCsEJ
	FFB1rwYvpclptXpKoYdqqd+S0E4IjjOGO73wZqD6lU/1TMcOuRNIBUXGI/RPzFxvOJGlm2jc2nqMo
	ZK/vCHXgfU2JBKU4W9f4HjyYli5c7pHoIFpbOuc/jEJ6Km8ab/Gx5xyONBtRTA4EemXlmk+wUs160
	81GG2FilhNrkgjqzTOjNiV5j/5SwpziKtA/1xlSE0x92yR/mEtM7d7yJNeZDUnTx9er6kBr5klF6E
	Z+RduARjkLsAFFnAp3rFB7IyxKjfEhANJIYYfWilLZlJV5Tn2BEyXLIrU0keYz2n+BYUEWgj9t23S
	EzGVaZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4Sr-00000000TLM-2Yvn;
	Thu, 20 Feb 2025 11:11:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4RM-00000000Svr-0CX6;
	Thu, 20 Feb 2025 11:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740049798;
	bh=KbXYp775cdnty7f1RIZ5D4SMIl7u1xJAlQegzHLVtg0=;
	h=From:To:Cc:Subject:Date:From;
	b=Lj5Rz8xFMibe4IC22N7/0i+iFcJChPrurFTfbm6FxtnBiXZjlcr0ysS8d18Kkk24H
	 JcBMXGugW9or6w3gy2zAAokcERw07Ft+q1MFQ1V2By+tzJ/v6fH0ruqbuLQpam24jt
	 bPUDMenlljFsyIHHrpTOnBx9ZzkkK1b/VDqJAkM8NFwKZP2Ax76OFtvFev2/qe75fY
	 qvgblGP7EeS4BCNpIFWY6dAXfHAAd92g+8/GGE9MjJeqcAqLF/wVQJTQbhkU5GlhuO
	 kNqVg06Py0PppaZ+hxFneiwETXc5Sennhn7a9nOMU9k2pD73FX6G4ZIZA0R1zbSFWK
	 v8TN7mI5oOR7A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B37CF17E1247;
	Thu, 20 Feb 2025 12:09:57 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 0/4] MediaTek MT8188 Display Graph: Chromebooks+Genio
Date: Thu, 20 Feb 2025 12:09:44 +0100
Message-ID: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_031000_231034_32C68B20 
X-CRM114-Status: UNSURE (   7.06  )
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

Like already done for MT8195 in a parallel series, this one adds a
base display controller graph for the MT8188 SoC, migrates the Geralt
Chromebooks to use it, and adds support for the DSI display found on
the Genio 510 and Genio 700 boards.

While at it, this also adds pinmux configuration for switching on/off
the fixed power supply of the touchscreen IC found in Genio 510 and 700
IoT boards to stop relying on the bootloader preconfiguring it as GPIO
before booting the kernel.

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: mt8188: Add base display controller graph
  arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
  arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
  arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins

 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 155 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 140 ++++++++++++++++
 .../dts/mediatek/mt8390-genio-common.dtsi     | 154 ++++++++++++++++-
 3 files changed, 434 insertions(+), 15 deletions(-)

-- 
2.48.1


