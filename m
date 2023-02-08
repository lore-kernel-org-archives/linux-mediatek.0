Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C999DC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EO+NLwX2w2NatVYeBgn4R1GH8kPQ175lSUdwZOXPeE0=; b=1k4tdRuoh8wmyLF2PHvwmqbshu
	onUTrM64eTH1VmxQXdBGiGbGs11LqaapUFdNdSm+rccP88hDHGEr+hxuCmnV3NilUJ/g+amxRvx54
	XVVYqT2saAXvZIqH73HoTpVk4oQpta/TBezrV7tMF3Oa6NbQ1QsrkW6irGdv1vNsf3jsKAC54N+YV
	3D+stg+mn8yZD1OWCaRBSZ46Rjr7bDRAHr3BQwYSh1awpU75IyW5p6rhrE+nLEMJ3xyGja7/ehBzZ
	MVode0ui61wp4eCMoViRR/EnBbFLCAnpn30pHXr679m2ln5p9ZuPgt4PEMDc163h36CKfgsvkEA1/
	c+SUNWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhy8-00FIID-Lt; Wed, 08 Feb 2023 10:46:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxI-00FHra-Tr; Wed, 08 Feb 2023 10:45:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B383F6600367;
	Wed,  8 Feb 2023 10:45:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853135;
	bh=uxPBG5wQOa/bUqDK+jm9zu3nY4u+VWE1I9KLBAJ3fa4=;
	h=From:To:Cc:Subject:Date:From;
	b=VT/PW6GqHaG/DJ/magsDCyA/W/UEvZAxKw1pcVzibaPfkjdUhXbTOTSqVGW2nVSTl
	 TFr6/MSkzJ7L+P9YMEb7zy7z9sCOL0u1koKn+tKMHOUCcmujoo1t2fJf6Zr60YiHhb
	 hOPDb0c/723YkyaD9ISwyxkxOR9LvppolJAfT8orW6hdE2TAdO7ffYnP9YY7Ti0YJ5
	 da4DcPM3aNiKVOjWIAvPhJvikPjHeAnZwzN+MfmeNJuKqoV22rX4B/+InAR45Z6VBC
	 d2Ue2pImpkdsTyVP9c2qY4dQDRcp5Mv1/f3IFafqy1LBYtjQ05YFKMmkBYCl2ykL3i
	 g7BuF2fl9AbJQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 00/16] Enable GPU with DVFS support on MediaTek SoCs
Date: Wed,  8 Feb 2023 11:45:11 +0100
Message-Id: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024537_159459_8837A7D7 
X-CRM114-Status: UNSURE (   9.81  )
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

We finally have working GPU DVFS on MediaTek SoCs.
On Panfrost.
For real.
...and the best part is that it's going upstream.

In order to get GPU DVFS working, it was necessary to satisfy a
specific constraint (which is different, depending on the SoC)
between two regulators: GPU VCORE and GPU SRAM.
This was done through adding the mtk-regulator-coupler driver,
which transparently manages the voltage relation between these
two vregs, hence completely eliminating the need to manage these
regulators in the Panfrost driver; this solves the long standing
issue with devfreq+opp tables not supporting managing voltages
for two regulators per opp entry out of the box, due to which
we never got GPU DVFS on those SoCs, often locking them out to
a low GPU frequency.

This changes. Right now!

Tested on MT8192, MT8195 Chromebooks.

This series depends on [1].

[1]: https://lore.kernel.org/lkml/20230208103709.116896-1-angelogioacchino.delregno@collabora.com/

Alyssa Rosenzweig (2):
  arm64: dts: mediatek: mt8192: Add GPU nodes
  arm64: dts: mediatek: mt8192-asurada: Enable GPU

AngeloGioacchino Del Regno (13):
  arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU
    regulators
  arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu
    constraints
  arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from
    gpu table
  arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
  arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
  arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU
    compatible
  arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
  arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
  arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER
    regulators
  arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
  arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
  arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
  arm64: dts: mediatek: mt8186: Add GPU node

Nícolas F. R. A. Prado (1):
  arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  11 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  17 ++-
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  34 ++---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  18 +++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  22 ++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 118 +++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  95 +++++++++++++-
 9 files changed, 305 insertions(+), 26 deletions(-)

-- 
2.39.1


