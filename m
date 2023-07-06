Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDAC001DE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arrhT1IZJkl27pU31eQY/6FWv1dx7Q6u9+hntxkmUR0=; b=St1WCDlzCo8pqR6YF7lz3LWO52
	DC8M8oQQkBBed/45H1sSRepy4io3BpxMYqUGMz6JlN9Y1GSzQPyhQfgjexQP76N0KEN7u7n0OwjUB
	wyc7P4E/7uPgpUaV0kCR5LHHj3Kc0Whk/+MIMt3SgL10UUtnuZbdzL46GGN+2spVlgYcV0RmUhXki
	+ixE4ARKxnaJJ15mqdv2xMNJgQGA3cQ20uhUa2bpr7bqlTe41OhzfaSGPXDk+d32v2u/i9bExhz+c
	VU7Ye4PXuBODTMcNtCWOJ5QxL5O8uBytwDFDV3CTHrm7F6ZVgM2ic7E/V1sSNTTv81ZRmZUO+jzFK
	Lg43gWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO8F-001cvQ-2U;
	Thu, 06 Jul 2023 12:30:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO83-001cha-39;
	Thu, 06 Jul 2023 12:30:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1AA9F6606FC7;
	Thu,  6 Jul 2023 13:30:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646634;
	bh=MT3q4EebZmygE+KyNdwlHQ30iT82ATSvvXBZJkPrX44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2pmuJ9Zhma74iPKRa3VbSF+KtxhrXTCDQQQ7v5UiBANm8VwaEDMciIqSQy2/WKTS
	 zS5Tc4F2x2tk46sS5Yz1/025SYo5YEDuepEVesh10KmTyrmjFdMuulHGjPVQvdzy9d
	 pUstFb2AhQK9piecuumsOxii6vnrODdnmerqoE37+8VtoKuM0g4XyEVR0Ef9cTEAyp
	 TRoBTJ8/bvikHm42nvEg3JSytGPWKnFCdHZkCoDxqJsrmk9/CjbDgbELxgrpuTn/GY
	 Zt1fWRLYJaZdGGZK5CobN1cgxBKM+bcB6K+nhyI16gHU4qXA8TIUcQlr5sMeDxD64O
	 HJ9H5O4m6q8QQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v4 5/9] drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
Date: Thu,  6 Jul 2023 14:30:21 +0200
Message-Id: <20230706123025.208408-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053036_163121_1FF155C2 
X-CRM114-Status: GOOD (  12.20  )
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

Change logging from drm_{err,info}() to dev_{err,info}() in functions
mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
essential to avoid getting NULL pointer kernel panics if any kind
of error happens during AUX transfers happening before the bridge
is attached.

This may potentially start happening in a later commit implementing
aux-bus support, as AUX transfers will be triggered from the panel
driver (for EDID) before the mtk-dp bridge gets attached, and it's
done in preparation for the same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 35f3549d258e..274119356dfb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -848,7 +848,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
 				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
 		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
-			drm_err(mtk_dp->drm_dev,
+			dev_err(mtk_dp->dev,
 				"AUX Rx Aux hang, need SW reset\n");
 			return -EIO;
 		}
@@ -2061,7 +2061,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		is_read = true;
 		break;
 	default:
-		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
+		dev_err(mtk_dp->dev, "invalid aux cmd = %d\n",
 			msg->request);
 		ret = -EINVAL;
 		goto err;
@@ -2077,7 +2077,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 					     to_access, &msg->reply);
 
 		if (ret) {
-			drm_info(mtk_dp->drm_dev,
+			dev_info(mtk_dp->dev,
 				 "Failed to do AUX transfer: %d\n", ret);
 			goto err;
 		}
-- 
2.40.1


