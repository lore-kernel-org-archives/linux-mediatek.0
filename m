Return-Path: <SRS0=FQm5=LG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86B0C48BE5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF226124C
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF226124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tbf3QVJkQIHOt7013tS9/+B3jNj94Qmzfi0y6OcmvCs=; b=E3i98g7zDBO/C5
	ALtqNLp1FcHh0TKp5iBUFMc4YBlGfe+/SBd3WdDxtsI5YuC0vak1C7ZqoFmuDlDhhtC0C21d6yCsr
	46jzI/sgMCHuosWlBkeXBDqJJBym+RG4ahxVnfoK0qj+n/UgLDkgXA7UGZH+GGMd+CyUrBTYdORlz
	ybFaP7UowN8Xndxy21bqQWW7s4xcVTlDgX33+/BrlXX78u11OHeGUetogRb4uSChBxV27woyvAHtv
	MQPqsF7cu93kw30FIlgDGrfkpbPthPeogYqY3PqmYSLsDQzFnAsDIihaHb1AUJsOi7Ap0ZUHQhvuo
	f6hA+4QBmoHtMGeg1vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lruC1-007ers-E9; Sat, 12 Jun 2021 03:20:17 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lruBo-007ep0-NS
 for linux-mediatek@lists.infradead.org; Sat, 12 Jun 2021 03:20:05 +0000
Received: by mail-pg1-f179.google.com with SMTP id j12so3977122pgh.7
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=iXquLxweg3SptlHKfWh1N9xBYQVkWZU+sg8cR2LhTOsGZuSLC38gAQ3ayu2fXU/VDI
 4dCEYFZNzQAHfCoDNEQlOWz5o4Rm6+m40HjB5JXP0AqBNLvmhsCQteXRJl6BllHdtMlT
 JwmrP6sTE4Pug/FOpvakWoWM5eLQ5ujnYnHqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QwvH5bGqHeUyZVp5Ps3bAzGRgv84nKw9pL18XwdnBM=;
 b=ALaniKJqCCgt4fL4ZE7bcojAOhElhcwBeq5yH15LTn4LwlNFJYPbamylShIAgM5ana
 k0yfdWquIixOB0MX6T4n+co0/3F5Ou01ksDoaPxxVwXrcVLbyZhKwx+NUgXbR9lHpj5U
 fiyeWQ0zzkpycWzx93dXezYJkyGk5DkaDEb7aOoNtFM4H29uNQrR42zb6fctaKEOFc5H
 OMxZFdYKAdSsLQ4kz/RgsASC1iRmrix0aC71ILAZqfDuGghNQAqtaGosjDLE2W5Vv/ww
 gIv8yDb9OuDeZcvhKOeYIUtQQL8xA5PkuUEyNH3sGlyjfMBRMmuge/JoOkjs4R/HJxPA
 NcyQ==
X-Gm-Message-State: AOAM530y+ZmPg+1WElH3ShiiXtHoMQDwLRAr6EXMA1NzIPCIF1v0Nirx
 Z6UQgp+LV25PvVCOWVKFCjAsxw==
X-Google-Smtp-Source: ABdhPJyWlvLaCN0zazKtkeyI88Zfmd5LHNUF4MilDnvjYVTdK+P5DUEdpdazd43Qm0f/JEM/rNbn3A==
X-Received: by 2002:a05:6a00:16c9:b029:2df:c620:8156 with SMTP id
 l9-20020a056a0016c9b02902dfc6208156mr11231224pfc.40.1623467943989; 
 Fri, 11 Jun 2021 20:19:03 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cbbc:c8a0:4601:2039])
 by smtp.gmail.com with ESMTPSA id h5sm6688519pfn.127.2021.06.11.20.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:19:03 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v5 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Sat, 12 Jun 2021 11:18:53 +0800
Message-Id: <20210612031853.3115482-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210612031853.3115482-1-hsinyi@chromium.org>
References: <20210612031853.3115482-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_202004_784793_F4121871 
X-CRM114-Status: UNSURE (   9.57  )
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
