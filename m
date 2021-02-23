Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E08C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:18:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283AD64E3F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283AD64E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQxW+bGv2XgFtaiX5a973oytnVknSIR9+yvuI5o4Mew=; b=VFJ7JuXz8VLpEUZrzOpefrSEQ8
	f/hxbkNzU7EZwT9QdFbsKAP1+3cqC2fWe4RY0XSRO1ds2Ye/FhLgEt8l75YOUDsFZK/6Ktk/JCooX
	iIcYLBCNSWgEkiQrnVOa5mbO0NRVGGQX4/K0uVyWaiqSLs8nhbE48idCuUwUPmCagtDl9i+qKLpOa
	eLqb19Cx86Otra3PYILfNvWzAVnnae4OFoy0M/V7KgJPezlQNuePsMj906onEI50fvhz+bTemz0GG
	JOGGh06fGvK/7r902EKAbIcdB7lUYRmbo9uvXzwtSsLrJ8zo5MvI2JzBx4JvqUnE+Hp+vQWrSDq6n
	bwBQyeHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEg0w-0003aa-8G; Tue, 23 Feb 2021 22:18:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEg0s-0003Zk-Lk
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 22:18:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id c7so7374256wru.8
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Feb 2021 14:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOWr9d9lq0sjyNqrHH38BMtESbANjRbnbDGooX/xjQ8=;
 b=MKwlftHyyZGE3othtgMueaRHkmaajvrUXsaVYoAx670mrzccorJhqLtyleUQAEYrCd
 suzFsQeHhogqSKhfzYnaXilqXRfFPxFKLzFcTH733uTZc3yK29Ukwsw6laE5AJWZTlQL
 UMyMB27jbFxhUDyJ6qor7SrKDMJXFhi2G7sTS+s6kcdUpWAbrbf5f7xF08IfVmBChJ1N
 4MX1tPr1/5ZbXUl407mcoItffg5bXvEFp7UeIGh+KRMFngmZGL5hxlWjmbBLw3nnhQ92
 UtTSais/T/XTcduQ/8HQur1E5xaNtKFgTsrXewtoN04/eaXGus6LK7aunjozLwx5c85p
 a6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOWr9d9lq0sjyNqrHH38BMtESbANjRbnbDGooX/xjQ8=;
 b=SIPiwZQRzhIKp3pgr/6CYp2Ff4x2TKfkH19zc2LvD1tycXxwVeveWPSU3bBMBHP6l2
 jTQ04OmHbbZiJ46dTt99xQxlZliaPJzSVOtrXMPB9kmeTWLGzR3KIM4/RJAjyHj7BO0Y
 /eVRw1BJsjPo3MuNYDj00Wo9sx5J3XY/HDzPoW8rnak+AMnexW9vCiStjAxzkD304u4i
 b+T0ZKAE+/mTusP9Dl06Aq+WGZ0sHXG6uD9cqR2bpISOmhrrpnvsz18MEACWEy8n/uY3
 K/hACNUJh+3AwkVE4T844HJsGY1QeLOCR4VZ1Bbah8UTp1ikCj69nXUAGLIAUtnKJEyD
 wTRw==
X-Gm-Message-State: AOAM5326ZY35dxD9cI22eF6PwXjNZyi+672okWBkgvNLdglkOn/u0JCf
 TGKrjnMRq3Xjr/uRFuCaPGHbmQ==
X-Google-Smtp-Source: ABdhPJyET+QxjGHr9GQWKV2tzcZtwrRpuGCUPQ0oFhxKbHTjMAg50XZI9bCQscPIpL6+/UkcI4ikHg==
X-Received: by 2002:a5d:6a0b:: with SMTP id m11mr28305380wru.414.1614118713821; 
 Tue, 23 Feb 2021 14:18:33 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id o129sm4035934wme.21.2021.02.23.14.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 14:18:33 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: fix reset GPIO level on pumpkin
Date: Tue, 23 Feb 2021 23:18:26 +0100
Message-Id: <20210223221826.2063911-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_171838_894656_4959C7B1 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: devicetree@vger.kernel.org, mkorpershoek@baylibre.com,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The tca6416 chip is active low. Fix the reset-gpios value.

Fixes: e2a8fa1e0faa ("arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 63fd70086bb8..9f27e7ed5e22 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -56,7 +56,7 @@ &i2c0 {
 	tca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
-		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 65 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
 
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
