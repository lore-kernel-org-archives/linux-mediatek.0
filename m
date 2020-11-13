Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F034C4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 13:50:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D368922201
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 13:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCIN2lP0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcVFHvgo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D368922201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iprok3jqgLMQqvWXOMAbLz8FOSDl6lEjHiiDwsmjz/A=; b=oCIN2lP0xx7/xlkQRvb3+R8wF
	5M/xXPjJn5O0+6qhiNleybO6tMsqAS9s7dh8JxVymeWSpjGRn9M1zPv0TqgMmAtxOh2h6Y1Ztgf2u
	F6nYtkwYtErXBSzwHk9DP05nRDv/GDUW3YRWOF07DY0cj8KlCfXf/a8LqnPq6NToWoVcXPSRIWpOi
	tbOCqr5xMBXGgJhQLZnlD4CKz/ggk6/ya0Q1/vn3Hl3tbDYhCjX38HxxutnnD77mhsudALsahWX6d
	JFltMMQqhfI+VdSSovpmmrJB6M5D5fSYG5mdqSn/c7u1qvv7doZxPndxZbPTFXNWiPPDhONrJFEU9
	dv58ojAdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZTA-0007M7-Qf; Fri, 13 Nov 2020 13:50:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZSa-00072M-NL
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 13:49:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id u12so2762936wrt.0
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2020 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=OcVFHvgowhYl0ECvQLfpLorqw2RlulROMnX4KA0JdKlQSLv9mVUpHCZi3/3LowHNyd
 pPbib+JUF/TZx8WcxyO/ewyRBfjMIKS3UtXxxiapN+aLc3DL3tKjsK1RstnLzU6A7OOu
 raaPYzUHAk9pQHEX8DdhINPQHyXgCWD+EGqFlUaImR9oRRNSCrg3RwlpBO1rA8gRThur
 5ufXOxBBG3r/CwQgQ17S2gixxqvFYvcJhY5owIsbOAQnLy+muaiTQpOZiviP7ChJaRsR
 WQ+DcU7lcgVDScBOZS3SuTdJr7c9G5qztri+ctAZ9PmmnfGvXcyuvz22sG4Ynfu8k5ZR
 rg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=ErMY3cGZfgoTcl0SqwL/OXcLyHrhYFjPT2j0WBmK7ZjWy2kYNr2Ja9/tz661BM+eCB
 XUlfKQp4xbKC+BHgJhqjK/FHnYqwzngOOMNHjTXPoK7ZFLjsp4BMKO/+iqczOW+YIzlK
 4Azs/4+zgtnsmKVWUpOw9oOMY9u8xMsDUID6zh8Ki2L3K2dZ/DoUhM81CXN1r452a4ex
 1c+ZgrVGcE+un3Is5Fq9bpuTXcSy7r8+Fop9bha6sPAzTJqHleU3zJUpa/GgpTOE2N0d
 j59bSy9fPjVLs82LGMXk2R73WUsTQmu0GQoTmfO/IVsUphocSiTNaesCBxtTgCfvRVyN
 iT+w==
X-Gm-Message-State: AOAM532gNS7nu6abofZyF3IoUH6PYEiu6n/AxHf53DbWivQqrL7M7NFk
 HnB46RjAgBvHJ7R9518/856W+w==
X-Google-Smtp-Source: ABdhPJyXHSTj58kWv9AHJ2Kd4IYB+cK8mVPoSovQ0Eu/M93IyXpZFI4npYQc9WOZVFn6vm9pr1K9Lg==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr3629612wrn.396.1605275391038; 
 Fri, 13 Nov 2020 05:49:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/mediatek/mtk_disp_rdma: Fix formatting and supply
 missing struct member description
Date: Fri, 13 Nov 2020 13:49:05 +0000
Message-Id: <20201113134938.4004947-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_084952_873161_61838B81 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'crtc' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'data' not described in 'mtk_disp_rdma'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319fedf463..d46b8ae1d0800 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -56,8 +56,9 @@ struct mtk_disp_rdma_data {
 
 /**
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: local driver data
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
