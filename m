Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2849C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAEjBTZ9/0R5U+jY0vlquCJzVDYRme93Vk2wRp6z1Bk=; b=OphMG8I2kD/Z+aABZjLexXo+SJ
	VLGnRT4iSRlep612WD3/CRK1EmkaQ5UeA1wr7Tg+JKY/8Qgold+fT9Bjm0V6gEx+n3f2Q/tGT8Cek
	gq4lT5o8sCHPwppMortx/Ol6CV0XhsrS+Q/UCO5KkzKLNL4GFMqJsZWeXQG//hehtvbrRBN5fF8Zq
	/6N8UglAPUZqLSv5YsIN5UwiwT9QDX4Al8I5HRdMjW0r/zYzpT3HPCe29n3AJcDKM/hCtVb3owqoV
	0m7Wp3oqznr2wMwokCImnYT6qAm7yFJANXLH1uPja37qbiIVpxRqQiKwZbbEfltS5MD65Hxlvz27/
	ocl6jG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6x5-0043W8-Ha; Wed, 20 Jul 2022 10:29:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6wV-0042fF-9g; Wed, 20 Jul 2022 10:28:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27FBB6601A93;
	Wed, 20 Jul 2022 11:28:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658312910;
	bh=WjQuvFNLVm8PV4tL75ngFil2ay60pZ5lwG2z4v6Q6rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hhmqd1R7Lmd52+qzUkQpbDDGF0an6MsHUnylgLlSnHsxb4h6z4JA1QG8wuBBsnLHG
	 tZHC6I7OlaRjL4g6mUGbKV5W/irLR9Kg7mq0VRwtXCmgMdNQ0ej7KwH5f3Ax5dlMlt
	 UTl4gQMTZxs2TZvcUEiV7qBtNMacZud4oe8mDrzApqPtxOuQP7o26OGyOWFQUGjY7A
	 4cK6Re2EtaMrub72W2LMqYjJRM/zxNFySN7a22qEhlZEC6ueS7yajL8vTOWAKJ4ZPN
	 21Rrc3RFXlJAl/SDTF1hayT9w6mdHqsLOpCCNWiKv5zz5qRsVURdVRWrJVs0/9MHPm
	 jMkYPNKP/rltA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: mediatek: mt8195: Add reset idx for USB/PCIe T-PHY
Date: Wed, 20 Jul 2022 12:28:17 +0200
Message-Id: <20220720102817.237483-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com>
References: <20220720102817.237483-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_032835_511793_217C40A6 
X-CRM114-Status: UNSURE (   9.10  )
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

Add the reset idx for the t-phy port 1, used as either USB or
PCI-Express (secondary controller) PHY, depending on board-specific
configuration/layout.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 75b54ec9c46c..fcd410461d3b 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -200,6 +200,7 @@ static u16 infra_ao_rst_ofs[] = {
 
 static u16 infra_ao_idx_map[] = {
 	[MT8195_INFRA_RST0_THERM_CTRL_SWRST] = 0 * RST_NR_PER_BANK + 0,
+	[MT8195_INFRA_RST2_USBSIF_P1_SWRST] = 2 * RST_NR_PER_BANK + 18,
 	[MT8195_INFRA_RST2_PCIE_P0_SWRST] = 2 * RST_NR_PER_BANK + 26,
 	[MT8195_INFRA_RST2_PCIE_P1_SWRST] = 2 * RST_NR_PER_BANK + 27,
 	[MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST] = 3 * RST_NR_PER_BANK + 5,
-- 
2.35.1


