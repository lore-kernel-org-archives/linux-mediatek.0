Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A61C54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHSfLPyRkXDW3BitmXCCpmumCAXMYnWo+zwUqVBO220=; b=iNHhKmlq4AmrmbAxacyRRTKnvr
	ibkhmjDdhbAWq547NipqmqjUql5MYg9foqZPthWLGh9KuwE76BK8FUaa6G+Vfzrsus8frI/lLAf2u
	wZWU5O/VbNVBrWDrnfoaNcvJYhjq6UPKyrJK1MT3UmFLxSRQybwye+RgMHOF8SPaj9An0AKrZKCLf
	Y8WC1tQzN6b3I6U57qIunXlXY0wDhy5omIpm3CeqIGCZanoVIC80GVJMfDA8k/6RUj1bWJZLPCAM+
	qFE3xEtjM4QzwlpLZ1wB4qfANzf9yV9FwZJViPvhGFdd+iV8AXQkSvpCzE1pRkyhTOJqCcRraoVyU
	4gX0RLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMy-00Gd6U-1R;
	Tue, 21 Nov 2023 11:56:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMo-00GcxP-0i;
	Tue, 21 Nov 2023 11:56:36 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01C9F6607286;
	Tue, 21 Nov 2023 11:56:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567791;
	bh=n/QwQ/VSC58UKI+cZu75pBr4SUUF9z59vdJN4z8NLnc=;
	h=From:To:Cc:Subject:Date:From;
	b=dR5aJJ2W6ufYnNy+jo2wFOFXWbjt4WdKVz1g/0y0p/qTaFVCoUKcY0/3E8lqAaeTW
	 bm5W1BUBrDFsNOufuYq32f7iOdH5cCR3eg6nxuRNOPwgucODmRUiNfDtbNGHpfv9sP
	 OSPbAenSl5suOgw/rekOTp1CueyPACYgtYYsg+lUk7RqYYjSzaK68eRaxAphC5nGxL
	 jRyV84K4metj/B14TdvGNEaYIWLJxR2xPbl96kO4bISNi2XWomktGRMI8uDe+n/ngU
	 +6/tFu40o0sf12/jwHh+4V45KErteXcukGNKIcaiamYyU3z8+LkFX8pVwNSpgfqQga
	 hZdYVmdqZvecQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 00/20]  MediaTek SVS driver partial refactoring
Date: Tue, 21 Nov 2023 12:56:04 +0100
Message-ID: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035634_388260_B9EDC19D 
X-CRM114-Status: GOOD (  11.99  )
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
 - Fixed some style issues in patch [18/20]


This is a partial refactoring of the MediaTek Smart Voltage Scaling
driver.
Long story short: this driver never worked as expected on any platform
because of various issues so in this series there are some changes that
will break compatibility with older device trees (of which, only MT8183
ever had the SVS node), but those are acceptable because... it never
really worked fine anyway, so there's no regression.

This series was tested on MT8186, MT8192, MT8195 Chromebooks.


Depends on

MT8192 thermal node:
https://lore.kernel.org/lkml/20231017190545.157282-5-bero@baylibre.com/

MT8186 and MT8195 SVS support:
https://lore.kernel.org/all/20231011034307.24641-1-chun-jen.tseng@mediatek.com/

Note: one commit was omitted because I haven't got feedback yet on
the thermal-zones devicetree consumers implementation at [1], but I
still wanted to send this series to the lists to get feedback.
Please keep in mind that the one omitted commit is supposed to go
on top of this series anyway, and that an useful example of how the
SVS node will look with the DT thermal zones is provided at [1].

[1]: https://lore.kernel.org/all/20231115144857.424005-1-angelogioacchino.delregno@collabora.com/


AngeloGioacchino Del Regno (20):
  arm64: dts: mediatek: mt8183: Change iospaces for thermal and svs
  soc: mediatek: mtk-svs: Subtract offset from regs_v2 to avoid conflict
  soc: mediatek: mtk-svs: Convert sw_id and type to enumerations
  soc: mediatek: mtk-svs: Build bank name string dynamically
  soc: mediatek: mtk-svs: Reduce memory footprint of struct svs_bank
  soc: mediatek: mtk-svs: Change the thermal sensor device name
  soc: mediatek: mtk-svs: Add a map to retrieve fused values
  soc: mediatek: mtk-svs: Add SVS-Thermal coefficient to SoC platform
    data
  soc: mediatek: mtk-svs: Move t-calibration-data retrieval to
    svs_probe()
  soc: mediatek: mtk-svs: Commonize efuse parse function for most SoCs
  soc: mediatek: mtk-svs: Drop supplementary svs per-bank pointer
  soc: mediatek: mtk-svs: Commonize MT8192 probe function for MT8186
  soc: mediatek: mtk-svs: Remove redundant print in svs_get_efuse_data
  soc: mediatek: mtk-svs: Compress of_device_id entries
  soc: mediatek: mtk-svs: Cleanup of svs_probe() function
  soc: mediatek: mtk-svs: Check if SVS mode is available in the
    beginning
  soc: mediatek: mtk-svs: Use ULONG_MAX to compare floor frequency
  soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank
  arm64: dts: mediatek: mt8192: Add Smart Voltage Scaling node
  arm64: dts: mediatek: mt8195: Add SVS node and reduce LVTS_AP iospace

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |   26 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi |   12 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi |   17 +-
 drivers/soc/mediatek/mtk-svs.c           | 1996 +++++++++++-----------
 4 files changed, 993 insertions(+), 1058 deletions(-)

-- 
2.42.0


