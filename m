Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC692C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 09:20:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524C864ED4
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 09:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524C864ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTb54VLYPrKKpuEIcZi+1l3sv+UUTyMQ8/gJVHh15is=; b=f/kf/73eC9eSmS0o772avFN1Eb
	4MSeSl8xj1EWhiREj/DbhVtEvojmQe6HE1Gqu+DbqNVoeix9AzFNLksFVOgiK6yRz2Rc+LCMWZbcm
	hVAcCw2OZOnf5BrE7kSZspAfyDDPkXuONebmM6V0xnDzZecD8dDCLnaMbkid9zl2XqxTqtnJZVQCG
	GiNIY3hqjia4o35e3UtW2GO/GRjZL5EQ3iCukCmqGixF/9ZiUVTwP79nlt5bGOCmtURUHHRf1EcxE
	0Klc5TWSRi9uW0cJOHPFvd+fXCIOr70ftYwsMUmz5wWP1MjLrKNXStAwJAX9J5bTGC3d9Oxnq5B0M
	5WElAm+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEqLL-0001mP-ID; Wed, 24 Feb 2021 09:20:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEqLI-0001kV-Fq
 for linux-mediatek@lists.infradead.org; Wed, 24 Feb 2021 09:20:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id c19so911673pjq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Feb 2021 01:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6QbaVKtgtUI1ubiXeNENn0SvGUBYVnolrmYp1NXybw=;
 b=lhrDhFL9BPsIUJr+sHv8QFAokk6fIi+d3ao6ADbx57svNfTlb6pKOr05hv45/voIya
 9Go6qlRZbtKY9YXNx13LjCGzRkZTrWTfHqCAN3ruCmAR5J4G+t5ycwl0Ud0/2d65miA5
 aykld+iKInnGjJB1HIhORveAhbZXZbrk7gKEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6QbaVKtgtUI1ubiXeNENn0SvGUBYVnolrmYp1NXybw=;
 b=sZdrMBZEWu9Q30yKIz16L0+TsBaZZ9EsRFMsNBkK/IGUMYQRa4OEBiz8GsNEPS4CbY
 ymG5EPUX7LLAlJdkzfxf6cCchJKoI8Fi9dg3BFtkVTcvsqZlUFUFJHvRDs2St2BaPdBC
 Q2g8CzYkoOyvH9JyCOxetvYJd6yhpWlzex9LM2h2nyU0+wDRJ/LxdhZVKdiLva1JRSmC
 9wLXCNvRiq4lwavuMhXROiJcly9KiBkfPQiuoSZqlgK3EAIEOofWq0lNK/0sJG6hpN+p
 oxyeaRv6AnA60QgimTSYXExuPGOvcXxvtsLBCp1POLFSJetaJAENGOGhe6T6bxJRoBlh
 c6xQ==
X-Gm-Message-State: AOAM531dz8foNHaMY7nAwCvu+uKAss2owlPWJAKbsqSX1toAwzdu9k5f
 2Z1fNqM6B9l2wUp9y4KAjLH6rg==
X-Google-Smtp-Source: ABdhPJzdWYNLyuGtkFHMNT1hFuQvLfPscgO8J+QdoZyQv16sdgGt+CJC44NDs5lHg4sX5U8g1+tZJA==
X-Received: by 2002:a17:90a:fb58:: with SMTP id
 iq24mr3533991pjb.64.1614158420489; 
 Wed, 24 Feb 2021 01:20:20 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:186a:b03e:afb5:9b45])
 by smtp.gmail.com with ESMTPSA id q2sm1906456pfu.215.2021.02.24.01.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 01:20:20 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: Add power-domains properity to mfgcfg
Date: Wed, 24 Feb 2021 17:17:42 +0800
Message-Id: <20210224091742.1060508-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_042024_614647_7F1EF4DF 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: Ikjoon Jang <ikjn@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mfgcfg clock is under MFG_ASYNC power domain

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..3384df5284c0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -962,6 +962,7 @@ mfgcfg: syscon@13000000 {
 			compatible = "mediatek,mt8183-mfgcfg", "syscon";
 			reg = <0 0x13000000 0 0x1000>;
 			#clock-cells = <1>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_ASYNC>;
 		};
 
 		mmsys: syscon@14000000 {
-- 
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
