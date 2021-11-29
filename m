Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0615C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP+HQhcGs+ymV5me/FEJnNwqNNZT6beX2j8INoMFdt0=; b=Cor29ATT8CPpAS
	ZtsQA/rJ17g2285ryP/WjLsbG1czwUSq0uUIn4qwvMp4CHw/4AbmiJ8E4hLkqZLnjqbYSJ7dmkCDZ
	6cBwlseQuKL9qp0//j1JfC5L27qpbjZWwv5sdO8YA/DG7fBzLXdLWGJvsj59Hv45gmIKM2UhGvl9m
	Wv7961UJ/jyFDjSP+yZJw/EzZJBTa4Dxtna5AOsPDSn7Uf7d+F+VN00aswT/eQsQPrXlPxDrlYMyB
	srFr+NppSholcXIBwGYQN/3cLgDU9J2eamGVy5cauA7fXIOQb46cTRGhyNuPGyxsEi+U+/i419rbE
	Q2swHlVIWs7lZyP7RB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrleG-001r0C-0W; Mon, 29 Nov 2021 18:45:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrldx-001qu4-63; Mon, 29 Nov 2021 18:44:53 +0000
X-UUID: 6351e52c7c814943ac11825664bf3ee3-20211129
X-UUID: 6351e52c7c814943ac11825664bf3ee3-20211129
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1661553890; Mon, 29 Nov 2021 11:44:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 10:44:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 02:44:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 02:44:43 +0800
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
Subject: [PATCH v13 10/15] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
Date: Tue, 30 Nov 2021 02:44:34 +0800
Message-ID: <20211129184439.16892-11-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
References: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_104449_253053_02B77A8F 
X-CRM114-Status: UNSURE (   9.77  )
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
index 3704e4b7f3c5..7d3bd6214c15 100644
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
@@ -39,26 +37,18 @@
 #define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
-#define LUT_10BIT_MASK				0x03ff
-
 #define OD_RELAYMODE				BIT(0)
 
 #define UFO_BYPASS				BIT(2)
 
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
 
 #define DISP_POSTMASK_EN			0x0000
 #define POSTMASK_EN					BIT(0)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
