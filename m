Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E20C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59182082E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t20OkGXI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hza1KTfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59182082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVas509EcnFOo0l3TF1w3J4WMH61mPWRbFGb5YxcUXY=; b=t20OkGXIHzrAH/
	NNSvgl4zwTFD2vXaiGAeyNbvulI3t4+9jfpA2rUTysmBVpJPREWkjbsww0iY9Bwas1JZASA2HV7NQ
	dDgxmTTDHqUhzUFBkjSklyk/FLM+jfHm5eUSRtoWSEDY5h5rDQN0GmhuNIB6Io7ucOYdP0Ewjc+Cl
	OuF++9G+QolWsT8Wdm83EqKytsbTTuLRo14VFIvnq1JShVNIhmLFHVAbDtQ5hRc/Di+BmpT7qerNU
	fyeJ2w8DQVtwIHMNT3oMZyXeEaLubz/hdRZWYsnZUGV2H9Rcc6IopBqacpiWrz8jRkONCcK9nrJBx
	646OLBRHHanJQ9SiLT6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izzXi-0006AC-Fw; Fri, 07 Feb 2020 09:03:18 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izzXH-0005gx-PC
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 09:02:53 +0000
Received: by mail-pl1-x642.google.com with SMTP id t6so735186plj.5
 for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2020 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
 b=hza1KTfZrcZ1cLVYVEDdUr/jIvAsku9QluA+QDTmDgNY77zs49q/Reb269x5AY4UM8
 QD7+elleyDZCAVm98iEvDjiwuBd5NXfl72cNGcJuMiO3AR72ZzeMikqXRvs2X6ZLVlN0
 mq4AtBDFJu+EfKYkx+7F3RiBIUd67rDHTfCb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
 b=HtAt3lJaTReWSuN//UHhZ16f19qN3QkUEqzZFvImRFcjFpIhtJq3JATTq3+xgElmxb
 VZYk8Ht5Vc7KrSt8njU0fmg+ejCDxKbIFLS2qyYw447UdbYTQnUkaInqwKqVgopghqfs
 DdK38rLGbN/w5L+pE1KA03oghMUNVdtZcym1vUsZ52+Tewn2IXFr0/wYTfaFpd4mnVt/
 MLgEAJS2eGWC3e8ZYwo0WOSkFBGdlSxgftVq0FLkglr/IiNT3B7X7CDUTxKAsnTICI4K
 /tjGYxEIKhzwlhMMLLhYKI4CkA6PAnRXjZcISQ+rqM7EWSNv6geQwlt6HC22aIYHxDQ+
 CEqA==
X-Gm-Message-State: APjAAAX+1SSwqzQ+xRwmh5wVJMUVPPsSvLgi6LtXP9FWZ91Y20B7XGK4
 vz3lDF6/w75GpnVJqMkD+d8z0kxnWPOe9w==
X-Google-Smtp-Source: APXvYqza2ipEubZur+4araOCqPbin70u2BC7nswqmXBXRQtznLERXJQIUiGybrHjcZpaHRX2VAs0Qw==
X-Received: by 2002:a17:90a:26ec:: with SMTP id
 m99mr2658469pje.130.1581066170832; 
 Fri, 07 Feb 2020 01:02:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 01:02:50 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/5] arm64: dts: mt8173: add uart aliases
Date: Fri,  7 Feb 2020 17:02:25 +0800
Message-Id: <20200207090227.250720-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200207090227.250720-1-hsinyi@chromium.org>
References: <20200207090227.250720-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_010251_833346_6B10FC8E 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add serial as uart aliases in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..790cd64aa447 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -50,6 +50,10 @@ aliases {
 		mdp_wdma0 = &mdp_wdma0;
 		mdp_wrot0 = &mdp_wrot0;
 		mdp_wrot1 = &mdp_wrot1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
