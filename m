Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7095AC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA4860F37
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DA4860F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwflRLwD/yc0xqMQqZ2a96I82volSwU5H3QJx3rH668=; b=4WLXIBXF1i8uF5
	bE5kcKX544Hlny6ZZ6UhW6tKJn5+7EDmYGYSOtcQ/3wOIrZ+YVFVX/uMq/FICD2njU13qtk8WIevR
	6OpLQH+jLUMOQaHVEnhP9edfap46MY7gvZUqFJdl3NupAVFjKoa8QM/t1oOMiDCUSkEEdeUVIv/0v
	vchvCt1qEfOB+Kf/uSg4yhF538tamEqAkHEfZMr+wNHZ6RaDm2sTAN3dqoErlEmbzVtWoqFRaUACN
	7vsA/Y87ygrhCQjzyCI77GVnZ2vn9bqf531SrMGmi5uzaV82rMGspAqY+JKEOyEU8hRSwueSiuYcC
	RO5d3xp3e4iGr9wmvuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xdW-00Ag5J-2D; Mon, 26 Jul 2021 10:15:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xdT-00Ag2u-17
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:15:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so3147547pjb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6cNmNVuZ2BFsOuXfbpUCz3MMqhnpAF9Cx6jU51cYVSc=;
 b=iS8JuFmAyRhk2OXIxVLoTABTcrtYVlLLYlc5yayhHOjjC4scqJ44arnzWJs0djA6WT
 dcOq8G9yWeMvmiFKETVhPMDfXwtmDHq5z2Fw64kHbvSG1VxaexSCFNhrdWqdyFKcltxF
 iI6sT0SeGMVhw4L80z/0sbZE77iX38IZGU+9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6cNmNVuZ2BFsOuXfbpUCz3MMqhnpAF9Cx6jU51cYVSc=;
 b=oShJeK1WxbwFvRpVstKinFhDO57w4Ly92NDyqeqTEV8BSp2HTW3lP64bNX9EkxZRi8
 IVGwcwiKhjCdELer98H9CWgeTy8BjqT3hmVz6K4wnmyPijZTJpihccA4+cVH6vl0xvuK
 FfrZFQdlw8u5ehi5Htc5/D0FkiJ5r+2j8K/zuAa/dgoNyoOoYNww9fnVqvW7B9kaGrlH
 WYYASyfn1k0yXisfaJuT6Oi4FxFPS9zKIW+wb4wPqyIrFfUaPfPbsKIR6dkFknxJqDVj
 BqROWIKnETddwIjU40qQZI6U8VetpCak84rQNeJN5z8YxUGzD1PD9AczusCDOQRrhAyh
 pLLg==
X-Gm-Message-State: AOAM5331L+Rc1PvcZepTwUELH4HH1AxKL6Y8iYBUiHg/oSRtMEw+ftNH
 z4MUpOYk3v8B+rVvMroGmhltIA==
X-Google-Smtp-Source: ABdhPJwtbzs9Py71e1eLFU81oGgxRo1XzTbjigdfghgMbb6gBQkjM9Zc8+T1twmwN0Dq1lmRa8I5jw==
X-Received: by 2002:a62:154f:0:b029:331:b0d6:9adc with SMTP id
 76-20020a62154f0000b0290331b0d69adcmr17505047pfv.73.1627294497090; 
 Mon, 26 Jul 2021 03:14:57 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:24d6:d449:2832:1652])
 by smtp.gmail.com with ESMTPSA id az15sm7289913pjb.57.2021.07.26.03.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:14:56 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8173: elm: Use aliases to mmc nodes
Date: Mon, 26 Jul 2021 18:14:51 +0800
Message-Id: <20210726101451.2118076-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_031459_133900_0EF73D86 
X-CRM114-Status: GOOD (  10.10  )
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

Use aliases to mmc nodes so the partition name for eMMC and SD card will
be consistent across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..be21740d682d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -10,6 +10,13 @@
 #include "mt8173.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc2;
+		mmc3 = &mmc3;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
