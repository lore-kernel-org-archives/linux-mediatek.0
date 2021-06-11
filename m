Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008DFC4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCD661285
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCD661285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pipegBgcV0dxpAiyQsE+OCWYxSTWHlfnVIGdVDkySU=; b=4+l/pqT1KFwshh
	Zcp21ltXnyuST2e88puLDHFU8BY77O7WBVyE+px1Hsb/D4KytMCAd7LzZRGEa+P7/VtOGGbpJNkIj
	yyMPgDtbWif7fBOX59iXYIc37dRH1BvCd/ZOQMhLhi7l6nXV1NqAJjoj4cMVWDZGARjDhVnhXuGnH
	c6mQXN+CSlpqrUPYqqGRxjh9/LtP1Yi3rpoWRHE2zh3oapQBfYjsImGThGLY4QVHjgFIoUx6R5bHS
	Fn+BrP3sSqlRJcM4g9lTYEoRKEspJzcQFDGOItFVGCU7iTq66e6hiGRONfvtffmNAhB40zaEAcGoR
	Dguayht2NNyGgN450wsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYOU-003SBX-UD; Fri, 11 Jun 2021 04:03:42 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYNr-003Rlu-Gj
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 04:03:04 +0000
Received: by mail-pg1-x535.google.com with SMTP id q15so1382890pgg.12
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NTjSTyDbstdRnS22JDnlh2GM3XC/zF1/Aj3ovyt0Ug=;
 b=GknmA9cuNibjqKF8cukI4rUCo+B6fVFFXRyPcRKfLjX4ZXbTFbCl6gWfshWkURvf84
 EvbRrBCv+iiKrKfsCmSPKE20I6McwpduzhDQ4gfI/sotqwG8MS70vsQrBcMu48EtoZte
 QmI35afo4IbvUL//F1J6XMpC446kgR7PkfVXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8NTjSTyDbstdRnS22JDnlh2GM3XC/zF1/Aj3ovyt0Ug=;
 b=bDMcZPIwUo2JTJkwxPKpWhdLMdKsknEF8t64P3xYQ6Y3FrpEtA5hBi3ngF6PRI3niT
 EidxArOLcUZRDrgdXEOcwwDXKmTVNM9tCk6UeSzH2hdo9It+BH58b0DzkSLv4T3dhg6R
 uWLPnRuRo1BtfrF744FjRHG54TS5ARCbYNxD1RgGlzSMTYOXjJvm54ns4QiDGrKanUJ4
 RkRjVLSSaVCWzDMVPCF7ryXGeZr467I6Z3i75XC7vO27RQddG4MtGfnWmjzF2bsKwmpK
 Cj6IZhVy/CRmJWXA4KmYmcqzhlQRtcB8Knc2/I4lYTKvI7VXABR7Sml9qcL1NvZmU3S1
 8Rxg==
X-Gm-Message-State: AOAM531iK6VnbVUeegdxTpOxks6e6e/yserEG76bFyXh0BAywmy0VDOB
 lVpQBkTsHH0eoRSHSAZSRekOdQ==
X-Google-Smtp-Source: ABdhPJygCJuW3iIEdkZVUkAyJQQoZ3+nFNvq3EnLuT+EJTj7D6lLuOFZJ9Gosw6bD409Elv0aczATQ==
X-Received: by 2002:a65:528d:: with SMTP id y13mr1648004pgp.276.1623384183064; 
 Thu, 10 Jun 2021 21:03:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
 by smtp.gmail.com with UTF8SMTPSA id a25sm3599170pff.54.2021.06.10.21.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 21:03:02 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 8/8] dts: mtk-mdp: remove mediatek,
 vpu property from primary MDP device
Date: Fri, 11 Jun 2021 14:01:45 +1000
Message-Id: <20210611140124.v2.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_210303_628128_308D5896 
X-CRM114-Status: GOOD (  10.01  )
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

It is no longer used by the mediatek MDP driver.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 814f56d59e2f..4020748ae446 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1055,7 +1055,6 @@ mdp_rdma0: rdma@14001000 {
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-			mediatek,vpu = <&vpu>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
