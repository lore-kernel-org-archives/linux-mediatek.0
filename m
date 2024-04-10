Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF1CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnukKObQ797b5zdj2/KOc5yx4sL2lPKpVF6d5nSuKUM=; b=lqrOi2HlUhF5n078nNrdwCDn3C
	Z36byrRY0uyKCH0Cl1JLNgfCxbIMZpMO0W6kuHyKhctQvup2TJzsMuYLTKnPJywuUjSKWxguEPesy
	dZ5xR0cdQ61rk78occDtChMmnjIBZ7z0U5avZlRMPKK+b+mueRIXemxilfGog1iUjfMpj6Rjn7jsj
	+dAIuFGVhKkJ8copAjR80/BYHDsrgoB7knX3P44+nvOoV24TOs7Lk/e9QFKKi3XldrX2zskEIiEjR
	gMqaWiJi8cqJ2WzpOv+6Lqrvp4cGS3zNCYtbfXprOvLnMwt2trMVntXbN8RX9if75+2v7hjHB7h1g
	ztHsOJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubL0-0000000880N-1dOm;
	Wed, 10 Apr 2024 17:02:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubKv-000000087xH-3sbg;
	Wed, 10 Apr 2024 17:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49591CE2AFB;
	Wed, 10 Apr 2024 17:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B92C43394;
	Wed, 10 Apr 2024 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768531;
	bh=UreIdQFDaJPTJRQHIFlJ3qYvDMdt0vj/yTnEoOJ3Q+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3TiokUVrqi6QazyAYeehv570Re+STaAnOo+2acOtaHn9CO3TXb+oWo1QllIJtcDI
	 SY7K7Y7BBnhSTy73+CdIcqBB0q65mWO8FuN/RIhTtbjhNvjuOszJ0mM5WZwxucYpRE
	 je2LSm7oW7MAFjL/uuxVpC8IU50C6JUcvc8gpwXVhiFVWBCXrBowsBgC9XaTVkGw88
	 d69GnjaWSWUXQIVr/929tead12fVRBEvUvtSnY9lWOwzQkGfxao2WSvB7nfMHbMFtO
	 kVtsCFSAqflOXBbhPP35X7Sd3x2ggwMClj11bQcXhe697BHmoiJYjUAYJnjbQEF3/1
	 xJ9Ho6eBQDhlQ==
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
Subject: [PATCH 2/5] pinctrl: mediatek: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:47 +0200
Message-Id: <20240410170150.248428-2-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410170150.248428-1-krzk@kernel.org>
References: <20240410170150.248428-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_100214_170520_51239445 
X-CRM114-Status: GOOD (  11.00  )
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
 drivers/pinctrl/mediatek/pinctrl-mt6765.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-mt6779.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index f6ec41eb6e0c..72609cf74760 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1086,6 +1086,7 @@ static const struct of_device_id mt6765_pinctrl_of_match[] = {
 	{ .compatible = "mediatek,mt6765-pinctrl", .data = &mt6765_data },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, mt6765_pinctrl_of_match);
 
 static struct platform_driver mt6765_pinctrl_driver = {
 	.driver = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
index 62d4f5ad6737..591905e4132a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
@@ -762,6 +762,7 @@ static const struct of_device_id mt6779_pinctrl_of_match[] = {
 	{ .compatible = "mediatek,mt6779-pinctrl", .data = &mt6779_data },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, mt6779_pinctrl_of_match);
 
 static struct platform_driver mt6779_pinctrl_driver = {
 	.driver = {
-- 
2.34.1


