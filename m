Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D68FCCA47B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oVXwZwkNbNsiEis3GpBq7zKZdG1xKS6yBmYVGW0Q2QM=; b=s2ogmpLyT12Y1ops3RjwiSa2tE
	n0Hr71D5Ive5PdVXzpEtqbuWkmrgAlWOX1inu89Ucp64e13EOvdeMMSMeC7W2cuOwTaOZMuM4l7ZT
	UzRzhDdSMOICkBK0DXJ7QEZK0jRDlUmxxVx2Opw/Ivu2boMguxH+xaCxiLMijMsxLHZ83oBCODmVi
	OsWWLnURSHjSH8+rlArOlaTwKQr2kSnZ17VJDvFQtPvYrn0jAEEQbDi2pWA5jovYuWMbWEISxt0NX
	G6YOPWKG64nPO+Ve4d30Z+a50mDXbCUZ8SJVDali2o7IzyFSv6FzM0IO+iliopWoSKJ+Wq6Zsx8Ob
	GTOCo6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wB4-000Ilw-OI; Thu, 30 Jun 2022 15:33:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAZ-000IUr-O8; Thu, 30 Jun 2022 15:33:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AAD26601966;
	Thu, 30 Jun 2022 16:33:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603204;
	bh=EudDgFiZB1R9NaUbxHSruCGuiD0p7vpdf1apIJF86C8=;
	h=From:To:Cc:Subject:Date:From;
	b=a22QgeEDiZNL1AUeZlBoDNE8gsCktZVRPfcQ6Tj+bhXjunFSzUdo0LsPkkxsLxllR
	 Zs2ZkGg9cr+WB2BGKG1tvraC5g4zJTgYefqiB/WuMFtdhXe2s0yWG2vYA+7TEA7Lo4
	 sgwR7l0/LEnGywJcbG126AEI7SOT9VhxH9IlJN7zpDH+WUImRaBi/zfKEAiWjldD7A
	 kERUlxwVHhnAO/bmwhZ3iD9jOwenRzvhuIln1Hf24uVb6QGprJgO24V2YDR/6YiV0j
	 OzoD1r1JCC4hQ9Lr/eXm0XKXSOo10WZaxcdDCD/cehyopMG0aBgDJUXZ3nPu/W9MyP
	 jMmJx6cJPlbzA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 00/11] MT8195 Chromebooks devicetrees - Google Tomato
Date: Thu, 30 Jun 2022 17:33:05 +0200
Message-Id: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083327_956390_136AAAA0 
X-CRM114-Status: UNSURE (   9.70  )
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

This is the first part for upstreaming Google's Cherry Tomato
Chromebook (Acer Chromebook Spin 513): in this series, we introduce
the devicetrees for the four revisions of this Chromebook and enable
every controller and feature that can be added as per the current
state of the main SoC devicetrees (mt8195.dtsi) and its PMIC
devicetree (mt6359.dtsi).

More parts will come as soon as more support will be added by
MediaTek in the mt8195 devicetree.

Note: This series will introduce a dtbs_check warning about a failure
      to match compatible for 'mediatek,mt6359': that's expected, as
      this is defined in devicetree/bindings/mfd/mt6397.txt (so there
      is no schema, yet).


This series depends on the following fixes:
[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630110453.186526-1-angelogioacchino.delregno@collabora.com/
[2]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630122334.216903-1-angelogioacchino.delregno@collabora.com/
[3]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630131543.225554-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (11):
  dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
  arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
  arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
  arm64: dts: mediatek: cherry: Add platform regulators layout and
    config
  arm64: dts: mediatek: cherry: Add support for internal eMMC storage
  arm64: dts: mediatek: cherry: Document gpios and add default pin
    config
  arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
  arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
  arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
  arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
  arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  15 +
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  35 +
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  36 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 715 ++++++++++++++++++
 6 files changed, 817 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

-- 
2.35.1


