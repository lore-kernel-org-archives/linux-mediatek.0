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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E96C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F2E64EA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F2E64EA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OfCErOHaHINcgmLBu6IDodJKrSB+QxnxHaev+oeYnk=; b=VfNfEwMXdiaCPLUUy/P8zhFTBQ
	97xzP59LIHm/jemvNTX9JvnYdLtRFPlqpO3GnUV2SwGQ1KB1s3P/Ij8bMb/ylhuNqB1Y7DYDYPchQ
	ljFbyujB1cNOJeRsSKBsDv0ONKXIDWyjZuPtBnXhRd5Z3McDI/viZ/1r0rFICUcEkI4KwVkO7m+tP
	a1xLNO5VCIk8iprnfXhQSDJmwj3q1XxPDlHr3iP7MsxAWKnJ8QW2KTf1jU4r6Jyl7jPhAoJ8QU1Wz
	hBOWLzdIJQoM3mJF8FSBAqEUOyMydZlexYCX/CIRjW7rJHcU8wUR7DzugBpa3Pa/PQWGxiE18NsG3
	RZkPvPlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Y66-00014I-1n; Mon, 01 Feb 2021 12:14:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Y5z-00011v-N9; Mon, 01 Feb 2021 12:14:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id c4so13606336wru.9;
 Mon, 01 Feb 2021 04:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0G9x29ODayyoEjGhdJzqiDx/sbh28ndUxLSuBK0gkBo=;
 b=Eehqg6mFJjzThcX5yVYlkRRPhFEandBN/vOqG0HKP8bsQ0BDqvlFYWUUW+MXY7HT+I
 j6k1xmqlQZFNBcYwzi67eo4HPfQhYNGpJThOiEvpeRRiAqH6mHhdxkQTCcqehCTjXjxs
 zV13Me4W+I41pHz2PRuYRYei6yMmdmaHD3nEICrL4nd1BO0AGjc0qdrk1u9zd6NSEYUc
 1NawBVehTnQdjI0kEx27WZ5ubAdlsx5KS2A4NWrsxQcl51jkKn2+nmJl4HINnH5mTeuA
 NiQYEvKzdw0GQqOjEaRecplBa2rSEBd4xBzlgnuJeV0JltvCED0+rjN8RcKGE31UgAaF
 867g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0G9x29ODayyoEjGhdJzqiDx/sbh28ndUxLSuBK0gkBo=;
 b=WS2KsAvYZvKzIBRbBQf67UWa2XYwqBVATFF+sKLjcs+ylmoIDn7+B124bHksB+uS/t
 VxhWS2I7HUEIipttqIKjS28aFKM/MQtu8G/o14FUKGJGk5vJlkqV8OjnkFS1U7oAdqFI
 Q9Ryq13kGIPGwU51Ulhsg5KzJXGp2YSlCxjDpNFEIyR5tm8SO9n7NvaYY1UNTcM1+S3Y
 mBIUCbIRMXBkqhzgATd4cTciNvPNCxRNAgoRmh/GdySrV/0SaAVlR3X89IyQM2nAhpRq
 z6A9WD/j3YqknMFETvwlnzupw2X2Uc5foaVYe6Eqy7egkgvFIqY8UQTo3sEZh4N8ryC+
 20WA==
X-Gm-Message-State: AOAM531w5bL5ThlAOZj/I6c+2G1x4QMduFqgObqEHsRppYnkFYawL9/r
 kiwSSmXJr+ZEQGiDidZTfoRO4c//5o1couKz
X-Google-Smtp-Source: ABdhPJx8LIEpPzcTp1mOi1bbjhVYmEG9rMDdQ13+9KZYOiZxoqvtPAxBaAn1r/shZYUsQBKKC8wQKQ==
X-Received: by 2002:adf:dd45:: with SMTP id u5mr17596132wrm.392.1612181658737; 
 Mon, 01 Feb 2021 04:14:18 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id j13sm20698332wmi.24.2021.02.01.04.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:14:18 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH v2 1/3] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
Date: Mon,  1 Feb 2021 17:14:14 +0500
Message-Id: <20210201121416.1488439-2-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_071419_795775_93644E95 
X-CRM114-Status: GOOD (  13.98  )
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

When "bus_prot_reg_update" is true, the driver should use
INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
protection. However, the driver does not use this mask for
clearing bus protection which causes failure when booting
the imgtec gpu.

Corrected and tested with mt8173 chromebook.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
