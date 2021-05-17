Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3257C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 10:19:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314AB61184
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 10:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314AB61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwkIDgamz4CWrZEiN8VDtr3Fx+sIiHhG9oewmYVhJZc=; b=FAZlrdrzdTwhQr5pkvKIeGrBcy
	iv55q1uNGJGP0yo5GLZjxUzow7tj17L4HRiAV1kBVis/wt9jQefSzzrxgPpk8USUMI73pUzdjTfeq
	M2fZKCDszvz1Vk3UkR9u3YE0OL9u1VausAFYYKXLWl2hJnXONm8XEWF/e2TgYMKoCthlPsEAsCtd7
	Uz9NLpTw4myz64YtjQq+AHaj50Fwpd8kbEtkjoZd/s1pzKptSV1FmkG5l6Fg0FZR1N0KKHhMEwjkR
	YESjXx8oXcZQgt+7gCkKnPX0nReByjUlBWbg8Uy+SPFyTZKW+QsqthMM81OyNYk9VkjSWH0mKnfSf
	t4C5sUJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liaKd-00EXbe-Th; Mon, 17 May 2021 10:18:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liaBd-00EWKq-10
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 10:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hoXZ4vHVHP8vrBjP/Y8D4xxfMB8OzgmtkMwcyzbeX0Q=; b=yAwQv/dnJmVn+npe/P3xQIy+++
 V/GfrCBDSYkzbvgYNJYvIFHhSTla4gbmgzmXZoBdKBFMrcQx3XrP85t52ML/AbVnJC5n/nl01Esqw
 F8HRYJSIbl9bifWeypKZSOFN4X/a0qcCcJpZrwXgSuKOEw4ps44RRg3sWokUJ0vgqKTBvyJE5HcZt
 DUs1wk9vMw1d0rpOfZmQjzloz0eGWIWxQ1no17iFN19/y8a9ZJ/6P1WaL2AI0vq3hWyMUHQQwt0RH
 kX5eQaPKGUjhVkbKbfa/Tq/cPVFVICgUIuyXav4mozMw6jt/+Ln/wVEG3OWEiuXp8AwjsG+SZ1+OT
 q8i+d5KQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liaBX-00DfRf-8f
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 10:09:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id 22so4211152pfv.11
 for <linux-mediatek@lists.infradead.org>; Mon, 17 May 2021 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hoXZ4vHVHP8vrBjP/Y8D4xxfMB8OzgmtkMwcyzbeX0Q=;
 b=h39floIVlsNNX7rbb5fFw7ehnpgjfPOlxxaXmiu51qMlFCa3eNTyBkCKghenPFtHot
 w22KYex6j6RTa2dpp4oky4+HF+lkye0N/S64nsQNkdtytq4BaWHVsRVge/HXgYX+Pql/
 Y0pgyImyC76QyFhtFSnA+gyPo7Uvx0khpY64YIqQUlfuEnoSUpxguLwk14ctfaXxUTpY
 q9A6FLnhCK22PO1amOYRWJyHNqFwMDxjFbb4FxBTE6UpYTHsTc/RTW2RfFRqQIwc6kAS
 6x+3BbYBjYQvpbEXB/xvy/Dedk9VG/kkdN3VIGEmWO0Jdb4SFiA3mlGAWK6Lsvyu+krQ
 WNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hoXZ4vHVHP8vrBjP/Y8D4xxfMB8OzgmtkMwcyzbeX0Q=;
 b=rsuuf5dmgRWrYcFRK7Ho3tgdvxkqVG7w6wVCW8RhVI5CyBGytSL1jzftbBA2e5zGyI
 ji562xLRe1e30b6iyfTAl05nQiKXh5SKKRlOsbPRBe2paJBX9Hect7474+xJYH+oje8s
 hK3NB6xbHPPpFDfqDQGSQExxvJHuBZjnfy2w/kfntszmaw0gIU7g6rDmhDNm09VL1GvC
 rzExqJstV4ucxDhO6u4XNrP74gj2d8nlVgobMmRCVdK8YIbaQk9KFsR3KnjTV/uzwwoe
 mcnIGzzljnT1USmb+bKpNwXVCM+jExik5GN3ihRDPw+UYe0BBy7dLKQVC7H9K2TR41rh
 0F9Q==
X-Gm-Message-State: AOAM530CIkFwcfPsL1S0cNG7CwUhevXmIex5kErVPTkjx2cJNoPMEN1J
 HQZabzEu1l7tJbvSvs2jNfI=
X-Google-Smtp-Source: ABdhPJz+0UcZFt4a1N9fMPs8K+Ea3wAXhWg1UaC49Ex05b9KOIstw3tWn11ldE1N2/QCo+g6qsCZ3w==
X-Received: by 2002:a63:334b:: with SMTP id z72mr31953889pgz.46.1621246153590; 
 Mon, 17 May 2021 03:09:13 -0700 (PDT)
Received: from tj.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id u1sm1471193pfc.63.2021.05.17.03.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:09:13 -0700 (PDT)
From: Yue Hu <zbestahu@gmail.com>
To: chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, huyue2@yulong.com, zbestahu@163.com
Subject: [PATCH] mmc: mediatek: use data instead of mrq parameter from
 msdc_{un}prepare_data()
Date: Mon, 17 May 2021 18:09:00 +0800
Message-Id: <20210517100900.1620-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_030915_346989_6F51FBF8 
X-CRM114-Status: GOOD (  12.41  )
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

From: Yue Hu <huyue2@yulong.com>

We already have 'mrq->data' before calling these two functions, no
need to find it again via 'mrq->data' internally. Also remove local
data variable accordingly.

Signed-off-by: Yue Hu <huyue2@yulong.com>
---
 drivers/mmc/host/mtk-sd.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 898ed1b..c4db944 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -724,10 +724,8 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
 	writel(lower_32_bits(dma->gpd_addr), host->base + MSDC_DMA_SA);
 }
 
-static void msdc_prepare_data(struct msdc_host *host, struct mmc_request *mrq)
+static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
 {
-	struct mmc_data *data = mrq->data;
-
 	if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
 		data->host_cookie |= MSDC_PREPARE_FLAG;
 		data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
@@ -735,10 +733,8 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_request *mrq)
 	}
 }
 
-static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
+static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
 {
-	struct mmc_data *data = mrq->data;
-
 	if (data->host_cookie & MSDC_ASYNC_FLAG)
 		return;
 
@@ -1140,7 +1136,7 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
 
 	msdc_track_cmd_data(host, mrq->cmd, mrq->data);
 	if (mrq->data)
-		msdc_unprepare_data(host, mrq);
+		msdc_unprepare_data(host, mrq->data);
 	if (host->error)
 		msdc_reset_hw(host);
 	mmc_request_done(mmc_from_priv(host), mrq);
@@ -1311,7 +1307,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	host->mrq = mrq;
 
 	if (mrq->data)
-		msdc_prepare_data(host, mrq);
+		msdc_prepare_data(host, mrq->data);
 
 	/* if SBC is required, we have HW option and SW option.
 	 * if HW option is enabled, and SBC does not have "special" flags,
@@ -1332,7 +1328,7 @@ static void msdc_pre_req(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (!data)
 		return;
 
-	msdc_prepare_data(host, mrq);
+	msdc_prepare_data(host, data);
 	data->host_cookie |= MSDC_ASYNC_FLAG;
 }
 
@@ -1340,14 +1336,14 @@ static void msdc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
 		int err)
 {
 	struct msdc_host *host = mmc_priv(mmc);
-	struct mmc_data *data;
+	struct mmc_data *data = mrq->data;
 
-	data = mrq->data;
 	if (!data)
 		return;
+
 	if (data->host_cookie) {
 		data->host_cookie &= ~MSDC_ASYNC_FLAG;
-		msdc_unprepare_data(host, mrq);
+		msdc_unprepare_data(host, data);
 	}
 }
 
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
