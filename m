Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F528C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VOP1U2haTLIN6QSJE5YT9NSpsYg9IrTKjDsrLCjuI0M=; b=atmxQLlzUwKRd0CPIQ5z3ZVclI
	MV3WI0PynJ/A6sIAAhY2km+GDk4w9XmjSn26cjWenyPHKZ4nvKAhOdpMNVyOoqaLwBhq0DmL/6IgI
	Z6z28fWwgzrv9CYFR6mFkvqgdVMA1tY5SNMfaErgFFs9VGn5xDUDe8/o8TChReLbe46CFZ7+YMjh3
	P6wlj7Vd5SD7BZysXK1vpy74wsBGJ8+OD/LvuU00JXRVqVL8w9mrB7RH4hYqb6rwVDyJEQFbhq+9w
	R32FryOyaC2SsmzIQYTViG1azHTmV0CngZsdLL7B14kIGRRm6fNSW2P1spSiHQk14x0n4WLlOOpej
	J3DI4cEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEqq-00000004X7A-459p;
	Thu, 20 Jun 2024 10:17:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEqn-00000004X5i-0XUl;
	Thu, 20 Jun 2024 10:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878623;
	bh=UFUBPQcSLVh5HOQ6vjmNUcwptTZHWQ6XHWTpYyTdK5w=;
	h=From:To:Cc:Subject:Date:From;
	b=NjjYSalEE4KOLecX91PFv1cabRR9Kn7//NuyQxquW7y80yOfwOCSzSq+pHbYk55SA
	 xZWdyDHV3G7UdbsITxYcwxr4ckb3l8XbDjSxjuxbG+EMiJkEwi7TTpTRtiC1wb6bmb
	 5Bw10q+jioWXFDyHMB6W7ZEvuwzHb399UxDPz+F41AIV1PMafvAq4D27R7IpNpbqip
	 ZAgEw19vv6xYiEMdU5IZq3KV7Q2qd/JXUa9WOJhxyBvF9RCkK0qb5Qx9JtUZV1MiZr
	 VxgCg+Gj2cHh5rCc/7RiigHQe0wm624W+W0hMfmT00wX+nTU0vsICUYofzFyJvFFB/
	 zhftUPFONtVQA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF81C37821AA;
	Thu, 20 Jun 2024 10:17:02 +0000 (UTC)
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
	kernel@collabora.com
Subject: [PATCH 0/2] dts: mediatek: Stop using unneeded definitions
Date: Thu, 20 Jun 2024 12:16:54 +0200
Message-ID: <20240620101656.1096374-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_031705_318803_781F3090 
X-CRM114-Status: UNSURE (   7.01  )
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

The MTK_DRIVE_(x)_mA definition is useless, as it's simply defining (x).
Change all occurrences of that to simply x.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: Declare drive-strength numerically
  arm: dts: mediatek: Declare drive-strength numerically

 arch/arm/boot/dts/mediatek/mt2701-evb.dts     |  2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        | 18 ++++-----
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   |  4 +-
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  8 ++--
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   | 12 +++---
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  2 +-
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  2 +-
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   |  6 +--
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  8 ++--
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  4 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 26 ++++++------
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   |  4 +-
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 40 +++++++++----------
 .../dts/mediatek/mt8395-genio-1200-evk.dts    | 28 ++++++-------
 14 files changed, 82 insertions(+), 82 deletions(-)

-- 
2.45.2


