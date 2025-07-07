Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF48AC83F07
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r7ioxFjPYamTp+v97ZzFeTkpWjwkFPACIBTW5WvPUm0=; b=VfkueGJOInwWkZ
	PFTJD+styfI6ERGn4SaLeMyw4dZ1v18A8AKx7z7cz+HqRn8KRWRIkiVXG+8yhiJm3Ltm+Xlo+AAQE
	QqQmrF8StozGngmCMG8OMSpRIS4v4ad5xhwXzcjzKQlVU4Q3gUsTSk346YbFENmTM5jW5ZYFxZ0hH
	lzxAXKFGMikIyQls6aFr8yMsHnYL6pUo38KDVEfpbmakzobU7C2iGEc5Awq5jfwLKWoZERMi/v7nD
	hgQtq6MqNpAY0Up+S9K9IwkG1l67CrjaIpK8zZ0BxrtVPDne9JVwgYkXC7Oz1bDWoWvYoM2I5VJ93
	bzrjr0Dgd6LEohJelVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjwx-00000002Gov-0u9x;
	Mon, 07 Jul 2025 11:23:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWC-00000002DA6-34PY;
	Mon, 07 Jul 2025 10:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885774;
	bh=xd1NPzQyI4l/zhqCduXiK96CFBfx57q3wZDMrjNy4XI=;
	h=From:To:Cc:Subject:Date:From;
	b=dHvlU7MCUhdZFBPAECd5hCDFreClGZaf6lnp2A69ZoHs3DQIIMkraeKr3ZjAmtRTy
	 SXD5lPk6uQflpxqOZ1P8mJdF+mwcfxEisEHhgEiTut35mAnhHpKXAfJd/zhAWjYtAt
	 mxQxh2bCbRVXPjBXpJRdN06x+lUUCm+iiGWskXWj93Zf9f88UJNyxcBiXrLo6gTdTs
	 u8+irKaImbqh93CmSpChQpvcCUN5Uopfs9KElx0byfFvce/bJpf18t3KkFrM15tOS/
	 fC8Ve+sfZxiVoeBD0mOmS6Hhi21ROQn0eNpsMoUIwbOmo/SiRjDYrG882fvTiEm3LO
	 Mn3n3P3GvhqpA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 03E8A17E04EE;
	Mon,  7 Jul 2025 12:56:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/10] pmdomain: Partial refactor, support modem and RTFF
Date: Mon,  7 Jul 2025 12:55:55 +0200
Message-ID: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035616_924521_21B0D1E2 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v2:
 - Added #access-controller-cells allowance for MT8188/95 infracfg_ao

This series is a subset of [1], leaving out the Hardware Voter specific
bits for MT8196 until the discussion around it reaches a conclusion.

Even though the proposed code was born as a preparation to support the
MT8196/MT6991 SoCs power domain controllers, it is a necessary cleanup
for all power domain controllers of all of the currently supported SoCs
from MediaTek.

You may also notice the addition of support for modem power sequences:
this was brought up 6 months ago (or more) by community contributors
(mainly Yassine Oudjana) that were trying to upstream the MediaTek
MT6735 Smartphone SoC and needed support to provide power to the MD
subsystem - so, even though in this specific series the code for the
modem power sequence is not yet triggered by any SoC, please please
please, let it in.
Besides, "a bunch" of upstream supported SoCs do have the MD power
domain even though it wasn't added to their drivers (because if there
was no support in the driver, it would just crash the system); the
addition is something that I plan to do at some point, but definitely
not now as I have no bandwidth for that (bar MT8196, which will have
this domain).

Compared to v1 in [1]:
 - Changed mediatek,bus-protection to access-controllers
   as suggested by Rob (thanks!)
 - Added commits to document #access-controller-cells on all of
   the access control providers

In the meanwhile.... relevant excerpt from the old series:

This series refactors the bus protection regmaps retrieval to avoid
searching in all power domain devicetree subnodes for vendor properties
to get syscons for different busses, and adds a new property which is
located in the power controller root node containing handles to the same.

Retrocompatibility is retained and was tested on multiple SoCs in the
Collabora lab - specifically, on Genio 350/510/700/1200, and manually
on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
Chromebooks.

This was tested *three times*:
 - Before the per-SoC conversion in drivers/pmdomain/mediatek
 - With per-SoC conversion code but with *legacy* devicetree
 - With per-SoC conversion code and with *new* devicetree conversion

All of those tests were successful on all of the aforementioned SoCs.

This also adds support for:
 - Modem power domain for both old and new MediaTek SoCs, useful for
   bringing up the GSM/3G/4G/5G modem for both laptop and smartphone use
 - RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity 9400

...and prepares the pmdomain code to accomodate only the directly
controlled power domains for MT8196 (HW Voter support was left out).

[1] https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (10):
  dt-bindings: memory: mtk-smi: Document #access-controller-cells
  dt-bindings: clock: mediatek: Document #access-controller-cells
  dt-bindings: power: mediatek: Document access-controllers property
  pmdomain: mediatek: Refactor bus protection regmaps retrieval
  pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
  pmdomain: mediatek: Move ctl sequences out of power_on/off functions
  pmdomain: mediatek: Add support for modem power sequences
  pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
  pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
  arm64: dts: mediatek: Convert all SoCs to use access-controllers

 .../bindings/clock/mediatek,infracfg.yaml     |   3 +
 .../clock/mediatek,mt8186-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8188-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8192-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8195-sys-clock.yaml      |  15 +
 .../clock/mediatek,mt8365-sys-clock.yaml      |  15 +
 .../mediatek,smi-common.yaml                  |  16 +
 .../power/mediatek,power-controller.yaml      |  39 ++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  17 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  12 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  23 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  13 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  20 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  16 +-
 drivers/pmdomain/mediatek/mt6795-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8167-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8173-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8183-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8186-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8188-pm-domains.h |   6 +
 drivers/pmdomain/mediatek/mt8192-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8195-pm-domains.h |   5 +
 drivers/pmdomain/mediatek/mt8365-pm-domains.h |  14 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 399 +++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  74 +++-
 28 files changed, 596 insertions(+), 181 deletions(-)

-- 
2.49.0


