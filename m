Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E824CC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B557A61F00
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B557A61F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgaH8m37RNVx950Ww5/Em5QMiKXxbEDBkbq4XjWRAFk=; b=JlHcLpzzVKXkHr
	rWYkMCDnTOf7+ZbbzD8ZTbvbtW7XbFYebt87EtQW647xstoGX1VLs9yQcf5OItkfpxoDW9SKlmUK/
	qpG2tVmB+t41/9Rb1xc7b8wbHAYDpDP5GVEeN4vDlqQGzNewgx+fQTrtA++Ll6sjwlz83WM5lfoB6
	Q3SGt/ljMGUQ0DecmNRTR1DaW/C0I6uP+6DHUcRtlUb99MSTnUm5canaxIqECbK+B1TC/7BvlfSuR
	yxuECeQRiAm9eOKAcT6q/cFNCFBkqceBwTRwpzPFbY97NmeUYcP/ollo8gQGubgyIIT8EzJ/jfGBx
	m1vv5gGFk4GHQyrQvz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jTb-00BUe0-49; Tue, 06 Jul 2021 11:42:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j9n-00BHnn-GJ; Tue, 06 Jul 2021 11:22:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F20561CCB;
 Tue,  6 Jul 2021 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570547;
 bh=UTqXKaW6JbYoJqpVG9EU8rB4wX9Lk/dAbhbGsvYNTr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OJgCyJvE+BfGl3gwmEHluFs7t4IRt5djLdQMeiLDWLWr5RD3LpNeatBkJze9D2qxH
 irhSHAl8q7GHeZKOUUXkK3q4RchjcA4UXCvP3JvhKY/h+G1t+ecoCF0EVykSaUDhv8
 0lgJHh+JS5NKK+eB8K4W9+icCUIxgbZ4sB5CnPWjy3OcW5xYke5RNcrKmXA06lHeMV
 hJGUKpUbju0nG4Gtu5s4f5pJnM/MHWTFdErOirZp1/9YFOwu9+psWt1wtAeSuQjHmE
 EZOArg9M4MHs2At2r+36xMkV/BT6QuK6xYYfZVyvnsV13MhLLeSUs2wi+7v6zXzr22
 Gzk4G5yddQ3kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wang Li <wangli74@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 017/137] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
Date: Tue,  6 Jul 2021 07:20:03 -0400
Message-Id: <20210706112203.2062605-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042227_595135_4EF60651 
X-CRM114-Status: GOOD (  10.22  )
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

From: Wang Li <wangli74@huawei.com>

[ Upstream commit 69777e6ca396f0a7e1baff40fcad4a9d3d445b7a ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ac038572164d..dfd5ed15a7f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -274,7 +274,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_get_sync(crtc->dev->dev);
+	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable power domain: %d\n", ret);
 		return ret;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
