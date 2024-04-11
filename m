Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA40CD1297
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/KoMRQK5iP88a4eO+gG/7tzJ/NeGARuIj8pLdAKqCg=; b=FJz2bJDXXEDtg7ZxVNYbkbFOnb
	tC7qH2FR+O5tGdfP3lAWh2SZsLk9D0Xeue+IEmmOx/pupwjn0GCJRGk82pDslCZHPqY58Lg37BEl+
	WGZazm3uPAi3aRZiwg1HZ/EsFkZCC3hPTjA3PLyes3OMggb2MjIZWwn8Kvw3sQ6FairXgLLkSQm0p
	F82X8+TdJLrV7YQ2/A1EOFv9sxiWEclsgB8Ic3y935PIeVUqeI6k1qGyM1tSrJzJV2wqrkzH9CD24
	924gA4EHSKoV9UpPkTMEsJhPT9/URJCB8VnGotqh8iDsomotLvRZKtcf9RpgBqvF1ygCSrjS8DM7U
	XGxe0R/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoDM-0000000Aew5-01JW;
	Thu, 11 Apr 2024 06:47:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoDA-0000000Aen1-1xXB;
	Thu, 11 Apr 2024 06:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC5D0CE2F1E;
	Thu, 11 Apr 2024 06:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E6CC43390;
	Thu, 11 Apr 2024 06:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818020;
	bh=GlRh8UW057t9Bq8GK2coWR2MWUDzOJl27L0JCrjgaf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZFKc09GOz2pyCjFCQEQ7BKvIvyvN4vJYweQ6qxwCoEii02GvFk6M3OceD33dErEmE
	 WPTg7FvmEh6qU9vHd/IdEeSZCl4kSpOTpwM/HXc49zq50w/tCjpvpO4Q871zufnxHw
	 iE1+omGnughItTcCtnltH5ji09DkK6WDCVla6Wb2pNwCS+/v8InKy4IIpUsFKJugsb
	 ijFfsyRq0KP753r3KrhM5pYkHGvfGfHNti7g/TbniHp7ZOLBmdoLPaxbWOl0T5RQAV
	 P/ZPTWC5ttBuCJIfmXSQN4I9loBcO0ahg7+T/vB9w/EHxXPvyVeNRi5D8NQ/VM0HB6
	 KetL8uwhApKqw==
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
Subject: [PATCH v2 5/5] pinctrl: realtek: fix module autoloading
Date: Thu, 11 Apr 2024 08:46:14 +0200
Message-Id: <20240411064614.7409-5-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
References: <20240411064614.7409-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_234705_048731_C2BBE03D 
X-CRM114-Status: GOOD (  10.72  )
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
1. Add missing yank-yank.
https://lore.kernel.org/all/1d96377f-2a9d-49df-ada3-086d1e6b9dab@kernel.org/
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


