Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B212C433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:41:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360272072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 07:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axmHv5hV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V47joEy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360272072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vLw/chZsfR8eeqlFI+ToqwdCAYOn3l3gBQOhcd19i8M=; b=axmHv5hVPXEewMb2+rmjgKmD3w
	KzouyuiPotlAk6nAckvELgqliR/orUgTO1A0cil50AMZS4ryfhZBqpwMCIl+CN252+/EqWR32DV5Z
	vmHNdJKeXAVrv8GnwQtR7Tyo8uicIt8UJhI1rZbLsDO96qlH1u6hZ43ivBctPEHzj81I79a/DWt4k
	vAbZRvQK70tJnIj2bM8QG3m1fx+43n8g08ZfPU26CVHgloLnwOzDxxMDjvXNp4JtBgNy5q+689usV
	/IaME+sX0m4v6Iqqq93QeABW9g4k4orcszaKzm7oCgya+1jLzM9ap3w47uV/NNOx71+FDWFB8yGcH
	0+jN14RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxlU-0003aY-Ja; Mon, 27 Jul 2020 07:41:40 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxlS-0003ZH-SO
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 07:41:39 +0000
Received: by mail-pl1-x642.google.com with SMTP id o1so7579797plk.1
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02L+nV06/zwmICNroTjg7mYMa/wTXN2VrRKBLAVM2dw=;
 b=V47joEy77meF+oSYORGjxuLpKGaeEr7xnIXCBWjrzNaPfWMvv2QRB45d0IROIpCTOO
 80nbmPjwyX5jPTo6BZfOxXcEMWPaVYTXVfJo+azQjZsMxvxNXq3LCe12uRk/2m8Ifli5
 2PJ9EDDRyYjJ9BIe+vMXLuW3oWZVdsOwml30I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02L+nV06/zwmICNroTjg7mYMa/wTXN2VrRKBLAVM2dw=;
 b=Z0Rs9UM+8LZAvDvDoHEuvB8y2fZETUSH7ce3YdvUub1o1IRkLwoYpC6I9b8f+xrf3C
 CBqB3EGWYuzrpQPL+EVdszt5BFmEqqohWwT2f/gGLWk5DYv5zRcXgvRGObcmw2JJBG2W
 CRBEVl0B3ZRsmndeeVbJqMUV13VwlbzT91yqvrMHojYsrmNUG5vzj9jok8yEBiz3/4J3
 kcA9vnvnbEiz+UIem/L5qCF8Z6etWJfXMshr3UXjYb16LSQO2luoVvtN8YFlbmYcCtHO
 mazgsbeVFmHwRGFDQhDShoAEAB0S5Ir2qwZP+prhrugCnoKwSk8JeOxvvwChSj8BdbLY
 MSOA==
X-Gm-Message-State: AOAM533J4sjvo2LLDQfvLNo13qT+NRAigtSTCO6Ar0v8ArSEm5gWxrcF
 i/hO9sExbjjxjcMB8iQCE2YGQA==
X-Google-Smtp-Source: ABdhPJzuZ7ICmuF4ozEQuv167siP20VYHysSz7yu/BjNoHfuX0QIrN7rkJ7u6etQwGM3gpJ79LyGpA==
X-Received: by 2002:a17:90a:204:: with SMTP id
 c4mr16807174pjc.165.1595835695486; 
 Mon, 27 Jul 2020 00:41:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id f2sm13966544pfb.184.2020.07.27.00.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:41:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mt8173: elm: Fix nor_flash node property
Date: Mon, 27 Jul 2020 15:41:24 +0800
Message-Id: <20200727074124.3779237-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_034138_942850_2A6D1117 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

bus-width and non-removable is not used by the driver.
max-frequency should be spi-max-frequency for flash node.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Reported-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..01522dd10603 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -431,12 +431,11 @@ &nor_flash {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&nor_gpio1_pins>;
-	bus-width = <8>;
-	max-frequency = <50000000>;
-	non-removable;
+
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		spi-max-frequency = <50000000>;
 	};
 };
 
-- 
2.28.0.rc0.142.g3c755180ce-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
