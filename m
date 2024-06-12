Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C348DC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5H8C3/avF4muzyDMl2EQz7isZqqohk3NMtYGzd6roGU=; b=DfDo0IsLfx6d3vPeXM5CgU/ljP
	pQpbIIC1mh5PY/OHXOjGMg04Qs5Vg2eJxT8QpzsIbkym2EaC8cLbAJryXkeR4UScPIqFw1YJCtwpS
	LyQkAOoqaURQ41FB2x+agz10ybP2a3NDtR1Ji7wIJk5uoWV7VufCM0BTY/ffrj10ZLW6OWogLx4gi
	VjJe26D7LV4OO3RSoK1eNF5Wa+R4rjclFZLoASAIOCa8ajk4vKEUWI/r/CYrITuEsRTUIzgTTlF2m
	WEDo+9dhQM2guJ3aqvvVTdRozuvcywgi7pvqCDEl4DUOyArad2MTl3U2NxCNtpogQnmUY/mWYeg50
	lv9+MKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdk-0000000BU2a-0XJJ;
	Wed, 12 Jun 2024 07:43:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdf-0000000BU0k-3Qbc;
	Wed, 12 Jun 2024 07:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178202;
	bh=QHmdx0T93KlMa0bAVjuFjeI5sMM5BrBaWcIHBFNDdIU=;
	h=From:To:Cc:Subject:Date:From;
	b=cABS5A2D46NNjU2XYkoKIpIpxaFkbqZ5J6LFiXJfNs/7wCEz0umyq0B4HpOooDbAL
	 o79Ojstduxq2Ht+OQvLdrD3xg9XDNrkj14ny/VnSFT6xyhRhwQuyksxi2Tuy3AMQx7
	 q7/jJdrDjIUJS0rdBYGIToWN1cNXK4kbnloRGN3Y4NQ8FBkO4Rhib6VjGpAZ7tr6Nl
	 E/oITx2EqXOWtLO9w5GkN19L9L992pQ6Ogx2O2q25Sc7HZkSlX70PHaWuxJkYrz+eQ
	 mGNTy0zI+9CcZoHVWH+PEclJ76pTaHglvT+dunJOpPkEEbDOiTiLBIbt9h8inBtHso
	 5PLYwAmAjyThQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6A253781188;
	Wed, 12 Jun 2024 07:43:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc
Subject: [PATCH v5 0/8] MediaTek UFS fixes and cleanups - Part 1
Date: Wed, 12 Jun 2024 09:43:01 +0200
Message-ID: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004324_147152_1A9C2E52 
X-CRM114-Status: GOOD (  12.44  )
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

Changes in v5:
 - Rebased on next-20240612
 - Tested again on MT8195 and MT8395

Changes in v4:
 - Replaced Stanley Chu with myself in maintainers as his email is gone
 - Fixed commit [5/8]

Changes in v3:
 - Disallowed mt8192 compatible in isolation
 - Added maxItems to clocks

Changes in v2:
 - Rebased over next-20240409 (because of merge issue for patch 1)
 - Added ufs: prefix to patch 1
 - Added forgotten ufs-rx-symbol clock to the binding


This series performs some fixes and cleanups for the MediaTek UFSHCI
controller driver.

In particular, while adding the MT8195 compatible to the mediatek,ufs
binding, I noticed that it was allowing just one clock, completely
ignoring the optional ones, including the crypt-xxx clocks, all of
the optional regulators, and other properties.

Between all the other properties, two are completely useless, as they
are there just to activate features that, on SoCs that don't support
these, won't anyway be activated because of missing clocks or missing
regulators, or missing other properties;
as for the other vendor-specific properties, like ufs-disable-ah8,
ufs-broken-vcc, ufs-pmc-via-fastauto, since the current merge window
is closing, I didn't do extensive research so I've left them in place
but didn't add them to the devicetree binding yet.

The plan is to check those later and eventually give them a removal
treatment, or add them to the bindings in a part two series.

For now, at least, this is already a big improvement.

P.S.: The only SoC having UFSHCI upstream is MT8183, which only has
just one clock, and *nothing else* uses properties, clocks, etc that
were renamed in this cleanup.

Cheers!

AngeloGioacchino Del Regno (8):
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-support-va09
    property
  scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-boost-crypt
    property
  scsi: ufs: ufs-mediatek: Avoid underscores in crypt clock names
  dt-bindings: ufs: mediatek,ufs: Document MT8192 compatible with MT8183
  dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
  dt-bindings: ufs: mediatek,ufs: Document additional clocks
  dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09
    regulators

 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 29 +++++-
 drivers/ufs/host/ufs-mediatek.c               | 91 +++++++++++--------
 2 files changed, 79 insertions(+), 41 deletions(-)

-- 
2.45.2


