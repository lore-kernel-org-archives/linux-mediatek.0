Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D607CCD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aC4UP0Zguq0QqAZ0ftXd8CefIw34bIQAMaFVPvt4Kkw=; b=RaPXXizdg+2WPk2lD4k950Mvez
	T7PAiqSX9bpgNGO7VFo/HN8j3ifWOzjzjbGtpG35Qyt5k5QtkAL0IJVpuOZSZXAOYEoU6/wAV8BOh
	MDRHt1Ye97rSKDqg06u+ej+jW54oSBcDqKQeU6dFIf2DXW8yGrvlHfeCQJkFzo6/l2jzGchW3VWL6
	nj1wHclRawhCRT8JR90HhpDeTyDpnRtPraeqHOl3vJJzazkBU+CKtYam7KzaKzbaeP5rrFpkHeLh7
	l4s11b8hEKWGT37TIjYH1AMlzc/aW1r08P/W416PdOX0M8Q5Cvy/lRzZ/GSkksywRNgwAzurc0Aj2
	DtxLGrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoCn-0000000AebB-441q;
	Thu, 11 Apr 2024 06:46:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoCj-0000000Aea4-3FZY;
	Thu, 11 Apr 2024 06:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F82461FAA;
	Thu, 11 Apr 2024 06:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E487C433C7;
	Thu, 11 Apr 2024 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712817996;
	bh=WbLKltYK/s7kUm98XICzKNUnpZwUdIqRk1dgonQu5Yc=;
	h=From:To:Cc:Subject:Date:From;
	b=kfihvtP24X739EE/kTEzwc2BdjlE2pfwBwO6OonyFbHsJNJCR1SdBGZlouBbwK7HJ
	 +yErPp4MIvHGDfdln/y2MYCyZzDP0KsCGKYE+oiQtJxin+o6DL/1z3/6GKNRU6UAZF
	 Esbb8FdcOechMyx53FoLOXcFwEFAM7uEVidM1vLBuJY01Sbk3EU9Iwzkfbrh5PzfAb
	 lOpRpWe4EemuLChfxRE1gY2mLalzr3U4aPmKYlRl8x213dEy20XMsIpcsg29SXm7/o
	 0eWmm3qJ+gyJ+oXhR/zE6dao+mZ8PTf7qRk/7QBbQQCmqmNXkJa1qLshIEYVIb8+4i
	 4N4M4Q7KZ3/RQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/5] pinctrl: freescale: imx8ulp: fix module autoloading
Date: Thu, 11 Apr 2024 08:46:10 +0200
Message-Id: <20240411064614.7409-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_234637_888239_1323CFED 
X-CRM114-Status: GOOD (  10.09  )
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

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.  Pin controllers are
considered core components, so usually they are built-in, however these
can be built and used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
1. None
---
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8ulp.c b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
index 2e86ca9fc7ac..5632c7285147 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
@@ -252,6 +252,7 @@ static const struct of_device_id imx8ulp_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8ulp-iomuxc1", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8ulp_pinctrl_of_match);
 
 static int imx8ulp_pinctrl_probe(struct platform_device *pdev)
 {
-- 
2.34.1


