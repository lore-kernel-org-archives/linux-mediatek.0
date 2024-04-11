Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8848FCD1297
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCS07IwaqzoOawpCoYZUCEB1zC4VYUIyaLN6jLXb97A=; b=A5zTtj50ZxjoWpLC28MV6hpgWK
	LlVTthesmfpUyCG16k6wAHX7+kXTnNgYGLJ1iv1qMojLan3UF1aBn7iRJcVjL88sA+AXUzS6j8RDf
	yv0afx6VOPfHUoGYcrZk131gM5CmOMXDoRV9mmKAfgscLgRXBkG3MS78VC6ZrWwejY3bdgitm3SWw
	6sVtbdV1q690FENWkFLuLdKJIry+DkM94V7Ww7QJy3Jm7P+u0fsNAnye3UInJQF8YLtK5ucGS0RPI
	nIPTFfVpZSXF8fPHv7lxspUtTiE/EcjngKAXr6SB183GV8wzxpPjzDaa78xMt7PIRsq/Uwo42Z8H5
	6fB9zxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoD2-0000000Aejf-02IJ;
	Thu, 11 Apr 2024 06:46:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoCu-0000000Aedc-1HlQ;
	Thu, 11 Apr 2024 06:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9A3061FA7;
	Thu, 11 Apr 2024 06:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C94C433C7;
	Thu, 11 Apr 2024 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818007;
	bh=21qdbRrqdGeNpdC7/Fy478NKAKlmZ/ysh6qtF4JrPnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvOlDXDpmb5BZ1h0Yrf9VuMwYVPczU8wY65hiLQeXdcjBEqxT/jpUq+18+Fl5BMMF
	 bM2xJTDZCeV48U2HD8E2c8lj6hY7/sOWX6uNTG3GeDavIokun2bqbgtkViGJfRIsh5
	 l8xFi5MOzEsTz3CkonWwL2WTKdfVBVVsCe2BKASEvyPfF+aDoT+NQbIhHabTgqiF2R
	 Qt+Nndp4X1uwBcVTu5OcGX5SvxAwYAERA5vvInO+2FrIMjDPBMqX4qlbOoyqsyt96B
	 JBKVfSJZjyrRRnxD831cRlYVtXNWM5kfq2ysZP8ojDYXszLp2XVkzKxguuoDExdzeH
	 NjJCw3rd/s0Jg==
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
Subject: [PATCH v2 3/5] pinctrl: loongson2: fix module autoloading
Date: Thu, 11 Apr 2024 08:46:12 +0200
Message-Id: <20240411064614.7409-3-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
References: <20240411064614.7409-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_234648_463970_B1C0614B 
X-CRM114-Status: GOOD (  10.30  )
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
 drivers/pinctrl/pinctrl-loongson2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-loongson2.c b/drivers/pinctrl/pinctrl-loongson2.c
index a72ffeca26fb..4d4fbeadafb7 100644
--- a/drivers/pinctrl/pinctrl-loongson2.c
+++ b/drivers/pinctrl/pinctrl-loongson2.c
@@ -286,6 +286,7 @@ static const struct of_device_id loongson2_pinctrl_dt_match[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, loongson2_pinctrl_dt_match);
 
 static struct platform_driver loongson2_pinctrl_driver = {
 	.probe		= loongson2_pinctrl_probe,
-- 
2.34.1


