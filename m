Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E875AC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 03:31:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4A761181
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 03:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E4A761181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndyJnZKEqGHfP/POMjTT+g4GHI508lBgmrCelKKDXPA=; b=fIVEkeEX0iGy9greKLw09TLTgj
	sPfPeVPmhJUDAYOLGXvyNpI1/bhUfcWS6BI9VN2tmk5YODXWp35uU1sP3DlvZS1En/gOFchnMUlQV
	RDV8nOjDw5mO/aM2E+0Fg1gmf8Y7xMD6XBoInf5l9CO72gWJGoTBAhnVvR/XpG+j54JxfaLaSojjZ
	gPNIqwf/A0fjeEDqs8dBOZD6wTiehGfTed7uEcFszZarZu011iu2xCTzscRcgmd+WEfanEEskOSKF
	n0j/2xeABUHfgmTzVIpJVLhBzvzJMSTQxX4k+YIfkdrSI5oo/2OxIpLkx21Omn8dkidMCXU2FK5kQ
	OCMcMtfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV4LO-0024Gm-Kz; Sat, 10 Apr 2021 03:31:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV4L4-0024ED-Ku; Sat, 10 Apr 2021 03:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=zyeOMvh+JJvVC/Ozo15JFB5YisvS3rSAKQDDCQJ8nEw=; b=kTEWRbc+fy7J3wNvpFx8kCIYUz
 8ThobEz3I0KUAJIWzEHAndQ0X68AUxjrzusfMIj2yK743lqfBF9PlAIue7SB2WGm7cEKmWoL6BgOi
 YcxKiBZ8p2W0nn/uEcKmxM/ZaCLwcQBBkzFinmeWrtvomS4pQmJpgmQ28QspHDWgCzyiP+VkUgDU0
 +HomKfsRLCd79mqUUNdC+mexnFWrwDSsp3dwcy2C8oCzqt3f1QL9zb95B7fQPCMT9DwHoHE2cEV+K
 OlRD7ahfxy4/N+7+cFj0jMHMFb38DXV3hS8DKGWZiNuruW3ul93YlCj+SXy1zWx1xtUUzwUJM8vvB
 2BwjkLCQ==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV4Kz-004vAU-UN; Sat, 10 Apr 2021 03:31:11 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FHL7c1ZzqzqT4J;
 Sat, 10 Apr 2021 11:28:44 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 10 Apr 2021 11:30:48 +0800
From: Wang Li <wangli74@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Wang Li <wangli74@huawei.com>
Subject: [PATCH -next] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
Date: Sat, 10 Apr 2021 03:48:41 +0000
Message-ID: <20210410034841.16567-1-wangli74@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_203110_172387_772A1BA1 
X-CRM114-Status: UNSURE (   9.55  )
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

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 54ab3a324752..f1954242d8f6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -259,7 +259,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_get_sync(crtc->dev->dev);
+	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable power domain: %d\n", ret);
 		return ret;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
