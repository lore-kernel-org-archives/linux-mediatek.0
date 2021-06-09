Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46725C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 04:51:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039DE61287
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 04:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039DE61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJXg7tDuOfJYLFvK4V70YH6cUJY8yudkvF2vici8iY0=; b=nzmTQs8Y+OuUTq
	9jaPECl5yNC4sohe6VgW4elDlgUCLfvtzWGeqRYy1nQ/LrahemjLAux2RIAJj/jsjvibt02UnKNt8
	cYxP3TtmGKNtNdxuFVLzhdij1u8NSnd15hUr1bfbjH9zXbUmh4TRRqav/a0qen51CSPYlbYwQ0ppR
	+EfFlm0qnFK2VGuehsmTcwqG7ravKMxb3a7TvCSafl3Wlp5Wte/R18M9stxncXYIzyEuH/FpBFbJh
	FQLKQEwaw3dT+Dnd/eqwVGpxBCcAcg+dinXPio+eClw9dH9yW3TkXp9Isz3RFBlURAU5+ANtM2+kA
	KD/f0qam0O88d9YbCCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqqBH-00BhWI-6O; Wed, 09 Jun 2021 04:51:07 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqqBC-00Bh5d-5n
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 04:51:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id m7so4539292pfa.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Jun 2021 21:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iYok65sFwc6WEDcag9xh0Hf6j7gDgq0CQ1KsKHhgvjo=;
 b=IiKc5ndp1M+CHWA+wdg+354lmwNXghTKdybF8tq0RZvCL5COD05uofXz0TjPvIqrWD
 2Zd0UlSBCO8bso5l3lOkrxIqxpFUkoAtZW9Vodvtph2lfU6bzvov7tO/ZuOj6l+ULzzt
 HjWDkmXNfdxxOHBFRr+e80s0Z+H6fkvwtboE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iYok65sFwc6WEDcag9xh0Hf6j7gDgq0CQ1KsKHhgvjo=;
 b=DZrVpz9TUS1IeJoYejRuiWvqk3oNBDVVycb9zEIP5NQ6w59HkOMVG7s+uX26FMKkwB
 zorOoS3OvqDsDQFO0S2XBluQrUNloFqNXECNA1bNpOMB1Flr706fOeuVx3Qg8JFoFl5m
 i/mFuAjK7oXieFkin0Gyqiw56A8WtwMz78+SAutrkq+o4HALTHMIHtAIP563YHkv28Ps
 pIZU5zZBW0aX+o5UVe2Ol88RzI5xbkXQrpWdCwja9ysYvdgfY5TM2sKX8dfLsHPq+dw3
 z0cti8zCWmOE5elg1xfBjb867m5Bs83PjzL0lGMcT9L+ONHmKPZDrNoZfqwthXAaz4KI
 jQzg==
X-Gm-Message-State: AOAM530iN5fD/kPDahEitsKVGxyqnLuILzsiUROr0rqfGh9n2hi7FzZn
 9FtUOo8pMaqB2dz9ksSzsy5YtotPzpms7g==
X-Google-Smtp-Source: ABdhPJzu5e6c64mB7KD2PoLwdt2R2dL9vCR7lWw3zZp8Cn9JbjCwrAk24pXd1HLgFvQL4XbwwXG88A==
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmr3335696pff.49.1623214139561; 
 Tue, 08 Jun 2021 21:48:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:83f0:56eb:3535:6bd5])
 by smtp.gmail.com with ESMTPSA id h18sm12865110pgl.87.2021.06.08.21.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:48:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, maoguang.meng@mediatek.com,
 yong.wu@mediatek.com, tfiga@chromium.org
Subject: [PATCH v2] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Wed,  9 Jun 2021 12:48:54 +0800
Message-Id: <20210609044854.393452-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_215102_244523_DE7A43AD 
X-CRM114-Status: UNSURE (   9.02  )
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
v2: rebase to latest
v1: https://patchwork.kernel.org/project/linux-media/patch/20200914094012.5817-1-maoguang.meng@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a3..fffe0c52909ce 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1329,6 +1329,17 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg: venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
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
2.32.0.rc1.229.g3e70b5a671-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
