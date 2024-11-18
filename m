Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95221D43FEC
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaXC/IkaX0WH7a2gXyN0AUFXzXzjYyrq/tzg9MZUxxw=; b=IJ7TP3joLZfqgVLSfZ4aKIf9Lc
	iwi8IhaY8vfGz/NBdjlpli/1QyzyTgW7wZeyp5zIEFivFqWJ/u5idinmwffpRWPLCtt4s8Hl7Lyrd
	w+vw5IFC9DOoYsD0QIHI52rqbxQow1GHyGTV9JDEJNeX8XoTW6UqqUI+SdddQpzdg46lCSdRFYov+
	OIgm3pg2onjJ2gK8rqQwAWLjLmRWvwPBnF27xLMUIAbNSTW5MzFpJQ9QH9u27iCZJmOC96gseMpWr
	GReh2zUOgsNhfUNUeDM33kZ4XWiM0iMxoIIs0doh83wfLMNFehyy3GPtcO/yy69xLHHtNqemIhs7W
	zhzBftKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwra-00000008j9s-2qfQ;
	Mon, 18 Nov 2024 08:12:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwlP-00000008iFg-0jxs;
	Mon, 18 Nov 2024 08:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC8DBA4180B;
	Mon, 18 Nov 2024 08:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B96C4CECC;
	Mon, 18 Nov 2024 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731917138;
	bh=XIASZdNzk8EQ2wGz5+IUsbi9uVPQANSTHY+c1WkJIfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HlRQZWkZ5tW1FKFLKv99RNFm2Pci8ayxrenK/cYQaBbNEGlilO5hpIAdcmtS0poQE
	 ShIdmToGkqoz8wUUheIkyzOeb8zGzJrloWYpIDhh5CoJhHFqOpmE+2KYquOE/0HtIQ
	 Zg5OwGgEYh7sYMCFfRrGApLZFa3ozXyZ4z5XNIj9bRBCUcc2bvPExSAxJkIcpiRe4/
	 qtmpKZt9ZeZLcN4KbZKyxfQ9gHMO6hz7wE/udcOvK8gnyXMdWw8uAJJp7f2tEUm/5I
	 ZXFa8tfO+GRmZgv46upsznFW+AMIomU2Mk2Ph2GJbzjRa9Fh/2Ewwsc6MLvae8U4vJ
	 Pi+a4dIg0eeZA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 18 Nov 2024 09:04:58 +0100
Subject: [PATCH v4 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-pcie-en7581-fixes-v4-6-24bb61703ad7@kernel.org>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
In-Reply-To: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_000539_287560_CBAD5DD2 
X-CRM114-Status: GOOD (  10.64  )
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

Since mtk_pcie_en7581_power_up() runs in non-atomic context, rely on
msleep() routine instead of mdelay().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f47c0f2995d94ea99bf41146657bd90b87781a7c..69f3143783686e9ebcc7ce3dff1883fa6c80d0f4 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -926,7 +926,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 * Wait for the time needed to complete the bulk assert in
 	 * mtk_pcie_setup for EN7581 SoC.
 	 */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
@@ -954,7 +954,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 * Wait for the time needed to complete the bulk de-assert above.
 	 * This time is specific for EN7581 SoC.
 	 */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/* MAC power on and enable transaction layer clocks */
 	reset_control_deassert(pcie->mac_reset);

-- 
2.47.0


