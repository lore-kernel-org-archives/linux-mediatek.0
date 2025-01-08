Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E9BE77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqfxwa8RmEYagczkDcDe4NEsQsvqLAihivl7XDfWlLc=; b=VYfX5nrVObt3LXiL/QjgFjO0yz
	f1br+TQEbGKWrUukq6rP6w6sbB2g4OjjDWJ9gqqjpvL2y+rQX7eJLJhswM2kcOW2jeemq+ooSJZX2
	/1fHaQGlBbwp3kAaRD3yDrsYVrhNYBsMq5bnHSwZqwTAORDZhxVEkygPrqweTP5UqzTiFxzI7ylRj
	AtyWKB+CC7wPOAi0n0pHzqc9PFOx96BPs11aD7Czo3LIlGHSNOHMCLKGRQUotr5kRT498HrF4RQqh
	ZJ2G9rIoRtquDxhN5rgN0j7j7eHfYhSXRkISOMKvvrp0/YLJmWQkskSchk1ql905g5ING+JqXiHmv
	QYVJYzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSyS-00000007uZB-3SNN;
	Wed, 08 Jan 2025 10:07:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSiZ-00000007s3Z-0GxD;
	Wed, 08 Jan 2025 09:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 688215C297A;
	Wed,  8 Jan 2025 09:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1328C4CEE0;
	Wed,  8 Jan 2025 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329874;
	bh=hPN4D7FTStknqbjGuFANLoFGFT58qAH7862kTNVFYwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=itGVqydCr2lYckymqpdNsd6/HKnE9ZZQ5cRpX4UWKzJExf7kJ3/FnMZcLeLcg2jtu
	 j/QDKg8BsRqnEqa/DioRev+WvSQ9CrzButK5VYMEx68n1K2ETitduLva/aFxYHvSvq
	 Kvdae98yeostOtMyFmIdk2DAUCyRKjEE5yxPNAzcCDeNX4rVuWYuEpQv26Q7yjs5lo
	 uIPw/f6ZhNFnHmSwB0IEjqto4PVUYFiNtyPjok4Flu/sRsh9c+2pD409pmT6XLqbsW
	 JqsjYEFgDiQglzmUwUrT6e/uYYWKa79moUak+9pJvKoHuiyr62dORkWBDr9nhPVb0k
	 IeTBMmBgMgC6A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Jan 2025 10:50:44 +0100
Subject: [PATCH v6 5/5] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-pcie-en7581-fixes-v6-5-21ac939a3b9b@kernel.org>
References: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
In-Reply-To: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015115_152249_73CB8969 
X-CRM114-Status: GOOD (  10.78  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 01e0b53cc1f22fc4b9270a2eb6a55e8948ba2f8b..aa511965eb914f7e58e78194491ca7a23790b99d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -923,7 +923,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	reset_control_assert(pcie->mac_reset);
 
 	/* Wait for the time needed to complete the reset lines assert. */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
@@ -951,7 +951,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 * Wait for the time needed to complete the bulk de-assert above.
 	 * This time is specific for EN7581 SoC.
 	 */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);

-- 
2.47.1


