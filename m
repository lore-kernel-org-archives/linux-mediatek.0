Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2C4C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5E1O6F8XFMIurLCllD6JGMVmsuqHQFoAO58kkivfIrk=; b=Al6k6fOgpOLn3rjFuDWOekUSvh
	dCg9JgOWuYesHuFi8Y8diHxJitMgD9l7WkhA3iw00NeWH3vXCpt+onmE/HdXS2UQYwqoXAWvhwPv9
	+uAMOJNSuxMHd7/s/TOjFTrF1PcXxZo32Je++WHBXNkB+F8551JFk8/QBPWiU7pTAjxJgsWRwi4FI
	JDR+sEQR4zILA4znp/986k41JAh0Aw9W35Fea4NTLfhTcQAW8f8P110Ot/Mc51rQ+C1Y8QobcRHfZ
	ckjZdY89QJZdByhoFtDLhw7f+6JaDUEqQ9NFHt/trsQ7PEOoKoTx03YTcmOGpkXMCECyAWtx2XWYQ
	cLqyboQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TDJ-001gdu-1M;
	Fri, 26 May 2023 08:54:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TDD-001gYf-0M
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 08:54:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d41d8bc63so589673b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685091253; x=1687683253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5E1O6F8XFMIurLCllD6JGMVmsuqHQFoAO58kkivfIrk=;
        b=UnwWb9DC2h863iCSINm0c8593AEcbSTqSTS0nIydcAQxy4ijGiC1l8g3dq3zHEueQa
         mvKy8j9rxBeD0sO+ZHFGrNtQ0nKiEHGf8VE+zNkFwoOREZKXTqlYsGRWB11GiqxGbDaR
         Kw33o3SFcqbx6F4JAKf54w+CVZiNXn9MFDrCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685091253; x=1687683253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E1O6F8XFMIurLCllD6JGMVmsuqHQFoAO58kkivfIrk=;
        b=YV2kMhfLTTIhUrwgci/flpwCwvbpE0S200RRoljJBWc7Kt6YKr3QjAV63SnJxikaAx
         4Gm+MkJ3V1ayKur9vhLIh0/KYwDmnhfJenuvcAhoE0z3z9fBj9S5QQtJA1CNfI0TB75I
         UlVlV/F7YeVx/E/AHxZ52so0R5CPJGSw5Hktz7DeIAtWuLvr0WZg2xrlfnumPb5pvsJ4
         WPJnO5QT87t8YYUC7Z2U9/gAKRic0KyFYC3CSWU5B4vZGlixHDb26yEMLht7hq4U6vmf
         +drxez8hEgUMMaUE2xXqf2XD/Or8ItOUcxNG2Lx2/h/Os27Vg9WiMiCkZZo/BitmpUkp
         QsfA==
X-Gm-Message-State: AC+VfDyoRdCvaO8LVn+dMOlwVwrPSxHlfg0uetRqgMd5DjqAW333cwcH
	+oHtXSIycGDOpSGtRdrMKPxgRw==
X-Google-Smtp-Source: ACHHUZ6j1OCMp+SsbHSsvJ+n1AMIMl1mA9tSeKDh1T6ew63dCD88XS43sI5XhoaDF57pLVfUrA6m4Q==
X-Received: by 2002:a05:6a00:218e:b0:64d:3227:b806 with SMTP id h14-20020a056a00218e00b0064d3227b806mr2748121pfi.33.1685091253571;
        Fri, 26 May 2023 01:54:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:17b9:e0b5:a956:4510])
        by smtp.gmail.com with ESMTPSA id l14-20020a62be0e000000b006460751222asm2344166pff.38.2023.05.26.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 01:54:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] iommu/mediatek: Flush IOTLB completely only if domain has been attached
Date: Fri, 26 May 2023 16:53:59 +0800
Message-ID: <20230526085402.394239-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_015415_154327_9EF3C01B 
X-CRM114-Status: GOOD (  15.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If an IOMMU domain was never attached, it lacks any linkage to the
actual IOMMU hardware. Attempting to do flush_iotlb_all() on it will
result in a NULL pointer dereference. This seems to happen after the
recent IOMMU core rework in v6.4-rc1.

    Unable to handle kernel read from unreadable memory at virtual address 0000000000000018
    Call trace:
     mtk_iommu_flush_iotlb_all+0x20/0x80
     iommu_create_device_direct_mappings.part.0+0x13c/0x230
     iommu_setup_default_domain+0x29c/0x4d0
     iommu_probe_device+0x12c/0x190
     of_iommu_configure+0x140/0x208
     of_dma_configure_id+0x19c/0x3c0
     platform_dma_configure+0x38/0x88
     really_probe+0x78/0x2c0

Check if the "bank" field has been filled in before actually attempting
the IOTLB flush to avoid it. The IOTLB is also flushed when the device
comes out of runtime suspend, so it should have a clean initial state.

Fixes: 08500c43d4f7 ("iommu/mediatek: Adjust the structure")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

I think this is a valid fix, but I'm not very familiar with the hardware
or the design of the driver. The ARM SMMU drivers seem to do this as well.

 drivers/iommu/mtk_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index aecc7d154f28..e93906d6e112 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -781,7 +781,8 @@ static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 
-	mtk_iommu_tlb_flush_all(dom->bank->parent_data);
+	if (dom->bank)
+		mtk_iommu_tlb_flush_all(dom->bank->parent_data);
 }
 
 static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
-- 
2.41.0.rc0.172.g3f132b7071-goog


