Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1421FCD129A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z4bFKMNhk0NfkEU/QN5H2pmLmmLK4LflnI6KkxYMXo=; b=TeksbDZ1d6/Xo/GJFjci+4uA4j
	qBks5C1AVCDuP61+HpC0BdDMGDR7MoH1hHzJTafaDs8xHPA/fXB+6c7h7bVRhkwzKZaKXHenzrBTJ
	rZL7WkqCWlTzq6jqfNWlHvt/zaDR678jR5Chq7hBfmBqtDwuM5k7Dsrz8g9jvdjE/H9lxFlYD1I5K
	SFmkkQf2BP+ngHFWzEz5q7Du/RkUl+IBPB0j6Urq/6OFADd7c+MYM483YSGZYnAJQQpxHH+53zYx7
	ucdh4IwV9Gjz7xqMtsOni22JmoRFvLWI+qedjNrT5Iy7PxXhQVbWFKmAR58F+NW/L+G15yrQx/r7T
	VQelVr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubLE-000000088Br-133S;
	Wed, 10 Apr 2024 17:02:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubL8-0000000885y-037b;
	Wed, 10 Apr 2024 17:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 481D161DF9;
	Wed, 10 Apr 2024 17:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86DDC43390;
	Wed, 10 Apr 2024 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768544;
	bh=QjOnUyfopFRRMcjgTW7txOdo+Ae88Ip/13leO2FO7/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=an6fpQQPjKNGuD77EbqSH2lJ37F5yaVuRShnLg5EpdBkj0jCqjrASa7BRLmolzFZO
	 IymiKzEkAhpZg7WE865Sg3BtlYm1Y3IZo5xEr2cIKPyA9pH3AULFNEUSaGikP8UIRQ
	 zpiQhRQkWVdduoDXcCGI9Nypuy0N4/mIAfqhQNnbPHuHzCaj2gbIei1AQZZ5iPtfwN
	 oWBB88KfTt1YqYzElCyMJw+DB806oMjcryH0JNwA3bP6om43Xw763sxs3J/LmL3BV0
	 mEA3CpgV3MYzUx0kkDiKXCs4j1FTvECLbGkkFxAskhX+jxKnl3hVJXzOAdac+DoQ2r
	 NyeDxzKNMxfjw==
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
Subject: [PATCH 4/5] pinctrl: qcom: sm7150: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:49 +0200
Message-Id: <20240410170150.248428-4-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410170150.248428-1-krzk@kernel.org>
References: <20240410170150.248428-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_100226_164173_2E86A28A 
X-CRM114-Status: UNSURE (   9.88  )
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
 drivers/pinctrl/qcom/pinctrl-sm7150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index c25357ca1963..c542f9bc6bcd 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -1246,6 +1246,7 @@ static const struct of_device_id sm7150_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm7150-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm7150_tlmm_of_match);
 
 static struct platform_driver sm7150_tlmm_driver = {
 	.driver = {
-- 
2.34.1


