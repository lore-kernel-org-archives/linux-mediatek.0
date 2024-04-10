Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AAECD129A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3v6sLqd6YetoC5RfK43dqjUp0PwwZbGapxZUh2Pl8E=; b=Kt3lbag1rTU28sv46/l+vwp0yb
	h4eaZe4kLS8IO3VIoPK8hu67oH0//2E3wRJf6hIIzZrk99lX3WzxDDz6/5XphLOLykPT58OZ85vZx
	NLrNo8ubur76yGn0YkcMUfqZw+9uITneGCBaB9KpRuEI5FOvGN6KDbXbzJcg0BvmFsVz/Rtq+avjN
	Ny5SvEHA4WGeRrMLLhlZxHWrNcgpYr6H0FevWyw7KCsrcOWlx+Qa+pBzwSL1ZMy8k7wTIjTRBlkDF
	cGd3g8Ajki9qmkfgcFx/QYdOMqigrOFyItRyEEqofqzG6BlmHaIeuii179J8QJwDQnxSotQaj39vA
	5puAJ1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubL6-0000000884f-0Dg1;
	Wed, 10 Apr 2024 17:02:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubL1-0000000880f-0h0Z;
	Wed, 10 Apr 2024 17:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8925561DF0;
	Wed, 10 Apr 2024 17:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A5BC433C7;
	Wed, 10 Apr 2024 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768538;
	bh=J8Xz0tO7wTFJkDIRc8XHLYUNNwxXvSfpj3JcT9M6hUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZACkiovPiGAvRBWw0ptxzDvez/h/OO9ESEpjSpxcblWyNi8XG5hw6rSN0T8jO7Ztv
	 qNSb/TVDDZGnyYwLmv0S6BNnqWDnRluQh52PV1ER1KzulQCG8y0ZqJovttvtgenbGZ
	 +Y6ahqjQ5hK6ZdZSL37/EASTHl3YlFSkpOv/oqCrbZTfQ1s82s4MYFUwqDWI4GQjQd
	 6ITbtEspXCEjlyY9jRsN7qsNYh9g7HJC7aPcJGu9JK4s4OkOMeeyNI3obYx6c/tPot
	 +9dUiEowanr2b+hHORsbTnvY5fk+csFAQoQnHysD/IMls9R+5Sm9NDQ7+h18lzkQL5
	 ALkigSot+8hMA==
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
Subject: [PATCH 3/5] pinctrl: loongson2: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:48 +0200
Message-Id: <20240410170150.248428-3-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410170150.248428-1-krzk@kernel.org>
References: <20240410170150.248428-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_100219_305127_22ED53AB 
X-CRM114-Status: GOOD (  10.12  )
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


