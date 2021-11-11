Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076E3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8AF060FC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8AF060FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwpANyp9yiZVWTlAq9WRDlV2tAQUPr9qA5tbRodX+BE=; b=ZBNwTbandbLkVo
	HCEn1ZrFUz+96N7aL2vUroNVTvzgaCcnrIQc+MrSGp5hpLkniX1nIwXemeRcmFtrscwcdG+YEiXym
	vGu/p5RjFBaIAl4jcQyix6FuqhQNxORWIsJxwBwTgCADgTxxKpvP0lj/H3jWDhS2voU4PQeFUArND
	jfNHFo7KLPBfpu4nhHy5e3TMwxkRuc9MWqej2rGJ51RfvFpuiz/48UWq31qUxzj7SXtIiDxq7o5dR
	+Qd0mCW/39HEF4dtHvTp81Yj3NWRugjk2HlIDwePP/jPlW80iW1EGm8o87LVXPmuGNcSFXRDjU2HO
	78ETfu57i61iyC/g8OEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml9xs-007x3I-J8; Thu, 11 Nov 2021 13:18:04 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml9xo-007x15-0z
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 13:18:02 +0000
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id l9xhmV6vzBazol9xhmbNf6; Thu, 11 Nov 2021 14:17:55 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 14:17:55 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, acourbot@chromium.org, yunfei.dong@mediatek.com,
 hverkuil-cisco@xs4all.nl, tzungbi@google.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vcodec: Fix an error handling path in
 'asid_allocator_init()'
Date: Thu, 11 Nov 2021 14:17:51 +0100
Message-Id: <86d3e2db237bc35eb55bd46ef07fa13a39bcdff8.1636636541.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_051800_265993_12CEF2F1 
X-CRM114-Status: UNSURE (   8.14  )
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

In case of error the 'media_device_init()' call is not balanced by a
corresponding 'media_device_cleanup()' call.

Add it, when needed, as already done in the remove function.

Fixes: 118add98f80e ("media: mtk-vcodec: vdec: add media device if using stateless api")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..8277c44209b5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -358,6 +358,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (dev->vdec_pdata->uses_stateless_api)
 		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
 err_reg_cont:
+	if (dev->vdec_pdata->uses_stateless_api)
+		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
 err_event_workq:
 	v4l2_m2m_release(dev->m2m_dev_dec);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
