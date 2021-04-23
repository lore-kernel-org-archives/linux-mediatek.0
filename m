Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A66C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:54:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58022611ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58022611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gmU/4Tjao6NYws1JOiYtmGv7F8lK89FGcSqflPNNN6Y=; b=AHEBkt+Wh6jYGL242qbigxqHxj
	yTvF0Cqrxm/l+hQMktGLwnS4zkP1YcZ0sGRUQ+yrtZdkZsdYL1FJu3+3DWSvBTaFWq55EBiEqDQ3w
	dTAiLs5Yq0fT7J6g7iCyqz/9hfz3q5i1PtpJfmg65c5H+xPmhNoaafu8qRtjFZ3dO1NP4bXeeQhWg
	K0nJ4+4Utyh8JhSsTKhhdg8oWCNi540K73qv6R728qFe4blT1BvNE5jhFK3hWsKTw1a/3Z7d0mQyo
	a7lq23ztlqTtQyyHD67e54tIRbpprSF9/5Z5qD/e/ei/RrQs4hrNctBD2TTePrwk/MZmFaLOElA0J
	1nsd1ixA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZphP-000uTt-F0; Fri, 23 Apr 2021 06:53:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZph9-000uSB-Cf
 for linux-mediatek@desiato.infradead.org; Fri, 23 Apr 2021 06:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oBsB1gTZg7pCEafsajc7J+2ruSCh6B3ByCc2MPyji4k=; b=D7gph9AOsdopoiaKGCb9fQf4Bj
 dV25TMUKlrr+ld523nlupQ56vhhBg46LfO9vZrJGcEIxIg10t3z/KCv4ZyRtbrTIHRpfDaDMcY6Mn
 Fhx55SCY2tweDyQw+HX2RXR0P2uehYNsi3UGSxMbhnGRqoi0RloC5Lfh6+K8BBxlcl1QaJ+Z8z6DY
 rgTZ9TEq2DhTLsS9dt7/vHcZSSDrQ8zLRA/33xsrpUdo48Rpkz1cfxACsSglonS7PrKBREedRHkBg
 DG9pV93Y1qx2jDtVLtH8bzZ0ayPemK0qVbZVzAcPq1L/I8hz7+Fa2LRsQzITL3FY6NzgvuhY1ZBY4
 ecXGYJIA==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZph6-00ECS4-Me
 for linux-mediatek@lists.infradead.org; Fri, 23 Apr 2021 06:53:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id v13so11175706ple.9
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Apr 2021 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBsB1gTZg7pCEafsajc7J+2ruSCh6B3ByCc2MPyji4k=;
 b=W2YpkNGska2guIgrKuthtDEFw0MwFDObtJe2oFDv0nSSdYRgHQfhrLWZH/l3ZFhbj1
 Ghy+BnszbbQ96marP7fzm0xZwUhQB6XqAygVceemKVrShGdixZufzFOJCbuwnG3I0F/8
 VOS+exVsVKPOpudrDs6b9KGMdrgXkEx2dA/M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBsB1gTZg7pCEafsajc7J+2ruSCh6B3ByCc2MPyji4k=;
 b=EaswRwNOgV4or4Wik83KTk2og17OZ998aWHVvnP/mv1m8CYF2IKIVYfZ7dex814MHp
 qVX/CTB7BRbKdGumIsshZXCDQ9luSw3qcHNLo4c8+xO4jXHUCHSHGJoJNRdPnj3SvDPn
 s+JyyEIE2Nav55ZtosCb4xv1+VjHYYEkK88avL+MPoXJpA4AOVzHOwoKUCXiy3VRZeYX
 CRNUgYLO0ZsLC3xoRvXzUnc2CBC5fpSKdHvYN+8/mbYv8TaCZcZvcHasVVjTuRPF6EpW
 q12tsDTajejXg2fLYrY+TPR2siN8vM8AFW11bpLG+5FGKq3sV2PkujvrQYYbB3FnwY74
 YeBw==
X-Gm-Message-State: AOAM530V8U3mqQ6yEgR3iobNRXPuuGg6c+uiYYuPlssRHv8ML2xDgcXj
 MfvXZNxGKWbs6r7ansaVRdfCbRbZ0o/WNw==
X-Google-Smtp-Source: ABdhPJyOUqurtSe35jHgXPvYL2sJPGggDMcNevLnMOq/El+jK1sVKr2iiwReHcGfqEMype6g/xvuGA==
X-Received: by 2002:a17:90a:318d:: with SMTP id
 j13mr2900233pjb.174.1619160818607; 
 Thu, 22 Apr 2021 23:53:38 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0c1:e03a:8cab:4dd4])
 by smtp.gmail.com with ESMTPSA id 1sm3731450pjx.46.2021.04.22.23.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 23:53:38 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] arm64: dts: mt8183: add mediatek,gce-events in mutex
Date: Fri, 23 Apr 2021 14:53:28 +0800
Message-Id: <20210423065327.1596075-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_235340_774404_0B93311C 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

mediatek,gce-events is read by mutex node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..cf22d71161e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
 			reg = <0 0x14016000 0 0x1000>;
 			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
+					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
 		};
 
 		larb0: larb@14017000 {
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
