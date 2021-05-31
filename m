Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800B0C4708F
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F18A6120E
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F18A6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvTXD+JUKFSlELxtLKCF/sM/kIitGRXC1fIGq+MM3eg=; b=mCpQ1G0iTFcYJv
	XbBByrBNcRoK4L4qKRKjfir8biXf1q0hNDOdh+9YZD33BiCaUIO0fHc2O1+uOUsvz4JF1jUXq8jZk
	HAtXN475nHZu1YAL4p9NgfW8BUZL42EDJBVSLN8m79AwuwpxcxG7xLN8HlPXUt9fczW9eyGITasZl
	WORWPvqlrngoSIeCjU6/jxYpPu0zBzYAAIZxawfOP88kJ5BWr6tN6fLcveOg+zZAmB7XKrsDRvjHI
	yDNwVry6b6R2va5aqPAp/4m3ehz97AfZoDyCXavm2doGnFoFj9as5p16DvGSSpIRl8h3sCDPV/ss7
	PpSsFbCONqvmEnVlHTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnZdy-00AhUW-6g; Mon, 31 May 2021 04:35:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnZdt-00AhRs-UQ
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 04:35:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id b7so4613278plg.0
 for <linux-mediatek@lists.infradead.org>; Sun, 30 May 2021 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8TCxgyYQSr5o3I78mldH5Z9lcyNNYCjL0+Xcvw5BpHc=;
 b=c2reybcrNCcfCPjUCkeuvpe3yKi/hqDQxkdLaYqMtpdB1ihkdJ/Ee6lG3gARI5Tsn6
 dmWLsn8v2A2NK1XB/35IHqY6VaBEVdLMmndFSX/EZsvOQhOz+nZhcfeCRTbp2DyFwVD0
 cKJIZOyZZxC22NNizE2huExt08h9WKwASPX4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8TCxgyYQSr5o3I78mldH5Z9lcyNNYCjL0+Xcvw5BpHc=;
 b=rNEvHkFTJy6vHzzrBk+xrQEzhD8whF+Ww4mEDAt7h5TjirgIcrRSb5BvRwjdBKof20
 /T7yBV0kFCcpLQJU6nqwnE+/7JjrNJNY6LyNa8TJfRwdjz7iSCDvnCVrqGugODYNDqru
 NZNBYV+M1jnjq+TizPWQwtIOjaE2hLTtqQfNZmUGpEl7fuUxkTRWKXqQK3QrX9rp+H3/
 mTvtEASvRlsNoYpovZPYQ2mEwtqlS+78F8heK9V60HovQPvMnGlgLm7KtdeMnfVb94F+
 jnXzxo5Z69+8bfGF1sCctV/KdOtZUVy/a5U2sYLjDObyMlRwcCoZD5DyJr3EvzYODS78
 H2LQ==
X-Gm-Message-State: AOAM530HwAj5pTnh1pfIAo1S3DkH+Szja8H1B+/wIOvX7EeXofS3PF1G
 QevR+xH77uBn6V47NSyLu5Ad7A==
X-Google-Smtp-Source: ABdhPJyFU9b17OROMPbkumQ0tReN4Qd93C+lb9YAfo3Zv09ruH6iQtxzuayQHC3u8LL7xGiLs5hG0g==
X-Received: by 2002:a17:90b:f07:: with SMTP id
 br7mr10601569pjb.141.1622435708158; 
 Sun, 30 May 2021 21:35:08 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c929:9e58:1e99:bfb5])
 by smtp.gmail.com with ESMTPSA id a9sm9366811pfo.69.2021.05.30.21.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 21:35:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH 2/3] soc: mtk-pm-domains: do not register smi node as syscon
Date: Mon, 31 May 2021 12:35:01 +0800
Message-Id: <20210531043502.2702645-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210531043502.2702645-1-hsinyi@chromium.org>
References: <20210531043502.2702645-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_213510_028880_ACE90A98 
X-CRM114-Status: GOOD (  14.83  )
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

Mediatek requires mmsys clocks to be unprepared during suspend,
otherwise system has chances to hang.

syscon_regmap_lookup_by_phandle_optional() will attach and prepare the
first clock in smi node, leading to additional prepare to the clock
which is not balanced with the prepare/unprepare pair in resume/suspend
callbacks.

If a power domain node requests an smi node and the smi node's first
clock is an mmsys clock, it will results in an unstabke suspend resume.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 536d8c64b2b4..a9ba71eee4bb 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -296,7 +296,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
-	struct device_node *root_node = scpsys->dev->of_node;
+	struct device_node *root_node = scpsys->dev->of_node, *smi_node;
 	struct property *prop;
 	const char *clk_name;
 	int i, ret, num_clks;
@@ -352,9 +352,13 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	if (IS_ERR(pd->infracfg))
 		return ERR_CAST(pd->infracfg);
 
-	pd->smi = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,smi");
-	if (IS_ERR(pd->smi))
-		return ERR_CAST(pd->smi);
+	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
+	if (smi_node) {
+		pd->smi = device_node_to_regmap(smi_node);
+		of_node_put(smi_node);
+		if (IS_ERR(pd->smi))
+			return ERR_CAST(pd->smi);
+	}
 
 	num_clks = of_clk_get_parent_count(node);
 	if (num_clks > 0) {
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
