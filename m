Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E1C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Ej1gehd9qh2qWxm1Oig9MmyhyNlnAtpPJ/2iAROCfo=; b=mY6epnn71MYv35OJiyztMYGhz1
	gGqluYy+aVnm6Naq5diBLDd9qKWZp/Jl0Ww8ugTcT4eogZy/Pa5iL5CogpHU2fVtHIHkl2CAlgUnQ
	vLGgol+wU/332F30NbpgNvI2T6AFVw0gVYraqZ2hSUzvPpLmzXv0E/2PGrAWUte/dwelVzfr22LT6
	FGtyk+jYu/ML1w2rVSywBYSyWk953zzXJ8Fd6aLCwPQUba66sfMn4jrYWxq5iAni6rti0ZZvZyU3f
	/n4VIPGgSbl+awMwFqON3vYm4YeoRaZsbl6m2W7Ib+AeFKc0ZvcSqzYIhY36nda9ED4tpU4rvroPo
	RDhxQ16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSGx-003OkS-1f;
	Mon, 30 Oct 2023 13:25:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSGs-003OhF-39;
	Mon, 30 Oct 2023 13:25:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8CD4660297B;
	Mon, 30 Oct 2023 13:25:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698672328;
	bh=4eqeiWumk4iSfUH1LnoCuerSUI7m7wgrGgGcR0jKt20=;
	h=From:To:Cc:Subject:Date:From;
	b=D6EovCptxO0ZxALbuNpnoq/13GJgRkqwpxgY1tqF99+c3Qnj7nIkTOP+QIiv7pD0t
	 4fDwG08rEhEJR6D71qtxH+M6nmNJvAtM/E22zOWd8lw4ZZz+fXgjOqee58z3woKI2n
	 UbQD1ZHF3OS287on70DQp2TfzNBbNAhmmdaM12nCgkNMp4LnayH5XXqxrm5UYd5YSP
	 8KBrgXvkbsWrzNpFEHQKZCGkiuMisVhcIl1T9bnp+PKnFQ47tOXGGN2XUXZc/g+P8l
	 4rNYb3/WCXBHkB9MV230pIx0/4ibr29eBHxrKm9Rt4/LPxnr3X9qqzvZ7Oz8t0JbFT
	 eHh9awnUnUCtQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wenst@chromium.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/2] MT8195 Cherry: Assign MFG vregs for power saving
Date: Mon, 30 Oct 2023 14:25:21 +0100
Message-ID: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_062535_163192_40637C99 
X-CRM114-Status: UNSURE (   9.05  )
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

This series assigns the right regulators to MFG0 and MFG1, respectively
VGPU (GPU Core) and VSRAM_OTHERS (GPU SRAM), and removes the property
regulator-always-on from both.

This allows to save power both during runtime suspend and during system
sleep; specifically because:
 1. The GPU SRAM regulator is switched off during runtime suspend
 2. The GPU Core regulator is switched off during system sleep

Of course, in order for those power saving actions to actually take
place, it is required to also have the code in [1].
Anyway, even without series [1], this will not introduce any unstability
as the Vgpu regulator will simply not ever get turned off.

[1]: https://lore.kernel.org/r/20231030132257.85379-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: mt8195-cherry: Add MFG0 domain supply
  arm64: dts: mediatek: mt8195-cherry: Assign sram supply to MFG1 pd

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 10 ++++++++--
 arch/arm64/boot/dts/mediatek/mt8195.dtsi        |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.42.0


