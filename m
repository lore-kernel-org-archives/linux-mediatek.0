Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F908C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B4464E10
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B4464E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tdNv0RUYAhgg4mcUU19TeLVnbmDJmJPl1tYn+bv4GyU=; b=2WYjXquFVHwuoEY1a0GeXZ84l
	fdjGm5sqYWOCISeMBINBtfMb5REvlrk3TfqcitPH6FXgReAapSNUqybNdOwP8TTsl0psWwJlbmtdZ
	EhZypg8eAv1VqJXQZ2imdsqFCHGzKqPX+dDIJ0IJ8udSPP+zhYQIxxIEthe9I5FUlhkQrPFU9bdrY
	l5hi8zmCf2aFmrdC5Zh6k3obVem+Tq3mJJyAix+OAu0n21Q3L25UG8pGKboFgAcFQ+5c/HaP67HIx
	xGQ5/yLhmUN5H6MPiTnIIZsh8W8IOfsVzJmcYkseK13/Mu/Nk5X6r2sgzhsbiI84vB4V7tCFhEwOP
	OpmNWGadA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Pyx-0005E2-Pv; Fri, 29 Jan 2021 09:22:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pyt-0005CA-T2
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id 31so4912844plb.10
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKkdntMWDZy+eiWvpGEbl6K4V4PyDtJ2Lkb/5Ec2zno=;
 b=NUT9OOBmMJjLfT1/whNjeztSfuBpB4Qmf3qZzRGQNXB6lTtADVTwNO2rsNTP2CmS2P
 vmdlYAMiLle/rL2gdfpSjA2oRT3NEjYiCZejicDdOVCN6WaWL4VkiTuDgBZ44TULwvYw
 UUxwwMKV5VyJxuE6zxu57ZaZ/kjB7hK/M8u6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKkdntMWDZy+eiWvpGEbl6K4V4PyDtJ2Lkb/5Ec2zno=;
 b=YC9T+aPJGVRb6uA/VubCkfKC0cSdd4TSSzFfy7Wx/pn21EmC4UtVvjjSJavZ6w1mBa
 0ow5wENXq6bWZKtCcQDX13Un+tuSsb5w5ALDTL20IIyEuZuBMdaO6u7iaspJur1xTIH6
 pEUv9qHN+WMkK/6neuQlOLsWmNYIbBbD2NiuFmQiByAdzHB+kUx12xYRTE5B17KKDXbm
 5Rl2l8rowr2ECtXawigo/J6/Q7qu/r7LcTnAT6ZwecJ5gocdU/WLMBgCTXVfNavE/4eh
 Ar5YZxzbpAKi3nwz6UdG48Hos+EvDHN4LsyAfXzDUuZttxJPOpwDR/IN4h5YBvefRIPF
 Q3Uw==
X-Gm-Message-State: AOAM533p3jG/cynPax00+zLkBTNgsb14iYQOXxIVh/CDK/05BhYr/iee
 BoeFCj2sHwdr2YkfnOQtbdiutw==
X-Google-Smtp-Source: ABdhPJwyqNacB1GotJvsyxIvuCNLwicaApsl9qK+9ec7iuWopBibM4gR92Jlfy9MUVxsyBSTYEjJ9g==
X-Received: by 2002:a17:90a:4607:: with SMTP id
 w7mr3721707pjg.148.1611912137468; 
 Fri, 29 Jan 2021 01:22:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 1/8] arm64: dts: mt8183: rename rdma fifo size
Date: Fri, 29 Jan 2021 17:22:02 +0800
Message-Id: <20210129092209.2584718-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042220_140378_25DFE897 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

property name must include only lowercase and '-'

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7e..6c84ccb709af6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <5120>;
+			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
@@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,larb = <&larb0>;
-			mediatek,rdma_fifo_size = <2048>;
+			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
