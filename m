Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67692C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36766610E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36766610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPdmVYBLLIU43jk/qgxzY0F3Brxudr9HRKokAKgosvQ=; b=1Dbij3xsNlQcCr
	DTFDV58WTomkh1iQF74vz3OLjLrvZHycwg7NLpLuS94Nz38fSWn8BA258edmHhtN+xUVJq1GQ2u11
	4W0aMu7ZJBd5OGsqtH1XI+SgNdIp0k60wvjgGeZ4H0qdTmZ3PbddOlV4yUUFAmt9CKsfSz8MMLOAu
	BB+2j1/o4cYIPPdgBICM4Ku//9Gvvk6WGqKS6RLvuHnWHvurAsD2V2pveL04Syqs8MTr5uuF1wJUh
	nHjzrKcdDla6OkW6zhPAvlNGGOHS1l6WNr6M8sKLTBQk3QxHr4sezdwZoJ242rVCZAT3QaEDVQ4iH
	7U1dz8pt3ddP7xdmWL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mImVs-005gSx-OX; Wed, 25 Aug 2021 06:35:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mImUb-005flu-5W
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 06:34:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id v123so5692587pfb.11
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzlvJ2pAHb+sQ8dhm6xnHR8froez4GvdycGHyMNLelc=;
 b=F5WiZhJXhxWF/mbzczkd9cNjwJ7S8d9ymOQjMsx98QRxA/cRwjk7CT7VlyyPZ8SMhW
 6da0jFGq6g5+LO8kceKVimbN5cE10MTXCRR9QGTyuWnBhktP6IxBUmeDLqAnLqM7WKDK
 BDkqDUPZIyf2oas8jRvXhgZerNuyKQV0G0uSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzlvJ2pAHb+sQ8dhm6xnHR8froez4GvdycGHyMNLelc=;
 b=scaBl+070g1TeiU7POGPiAWoVeRBGXuJz/popw6FNGR9+j4NqqHV6TEE5wfXO+Qd7a
 V5NQXAVLPrex0KVFhsyYs+tg/5EkqFzOMcqylYgoqltsJODpE9m5vpr4ku362viHXvbF
 CbgLCnSCCrdk6vpyr018QZ5GFwHoGUozaHRMs9wjR6bOQyf5Ulhj3aCmrwrXNUkk8QcF
 LiS76bcPLicawxXkiF5sni96UYmYaSpjuXoBgj+mVdze23g5JKqRYdFTfjeFX4RA/Qo3
 UK9tdySlcJZOILVSfhe2aynhS56LuEeLa+aHY1xImuew+391R10sW3jaQIF15naFqOFo
 A0yQ==
X-Gm-Message-State: AOAM531KS8wUb5EgWkolBv+BSO7uk5XsLDYDkl+8W00sO50lJqLLuFMv
 d8aP9jgKlQACDrqHWGeJxKFP5g==
X-Google-Smtp-Source: ABdhPJx2TfFNIn39qLNwd5ZRKN9W2+I5qUl2jnGzviCUVZz+vZQt1XYHenjGJ99AZJTmbQntBR4yZA==
X-Received: by 2002:a63:4206:: with SMTP id p6mr32630642pga.449.1629873272423; 
 Tue, 24 Aug 2021 23:34:32 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
 by smtp.gmail.com with UTF8SMTPSA id b10sm21105718pfi.122.2021.08.24.23.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 23:34:32 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, yong.wu@mediatek.com, wenst@chromium.org,
 ck.hu@mediatek.com, houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yongqiang.niu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v7 6/7] soc: mediatek: mmsys: instantiate mdp virtual device
 from mmsys
Date: Wed, 25 Aug 2021 16:33:22 +1000
Message-Id: <20210825163247.v7.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_233433_225088_CC5E6218 
X-CRM114-Status: GOOD (  15.74  )
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
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
2.33.0.rc2.250.ged5fa647cd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
