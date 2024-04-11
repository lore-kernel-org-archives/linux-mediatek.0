Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B59CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PtuyMnLEnJbClrqcUx/f3P7mZzM7Esss6WXp/AR7vg=; b=zTaFjPnXAydsOju3VDe1LwE2E2
	b4ctJMmIl0ZTHmSu3TMi1qVE8unh8wPCniyDntWSOXwIkXqYvb0C4L8XcNi22WRpz0MHn4Tcorfia
	34cxEqIrNFPVMtkeAue0XARnxCR3VKBb9w747dhcANPNIpkxi/Wrj/oiy/jw+i8uxW4xJMsl9F9pU
	59H/aIANHTSEXx3ps0X/u427In/RdVwfhyp/rpxk4WvoPoIo+5cyOlNnlIF5w4ALozmsTZx9JV1Hy
	V3ohxlEGz2xbuTDTkZFAooYb2FEI43kGMVcBh2KHhVyMws0OisNG7Gu6UKPWuNxLYvpkF6s0bp+qS
	/441MVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoCt-0000000AedV-3fea;
	Thu, 11 Apr 2024 06:46:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoCp-0000000AebQ-3mnG;
	Thu, 11 Apr 2024 06:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2B2D61FAB;
	Thu, 11 Apr 2024 06:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6958DC433B1;
	Thu, 11 Apr 2024 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818001;
	bh=gMnoez56bAZd7APZvMyA7WH/YLAHsyDnpeBOij4GxtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/ZL7ededP7US0kHeZuRlSNuSKFS3IwH2l5s24Ojuq6QpEHY2CdCHDI5Cwy+3jyWz
	 ewWgz/a47Zp7cvDTnbKSl4BMrI/QWpnsCR3WqsqjR5xmV7gJWWaGrkD8yEv1iDeZue
	 HdflEQKF5uo4r1oi59xgDR5n/ZdIAy6ygI56+1A2a2VmPtwLvMC7RNO/zVfgpipMOd
	 juJ7kZn6prkM56sHUQQ7LtBKZV6+1fsoMhr4T3foqrxFTA6JQiFahjPgccmp17QvO+
	 BdDtOz6TPGiOOABg8TJlgeiY1yXMoHHM2GBLwC/Ibl7YrbF8+TsXBKLqMZ2ZIKZeVr
	 M5B2vBYEusCYg==
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
Subject: [PATCH v2 2/5] pinctrl: mediatek: fix module autoloading
Date: Thu, 11 Apr 2024 08:46:11 +0200
Message-Id: <20240411064614.7409-2-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
References: <20240411064614.7409-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_234644_014158_F81A0610 
X-CRM114-Status: GOOD (  11.08  )
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


