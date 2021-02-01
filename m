Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80F4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577CB64E29
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577CB64E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsPxVhlxTChOoklOdsr0de2pzWwrO83TcIXzyozpUtg=; b=A3zwN2AxDUsiGWI6M9TJAIUTc5
	xIwELUzpLsujechyrVLYEv6W/9HzGJVE29E30nk/rlE2k/F+/Wfsw1IMLV2NPmlx57/c64droy26c
	nJYvAYU0m/lXn4KMuINKlb80nCZbgTYjbYChsPwRJcShx2cXibcaKq5aSIWOiZoViXMM3cp1hmq5T
	DhNSBtGxeRirFYmq5NrzsUuX/JVEIiyGutxWJ2SfrFNYor8hikXSKcbM5Vy2uu0Z8rzzuPgAKTWOQ
	mmaxHds9ZLGb+H6zSgZRwQaEbLFm4ab4E5LeuiPXT16hi1PWNvCGVo709zrrJ+1+FhExmxvtRssLa
	lQdG+PFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6S24-000604-Bc; Mon, 01 Feb 2021 05:45:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6S1z-0005wu-Nd; Mon, 01 Feb 2021 05:45:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id l12so15209138wry.2;
 Sun, 31 Jan 2021 21:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9xqpeCBfVk8R05gxk9ASEmNGjJ7u5/VBiUnlJBQKPVA=;
 b=HeEiP4EKNiLQqx/eMp7WsrTlFOoIrvTk4jz31ZbAovOdGS9mO2+TsTuQgN0zsRIqtn
 YJYsh1fSX1tXL1PX56dwqQb16PHIkbvuAqJpQevRtdbqTYtbgWI65ddse4zgQcbh1UCV
 REQSDmjynovnXAV+5PC3xOei2iLreX67YQU9IP0FrN+F6hm99Fy129BzTlyWmbeQo3qJ
 g31GUYGJxoMviG6LpB6NZEctMJFj2391v4DsYv4l+1/I/T0f9tY6j8nNSjDhP9aN4W12
 noYjZ7OZHkty7UZIqVnlYJ1hw+PI5AjG6jT0ujpS6btcgFVdjgFxAJR+zDPzMRbTABem
 lPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xqpeCBfVk8R05gxk9ASEmNGjJ7u5/VBiUnlJBQKPVA=;
 b=QJW0nHPGKMsH4Bo8t3EPTqX108zgIpDxrrfNobB2Qu7YxZvlQPb0Zxb/5mCYvzfqpI
 16qM5QZMz08WsvC4mRaVpLPGhXBBbCsnDApYOFN8avRJPOzLgKw/HYfcZBTa8Tu5lbQH
 orEeGPE5k+ZEUwfFrqgAspcFFK2qKr4GQDgf+wZK+OU+vnFaaihURcjPsnW4Q2EcuUsW
 1E3TNVlaiXOPvcrxIVFWsr/6U1dPgKRcqHD5Zud9I0L7jGyQx/sH6Kmg06NLXvhG9rjA
 mrMzoca0bp7ZBgBnUxcyM3BWsYhGn+yrsdwBZEQT/lz2232Q6zz8ukGRqYohF5k7p1n5
 fi1A==
X-Gm-Message-State: AOAM530iHqFwM4PSSsEu8bd8XTBlSYSWZQuC599Bpt/vZ2494bZ64Tkm
 v02Q/MrU/SimulzII2hGqG6vw5/5aXKv4wqy
X-Google-Smtp-Source: ABdhPJx5/3HJTSnShyp3E+2DkQGoHwNB07bsPh2NWECRc1vYO9mVW+Qbk+SioZbcANp+tj3990m7wA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr5611294wrg.362.1612158344996; 
 Sun, 31 Jan 2021 21:45:44 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id r25sm27123540wrr.64.2021.01.31.21.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 21:45:44 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH 1/2] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
Date: Mon,  1 Feb 2021 10:45:41 +0500
Message-Id: <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_004547_795392_FE4C4BC1 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When "bus_prot_reg_update" is false, the driver should use
INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
protection. However, the driver does not use this mask for
clearing bus protection which causes failure when booting
the imgtec gpu.

Corrected and tested with mt8173 chromebook.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
---
 drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 141dc76054e6..7454c0b4f768 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -60,7 +60,7 @@
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
 				INFRA_TOPAXI_PROTECTEN,		\
-				INFRA_TOPAXI_PROTECTEN_CLR,	\
+				INFRA_TOPAXI_PROTECTEN,		\
 				INFRA_TOPAXI_PROTECTSTA1)
 
 struct scpsys_bus_prot_data {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
