Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23A8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 08:37:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F796206E9
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 08:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/hnfXO3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZH/gSL6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F796206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3g/d2ClekWp815yavQC5V6j1NOmtxeTCDTBLEG0fkw=; b=F/hnfXO3Mf+KIuA5mD1JbRv+7C
	YxVu0aQkRurL3BAT2kCa3UsTtqj9ssNfUgLWJF/icz08/KtuzbV8YK4S9S848KObaBaNCEQonFOU+
	NRg7cZBAheF7wXGO78Ihwjr/lwwkdkHXUeRQQzR6IXDxKgkWAL9zt3SpioDGGcGUwutEJ0Xf/F+II
	2IZ84dtellIwvrvtvcwkffsbz5samU7sjBVMmOpX8U5zd/bPj8SZi4fktwKHuLvqBV/yB2JbBBTHQ
	uGw/oKJvgeLKibGD5fHug3ZpYWM7VXOPimi0B+cDZHwnI+5V6QeloD4PZhSfXk57OGl8o1/kviNpl
	Iw0AeKcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsMcu-0007ec-Ky; Mon, 06 Jul 2020 08:37:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsMcs-0007e7-2G
 for linux-mediatek@lists.infradead.org; Mon, 06 Jul 2020 08:37:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id k27so1973974pgm.2
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2020 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDPVa/N3+ZUhvoRViqdPQuinT4r2KBmw7AgHYWQpXaA=;
 b=ZH/gSL6NxrKlkOJdEjmRdJfg84atT3SGryBcqvwJxgXifGEQU/myuLaGsECCGWHy02
 hIpvBgTnrMsLWGrwRzi6MQw61zYE+LqvgbkC/Pa4YFYpPzfLti69KDZXzwkVCybQMiTh
 vgVvih10X5hM74DnXwSQGhxhVPlUn7lLkC6aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hDPVa/N3+ZUhvoRViqdPQuinT4r2KBmw7AgHYWQpXaA=;
 b=r5TKMzpLPf2oUR6M4zYO+mXJFfaz4/eb/gaC0Ucma2wlmBy2FMQono97l8ULm1EEDq
 RH7ev9hbat1vFRUsMISjuAQZk8EtPZ65go4L0zbKJpyqeWybSxmq+QndZrsmKtBDhbFT
 JlVPFkcpwpiU1eE5MTS2lJq8JJGa39Ib3iJqXtKuhK1pQ2rYAK01D5sXyiB5D3i2BZTO
 NlCpNdVuSh3QzNfhWBnPpXIoeS41ZSXeHiIMoSCJvwxATrr96GkFmjsNeTZNMymp0t/y
 DAp5Bx5EfQz/LDnYhr5EJAMbcMCRvGhHa7WXODI+GGW0u8Snpu2pYO2DSWnbPmVhBJ04
 yTug==
X-Gm-Message-State: AOAM533ddUSVsP+Uwt+724rNsxoukpHfzgpCvRVohl8wILgJ/ZDSo3dj
 4VVr+5xnJMv0++lcQuRI8OHK1sfpqbI=
X-Google-Smtp-Source: ABdhPJx0l2boOlf6QipzFSm9Oam/wQo9MTfVhN3BnUkyzGrJjWzbyT0fJys4WkerFMUBKouOJnQ8rQ==
X-Received: by 2002:a62:2ad0:: with SMTP id
 q199mr33712673pfq.229.1594024637530; 
 Mon, 06 Jul 2020 01:37:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id bf11sm17657345pjb.48.2020.07.06.01.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:37:17 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8173: Re-measure capacity-dmips-mhz
Date: Mon,  6 Jul 2020 16:37:05 +0800
Message-Id: <20200706083705.2343150-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_043722_125992_CD7B7CBD 
X-CRM114-Status: UNSURE (   9.13  )
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 ikjn@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Re measure capacity-dmips-mhz on elm and hana:

cpu 1:  9502 DMIPS @ 1703 Mhz
cpu 3: 16250 DMIPS @ 2106 Mhz

==> 740 : 1024

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 70b1ffcab7f0..5e046f9d48ce 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -167,7 +167,7 @@ cpu0: cpu@0 {
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
-			capacity-dmips-mhz = <526>;
+			capacity-dmips-mhz = <740>;
 		};
 
 		cpu1: cpu@1 {
@@ -182,7 +182,7 @@ cpu1: cpu@1 {
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
-			capacity-dmips-mhz = <526>;
+			capacity-dmips-mhz = <740>;
 		};
 
 		cpu2: cpu@100 {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
