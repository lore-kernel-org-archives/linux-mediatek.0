Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280ABC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B4364EC8
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B4364EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NHdvyFbtC0t6qII1iwUt12JBfr0810SxZImZ6QUiC2g=; b=XHWd0yrw6wTZHHPnKmIAEqywK
	380egfagxXgIIedQAGxrLWD0cbMv8zPnDaivUpGNR3F6VDIhpaPgIPKD2Ru2mCUQg0KXTfQnlIzsX
	DCmL2gztQLN9Uzb0UmLOJXEQH0a20p3oteQHQ1GjYvinaEjgvb5ZpQiLEqTFf2DOTIUA518b55bDH
	p8xcRldIq/whqg/kIBIWUGdahQRpofFpbN8kktmoVI2eV09ypT9E1/sVHb2JTBf5b3/jve9IKL2eo
	euJ8tLlLVAk2T0yeqDaN6kWP2/Yl2gr9Ok8roA+AbSE4KfOzsWm5yfRT1/sr8td+hi8C8mWXm6T+W
	ek66SDMZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFDhV-0002Ws-QV; Thu, 25 Feb 2021 10:16:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFDhQ-0002TT-BA
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 10:16:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e9so2941407plh.3
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Feb 2021 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOnu5+rwwrxagaBbf8x0GjKsvpo3db+Itt5LI3BY7eA=;
 b=FN0DasRvoVznQ6E4Y/uUENAY0JjGIAWRWInz95h/Puo/8Tm4QEnbA8qhftyt4NyklR
 FKF2qeGViS7xGwJViornwpXb4Cnd/kyfU9BFEHHF7YbGr+2IQJfc+IDMV9C2jo3p6Ry6
 xk5TZxJqO8SneFI5R43DkmyQ1pRg1hYCnKpX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOnu5+rwwrxagaBbf8x0GjKsvpo3db+Itt5LI3BY7eA=;
 b=dWRKtxFDxNWL+ef1VTCSrwiDCc06ePP1lwhfrV3TDd6uWGH8397DG6dqeX6spyW7b3
 tlne8SziHzupelyJgAknlDB4zLs9hpV0kMSIJEMqSGUG0zwe+q2LQmSnIAmvkpScRPkE
 JvMgrXJFKcHjC20q7I7yVBMo6sJMBze/dBfgcFDdGyy+qcx8ApcWfK95nq4puDBBIude
 KWF5YWQ4gwT2sZ38LvVqt+hWc5TZMCSDAbKFj8LcsvUwX28sWaPZ2bAKIv1fsKtlBV61
 sw3D40E26YLzLr2pSZ12g0h4YWr8k9uqmVjN16mIm+JB4rXx/b7Mb7G5o6Evq1uQ1OYO
 C2BQ==
X-Gm-Message-State: AOAM533/+hmTqBMf18ZEqSSuX3yQMxyltk4HuRF+lwZfW+nx5/UOdcmJ
 Uzp8tHTPnoMM+nvrUfCoFJvLtg==
X-Google-Smtp-Source: ABdhPJxYnrlwLEA12Pq2yUQxpxKVdVUC1QRTp2SRT75TUZk3NGgHWKkRD2dvNBrC5K6NHMWXR+6sIA==
X-Received: by 2002:a17:90a:b28b:: with SMTP id
 c11mr2638559pjr.62.1614248206231; 
 Thu, 25 Feb 2021 02:16:46 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
 by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:16:45 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v2 7/8] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
Date: Thu, 25 Feb 2021 19:16:11 +0900
Message-Id: <20210225101612.2832444-8-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_051648_404002_B6E1B448 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..30c5888bf2d6 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
