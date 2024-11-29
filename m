Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0DAD735E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 23:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdpZ/7AFfxNsv4moXLHaR8pTqkd6QUKsqUcf+soQx2I=; b=1Ca8ySwd59K9ey4WrvAVVK2dmv
	iGeDI0U/DupABu8eTtS15JVJa9fGxcXOasfG0wBrag9fuRacgvTFu5d0pntKAW1MKjsccuZfxr3zV
	Pvi/chg1e2o50DISHOiMqK9CVHDn6Wofy/IK+CKmEEQu4t6mJyfr8jD0QKWfyRpRg4dAbDcCg7ITM
	4SufMxJWy86cSunQPS/yyuOIQ/ZiHmPgHGfUv/c8hSRkFOrxp5i5GNgJUhOrX6ZJWzlCqfCHQ158R
	lpICeaECBK0WJxzxwBGSL7SzebJnLu4xGpCFmIubaEvkX7fdTKkMtG6bMy7fK23tRJiIc0spqQpNv
	EF8IYK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAMk-000000016Y6-3BVR;
	Fri, 29 Nov 2024 23:25:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAIx-00000001603-3nTA;
	Fri, 29 Nov 2024 23:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C2AD5C5E1D;
	Fri, 29 Nov 2024 23:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0973C4CECF;
	Fri, 29 Nov 2024 23:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732922503;
	bh=BjCvQz0D2wl+pRuXBn4XoivgVQi1wn+sLuPP5F+9XD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qthJv+iaisz53lJt0zi8tV23TGU2AnESm16mC17EqGgCI/CFirTTflXZLQ0SK/PdB
	 e/Hm/9btNaYNpVVZQZuhUCOro4bN23tGXJvO8evJp4uHj24+BlagIGEn348dSk7WNn
	 EPsMv6K4JdNsFRbTsWchN8BaKUIQzBq++VQUMd0DdUNzxQt5tRB/lVcadW2+BDd2AQ
	 YP/qq+LJXd2pyq6N1w+Za8mFqgen3oBoOzkic1hCSKtxI3r304vcJvVIfGGhMq4tVW
	 MvT4wjqcya4YrF89rX9WFTRBLjn9KG9rzW2L425iTsq4gwT601Y1uvaPAkSIGtbbLp
	 jpHAj/F1Nh4WQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Nov 2024 00:20:13 +0100
Subject: [PATCH v5 4/6] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-pcie-en7581-fixes-v5-4-dbffe41566b3@kernel.org>
References: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
In-Reply-To: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
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
X-CRM114-CacheID: sfid-20241129_152144_019730_02F64227 
X-CRM114-Status: GOOD (  10.40  )
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

Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike the other
MediaTek Gen3 controllers, the Airoha EN7581 requires PHY initialization
and power-on before PHY reset deassert.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 6c5e1fb16d17de0325d66277e0508b781fe45112..01e8fde96080fa55f6c23c7d1baab6e22c49fcff 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -925,6 +925,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	/* Wait for the time needed to complete the reset lines assert. */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/*
+	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
+	 * requires PHY initialization and power-on before PHY reset deassert.
+	 */
 	err = phy_init(pcie->phy);
 	if (err) {
 		dev_err(dev, "failed to initialize PHY\n");

-- 
2.47.0


