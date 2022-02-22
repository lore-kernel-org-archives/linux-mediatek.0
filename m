Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWaU1zpvLHdVnKTBtHWleV7RkRn+3hCpbQ4yr06b4gw=; b=l8kdfuMOVsxUiJ
	nanMXu2CXkAEhmAa64bTZ74YOyuD5jO5AmlWI0xc/Vc6uxUhkr1O+Zg9vUJeOfjSg+hMthHV3E0ro
	KZBLWCKCCEUMoqOaVUTiuzU3uUj8+hemgEkVhcZRKY0PTLAMsKrEm6SThSiH3E0fl97mXzBClDkFH
	qiffUEGwBLYOczLrzc71fXAUgMY9tQVhXerLLgL397Nd0JDl3JrjSnmRQikzDRZwSzE6eTWCwuhaY
	QvcvGgzaUYTDnDC1TJNtqOUn2O3yZKJeb4iGqftQTkIE4EcVmlQNGVloFC3TwTL4UPNr0H9o5PpTO
	vmgTJXVQ485LgLjjhNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMT5o-009LFf-4t; Tue, 22 Feb 2022 11:12:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMT5D-009KyR-MI; Tue, 22 Feb 2022 11:11:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E85091F4383C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645528310;
 bh=5a+JNDYzhrEdlMXy2IwS2GK3LUhLlFaWjrDmnWR0iNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nVu8ZMVv28kJ/zXaMIuPoLb1eHt2YHoS+keWwS6T4bkzScgv9jpFgs24yK3yHlh/W
 uH7xX1U5ojsAUCsWoFhZTbUc4fdCYmNsKO2kUEuMw9S/FPcdkkeUHrg+TQHUP/qXup
 DnkzbS8naxB8mChX/RcAAsYq1C8sBPCHxfnIvrKN8GZNguJjZ++9G3O0x+qFcQQZbF
 ClHu6WEC56hLlECRyhE/KwNDjNxsRbziXwTPSbgrOey61hKYCNi/NKSiWtUbxvrJTy
 cOqTLFJzaultWcygtlObNOoruaEIM683qtx3JMNcoo5Gr/ET29Rb4IM9at1cF+ML0o
 gfh7C9N5cmLMw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/5] pinctrl: mediatek: common-v1: Add common probe function
Date: Tue, 22 Feb 2022 12:11:41 +0100
Message-Id: <20220222111144.20796-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
References: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_031151_880228_96B793E0 
X-CRM114-Status: GOOD (  10.75  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 11 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 6f8dfa6ae5a0..7835a6ea505b 100644
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
+		return -ENODEV;
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
