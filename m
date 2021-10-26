Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E41C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83D6603E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C83D6603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2K4mUk3thk4ImEHmkOMCnCV5fRRcsUh6JbAvkfDsViM=; b=TG+s/8sMLkqEiC
	M+NPW8ABEgtD9vAxepXyQ5k0m5U3RtiD8WTcK+nHlaH08/MWX+XXwqKjBfY/lLA4YXSOCrKLgeKC/
	OusfvEqR9+4QzYHkhxqEICTOABC/rmbI4c7nWmtZhV/SIhpAYblhTe4O4Ur7ur4VdyLNnw3c2B/hd
	xOg3W6GJEpt8T5wb1Yu+hzcKroBVyHr6/ioNYfcgvrLLxJwGkSFYdbjMGVo/XFeAF5VhLlOwzabDK
	BqhDa4P11PwMW/Hvze1yvhA7wQWRFR9gC9W3tuf6zGOpchncUweI3sOnS+PimmA5s4xC/SnLj5LsS
	Z05aqo22F3HGnJ8YWMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOta-002Ich-W6; Tue, 26 Oct 2021 16:01:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOrG-002HV0-42; Tue, 26 Oct 2021 15:59:27 +0000
X-UUID: 3c54f8202dcc4be38cb5d24267a64b57-20211026
X-UUID: 3c54f8202dcc4be38cb5d24267a64b57-20211026
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 839948310; Tue, 26 Oct 2021 08:59:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 08:59:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 26 Oct 2021 23:59:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 23:59:14 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 11/16] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
Date: Tue, 26 Oct 2021 23:59:06 +0800
Message-ID: <20211026155911.17651-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085926_250365_3A4F2D37 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the unsed define in mtk_drm_ddp_comp.c

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index f3db96a1b24d..839ffae3019c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -21,8 +21,6 @@
 #include "mtk_drm_crtc.h"
 
 #define DISP_OD_EN				0x0000
-#define DISP_OD_INTEN				0x0008
-#define DISP_OD_INTSTA				0x000c
 #define DISP_OD_CFG				0x0020
 #define DISP_OD_SIZE				0x0030
 #define DISP_DITHER_5				0x0114
@@ -39,8 +37,6 @@
 #define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
-#define LUT_10BIT_MASK				0x03ff
-
 #define OD_RELAYMODE				BIT(0)
 
 #define UFO_BYPASS				BIT(2)
@@ -53,18 +49,12 @@
 
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
-#define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
 #define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
-#define DITHER_ADD_RSHIFT_R(x)			(((x) & 0x7) << 16)
 #define DITHER_NEW_BIT_MODE			BIT(0)
 #define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
-#define DITHER_OVFLW_BIT_B(x)			(((x) & 0x7) << 24)
 #define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
-#define DITHER_ADD_RSHIFT_B(x)			(((x) & 0x7) << 16)
 #define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
-#define DITHER_OVFLW_BIT_G(x)			(((x) & 0x7) << 8)
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
-#define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
