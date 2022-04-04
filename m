Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DuxWq9MnQjRYhN1ICJuJsSEdAkuR1jv/lTelobEI/lo=; b=RMGN+VPIEoOfie
	aVZuxvxGviteS1uTIlXpiXo6MvxWj6CbQStp7styqaYTaLAtVM6p6EVRXXI1feLK6tn/eUXKq9ALY
	F1asvEa93Td4tSByUo7nElL4Odc4Dar7JKsF04L5vVbaRP9vcahaDaeLqJy1WlfkzvQ+1Eo2LfMiW
	eLv6XOQF3ZQ2qDw7jCSozKqVhMxYhSW09OrTZ3wnZaSV9lv321ZamNzc3mN5r/OdqOTFoP8ubQ+Wq
	PZkG0ISo0JRBFBb+TE2zzqgD7FIkfv4h/QOL+BjFebv4U7ggZf/6W/LnPYJtbE/9YD2UsuP7fN3Cj
	T0lPWgiwMAtF0voGz6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbO17-00FQLq-DE; Mon, 04 Apr 2022 14:49:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbO0w-00FQHz-Gl; Mon, 04 Apr 2022 14:49:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2DE141F44AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649083743;
 bh=gqGXxJTgo2QFByPlVeChgiuVrlRNuS1ZqugUAimLnDE=;
 h=From:To:Cc:Subject:Date:From;
 b=jcyi3ieeRTjx/TdSizLK3y7evsfkq7a7xC3FvBhuFTx2x+b7kVS446Fprm0R/mAoU
 zN37Pr2DLQw/YLDqdp9zQuPItVJVXNxLiK+OGeN5zw9sRSww8pSiL6pk6AnoA/2TtS
 XwBlOD8E0NmBHlUnZn2djZfHFu1cywvz+AG0uDauu0yd5Ov+qp04WUiGYdvdPUB3+e
 5B/EtU1UW1YPHhIbN11kRC1gJp4gWaoIbL5weuuwD1wGsePQNMkrzpRh26+Vvo8V6y
 6NXbUfvLmlVI6uGudg7raD0STAbijI4jgg2oAwomRywa3sXrYub1barMRAAot6jNN+
 sgAzvMHjOiU8Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ryder.lee@mediatek.com
Cc: jianjun.wang@mediatek.com, lorenzo.pieralisi@arm.com, robh@kernel.org,
 kw@linux.com, bhelgaas@google.com, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] PCI: mediatek-gen3: Assert resets to ensure expected init
 state
Date: Mon,  4 Apr 2022 16:48:58 +0200
Message-Id: <20220404144858.92390-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_074906_804933_F4B1FDB9 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The controller may have been left out of reset by the bootloader,
in which case, before the powerup sequence, the controller will be
found preconfigured with values that were set before booting the
kernel: this produces a controller failure, with the result of
a failure during the mtk_pcie_startup_port() sequence as the PCIe
link never gets up.

To ensure that we get a clean start in an expected state, assert
both the PHY and MAC resets before executing the controller
power-up sequence.

Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f7048ea4c020..dccdfce12b1c 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -838,6 +838,14 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		return err;
 
+	/*
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
+	 */
+	reset_control_assert(pcie->phy_reset);
+	reset_control_assert(pcie->mac_reset);
+	usleep_range(10, 20);
+
 	/* Don't touch the hardware registers before power up */
 	err = mtk_pcie_power_up(pcie);
 	if (err)
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
