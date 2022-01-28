Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yl7svNi1c9Z21lerNnMa2HfqJM/IrK+ei5AE/ESCQ7I=; b=ESjwA5V8d6WI2Z
	BjtosHAqDUzTGrN5EYmPBo9IzbRh41uEuPIB50w+6YFRFNWGRzf1XajrhnFBKvL8ZWxVpij+QipDj
	8EL1M1d1chh9gSydmG3T/VtC1n17DjRHHB7YZh1GsO0piHypfqtX6GLuYfVHHA/Tse3FEq4opHy7h
	UD4REhUshc1v0T9/hsMVaCsNMNdbEs/UN27gJuADsKOw5NRCuOAH5TBupCKwTF53cna1PKS/lLUn6
	lCy1ySuf2O/DnT5ryuiecFzRpkL+Bkva21wwybnhQqUHQGvvuKQwgKXG4r9q3d7jDvxpS6Vh7sOuQ
	fs6jz/soET9S8oEOJeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDS7p-002W0l-Eu; Fri, 28 Jan 2022 14:21:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDS7c-002VwK-84; Fri, 28 Jan 2022 14:21:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BD9831F46061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643379661;
 bh=KYW2yecCoVBOnjMv+GLtAgdWuyfAb453i/OaAeY6CaM=;
 h=From:To:Cc:Subject:Date:From;
 b=TuWi2W6SvZVi9AE07A0UXEqa+MmeT/bLGKQnijiUxFxcG9+oRE6PQydX14DiWpJgq
 VR3SqEm9t7cbM4EvYtBMRPxAg95Ms4cVy6oIWLhbwwXzUao+YLk21sGht8iBTS0zaM
 tIhram3C1GZBcSwPaNCpAwSYWDJk8Bna4WUDioJjWkROX4m9jrW6J22RltQaYc80Ej
 d87yM2k8subrXo1erK0myMENkOCqh8Fnares4C9xXWP8BtUYl/lYTrwIDgLSiVhDpy
 AXwfHd6yupQvMSfB+IqX0GhqommNIqClOrybTKzrrYwIIcb9NlIJZpcchehuQPFyYZ
 dIVVtBwxXYeDw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: yongqiang.niu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's input
 sel
Date: Fri, 28 Jan 2022 15:20:56 +0100
Message-Id: <20220128142056.359900-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_062104_462699_BC833B24 
X-CRM114-Status: GOOD (  11.73  )
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

In commit d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table"),
the mmsys routing table for mt8192 was introduced but the input selector
for DITHER->DSI0 has no value assigned to it.

This means that we are clearing bit 0 instead of setting it, blocking
communication between these two blocks; due to that, any display that
is connected to DSI0 will not work, as no data will go through.
The effect of that issue is that, during bootup, the DRM will block for
some time, while atomically waiting for a vblank that never happens;
later, the situation doesn't get better, leaving the display in a
non-functional state.

To fix this issue, fix the route entry in the table by assigning the
dither input selector to MT8192_DISP_DSI0_SEL_IN.

Fixes: d687e056a18f ("soc: mediatek: mmsys: Add mt8192 mmsys routing table")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8192-mmsys.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
index 6f0a57044a7b..6aae0b12b6ff 100644
--- a/drivers/soc/mediatek/mt8192-mmsys.h
+++ b/drivers/soc/mediatek/mt8192-mmsys.h
@@ -53,7 +53,8 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
 		MT8192_AAL0_SEL_IN_CCORR0
 	}, {
 		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
-		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
+		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
+		MT8192_DSI0_SEL_IN_DITHER0
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
 		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
