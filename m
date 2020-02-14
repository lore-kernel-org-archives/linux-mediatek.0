Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF42C3B1A1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 17:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8532D20656
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 17:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRe8Ojdr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X7BRzg2E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhEnV7UG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8532D20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M15fM9oJNhPUdtQPuVlBbHV2vvAKhuDc5zwgMpJOADE=; b=HRe8OjdrhOyq0L
	mYiKHFEXOunjLOEe8pNFXkeFYkf2phgK6UZFsHh9pVUZp4ORje6pWR1/NgUL/F42jqQNTyXR0jyst
	G6OCOidDIZmMms7X5j7ghoruE2IH3HCL8VIiBU+mG7xgwoLfbAF8g5vHuVKiaO/xyJ8U6cfHQTqs0
	EYVyJLgB3qa+Hz7+2oj5IbGSMbtDlBA1j5ki5gXrjhg7uB/BxN4GUiiirwVN69U8S5gTAAKS0lioy
	NvWojb9o8FD3MYrGWA3ddNAIcvAV5zD34vCWR8LHfb5HEJQkFQ3+jIT4drShKmBYJQMbzAag8PV4V
	m/g5brXDWP4o2I08frdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2eL2-0002cS-Aj; Fri, 14 Feb 2020 17:01:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dwN-00058a-Fh; Fri, 14 Feb 2020 16:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=X1FIY36JkPPlRt9syaihRAiVQrR7KaQAAxvdKCe1Uzk=; b=X7BRzg2EuZTZKJZAe4ToWypTpw
 Efseg8smbnbcZIpbPxOD8ngpqRzF9SdxAfphCSKTf+hdmlBPJtMIJPcHxtOl0XauiokVee++8od1r
 +QAn+cxxqnebHLhsI+5l0WLf3WGfeoRdtbqLV1uFd/lSYvm74nQG/ehZK+qqjc0c+YoMvRJrcgtdG
 ePLiPhcuqs4jS9TIncAL5aHm7a2Xzvq7Zei9IN9nSDefIcsjxBuk+AngukMGHtvGaep/Jtj3qZ/Zv
 fQ5uCBXRLJKErhBXrD1R2pbyB8fKhO28dVxj/j+aFzdyAQZCinkr+RcHMLr02pAV9BAUQmtgQ9vzU
 aw9qOaRg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dba-0002P0-1G; Fri, 14 Feb 2020 16:14:18 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A13BC246D5;
 Fri, 14 Feb 2020 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696852;
 bh=vVexZEER5O/jm8hcPhJvhiZ8rHMq++7YZdv102yM0tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IhEnV7UGM8A7GwSoQ6wkT6VRDxNdd6wPyeSefu/3lPDtPUj5MORPtpjID+14vP3y1
 /W0blwTDnsMRIRONOOmMOHU+8AHsi1Odz0qgdMKQi8DIu/jmBn5r861VhxUBzXiXql
 iRLtauuhBdMuKF7dmwpLptOn8TOZY/wVJf1n9R7c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 113/252] drm/mediatek: handle events when
 enabling/disabling crtc
Date: Fri, 14 Feb 2020 11:09:28 -0500
Message-Id: <20200214161147.15842-113-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_161414_355031_FCD3F2A2 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

[ Upstream commit 411f5c1eacfebb1f6e40b653d29447cdfe7282aa ]

The driver currently handles vblank events only when updating planes on
an already enabled CRTC. The atomic update API however allows requesting
an event when enabling or disabling a CRTC. This currently leads to
event objects being leaked in the kernel and to events not being sent
out. Fix it.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 92ecb9bf982cf..b86ee7d25af36 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -308,6 +308,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_device *drm = mtk_crtc->base.dev;
+	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
 	DRM_DEBUG_DRIVER("%s\n", __func__);
@@ -329,6 +330,13 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
 
 	pm_runtime_put(drm->dev);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
 }
 
 static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
