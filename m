Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99884C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XyqEjbsv+z9CUBqSGOqxXKSmOvWQaOExLXPsIsto+GU=; b=DxZnXoDetNXln7BjpPZog3RCPK
	xOrJRVqjZWfrBfXQtJqoMSMjxsN2oMKFfGj5CrNEV53fw8PRH4cmnI6UxJJtszP26ssHyX9TAFOZG
	VAmodsDwYacMmHvnhVDSYUYIJRSdaffUxlLqufG67fmZH5nRHc9HjOMFX86RL7SI/HvFli8HKCAQF
	onzXeMsBFK/+0mOyONf/bYbgxfSgSAhsG3DvQQdFXhE0tWY8k0UF/YZemv5msmPfC0/26Fp1cNTSC
	ilacR29ke6l8rPhxydT8RFmsmbKlWBc60DjBB45ldSks59LfrQHqNM4MtoR4re1jbJWFZktsdcVs2
	8j2nTPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jn7-00ES0j-Ho; Thu, 23 Jun 2022 10:10:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmn-00ERrl-5p; Thu, 23 Jun 2022 10:10:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0EAF56601796;
	Thu, 23 Jun 2022 11:10:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655979003;
	bh=+y7MosVyFMCeWL500cbHvDLPel8eiklTH/H6ZFzjZ1Y=;
	h=From:To:Cc:Subject:Date:From;
	b=EoOSch7c2DJRjoiRID56J9pJIkXxdG+jxrFhuCoajbcuS9w4U8+i3ecTcwFwRGZF+
	 ZJiIbbNNqkSlmgWyveYXvJiM7M9xG+K3hv6/LTDYN2eeOHBl/Px3GziBKAELJx+JoN
	 UxeTQpejkI5tZGTAN23bCXxvtGd8mHHifERS9JSWLI8JizcmxfD0nS/CRSJmER5yDM
	 9589/DPPRG860wFpos+BWLSD1gQXxcaD1deaS7hk8iSQ6FhtQUPuTNH/fRq+Q8cybz
	 HM0xfxegcBAZEO9cj8VjbUaHF/PukGheZR+QVSb5EwkoCLDYniRFV4sFfzf94Leo+0
	 AFmx/zGeuNM/Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] Allow getting regulator on MFG for multiple SoCs
Date: Thu, 23 Jun 2022 12:09:46 +0200
Message-Id: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031005_393954_EF0541B0 
X-CRM114-Status: GOOD (  10.38  )
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

This is one of the steps to enable DVFS with the Panfrost driver:
since Panfrost is already enabling the (required) MFG power domains
and since the mtk-pm-domains driver is already responsible for
actually enabling the SRAM PDN, it makes sense to make sure that
the VSRAM supply is ON when trying to reset/enable the SRAM.

For this reason, the MTK_SCPD_DOMAIN_SUPPLY flag was added to one
more MFG domain, ensuring that the SRAM is actually powered and
also not relying on the bootloader leaving this supply on; on the
other hand, this is also making possible to avoid setting a
sram-supply on the GPU node, making devfreq happy about having
only one supply and finally allowing DVFS to happen.

If no domain-supply is declared in devicetree, mtk-pm-domains driver
probe will anyway keep going, so this is not breaking old devicetrees.

No side effects either when this supply is declared for both a MFG
domain and Panfrost together.

This series has no dependencies.

AngeloGioacchino Del Regno (5):
  soc: mediatek: mt8192-pm-domains: Allow probing vreg supply on MFG0/1
  soc: mediatek: mt8183-pm-domains: Allow probing vreg supply on
    MFG_ASYNC
  soc: mediatek: mt8195-pm-domains: Allow probing vreg supply on MFG1
  soc: mediatek: mt8186-pm-domains: Allow probing vreg supply on MFG1
  arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
 drivers/soc/mediatek/mt8183-pm-domains.h       | 1 +
 drivers/soc/mediatek/mt8186-pm-domains.h       | 2 +-
 drivers/soc/mediatek/mt8192-pm-domains.h       | 2 ++
 drivers/soc/mediatek/mt8195-pm-domains.h       | 2 +-
 6 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.35.1


