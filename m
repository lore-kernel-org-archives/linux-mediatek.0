Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712CDC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0qlcKrWmky7+oVQgMysBLbhTxOpuHrtgdrTy78e+OQ=; b=4qytk6FT4SXPgkeSUowU76bHBD
	cgxhdDlV2RL2aeFDMoJtBi6I6ICPRDub4eNawBBOsbCVkQl0KBsk6uQMHXMLBk3pADcQCh1VM4wPR
	tS/hTEWRa/bGThWC6yLyc1buVREqneUVV9csPWsOVxao7KLLnuZBGIbtHksdG5vOwTobaCce0BEOV
	SigHsQaIU8ap0aoMPuqaT0+Syb95v09jOeEEmFNmYdsetWiVOOAQD+ntlcnmNwR/sWatOEBALgnLY
	Fw1h/fM4OIigAEXZHuwX7S2rFGyEtGkFzB2FgamZF3SQxJ1cTnULTesXDVDf/iYoi+cHvWP0ACZ7Q
	HyRe6H6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdwM-0043fC-2o;
	Fri, 24 Mar 2023 09:42:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdw9-0043ZM-0D;
	Fri, 24 Mar 2023 09:42:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1D706603103;
	Fri, 24 Mar 2023 09:42:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679650931;
	bh=ebcxMmChYQz6A/ejLgJx2hRoaZswuqFXLT5RuazLrD8=;
	h=From:To:Cc:Subject:Date:From;
	b=GJcm7kUXnum8O5QYg3Yhy/u1GZviyHYRPMKxFk1EjRIGNpvWgD4YRu9LA/3w6euFT
	 OrpW9D9PZI4CgE+PESNVuTKFQ1UohddPqMa3eBebTiHaH+tswkBollMdptCIbngR1H
	 N0oFlfg9eE2hpbRPmYa8uIoWfj74j+0ozpDtQcKRCG0zzhdRshsGg87zMQfaS1cksH
	 enIBbt0XMqIZ1S2ywYz9qZ7zqPEtYWUI5oWheKWZZBw/Hrffb00Y1pmUKO4JWMBKKf
	 UuNOm+EWAGCROXPLDNAtEZj7+o8J40JDzZyQ7uqusUUj6EAxP/YT/O/sFBoE5vxCGt
	 upLwXdO6ujM+g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	amergnat@baylibre.com,
	flora.fu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/6] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper
Date: Fri, 24 Mar 2023 10:41:59 +0100
Message-Id: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024217_316350_18AB1C78 
X-CRM114-Status: UNSURE (   9.06  )
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

Changes in v2:
 - Rebased on next-20230323
 - Changed pwrap.txt addition to new yaml file addition

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support in the PMIC Wrapper for a different PMIC
topology, which is commonly found on smartphone boards, using one main
PMIC and one Companion/Sub PMIC, both accessible *only* through the pwrap;
be aware that this kind of topology is not *specific to* the Helio X10
SoC, but common across many kinds of MediaTek smartphone oriented SoCs
and board designs.

That said, support for the PMIC combo MT6331+MT6332 is provided in this
series in a form that will be able to initialize the PMICs with crypto
and DualIO but nothing else: these PMICs are very featureful, so I have
decided to add this support in more than just one step, as there will
be multiple patches for multiple different subsystems (..it's a mfd!..).

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

AngeloGioacchino Del Regno (6):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6795 Helio X10
  soc: mediatek: pwrap: Move PMIC read test sequence in function
  soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
  soc: mediatek: mtk-pmic-wrap: Add support for companion PMICs
  soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332
    companion
  soc: mediatek: pwrap: Add support for MT6795 Helio X10

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 287 ++++++++++++++++--
 2 files changed, 262 insertions(+), 26 deletions(-)

-- 
2.40.0


