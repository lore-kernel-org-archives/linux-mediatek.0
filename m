Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4257CC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A6D60FA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12A6D60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LXIATKb+CsocWtJwDQ1oi+z4L/o0JAHGzCVXQh4DoY=; b=VpZax4S+rdy1Di
	X9Ty83cg0V1S2tyOozvZYnY+f/3wjFfeJyJSzOa0Y9hVOcyVGKYg2s9kiHh1MtCxETmXibn5zsKG+
	5HPzH4vNrBPXVGpUSJ7cN8rZKwW9A6I0t3txj3uWB0xfyL5Nvdr0hifJQ872prFbdDLtuMXWvWeXZ
	SK6IsbgT7yqAsAebonJXjNa5vCp88ndGbC14X/hQITCnov/RYWC9mOYVk8yd7fccFMUILtIzSTnJ9
	XyKqTCj63gLB/Tw2uOgr4v9kk4uvH+HwgmuLVObh6a0e6tvks0LugkTKwV5kPfU5qgmXp6a+Th6ij
	5ibr2KtQFp5jmbBxVJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAWry-00G9nJ-4f; Mon, 02 Aug 2021 12:16:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAWoy-00G89u-4d
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 12:13:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id z3so18051469plg.8
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evSHLz+4lNWA1wocPlr6Y/PTZYLO3lc3/HELCGdrACQ=;
 b=YSApFs5j+k2H73a+L1BNT9+q1XyqgEUnnviS0LX9f02fjTbK8BRORyy0OeqXf+2Akr
 gRQ3CKxc282UmhLCDUaMoWNYAH4s+tHIBAUt+nfSy+8YSj3aWgh9LUUOomOW0YoyDucB
 19bj4rIWcNxSb7uGQ4IBbe2n/FdrYR01+kxM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evSHLz+4lNWA1wocPlr6Y/PTZYLO3lc3/HELCGdrACQ=;
 b=mkif4OjdeXVAHqApF8A/2E7mNBy3XeVYoPlRZKYJaDTPNZ5t0UekvP7KGWWG5EFQgI
 LzncPFXGx4vKIF9lrcR8zlwrm12FR8OGQs6Jq3AUqBFzw9ZAnbQuITonHVO80RnaEzeg
 6SAK9inSm0jjjGNx3m0cSekk29x3TfI/2UJP+NyU4iYTuq3wPxu9Zc07c/rnloY1u7DT
 orz6KuFuAAcXpRiWPxxc5twvTqIIcmeeothC9hW3icc2fsZQNO1qJIQHNv8xWNuMwDJS
 7rGmyQSfbw7TaVb/Tcx2ZXbjjw7pLoqT33VzSGZoEhTVRTYGbRzck5JJgTy0AKyI2I5+
 Ld+A==
X-Gm-Message-State: AOAM532ml0xxCnZv7cv/e9yHZkMRHfJ1xj+8uq8eEzQHGJB9KIoAGarZ
 btZwAsh3T8qiuSLWd0RCRaFfrA==
X-Google-Smtp-Source: ABdhPJyMcEQ1oS5cazN7DJMVgqfk+TFt9nioGxs8aVS0gcCs7ra+9cu8JMdrbm9zXFDO7EkpYs3szw==
X-Received: by 2002:a17:90a:c912:: with SMTP id
 v18mr16846980pjt.135.1627906407125; 
 Mon, 02 Aug 2021 05:13:27 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
 by smtp.gmail.com with UTF8SMTPSA id n12sm13435252pgr.2.2021.08.02.05.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:13:26 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v6 8/9] dts: mtk-mdp: remove mediatek,
 vpu property from primary MDP device
Date: Mon,  2 Aug 2021 22:12:14 +1000
Message-Id: <20210802220943.v6.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_051328_216459_8210519D 
X-CRM114-Status: GOOD (  10.31  )
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
index d502073b551f..872427748110 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1010,7 +1010,6 @@ mdp_rdma0: rdma@14001000 {
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 			mediatek,larb = <&larb0>;
-			mediatek,vpu = <&vpu>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
