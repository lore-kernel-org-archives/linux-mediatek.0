Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18825C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC09613CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC09613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tbf3QVJkQIHOt7013tS9/+B3jNj94Qmzfi0y6OcmvCs=; b=2LYvLZQAJEerYX
	V4fqYqAynXuAPWTVHWfIe9+0yZyqFWsCaGDnLG9yXhZP2aonIGXZC21X3+jCTFZrX8ggTQHaRower
	ANNsAr2mNhpDP2Rvg5xHIHJq8+Ca70SypKZdZy9pm0jaUnRb/CtYdOa8bmCrdtaKQmH1CSTipXILr
	/5Howfk9hElDnxnb+pnr6hfhyWDUWQNCfnitpw+lpN/uIxy/WRF5yR5MuszlhgwCgLntId5MSCaPt
	5lYljfL0mC6drawiXszAb0uZhYIKUOgTQba02VwNE0ZDR1aOhVRTCUa6qGYT6HF6vHYOKegtvbHey
	pkolu0g2RJCbntT/12FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrdOm-004VRJ-AW; Fri, 11 Jun 2021 09:24:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrdOX-004VPO-MC
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 09:24:06 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q15so1943747pgg.12
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=ey6HE0fb9KAEDfEWIZh3oFrtGw/BoGsTFqloJaswiwpoMt/DR28azQo9+50y5K3znM
 FNj88cAGhYJ8Anruvwblc8X22JmeK83xohuaowNTwMBY2Uwpk4QSBvCtbt0vkjXtceeU
 qLq1sXho4gDKjdsCkDw53Lfp3okC3VEAsFIxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=L+ukDo20ffhBPSbIsbZ44uXx5PldH7n33yLeF5gdbMm3OHk609aCgjxfkBl7J1+zN6
 1tha3/7UrYUhH5NfBygY9jt18wK3Mg2ZGw+bZr5/MPRzH4CR3JQ1r5rvTfT5v6FHphxF
 KnFETjdJ50WsaEm+QSqk+qfUn12iIQRW55QpH9/LO68AJNnpTquRL2cO0yYtmguGDhYN
 365PlI/o6Q4p/XEIeIOLi7xDjL+O+SCqLm2XRCL3k7XslRrkUFJ4ofHl6rWSX5KoBb/f
 W/0g3xM1B13H/HXyzqwpKCe6WnLVPF6Fezy7BfWD1aUxUuz3U6RMVcl3gzNDxYy8Hk63
 wEbg==
X-Gm-Message-State: AOAM532Ubz0NT2JrxQGZdTwBbp+ygOk5ByuEqeTaLRWUWpBb583epyzg
 b7KsXj93GPXvfZV2T7COV3w+1Q==
X-Google-Smtp-Source: ABdhPJwWYRTeSrDgmFG3zwAghCTIJNKEVaANebghOER6NvuMljh9UqdjztrUIFR/kQaOdRCnq20ZVA==
X-Received: by 2002:a62:3782:0:b029:2de:903d:8640 with SMTP id
 e124-20020a6237820000b02902de903d8640mr7502174pfa.40.1623403443126; 
 Fri, 11 Jun 2021 02:24:03 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:73d3:4412:54cc:752d])
 by smtp.gmail.com with ESMTPSA id q68sm10394037pjq.45.2021.06.11.02.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:24:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v3 2/2] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Fri, 11 Jun 2021 17:23:57 +0800
Message-Id: <20210611092357.2930310-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611092357.2930310-1-hsinyi@chromium.org>
References: <20210611092357.2930310-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_022405_750465_0C347270 
X-CRM114-Status: UNSURE (   9.88  )
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
