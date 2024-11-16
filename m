Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDEDD68BD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Nov 2024 08:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7+eRp13hd/lyi7qRJ1/dXZT2j6TK7Inb86/57UBWDc=; b=Co5yfHu4DttCdKHEPNGo7f7N8y
	CBHVJCPNqNvrtOW/bHi0ndmoKWaQklFEL+aF1WtTA8quu50fbvy7+Cb0U7nUZF3I36ly2/dmSQzur
	Tqdxu+kpOencblbcB88k/AJl8YkBuDAwPFIVR5z5xqTgZZd37LeAxAUayxRYKNHFPNrVlfQDIuWJB
	0okaImfS2F8/KhEhCaP1uCde8bchQbk7kV6l6xTCaL4oOY8s8UjMLMFkfkuT5+8tUtnC4px9kvKgG
	QbpCGgarazGQoOjC1Z5FCvkNea3FcG2PbXrRCzQkH8NoYXVqENbUM6ngadOgMFnmhJ9/eWTiatKDS
	CbtnD3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE6s-00000005E3x-03QP;
	Sat, 16 Nov 2024 08:24:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1p-00000005DAV-0fK2;
	Sat, 16 Nov 2024 08:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83C735C2720;
	Sat, 16 Nov 2024 08:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F20C4CEC3;
	Sat, 16 Nov 2024 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745176;
	bh=L4hA2wy50Ckn1zmHwXFzkEw586yHIeg2jaZbtr70EFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tot5XOPXlSP4EzGywdvLL4decfH9hIuKyEHI3PRdHkubDoyx33bpMTXP0dgB11FMB
	 EpsB4VKPrkXoLLY5qJwPP8p0h8+TpXDY/yp5FC2aO3brEcSLtyY5QZ7BDAOKgFHNLI
	 H5Iyi24/jXAfgzBd/GOikwpSz0UHunfxFvlugtVisUpWep3wEKXhpCOacmDT7hKoqO
	 ZjUiFHuknfJknYCC+Cjv8suevXJ8DRM56ZDHePT1+eO6ROnL+Gve3Zx5gdrEr5Bbt0
	 T6Xh/Dg+5Kpc89OnxvkEciq+6j+k4Je/M6Gie+eO64e+/xVG9YTYGFNkSYBAhAbrbl
	 9Gn8m2hfOvxMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 Nov 2024 09:18:26 +0100
Subject: [PATCH v3 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-pcie-en7581-fixes-v3-5-f7add3afc27e@kernel.org>
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
In-Reply-To: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
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
X-CRM114-CacheID: sfid-20241116_001937_262536_98776BE7 
X-CRM114-Status: GOOD (  12.61  )
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

Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
causing occasional PCIe link down issues. In order to overcome the
problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
REG_RESET_CONTROL (0x834) registers available in the clock module
running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
In order to make the code more readable, move the wait for the time
needed to complete the PCIe reset from en7581_pci_enable() to
mtk_pcie_en7581_power_up().
Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c                    | 1 -
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	       REG_PCI_CONTROL_PERSTOUT;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
-	msleep(250);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index dd30530a43b1097871acc9e76a7534f30819432d..795f134e1970c504e8d9588c09a9c3ff51e5397e 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -980,6 +980,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 		goto err_clk_prepare_enable;
 	}
 
+	/*
+	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
+	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
+	 * complete the PCIe reset.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
+
 	return 0;
 
 err_clk_prepare_enable:

-- 
2.47.0


