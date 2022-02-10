Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXynrrwh1BWU2bb4RPhS4h0hG9i6IwgutTWqHwZKe+M=; b=0Nn8m9YXL4QBe8
	xvIOIAse3cXH52cDdP/i8mNtjzolphMZgS5I652ueGj3olCEhoUdnWAtN366iOnTw1pZpJUmLZTOB
	4u1CZu489BkVkJ0pDroozLCfAs4vdxF12a5K9h3V2K1gVeyMEBwxTb/EmTmzSkFu6/ZKSixWt5SFt
	jiJ/1bXinoSEacalFwRfP/2n9+RswebGPYmQ+EI2WC5XkvGvIeA9QS7maSJWrXnPN0ugJCJGRQzmN
	F8byHuTky8ZYxkkPCvVZvPSVr48qQCyjm0dV40Va7+q8OUZYdF91Xrtw6QCwmgQ80Wi3b2y9QvtFN
	g8r7rNrn8YjkdcReRnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAIu-0041yP-AO; Thu, 10 Feb 2022 14:20:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAIM-0041kU-Nm; Thu, 10 Feb 2022 14:19:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CCACB1F4656A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644502777;
 bh=sQ+FKkicNUDc/dNX696E1r1KBxy8rCFNJOXpjtexupY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZM0WFhkt1W5EvBOeUJpFadV9V97cO6GR6en/cvtgJtW2zYjFEGTgI6cCNtDul8Zgm
 SqHciHMaFJrknyO9tr8lImjDW6ArvKNQjc2YOfmjFJ8Qzf7l1o3uAHRO1gL44HF/Az
 5ejkGtb+uRTdytPAs2oWQz72Rp7sxrPgtJFVOJjHDJGjp3ovUyZdaxmp9jx3PU4GZV
 LdY6/iovw4q2SGd3CjG3qRlC/WpltpHLBbevtQ1BtCeJTY6+YyNUbz7r7BJVjv7bJY
 oIK82HNjxoGZhKB8dvpoMgtePTXQlqRtPZ916fdPLGY2knsUgf7CqZCdR/Z8T2lPJy
 msHrq6V9Am/rg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/5] pinctrl: mediatek: common-v1: Add common probe function
Date: Thu, 10 Feb 2022 15:19:28 +0100
Message-Id: <20220210141931.291712-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_061938_923551_3461FE1D 
X-CRM114-Status: GOOD (  10.48  )
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

As a preparation to cleanup the probe mechanism of mediatek pinctrl
drivers that are using the v1 controller, add a common probe function
to this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 11 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 6f8dfa6ae5a0..007da39b68c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1115,3 +1115,14 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	gpiochip_remove(pctl->chip);
 	return ret;
 }
+
+int mtk_pctrl_common_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mtk_pinctrl_devdata *data = device_get_match_data(dev);
+
+	if (!data)
+		return -ENOENT;
+
+	return mtk_pctrl_init(pdev, data, NULL);
+}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 98f27cdc609a..cd264cc3547b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -277,6 +277,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
 		struct regmap *regmap);
 
+int mtk_pctrl_common_probe(struct platform_device *pdev);
+
 int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
 		const struct mtk_pin_spec_pupd_set_samereg *pupd_infos,
 		unsigned int info_num, unsigned int pin,
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
