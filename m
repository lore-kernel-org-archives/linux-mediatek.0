Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0E3C4708F
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FD2611EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 04:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FD2611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENVLeGdvZW1WNH46LykUD3+5gHG6brUznhHw1nx4dek=; b=n1UYAd1raG6Ti2
	9ZTQidsh4EdZfbAvdppeZT93WaLaW+AyNZW5bof08mOYCGG7hKKgtNDrCX4pULmd1ujIT+GVTbbQQ
	SvYouOxK2JuZ6btA2ayzp8MXC5hI/zFaUfSoqmLSj6UwdSqg4dusSW9KzwjYNbZB9J7a7TTQwiC7T
	FgHTmotagUKgqMN5SZxMuEOkuS2x4zcts7tsO9A0CPQ7/dkhXHqvS8MqGkNQcXJtaRFn9KXxYKnTx
	lJyooJgGq+PmLKNmhUDJcWepIhDBsR04H4dhTSBOMnkOGqK2BqyD3cKf4yPPsSlQynnZ13JkVchTn
	CFCdSi78AI7LnxZQu3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnZeY-00AheC-NO; Mon, 31 May 2021 04:35:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnZdu-00AhSb-OI
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 04:35:13 +0000
Received: by mail-pg1-x535.google.com with SMTP id t8so1216956pgb.9
 for <linux-mediatek@lists.infradead.org>; Sun, 30 May 2021 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wS5m2z0kdK64AV2ytOX+ndcFkQ/Q87q9VVh0RznGUCE=;
 b=ohNQUgiFv/Fr1yPgaH6iA4nF1fNcnSHZKFgxhEAFnwjZTEMCaINRq9c/T5U3EIuJaE
 3ZNmPQWOsv0nGdzItO5F+G3bx6lLHnTVI+Fn5/VX4bVdNu7QbF+hCAXbOT2jy7Ft++jN
 IBXZsCeuCvycV5LrSpzECRpKsV4+PI8V9kk8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wS5m2z0kdK64AV2ytOX+ndcFkQ/Q87q9VVh0RznGUCE=;
 b=Tz9S91NFs7D5GfXhcW+p64spRb3AdUUcLpkeWGSsRSlm3/nsKsZhRaUDKdfrBgKL8l
 7VeYomcIhj9QlJDyjTC39ZIsdijANJ14HkqOr/kqzF08NtAxqwxS5P6nb/tm9bKo5Gnx
 1MeBw+fwlG/a6SbzpTCK4Sj+fdWAh6lZO85BbWtNYa7i4E7a+qRJLTFjphZWlpSxN3TM
 otyJEny0BfFX7hNhn3Ns0Tp5hVKLAizDO27dnTAnTqibAbQsvHDNBEvvXa2AercPAa1E
 RYfE5qj1GzstjYFQ0k7ydPMk186zC2YaFxye27YOqfYivwjL5V/nLG++7vyi2SiQvBl2
 gL1A==
X-Gm-Message-State: AOAM530MLYvMoVKmjjW7iobuVYWJgSrD8I2C4zOkj0dQ9YRgdDMo73Ry
 Vbxfocf0oqL6FYiZeRn0L45YWA==
X-Google-Smtp-Source: ABdhPJzOiquBBIDE4EvMprzcLUHuBhRfUOPzESEydjqntsXKkuvRcoC9aC3UWo9/twaTctBSY393ig==
X-Received: by 2002:a63:7d4:: with SMTP id 203mr7910265pgh.348.1622435709911; 
 Sun, 30 May 2021 21:35:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c929:9e58:1e99:bfb5])
 by smtp.gmail.com with ESMTPSA id a9sm9366811pfo.69.2021.05.30.21.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 21:35:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mt8183: remove syscon from smi_common node
Date: Mon, 31 May 2021 12:35:02 +0800
Message-Id: <20210531043502.2702645-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210531043502.2702645-1-hsinyi@chromium.org>
References: <20210531043502.2702645-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_213510_810931_2ABF185C 
X-CRM114-Status: GOOD (  10.79  )
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

We don't need to register smi_common as syscon. Also add required
property power-domains for this node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..e074c0d402ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1263,13 +1263,14 @@ larb0: larb@14017000 {
 		};
 
 		smi_common: smi@14019000 {
-			compatible = "mediatek,mt8183-smi-common", "syscon";
+			compatible = "mediatek,mt8183-smi-common";
 			reg = <0 0x14019000 0 0x1000>;
 			clocks = <&mmsys CLK_MM_SMI_COMMON>,
 				 <&mmsys CLK_MM_SMI_COMMON>,
 				 <&mmsys CLK_MM_GALS_COMM0>,
 				 <&mmsys CLK_MM_GALS_COMM1>;
 			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 		};
 
 		imgsys: syscon@15020000 {
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
