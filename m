Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9C7C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 22:06:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35BBF20767
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 22:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTofC72c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KethZPFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35BBF20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FNhxmac+HkOBRcr1D1abAysyyYP+UEDjdKQS+0LmWyU=; b=YTofC72cElRhg7kexIEgy8nc0W
	ZwWoBoeoAtlUYrzw6g42LaWfTJBPQeRUZsSBUrZn3XCqMlDi9XWk2pDvFQYXiheVxAPJDaQgyItSJ
	t6wu1xAnZP9LZ1u/eYU5SzBEShVTByoqCeqGxt5qpiKTwDxYog7XBGjBLYS9aL2Ps7VS1qODT7HFB
	irPcLzZMVs2/S1fo5qQ9QiVjG0kA3Va7ekPQ+ECVo7LRvrgeug0nA9OgxXucLiipm+pFojbxGELMG
	1x80noWlq4UZwYG452PT0otCseLWL1Yj7Mqq6tGEAy8GBOUa3obIQbnu7uFEK36vhKsU31GFxGogL
	JZLDunew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDatM-00054t-Gv; Wed, 02 Sep 2020 22:06:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDatI-00053p-LH
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 22:06:07 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7633C20767;
 Wed,  2 Sep 2020 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599084363;
 bh=o4jmNbgqxIlHHhWKN1PTp11DdjWkhb+PE+ngof2jF9s=;
 h=From:To:Cc:Subject:Date:From;
 b=KethZPFV/wkeAlEl57HkIS9LLug2iKpcHDa2/uRm7L01q52opeDOK/5UHX+f7oUtb
 oDS1ZP52R4NVUe5qQWh2XK7f31uoqaTxbE0pfecQgVmG2Xu6T0HtozIdmXRIpMRgRD
 sgr/dTLvYfLy88HPOsuKjOE3CbZsb26PbGdVaINY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Use CPU when fail to get cmdq event
Date: Thu,  3 Sep 2020 06:05:42 +0800
Message-Id: <20200902220542.60-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_180604_775076_03E528A4 
X-CRM114-Status: GOOD (  12.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Even though cmdq client is created successfully, without the cmdq event,
cmdq could not work correctly, so use CPU when fail to get cmdq event.

Fixes: 60fa8c13ab1a ("drm/mediatek: Move gce event property to mutex device node")
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3fc5511330b9..4d29568be3f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -831,13 +831,19 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			drm_crtc_index(&mtk_crtc->base));
 		mtk_crtc->cmdq_client = NULL;
 	}
-	ret = of_property_read_u32_index(priv->mutex_node,
-					 "mediatek,gce-events",
-					 drm_crtc_index(&mtk_crtc->base),
-					 &mtk_crtc->cmdq_event);
-	if (ret)
-		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
-			drm_crtc_index(&mtk_crtc->base));
+
+	if (mtk_crtc->cmdq_client) {
+		ret = of_property_read_u32_index(priv->mutex_node,
+						 "mediatek,gce-events",
+						 drm_crtc_index(&mtk_crtc->base),
+						 &mtk_crtc->cmdq_event);
+		if (ret) {
+			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
+				drm_crtc_index(&mtk_crtc->base));
+			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+			mtk_crtc->cmdq_client = NULL;
+		}
+	}
 #endif
 	return 0;
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
