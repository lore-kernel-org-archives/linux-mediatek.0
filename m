Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5186ACD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LNqtxJI0ssuWcl4zoiVjN6UX9n6ZouLh18MILaqH7o=; b=NR30dBfUXktGBQnrK9TyqgNSpj
	jwTuVGT+cF1gtZ3uUfQjbvNyJGx8FnR29cTbLjyRSdylo08a5bStKWWOMP9rNv8uTZCMCOS8kYwLL
	TJNo9TT7svp+cQASc+2o54/0L+gTaEP9+/j1be6XEbM4C87wAfd0tfWW3KmhgLslkdCe+q+MswbfW
	OJzU3CIJQ5nSnl71Ywfjxt4fiE/di/EKs9Ewj87dYoDhX7KMx+ZUWouNzW6WG+I5q+OKImMczqsG0
	P/LGUUHYFWZ8xYhmGwj3PjqeeDKwGOdMVDnpOJ0ORMtvK5j9rNyen6RWzp/rtKtfjcPyMZSl/K3OI
	kVAQVuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubKt-000000087wq-3eRj;
	Wed, 10 Apr 2024 17:02:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubKq-000000087vc-1SS0;
	Wed, 10 Apr 2024 17:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFCB6CE29AF;
	Wed, 10 Apr 2024 17:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86249C433F1;
	Wed, 10 Apr 2024 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768524;
	bh=nfO7BhOr35ZNDar/Pmam3BamoEiQ6+6qfGd93yRI2Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=ocnr0wxSgG0VHuixPUnewtVTdrpXKREAJATiYstPXiA6ckwuxFE/T265Ecu3MmGZp
	 cUhd3UCcCswUl4cAWN4j0KuGATYzzAqzCVZ7IFErSkDo0LluDagpGoAHs3nVmSxFqd
	 f7POFdR5JNIx9PuFeKiQZYwe9F0iE+FZzhdUBjWPu5QhYSIA4/tEziWa/LZLt4luTw
	 AOr+Oc/Qok9e36AsqOTaE2WaM8JG4d2wikipPSl31qP3vwXp0qpA/6gU0qyf4JvuaD
	 kF41OSTsMtzN5EloWkPnYzywlAcnIGf/1khnTgbA+8+FfoYNcrDWL9aSmTHKWffA4q
	 6nNb/sv9XVNMA==
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
Subject: [PATCH 1/5] pinctrl: freescale: imx8ulp: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:46 +0200
Message-Id: <20240410170150.248428-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_100208_588784_8D71C695 
X-CRM114-Status: UNSURE (   9.66  )
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

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.  Pin controllers are
considered core components, so usually they are built-in, however these
can be built and used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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


