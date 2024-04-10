Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FEDCD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMo4VQOtIQgh6P7rcQ0swkLEqu/GppVVSBeIDlCnmHY=; b=brtaSyAF34MCbfZX4UHhRSaZsD
	Au/zWl30xfbS0J3FtQQtBFRNNjAzodc4UV3RBo6nr8HVFyxPy+FhXRxVEwEUJJ/hoGofDxQ4Ul3p1
	mi15wRTgQygXyiwaZa5cS8QchxO55uuUXoJlcjkWtpxvtBDp16iZ+PRJtfVFNUhyEQz4Om4PqNlvp
	iVQUS+mc3R8KO8VwUvSu0C4f4mBwNPdmlYcM55H7IWriMKypLH44PZUSk8jV3TD7NnzgNRzoedhph
	4uD+qWpKA8JrhsyQhSim0LuqcTwP5V3IW47mGt8aL9OE7PU+Hm0UUUTAf5Rjn004S0w1vcixbxvfo
	/nKmAQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubLL-000000088Hz-3V9l;
	Wed, 10 Apr 2024 17:02:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubLE-000000088BK-0ix0;
	Wed, 10 Apr 2024 17:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0801861DFA;
	Wed, 10 Apr 2024 17:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E12C433B1;
	Wed, 10 Apr 2024 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768550;
	bh=X5Xl+Apo8HTXG6kNLMLPU23egnj69bbwrAOoPVmLBzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaaofxEPTrlwI7/JwDfIgCY4I/zqZCAz4yDo9ua+4mP5AxSehSI2PP5pBwe1W14Wt
	 RiaFNXRqtw3/EGbbeduCBluKm/YbSLbsh8jhiHrGfN6MSYVqBcrN/kwwYVQdvFeO3o
	 3ia8P70evuxbLmjkHFFvXcNYtYpfEwDclm9DMIUfd9TATx+rE1lcSB2MV++DrTtVB1
	 3hDBo6NHfBi0+YNjsQjKWb0lNuI7ai2tRvbDl/8VIqjJCm/URcK52tsYbt9oilL3HW
	 8NkPCkdXKSCrhAQcbzTq0AOv3a0RaUJyswXOsndrhHcP3IOBh/YEyKACwS5Xd5wnzW
	 CpIbQRycVkNLw==
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
Subject: [PATCH 5/5] pinctrl: realtek: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:50 +0200
Message-Id: <20240410170150.248428-5-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410170150.248428-1-krzk@kernel.org>
References: <20240410170150.248428-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_100232_424704_901576A6 
X-CRM114-Status: GOOD (  10.36  )
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

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c | 1 +
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1315e.c b/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
index 10afc736a52b..86f919122bed 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
@@ -1414,6 +1414,7 @@ static const struct of_device_id rtd1315e_pinctrl_of_match[] = {
 	{ .compatible = "realtek,rtd1315e-pinctrl", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rtd1315e_pinctrl_of_match);
 
 static struct platform_driver rtd1315e_pinctrl_driver = {
 	.driver = {
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1319d.c b/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
index b1a654ac30dc..474c337d2d05 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
@@ -1584,6 +1584,7 @@ static const struct of_device_id rtd1319d_pinctrl_of_match[] = {
 	{ .compatible = "realtek,rtd1319d-pinctrl", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rtd1319d_pinctrl_of_match);
 
 static struct platform_driver rtd1319d_pinctrl_driver = {
 	.driver = {
-- 
2.34.1


