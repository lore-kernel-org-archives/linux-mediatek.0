Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABECCCA47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUg8VaaGZLwmgP480L75+2SGy6eKNplguVAcE43QpAE=; b=EQlr6HATThO9EL2LSGZ3metXgr
	d0ydaNdjCjEWgsCmGxYL6YVYjfVoqmHjXDoYRaloKQyW3vV65MGmYK63FU5CjzYN4sG27xKUl9S8H
	p1joXRsYbQc60aQzFk7XJkL+gB4p0IljaVr4ib6Lq6X82LOd5g6um5jBGXl0Kc6TR7qr9M+ELNH4z
	lwlgueY/7K7Mmj9Nvz+rhHO6Cg5Y0mfpYS79QJS8tf8ItSFqZK7tOW/dxYYO8wJ/jgPzRWtqA0P8I
	6ApMyA8zGaVHqgE9u5TwqHb5AqNnAQoymcVkhnrxZgYlO5z8ZdQfXbwJ9YRmRZd+VF9ifRZnScQxj
	UrJd6uTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Vdq-00BJVh-0B; Wed, 29 Jun 2022 11:13:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VIx-00BAMK-BT; Wed, 29 Jun 2022 10:52:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 526A26601917;
	Wed, 29 Jun 2022 11:52:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656499938;
	bh=py3LLK2To0yUgU15nM6y7YgY1j1M75MtNNYXz3fL/tU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EeFxBt0xrxABbRTiVOYN4Qc4dWVujwxHOxUh/4P/i/0CQcnLrCpH5ps2FpzxgHVZP
	 M/ZXDs5mihfd/1Bsd/HVLhtU4zqPv8/pVYZ4dfdXr+wDMUEHVGRgpuXvZbFnz0z8tn
	 37tzB8hmbIDQI9FCPW/aIrXyrk9HzPPTKI6QRLnwy6ysutvjHobXJdTgvusNTWOmKK
	 eIdjzfw+/CmiFz9KjMnokKprGDaf+ppoiu+aLYBqvySv8v1k4EXoqDUFRj1erjj9PW
	 Z0Nq3te/Feq2K3Cyv0vafxeXk5T+zyI5rVLdKbutXgPSAPp5T31kU4lUylr2I5F39Y
	 qsHIveHDREcDw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: mediatek: mt8195: Add reset idx for PCIe0 and PCIe1
Date: Wed, 29 Jun 2022 12:52:05 +0200
Message-Id: <20220629105205.173471-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_035219_598828_2E514D83 
X-CRM114-Status: UNSURE (   9.48  )
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

Add the reset idx for PCIe P0, P1, located in infra_ao RST2 registers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 97657f255618..ce7ac16a2f42 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -193,6 +193,8 @@ static u16 infra_ao_rst_ofs[] = {
 
 static u16 infra_ao_idx_map[] = {
 	[MT8195_INFRA_RST0_THERM_CTRL_SWRST] = 0 * RST_NR_PER_BANK + 0,
+	[MT8195_INFRA_RST2_PCIE_P0_SWRST] = 2 * RST_NR_PER_BANK + 26,
+	[MT8195_INFRA_RST2_PCIE_P1_SWRST] = 2 * RST_NR_PER_BANK + 27,
 	[MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST] = 3 * RST_NR_PER_BANK + 5,
 	[MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST] = 4 * RST_NR_PER_BANK + 10,
 };
-- 
2.35.1


