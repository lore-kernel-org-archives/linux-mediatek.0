Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A622BD0C84F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hr7NgIys5FGc3Y9tVJClDhkce4MFBudFLvU2XuTC3Lg=; b=H0Tke1Fh2HCjQ4E0imxbpWbO46
	MYGFOAyBMNELhPqJJcR2cvSSH/DiOEO+s1AEPooeYGJ0qC40b+3BkPFCc+AACZGCiR9hAOgvQsVVx
	u0RfGEt7DYz5fA7boMymwDc6x4dHN5HlQ992ocbiYfEAIQdzpgEGvmPaYiqPi2cvIfocv5vCrW14U
	QZP+vC442A8lL9Ywp64NLnODOMFH5Bp66i20xp3DqlxQEdptY0dz24q9ml4XR/I34+at0IeZhHcwc
	hSKYRxWaVKwXcHEhqZu9lgswIV2LUxl5ws2dwitxsoytHJRik/D/SrFUMrRYKI7A1CGsg0wVQWziT
	fEH5mP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8C-00000006wyi-27ux;
	Tue, 13 Jan 2026 11:00:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc89-00000006wuC-0TJ0;
	Tue, 13 Jan 2026 11:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302005;
	bh=WSc8pifyA45PXjMypwWXQ0wi4toOFAjaSOf8+Y4VN5c=;
	h=From:To:Cc:Subject:Date:From;
	b=MzDKhcrDFN98q6o3nJGgRTX4ntmBZcIwZraHvVgLIrY+BvVqJ4FfvJ8Sa94RDvfQU
	 6jOFCVY2w8WWOZ986pJnXjxDTCgu/E9pcwaMxP+rvu4bqPahPweO4ZL1C9v8JIzzEh
	 IgsXIkyUu8xu7PCyn4Z+0d1vcaynB+g0/fStQ1L1pERjGBBB2om3Zcsp52LJ6mlg+E
	 ffAYZdsFbMCAZZb+kyMDFHpDQbRhts6Vgerr5faRwExJTq55EMRs7AhxVu/Dk0gQRq
	 WK8xFP8+7Gz5XXzeMhSHbq6b+RXpUKHJ6rV6gUZL+Vo8NGisL71hfK0UTGATdPdHCB
	 RWCvtLQX50B/Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9088217E10C8;
	Tue, 13 Jan 2026 12:00:04 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/6] Fix dtbs_check warnings for MediaTek Helio X10 platform
Date: Tue, 13 Jan 2026 11:59:54 +0100
Message-ID: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030009_354069_56EA78C5 
X-CRM114-Status: UNSURE (   8.27  )
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

This series fixes various dtbs_check warnings happening on the MediaTek
Helio X10 platform devicetrees.

Depending on correctness, either the bindings or the devicetree was
changed as a dtbs_check warning fix.

AngeloGioacchino Del Regno (6):
  dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
  dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator
    compat
  dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
  arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
  arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
  arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node

 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml    | 1 +
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml       | 1 +
 .../bindings/regulator/mediatek,mt6331-regulator.yaml         | 4 ++--
 arch/arm64/boot/dts/mediatek/mt6331.dtsi                      | 2 +-
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts        | 2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi                      | 3 +--
 6 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.52.0


