Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C9CC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 13:07:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26BF2072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 13:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3N9eaxP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ja8TmubB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C26BF2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2TkH56hc2nv/uP1FASoQVWwGcQaGGGqVK6UYy7O51qQ=; b=r3N9eaxPSgmpgJ9oUua53bZY/4
	XMWKc2ViCmbts8MIz3FiFt2cdCN0avwxBZZExLoZVb1Nu0h8MHvdgsoZHwkSfo5w5zJSdglaZq3Jy
	jnt+ogxQXXxapLbN/b9p7PnMogzyN/da+Q+7uLMT7Jj255okB7qYcqdzLxTeeS0ftiye2Vbs/LSAg
	+NftXw3Vh6Y5Dr4rwRKTv+LE2wT/uiJ/Sk27dir0XPNA8aCM2EVetWm2BeGzSgyPSlyAbcQyyvezL
	AIzZMpprSqSrCoj8qpCRm0K5gCqwiqU6xR7T0gDd0L6KJQv7fHbnfI82dd6lG1OySTUoCN5LDfDUk
	g3QXy6yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7eqn-0002sT-QZ; Mon, 17 Aug 2020 13:06:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7eqk-0002rL-Jd; Mon, 17 Aug 2020 13:06:55 +0000
X-UUID: eb6cdcac9fd144c0ba697d173e1fbfc7-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Kc2wbQ5/5ctPeZ+MBcGEqqORVXhdRTfyC3iZHOQDq5c=; 
 b=ja8TmubBv78/qB7FOeuvo3C9/tBdX+EV2uq7cuJQ58QN9JBAue9/G6c44JFV5RF0z6Ido+6i4SoKC0/GiDsGql08SsZ39U+1kAL58NXVp+9yt8NXU5RT+/bfXvHePAEhlR8NQ5Rq6UWPYlSMRiuNE2FD601f//1hTUIjCXEEkLU=;
X-UUID: eb6cdcac9fd144c0ba697d173e1fbfc7-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 363408388; Mon, 17 Aug 2020 05:06:43 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 06:06:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Aug 2020 21:06:36 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 17 Aug 2020 21:06:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small hfp
 or hbp
Date: Mon, 17 Aug 2020 21:06:40 +0800
Message-ID: <20200817130640.18021-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4BE646BE1621BC9DA9C810CAA548159897D201F4DC13F4A0D86FCF88B04C65B62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_090654_844022_08EEB1A0 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

horizontal_backporch_byte should be hbp * bpp - hbp extra bytes.
So remove the wrong subtraction 10.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 270bf22c98fe..5d031e634571 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -473,14 +473,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte =
-			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
+		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
 	else
-		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
-			dsi_tmp_buf_bpp - 10);
+		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+					    dsi_tmp_buf_bpp;
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit + 3;
+			  timing->da_hs_zero + timing->da_hs_exit;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
