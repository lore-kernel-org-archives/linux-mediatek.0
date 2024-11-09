Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB3D5E361
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hj+yKpDG6Oj8U/HfQTfQTrhnazZVOznFiYSZWtlAo1Y=; b=FHi21+4DALhDu59lIy1AQCBBhm
	Xlx8FscoxdCs5lEhraeQxz6U6DQGL0YjmnKlDsLAq9VYja9CUGXkEr8yTduv9LJJvhvruvDw6EPLc
	uxD54N5YOnsDvPoJOOKfZ33UB6WwPaOjK3yk9NQx59z1oMaE+IMEeXcQtBVqqnzssnHUqmFTVyElC
	fnyncRhTt5IjPUYfPDq7N7bdZzD/6wC4jcFqd3wUuKl4aGlxb90DfuT5OJMuelBDAjz6AtPw+REzB
	oPnAxJApozGkKUFIzFlSmWlK5U6iDG9a/VdBp7QvYZDDAdlpjP3i/zHrlA4PA98V+xbm/y6LmULmU
	80wDDC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hv9-0000000Czyz-3n6z;
	Sat, 09 Nov 2024 09:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hme-0000000Cyyv-0BRM;
	Sat, 09 Nov 2024 09:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6AF95C4A5E;
	Sat,  9 Nov 2024 09:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92281C4CECE;
	Sat,  9 Nov 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144570;
	bh=+BcPyG4I1IF3EXLrEkXmng4dCXSymF4dMJ8XpkxZI4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=offz9ekkgH0jrv3N1QGwBDKkc4x9pVQe86sBYqBv2hSxhC2r+0OlPizA+i5isYMQl
	 UghLiaYW0E3ge9qfhleygJLv+tqI2VHtQ7Ro+++S4MaIiBt6/YtYLYuqZGJsIo5bls
	 yk9WZUOb0FRuexfapY9hE2I2U/WaX7S2btTeuHWWMM3nRXA02EbknbKMES2tEk62g1
	 yyO9fiTSdGve+BJYi/jZmp+tdRJuFdodY+Ef/6qd8dVjfR4j7N5kAYPBtTGkRm2R8u
	 MWaTeRxLBLZ0iQKntNGaBmuIejvlFtwnshUoITwld2xXe5f9eFROmRvr2buM3jQz82
	 0jLO9rLs1l6Ow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 Nov 2024 10:28:40 +0100
Subject: [PATCH v2 4/4] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pcie-en7581-fixes-v2-4-0ea3a4af994f@kernel.org>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
In-Reply-To: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012932_165573_21DFD266 
X-CRM114-Status: UNSURE (   9.71  )
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

Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike MediaTek
PCIe controller, the Airoha EN7581 requires PHY initialization and
power-on before PHY reset deassert.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1ad93d2407810ba873d9a16da96208b3cc0c3011..c9981013e59d18ccd3294acdcbd536dd95a0e436 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -884,6 +884,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/*
+	 * Unlike the MediaTek controllers, the Airoha EN7581 requires PHY
+	 * initialization and power-on before PHY reset deassert.
+	 */
 	err = phy_init(pcie->phy);
 	if (err) {
 		dev_err(dev, "failed to initialize PHY\n");

-- 
2.47.0


