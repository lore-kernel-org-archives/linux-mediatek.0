Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B178C43460
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:33:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1163861396
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1163861396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/n0NE78NYztKR02sdRTN367da9X6s7GhBksJ5MOBstQ=; b=LhSPLDDBo1rVVBEragg9EZjF3X
	/sGRmUz7rvjK8d9C+ieZjnu+MA526KuqfolQYwQG04Q/8p8t68Yaqlmi8d0JmAVL+dwsObkhv8X03
	YmHX/Q29UpqGqpdZVADGMuEVqfBHitBOhATfjSn2Nb0UeAWPjakK1AJ1joAxLNDuPnEHyQzVI4XqF
	kJBUmAk3BcGTms8PLm7oazdEsVtBr7LiQNVY+Eq3Rko7/mdkpFvf18MrT1qgGQ0scGOKMUPFscI1+
	pTLYbEszZmSmrT+5lzyZqg7DVBv1ZVfl6H2iJv3XATQSMqf9S0qZPYURiM5QjlRs+BlI02t4R5akw
	UeJd7jCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjwy-002KgB-9c; Tue, 06 Apr 2021 11:32:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjwt-002Kdf-AQ
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 11:32:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id f6so7750126wrv.12
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qsh1PvwVqT8YTPIyWFqgM3PFqlHjXtan502PwOLung=;
 b=gSfEfvnlc0O2ZY6hXjjXUZkBGi0Fw9CFyePVeDT1hU50JJ0+I8DEvCv4Q4BzD3G9mq
 WtZyCC6lCpaQyo094PNpjLfCzYlY+vgH5ZkBu0iU1H4QfnBsS0xmw2pVgbrnIpXMtoxg
 kZ+lEffPE25KG/RRHbubTpt6CgoDwAs3EiY2KzGF3xLSOOrX3BJqms6DA/CMNr3IHAs6
 w6Hg3aydYpilrCXeRLHhcbMbAe/7UODaEPH0IT6BXynb4tQH3M3kH+Hmk22feEj1nBx4
 2EVB2mBuBVo90+ydGzw9VIt80mXTmeDo3vCwhUCe0s3UBv8iPxtrJb9rwSSCrq9E/m4P
 Tp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qsh1PvwVqT8YTPIyWFqgM3PFqlHjXtan502PwOLung=;
 b=s/ZKIKAnBtdKccklhYOcq+rl5ZzNn4WXhIcYlSUMDDxTq4WUVuL74AyiEPPBFJkhGn
 Xtj1jcGAZ7UA5dJP9ghMiBGr7B187q2OH5MuLfdTsKAxY0OZH8Lju2J0+RGtYFazzLmb
 cFt6BgGElvPGn3xd48qsDFhbAM3gpIzN3pPr6N56ekq9kfx2dzgEvb6j/5v40bqDABOa
 Efym6PhnmpFuc6PmPzOy4jtHQRU/i+SJ199G52rxNP6XZyD40io/znveQMEbxGAwvUqG
 fU648xa9C/fJH6zllfgUcCG30TU6bDxbtiB+1m81zWoDYjqOQjkJH+PsDtnB4R2wk71l
 zrtg==
X-Gm-Message-State: AOAM531tQSBZAgb8w4Fqi9sdPJ6EAV9Qola+9UYA8yWNzDrLIufPSwkI
 9yoyklDfTaNLpBIWWPFFO/tN4A==
X-Google-Smtp-Source: ABdhPJypWuWfiAIQZSjc/XoWLsa+fRwrHArjxR004q9Cf/LxGitUQGxR4w6WIGjxxI9MoVYL3kCdCg==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr34494614wrd.261.1617708766655; 
 Tue, 06 Apr 2021 04:32:46 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id j6sm2424229wmq.16.2021.04.06.04.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:32:46 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] =?UTF-8?q?=F0=9F=93=A4=20arm64:=20dts:=20mediatek:?=
 =?UTF-8?q?=20mt8167:=20add=20larb=20nodes?=
Date: Tue,  6 Apr 2021 13:32:40 +0200
Message-Id: <20210406113243.2665847-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_123248_107372_C3DE85ED 
X-CRM114-Status: UNSURE (   9.74  )
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

Add larb nodes for MT8167:
* larb0 is used for display (dsi and hdmi)
* larb1 is used for camera (csi)
* larb2 is used for the video hardware decoder

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2

V2:
	* Removed unneeded mediatek,larb-id property

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 4b951f81db9e..bbddd4b22d3e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -140,5 +140,35 @@ smi_common: smi@14017000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
+
+		larb0: larb@14016000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		larb1: larb@15001000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB1_SMI>,
+				 <&imgsys CLK_IMG_LARB1_SMI>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
+		};
+
+		larb2: larb@16010000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_CKEN>,
+				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
