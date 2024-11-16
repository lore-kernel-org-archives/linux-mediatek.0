Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9DBD68BD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Nov 2024 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIUtkMDYSFIBO2VOuAbr5SSqMTiPnSn1asYr+BSGLis=; b=DoJms0z950x/y5wGOmjxIoiC9C
	WJBIL3ksBaaPjPlPlOzn1WAtTLduljA6M8sM42Nz/An/pRmSzUMhahrik/OsNeRRhbb/l3XX/43TR
	1Ncc1YWoFHfJBA8g9XnXJwwVKahH7ZKG4bbbP2tsSfygfeuvABtI2ODlb0IyUqQEFq6VLOb2xuhhA
	HtdMpXzMBFRbkkjWjj/9SqdAzCW6zGpXe5VP9bIGY0v6XoQDRQcutzIFVaiFw6TUYYtYcmusKTirE
	Y/J4UfrHqLTsQrUeDmIY4ZvH91F5XOLxwby5lCXlZ8AdG/NccER7XzFA4Fh9PN1DlC0lJauPM59Lg
	R8/Rb2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE7l-00000005ECg-1Rzo;
	Sat, 16 Nov 2024 08:25:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1t-00000005DCw-32n6;
	Sat, 16 Nov 2024 08:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C9AD5C4A77;
	Sat, 16 Nov 2024 08:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711AAC4CEC3;
	Sat, 16 Nov 2024 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745180;
	bh=5ckEAFt3DCXgUGzrfG8vGUMcL5UShRW6eE3OUEf8DWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PHDw2jUn3ctkoH1Bf8Glb8QZo2OPAuZJaGTG7vPfibtyxjLOQiCuVCsGyzsPwbOX6
	 XB6d99IK7HwSlgSHOwTylt7T+sI6dTABaHdgo19bW7Wq5kGcLGwBdSelmGHkxS6KkI
	 WiDncig5kE5mXrxpaT+V2Cxbx3RQdgmWOVx0r5se2XMsqkrp9QODGvwQWtBPzqzrfM
	 4GtSHbZ4XK2HY7qCBXCh17Bf57Uz53TMWL7zjiN9yCe3KKwzxZrroWjO8n6PmNfQdI
	 xeZAg26j8FtuIB/x2xDJTXqa6h/vl4Fq0wLopnpw/Hh09kUiBFnjaXZ59daii1SJuk
	 r8wLNAvQl1oWg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 Nov 2024 09:18:27 +0100
Subject: [PATCH v3 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-pcie-en7581-fixes-v3-6-f7add3afc27e@kernel.org>
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
X-CRM114-CacheID: sfid-20241116_001941_826113_5826613E 
X-CRM114-Status: GOOD (  10.81  )
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 795f134e1970c504e8d9588c09a9c3ff51e5397e..aaec0cb6cc1c016d049e8a88148870de560b9ce2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -926,7 +926,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 * Wait for the time needed to complete the bulk assert in
 	 * mtk_pcie_setup for EN7581 SoC.
 	 */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/*
 	 * Unlike the MediaTek controllers, the Airoha EN7581 requires PHY
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


