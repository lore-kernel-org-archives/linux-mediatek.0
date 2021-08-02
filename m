Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24261C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E216E60EFD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E216E60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHiAz2vcSZtvP2UoaXy4KaMMpxT2yaD4BL1nHFqdAq0=; b=JaYQrZo/49l2cv
	w43ZrsNl9TO4WGVJ+qo1NWX+3aoYNmnQ5eaFH5DZUy+OQXq1kYDUjQJSv7skC4yTGF2syDtZrQMc8
	XMelPJqaUG+hh3wU9LQxvQ+pyFDzXG3JsTTvP9Uw9K2GHo31GPdB0t8j2MdVfLDp6bVIYeGh6DiiG
	fLZ/ew9ngXcpsZdD/xeuLpJGdGCwfZ9OhwhqERI9fevMZNvBW34oBd3MH78eBwOyCU3XMnhrxkrs0
	nf8Rah8Jt1tSxfhvSZ/rZL6m+8zZ+wKJTT+Prx0NrR3PF+SuIDoXpgshFD4wXQlObhNScdLnBH7zO
	l7ffgq912tDRSIsoFI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAWr2-00G9HT-6a; Mon, 02 Aug 2021 12:15:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAWoj-00G80q-8W
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 12:13:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id a20so19442641plm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2JtECa2IcVydNG9W9omBIT16d7EqW3TFLgJK31zJ7o=;
 b=eUvsQdPL/VkVnjaMbKYUtiGlRVNvPiAkh5fuwmShF9oNk/WZQ0kSW/XOFks1faLV9A
 RMDuDFpF3fcrm2RRfaR+8cXVmZPgqtFwsvxfahHuqk0gmcUfhKM/PHT1kHA5jEmJ+Zli
 YQG12rziTEbbsWhrj/rcEnlI8L7MboOCLrL9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x2JtECa2IcVydNG9W9omBIT16d7EqW3TFLgJK31zJ7o=;
 b=FoDZKv13sj6TyIjcVbuIL7M9xi2pxhHBCRGN+KbxIMyunTA7LeECKv1lTRxQ8yMiIZ
 5m4sHW+Cu/6dDS8ciX5W0hQxwjO6sqbxXHvcLhKL/uDyxJs34TXeKpA3i3S4brM1IFT7
 NLHkRcyAzgADRMEXuYsREygVJJtnx4wtbyHThFAdReHePCKaLJ0cizXKgOJPdyiymAMc
 7Xh+Sb4IZ0efmq/9zQV9HGDFAsGxM14URly7GCWACuwpWIbLT0lyEcnKwzA15gV54qOq
 20tnm5o+zDkduEgYYijQf1CXCMG2S78lzAkIzOMzY8Fc/L+wsbEx9O/lLVzR7ID4qsNZ
 D+SA==
X-Gm-Message-State: AOAM531ih+UAMFAkK3L52+UK+3kvj3x+Q2lx3ovnJCid3fYCYYFgGII3
 qVQDzishCQexe9TBfmt8aKj9bw==
X-Google-Smtp-Source: ABdhPJwDDACME/3b7TMkfgVYpZwoXd52Lpsw79m+gpQ1U876rXmkAZoCr6Z2s93D5COFlJv9y4ZIlA==
X-Received: by 2002:a62:ea1a:0:b029:329:a95a:fab with SMTP id
 t26-20020a62ea1a0000b0290329a95a0fabmr16889563pfh.31.1627906392167; 
 Mon, 02 Aug 2021 05:13:12 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
 by smtp.gmail.com with UTF8SMTPSA id ns4sm691855pjb.51.2021.08.02.05.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:13:11 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v6 6/9] soc: mediatek: mmsys: instantiate mdp virtual device
 from mmsys
Date: Mon,  2 Aug 2021 22:12:12 +1000
Message-Id: <20210802220943.v6.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_051313_330239_59A9F773 
X-CRM114-Status: GOOD (  15.75  )
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

A virtual device that is probed by the mtk_mdp_core driver is
instantiated by the mtk_mmsys driver.

This better reflects the logical organization of the hardware and
driver: there are a number of hardware blocks that are used by the MDP
that have no strict hierarchy, and the software driver is responsible
for driving them properly.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/soc/mediatek/mtk-mmsys.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..e681029fe804 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -97,6 +97,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	struct mtk_mmsys *mmsys;
+	struct platform_device *mdp;
 	int ret;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
@@ -122,10 +123,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
 		platform_device_unregister(clks);
-		return PTR_ERR(drm);
+		ret = PTR_ERR(drm);
+		goto err_drm;
+	}
+
+	mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
+					    PLATFORM_DEVID_AUTO, NULL, 0);
+	if (IS_ERR(mdp)) {
+		ret = PTR_ERR(mdp);
+		dev_err(dev, "Failed to register mdp: %d\n", ret);
+		goto err_mdp;
 	}
 
 	return 0;
+
+err_mdp:
+	platform_device_unregister(drm);
+
+err_drm:
+	platform_device_unregister(clks);
+
+	return ret;
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
