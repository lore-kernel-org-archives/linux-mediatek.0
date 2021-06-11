Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16089C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:22:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E8561287
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E8561287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tbf3QVJkQIHOt7013tS9/+B3jNj94Qmzfi0y6OcmvCs=; b=TuS317CV+wfhM6
	PgvsUiMxzHTACNrctIHH19ZRFq1atTZrw6atICWneX+A7skU9f9S6ERK0b6Ke5ZyrYz10f9H8X/Ar
	yjEDJmrEel9H6lL4OtWbMN7vOojAXoHeLyPwpNn9y0AisT2LMRrm9tv3KZJv5Uolj5C4PtQQ1JCKc
	Hi9r83koXiy9tJOLzZk1SBy456bwWG0gKpVniSvt2zhvlTOAKvCbdvwwv5/EvDM3H2jslByHtrrEA
	sLde1Err2+XOyFLPgCDOHQCB8HHYB/wRbEzcSAvME9A7BCYChw+RZJJ5nyGdmrg9mDFQBDSeHySbj
	XqxNHDIxFJRLXMzFvw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfEa-00502i-L8; Fri, 11 Jun 2021 11:21:56 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfDz-004zpN-8s
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 11:21:20 +0000
Received: by mail-pl1-f179.google.com with SMTP id 11so2668289plk.12
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 04:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=kk3HFX3t7+pm4U/kjbmmasXspVI2T+d5ttTTpONnlHt9FJYS47YoPl6FI4PGXes9Wc
 6QS1tcKLLxH/Y0PD3TQ9KyiAySH3iNieFqIF9+2m7FSXNetsYOKvLEh6swUIljF9NFG0
 2eC5PsZkx/XLvDuBZG5ZICFggERngLC8Vp8Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=khR4hSvocM2fOBtCRBBgn4OwzrcIMZVmPDt/69NgUdIVwXdqV4fIzJqd9pNVSujpbK
 8kONvifx58kv0NQN5OxN30NSYWjc5E5drQV+UfG7hPn12p/VfSHzrfKCUVu/XNSBguJ2
 9TVM4ciduX3Au5AuhteXj5/tqgdW1T4l+jOLue2qH+qmFyVfZVNfI7lpId5sW6g9iZf9
 XSud2wLo6lBreNV7q0QjIDQ6C/WwMASYWuuFdsOItthC8Pywrt4SuVJxe975yuDlG+pI
 zB7q4OHgm3RRotYud8+KCvgi/56i9gRTsc+n9FAmdGHhkbxZ/WigxLy/KQMkN336MGqO
 +MPw==
X-Gm-Message-State: AOAM530uDK2m+uTrToxxYmBKBWaZ7qZvbPoFU5PqisNHkHE1dJItcB2J
 steALcDP0inJf53xpyRz8+HmmA==
X-Google-Smtp-Source: ABdhPJzduBIz6I4dCv6hcEL/NSQSitCklTwTnFZIr9rbFuPwFRYv2RhdaiZve2JcmaimUOSyRSHFlA==
X-Received: by 2002:a17:90b:3696:: with SMTP id
 mj22mr3994602pjb.42.1623410418179; 
 Fri, 11 Jun 2021 04:20:18 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:73d3:4412:54cc:752d])
 by smtp.gmail.com with ESMTPSA id y5sm5177189pfo.25.2021.06.11.04.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:20:17 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v4 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Fri, 11 Jun 2021 19:20:09 +0800
Message-Id: <20210611112009.2955944-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611112009.2955944-1-hsinyi@chromium.org>
References: <20210611112009.2955944-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_042119_344318_3E4DD231 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Maoguang Meng <maoguang.meng@mediatek.com>

Add jpeg encoder device tree node.

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a3..d54b4532fc3f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1329,6 +1329,18 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg: venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb4>;
+			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
+				 <&iommu M4U_PORT_JPGENC_BSDMA>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_JPGENC>;
+			clock-names = "jpgenc";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
