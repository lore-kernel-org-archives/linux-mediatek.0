Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B89C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c80U4qBO5/hI2BzCNH2ON+BedoQuAtTBiQMN/uC0eog=; b=DJ3SgS6TIHJxjSsdKvVzsvX37/
	DQXGhxzdsfDPw6teJiKdnOV+97TZSEElFUKxnxaCaXI9LndB2hh1AGjS7WePJk72dVMXuL6IT/k7E
	9skpbWmYzSS1TMnSze+Yxx+fa7YazdoFrDRyQW23MjUwx9bzXpqHshHs9+cCeZT+/qcQ4P0fpq09f
	hP6II7RjscZl7Z1qbs8IZbIiEm/Z0MGbs3uXWuk/HKE7t03Hul9mXF0XnPwptThvj3Qzpl/InPTaE
	mfcDNMt4qzciYVSMo1DIK1cFk2PRqC7f2IDCCEoUaZCAVvWh8Ie2z1FKKH/KBmJ69cJavaRSqF//K
	C+ORVGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJC6-00FdlS-IQ; Wed, 01 Mar 2023 09:56:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBM-00FdJy-7D; Wed, 01 Mar 2023 09:55:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A1FD66020E0;
	Wed,  1 Mar 2023 09:55:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664529;
	bh=o3TNOGjIcOTPfj5Mg8+pyQlaPH1CJtvHA+b4+B4FjDk=;
	h=From:To:Cc:Subject:Date:From;
	b=beVjjqEb8AvCZuGEm3++sGok+YZ+dfAetxyoLtgusDrZMlkSbItxsM1dvz5mcYm8v
	 bTPo3h7GHHLRNRO/pNkvENHR079EvqUzhni63btxVpLS5AEnmMhNCUIV+hI81U1s6A
	 t0sRUHVGX5Dky4k29YgzCo6lheJfKYNHx1H4I6kzJU9fmcQNx/oFKz1TFak+NSTHmN
	 D48x5M50sRXY0Pdw8UE4B0izp+A8Suakhv+FVa3jSF3L/lNQQknV5u16UhN28hh0SY
	 9qsu/3ZWEpRANYUZEJgKB2zUuHO5Ospepr8eUG25LJwfaHqRLpCvdUVTNvT2YjreSv
	 r2Uxlq+eAYwyw==
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
Subject: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
Date: Wed,  1 Mar 2023 10:55:04 +0100
Message-Id: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015532_409765_CDABB585 
X-CRM114-Status: GOOD (  12.24  )
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

Changes in v4:
 - Added a fix for MT8192 Vgpu voltage constraints
 - Changed constraints for MT8192 VSRAM-GPU to reflect the maximum
   achievable voltage as per the actual vsram-vgpu relation constraint

Changes in v3:
 - Changed MT8186 compatibles for new bindings
 - Added min/max voltage overrides for vgpu/vsram_gpu on
   mt8183-pumpkin and evb as suggested by Chen-Yu
 - Cosmetic fixes for "arm64: dts: mediatek: mt8192: Add GPU nodes"

Changes in v2:
 - Changed MT8186 to use only two power domains for the GPU.

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

[1]: https://lore.kernel.org/lkml/20230228102704.708150-1-angelogioacchino.delregno@collabora.com/

Alyssa Rosenzweig (2):
  arm64: dts: mediatek: mt8192: Add GPU nodes
  arm64: dts: mediatek: mt8192-asurada: Enable GPU

AngeloGioacchino Del Regno (16):
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
  arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
  arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER
    regulators
  arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
  arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
  arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
  arm64: dts: mediatek: mt8186: Add GPU node
  arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu
    constraints
  arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints

Nícolas F. R. A. Prado (1):
  arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  17 ++-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  17 ++-
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  17 ++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  34 ++---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  17 +++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  24 +++-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 116 +++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  95 +++++++++++++-
 9 files changed, 315 insertions(+), 27 deletions(-)

-- 
2.39.2


