Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53511C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVGtG/xkZ2SUVTPfv4N3jDDyPcG83QKS8uXtKdhBSu4=; b=TRXihO8sKgBlDl
	7/L3HFbRHtr1GZHXHZIlp/jLlMB1Gdx/yHI5/fSZz6iwtgzL4qTyzk2Wkfkjyv6Q1uIyYntk2yZYh
	bGen+OO4Qr2QAmBFA6UgUFKQLfREvTpaDry0CWKHUP48MwFfa1/kSZ9h7Iop8Y5F05HB1HmiDw656
	FYookuLM+6bPInNDMlOfkfbRq56zTWq3PlrKImpc8ec+SsWT7rfyJX0+1KK61i6hiIZwrI/HcGivc
	QnEiyFzYM5mBn7CoBWBIlwOppyqy1QXqIz2jSBHVWKY0H6l9BDDrfp7dNHzatVY6ZQKfkBLLqe+Jw
	NGHqUOAwk0WYC1AEwv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWki-00A42h-PH; Tue, 22 Feb 2022 15:06:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWe7-00A0EP-70
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:10 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F9C9407CD
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542002;
 bh=AXkZYdVX5Zodn+3WZgtIGj/ZSa6Qs/Xzl3ZJQ9geNsQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=iyDq1tbkJf+9Q5xXoAFCuJM23bV735qnBjiNaQruOElGZ1TsmBGwVWACq/uMXb649
 fu4uOd0GB0exylnFoJP4t5DaS/s9Wq0kDQf4x/02ypQqPQWSxtSI8j9PsgXtYHlFrV
 a13X20p+d8FPOlvU6r2VRQRE0PDhQOEpV7T94QoLQ9BnHv5ff3BRRPt2UTtTGAXzMJ
 uh8340d6iP3wae+G54ovCBBWfehvhWQg3ZR+wU8Ww3Nz+vSMu3xV1TjcBMSghpXMfD
 r9hAhyUof8x5fMba6JpEsv5SXAknVOZ3x97RE5uYMm5nArFxoUoCj3EikG//0m/To6
 RLMm4dd+w9ayQ==
Received: by mail-ed1-f72.google.com with SMTP id
 j9-20020a056402238900b004128085d906so11162782eda.19
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXkZYdVX5Zodn+3WZgtIGj/ZSa6Qs/Xzl3ZJQ9geNsQ=;
 b=VtrjFfiCndXqzCo/5eDEJm+nEtFY6MuLu5QbRFLOJUVvq6W+kZtk+Fq+bQtFoye2/2
 n/KtUcKFB9vFFPWnq+GmtBhEEOAFU91ImhnKsr15NKYrmcCJxE0tCUBFMtiop73bNggY
 y+Mt03tJLsKJg0lbS+T8IMMRWiybyMuG4ejmL/CekpO63nd6//xyuB5Ta5QKvu0AuysF
 fsNU60n+mLHWrOvSqF3KQMvRiaz7YpEOvSEPLGIQYbs9t3xWo4/ucMl9Ob/XgCYJroFa
 ob4M4QgQhtl4paXB9b7QvXHy5tdP+YjwCP3WUxGZro1uAQBeEuqPGHEy+9WJv07QXPlc
 S6Qg==
X-Gm-Message-State: AOAM533yNlNgw0WScqNopwh7PhCnexyHRhQZAhwoyugWzjSxQxm0pGRa
 n8vv4AUnvrtUkpBrsoc4XXDqcNPrvzgR8zvBEEue8VqwArIgQHOcR+/okfQp9XqrPVb5F0YU7ov
 SKqVsBDSDc1OWu+G5CFIugSVnmMLhz6RPzzqHlf0umftH1ZSVPg==
X-Received: by 2002:aa7:c703:0:b0:410:b96a:6bf with SMTP id
 i3-20020aa7c703000000b00410b96a06bfmr26705736edq.439.1645541997724; 
 Tue, 22 Feb 2022 06:59:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfSFtNX/a3KL4lHPEAhSPb3vHh30FiudcrzDoMBrPmGyj5vo81xOj/2DV7Q8M391vFSdj/vQ==
X-Received: by 2002:aa7:c703:0:b0:410:b96a:6bf with SMTP id
 i3-20020aa7c703000000b00410b96a06bfmr26705712edq.439.1645541997526; 
 Tue, 22 Feb 2022 06:59:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 11/15] arm64: dts: ti: use 'freq-table' in UFS node
Date: Tue, 22 Feb 2022 15:58:50 +0100
Message-Id: <20220222145854.358646-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070007_420933_DB68FD2A 
X-CRM114-Status: GOOD (  12.09  )
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

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 599861259a30..34aff40c6b8e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1257,7 +1257,9 @@ ufs@4e84000 {
 			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
 			reg = <0x0 0x4e84000 0x0 0x10000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
+			freq-table = <250000000 250000000>,
+				     <19200000 19200000>,
+				     <19200000 19200000>;
 			clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
 			clock-names = "core_clk", "phy_clk", "ref_clk";
 			dma-coherent;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
