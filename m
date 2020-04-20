Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DECC3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 06:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE666206F6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 06:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ee5hBmC4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mh7u/Nzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE666206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZineSiLzGLsGieX/VJu1GOyFgilARbRVtvGrOBAdqN4=; b=ee5hBmC4abGye5
	kU0iWI6xc2AabkEnXEq+7LUUciJYPKQKX1QmqYGyYecpWS6qS8tMCTrofKknf8a9o3/sISuMozijX
	IkumTSRUj6OJ4raPO5bMOcYnmZpz9To4O3HdOFzxUH0qnvoswRjeEx5hu9spk2qGJ20Uj2kfOw9vv
	BBiYIcHFYMiL4kGF9BVMALwookUyMNcozgIzAjkU+fF5tKagUp47MdgXWyNHVUJciW7MvlTTbeFRz
	aGCIv8EjMaoE6rBlh75P/4HnyBAOYD5PoggV5ih8OqWlug07psAi1sKIIHLa42AkEntfU9GxBx8qm
	1ilgk6x3cP4jZTkBy2yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQPc1-0000ww-9X; Mon, 20 Apr 2020 06:08:57 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQPbq-0000ok-PD
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 06:08:50 +0000
Received: by mail-pl1-x641.google.com with SMTP id t16so3557618plo.7
 for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2020 23:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SezQvaqjYLbKiOOQWAcX/3BNfbHbuPlMP92AcIlOvpA=;
 b=mh7u/Nzr3V0kjSRxTO0mKkatpJU809OLSLJJlsFt2qqISf72DiGj5xWDQAEvljElfV
 FeYKApqTjmmOh8eLf4oP5EPyFuKRdTWijq0Bt4MVVh7MOdqoryB1MbCic8WbRgfkq6eg
 E9a9BiB+TFtHM9d/GUjKY4K1Jx3aDv8xSb9Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SezQvaqjYLbKiOOQWAcX/3BNfbHbuPlMP92AcIlOvpA=;
 b=CLpgodiMhgbTnmQERzmqFEp2AE87aMGmCdVA6M8GaKi0Ep4xj/skEeZTY2eAJA7aA5
 h1EtXYlR3iPib5tGTloIiMcdxiuWtNKUX+r23pEfa8k36YaM19p/ODNXh/ejc3ivKUYL
 RSqXgGcMUlhxH81gpq3JveosPOSeFA2N584YkWaZPJkzX7QT4qlzn+KaniQbl1svTPfa
 RjQbnbytswVSYUf1uMVjQESY04B2YMKFLVRtZiPhqcGj2IFqBpgT7LVTdfK3GN+XYBI3
 DmDNDn+HCqBcpD6Eer7FSpbWHuSOAiPp4P49OspnIALnP5CIWOjOgQeX27kJFHDclCLH
 Uy4A==
X-Gm-Message-State: AGi0Pub0jcO7A+mxu8fRA/GHwITMrp4c9Y5H6ywOFUNwdap/g64Kskmp
 3JTVopT1uirv6HhOEoJEak5q4mlOrb4=
X-Google-Smtp-Source: APiQypJ7/kohKua8cbRIlf5c1h2ySfX9UyLVzIyb/i9csqaqSHKdHfXhwGV1/987z+JuCjIkPug5+Q==
X-Received: by 2002:a17:90a:340c:: with SMTP id
 o12mr20794100pjb.22.1587362925217; 
 Sun, 19 Apr 2020 23:08:45 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a274:40bd:f640:b6c6])
 by smtp.gmail.com with ESMTPSA id t188sm21384pfb.102.2020.04.19.23.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 23:08:44 -0700 (PDT)
From: Anand K Mistry <amistry@chromium.org>
X-Google-Original-From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: stop iterating dma addresses when sg_dma_len()
 == 0
Date: Mon, 20 Apr 2020 16:08:34 +1000
Message-Id: <20200420060834.44461-1-amistry@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_230846_815098_EE83BBCD 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@gmail.com, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Anand K Mistry <amistry@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If dma_map_sg() merges pages when creating the mapping, only the first
entries will have a valid sg_dma_address() and sg_dma_len(), followed by
entries with sg_dma_len() == 0.

Signed-off-by: Anand K Mistry <amistry@google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2b111e09..f8fd8b98c30e3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -224,6 +224,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 
 	expected = sg_dma_address(sg->sgl);
 	for_each_sg(sg->sgl, s, sg->nents, i) {
+		if (!sg_dma_len(s))
+			break;
+
 		if (sg_dma_address(s) != expected) {
 			DRM_ERROR("sg_table is not contiguous");
 			ret = -EINVAL;
-- 
2.26.1.301.g55bc3eb7cb9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
