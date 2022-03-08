Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9762C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ESNm5NNe9ASqeSM5Pnxg+2DM/U2O7gwBv9a6WUC1Io=; b=Du9ayZsrRK/nci
	qPj+4G12E+9flZD8OhZD+zjaMsEOwKSC5SzcHG2+SJSiGb36JWzjsKCsi+ZHFeOr7mabXwkZGyPj3
	pEE8lYamWYrW8a3HZFdszsfZevLbS0M5PY0N81Vqn/WmiiHhKWQ6J54D4Bo9ufxjTuQGF02kr6WxV
	SwVALDAiDeE/fmTYh8kLKFzDSLVgnMoBIJuR3y00BYTBTqcq4FGHcEafdvwVeptk6Jdx/BqUtHT79
	L+m/CJ7q2kJi5C3UrqC2qei7gQZMQhGjd+PcxBPq2c54J2u52PoCYZ1FPxBaia2nkCJn1pMa0ksd8
	Q9MEz2N0T0IsXmZhQLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRUDS-0033D4-N9; Tue, 08 Mar 2022 07:25:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRUDD-00336X-Vh; Tue, 08 Mar 2022 07:24:53 +0000
X-UUID: e5dee472e6104dc69014943dde4a541e-20220308
X-UUID: e5dee472e6104dc69014943dde4a541e-20220308
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 660779067; Tue, 08 Mar 2022 00:24:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 23:24:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 15:24:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 15:24:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <yc.hung@mediatek.com>
Subject: [PATCH 1/5] ASoC: mediatek: mt8195: add reset controller
Date: Tue, 8 Mar 2022 15:24:31 +0800
Message-ID: <20220308072435.22460-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308072435.22460-1-trevor.wu@mediatek.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_232452_054152_B6DB4A32 
X-CRM114-Status: GOOD (  11.90  )
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

Audio hardware is possibly used in the firmware stage, so resetting audio
hardware before regcache records default register values is required.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 550636500949..72b2c6d629b9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include "mt8195-afe-common.h"
 #include "mt8195-afe-clk.h"
 #include "mt8195-reg.h"
@@ -3056,6 +3057,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8195_afe_private *afe_priv;
 	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
 	int i, irq_id, ret;
 	struct snd_soc_component *component;
 
@@ -3092,6 +3094,20 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* reset controller to reset audio regs before regmap cache */
+	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		dev_err(dev, "could not get audiosys reset:%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_reset(rstc);
+	if (ret) {
+		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
+		return ret;
+	}
+
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
 	mutex_init(&afe->irq_alloc_lock);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
