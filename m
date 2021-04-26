Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E822C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:19:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C9D61176
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C9D61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiOUDYcMxMkt6CX8Q/opm5xcJ7TE7HqO4oHitrnBMl4=; b=qliGDrLpDwUoNc/iCCKChiIWs
	aeLhPvJVCq5a9b4GrS4Jl4fzmcGTanupCkcWayjXqo2idMlUJifislhz9U6BEyqorADysQA8gth5W
	+1GAWDlTPEFk7GWVfE0+h2RyHHdrf0yJjwtNjRm1cQiCAkGe8pIS+jYi7uObSUQ8Ibk1buePZd4wE
	ewJ11Z4Qr9MfSMX8Pw5MwMyY086WQuCiwaObe5QXmO153+oZQB886pXApOkHNBDjO9lccu3uX3gbU
	dFJMNAzZKUoDj1Q7w+HFkotZuGfWneey0Ux1AJBJmJNFbGbf7+/HzLUE2DDFB6FdC9lzRGoiuoID6
	Qq3ajtrXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lateU-006vii-OH; Mon, 26 Apr 2021 05:19:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1late8-006vft-6t
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 05:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=; b=2Ds6/fAZ+pccX5lBUsU6kTGlAq
 i5mZIXY4T7gSlhwY3k83qRiY5vGoeRXx/oPwpqQnCJnN//GXQ5euxKjF5n+C1O1Yg8UukB2cFRPea
 sGVGFpenH+CGkyP+mq9ianecJySPVt3TR/oklZAuTYMDt3wBR0x+TyDamS5JFCOF3HqDz4vT6j8VM
 48Z9/nPak/LW7+p7I8AVchcYUBTgnLMLjmNEVAG6LcSGonILS3SX3YpfSKyMqtb5xdtixlxwQX1iF
 7p9J0LDmDu07CcNAqgLguIB7euv6Ks+cJt+njDj054IxTgB2xlWK92MQWWMT2sYG37a4gnPpnCcfe
 yRQO58Kw==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1late5-00FjgL-Sp
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 05:18:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id b17so2290088pgh.7
 for <linux-mediatek@lists.infradead.org>; Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=PLSD7jhKImFPl98DBSFMj8R/b5Ul4bbE+BoQg9DsV2ma3TcmldaXG7B0oHdDFuM1lD
 /HVqkDvzFawztE9+VgbeJojJAMZvcfkOkTS7KH/HG+p21hPsekQVIJpXS07mWJHskcY4
 rEnzo0eFpJwFbTCLUYHx9TOYDAeOD6D9JpLVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=SAYAKq4GdNwc4aPrXzBOEFluHqZiPVGBbvj2C94+uFSKbwEBG8D6uO3/EKX4cLs7w3
 RowHuqgaHPTeYo0vwF9kmpDoacc0jfPNdt8SJmIKuzl9YP8jFSqf38PIA4RGkJmkjJUe
 ALYhRjl3Lz3dzGK6A3yWYKW1DAG5UbgOE1ZS5lfkbxQiqVwoSFi30eRfHAw32DWIAFlL
 MoI11PuBOJIVLLsmdTR6sreVvFd9sL9Hx6bl5OYkixDhdLlrTNG8RqOu0TlV0VI+stAh
 qXryLgQjzMS4vKyMsMyz0WgqQHe94Oais6TEnODa75P5UNell7m+XQfRcuhGVy5CiD/e
 dRQw==
X-Gm-Message-State: AOAM5331BAdYEV5Jbh9RzeKEC+mDT3R1VrhoZnVKSk4ZIaEuIS9diN5i
 TZJ6nSkkYSyH0r8GeYNTlTHdqmLfp/zXcw==
X-Google-Smtp-Source: ABdhPJwhzSFNys1E+rEQpwqHLs4DcKy+qdcvTtSweq5ZIYRg4MfS83Z6E4sOu0fwV5TrQEfwqkVuOQ==
X-Received: by 2002:a63:6b4a:: with SMTP id g71mr15306124pgc.274.1619414336303; 
 Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:49dc:8519:4648:67e])
 by smtp.gmail.com with ESMTPSA id h9sm9928420pgl.67.2021.04.25.22.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mt8183: Add panel rotation
Date: Mon, 26 Apr 2021 13:18:48 +0800
Message-Id: <20210426051848.2600890-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210426051848.2600890-1-hsinyi@chromium.org>
References: <20210426051848.2600890-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_221857_934839_A43DCF8C 
X-CRM114-Status: GOOD (  10.25  )
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

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
