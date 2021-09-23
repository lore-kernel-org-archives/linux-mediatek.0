Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C98C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEBE60F11
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FEBE60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIankJPFb6XUAjEBYiR04cVOlh49e5suolofjbi/zBA=; b=X0sJgSEz6tReau
	x0ScfEwKebO+k+h1KXZkwbZknnTHmCZRnPTGRtDtmOsxcM5+mbVbi7rtqqQHcFc+Doy5lEZk7BWpi
	JGpQHf9BgDfLQvi6FmwsyOqnUH0Zbp0sPMvEoL+sLW+Fr9+IYUEsZHutNnsZQzyGyb3bqUY788Ih8
	WGRQyX4Az8VoZAFM2u4DTQXEOOSOXQcRve/PQrrSy25t1UkUAK/Od99shRxJZb/IyPDC8VfnSHp1f
	lzPMFkuQS6Rxk0kPUxlQs8Jq/aBHcIF/wIWqd4O0hNcInN14wpVJh2UNc2X+35BqrjHQPhVxxgYVs
	OJ4Xj4OhktXth3//OjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNPo-00BBHh-GM; Thu, 23 Sep 2021 12:01:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNPV-00BB6g-7r; Thu, 23 Sep 2021 12:01:06 +0000
X-UUID: 6d4d8fc2ce4b4c8085c8b234664c0ec3-20210923
X-UUID: 6d4d8fc2ce4b4c8085c8b234664c0ec3-20210923
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233026155; Thu, 23 Sep 2021 05:01:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 05:01:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:00:59 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:00:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <yen-chang.chen@mediatek.com>
Subject: [PATCH v3 12/33] iommu/mediatek: Always tlb_flush_all when each PM
 resume
Date: Thu, 23 Sep 2021 19:58:19 +0800
Message-ID: <20210923115840.17813-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_050105_350135_4540584F 
X-CRM114-Status: GOOD (  17.92  )
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

Prepare for 2 HWs that sharing pgtable in different power-domains.

When there are 2 M4U HWs, it may has problem in the flush_range in which
we get the pm_status via the m4u dev, BUT that function don't reflect the
real power-domain status of the HW since there may be other HW also use
that power-domain.

The function dma_alloc_attrs help allocate the iommu buffer which
need the corresponding power domain since tlb flush is needed when
preparing iova. BUT this function only is for allocating buffer,
we have no good reason to request the user always call pm_runtime_get
before calling dma_alloc_xxx. Therefore, we add a tlb_flush_all
in the pm_runtime_resume to make sure the tlb always is clean.

Another solution is always call pm_runtime_get in the tlb_flush_range.
This will trigger pm runtime resume/backup so often when the iommu
power is not active at some time(means user don't call pm_runtime_get
before calling dma_alloc_xxx), This may cause the performance drop.
thus we don't use this.

In other case, the iommu's power should always be active via device
link with smi.

The previous SoC don't have PM except mt8192. the mt8192 IOMMU is display's
power-domain which nearly always is enabled. thus no need fix tags here.
Prepare for mt8195.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 44cf5547d084..e9e94944ed91 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -984,6 +984,17 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * Users may allocate dma buffer before they call pm_runtime_get, then
+	 * it will lack the necessary tlb flush.
+	 *
+	 * We have no good reason to request the users always call dma_alloc_xx
+	 * after pm_runtime_get_sync.
+	 *
+	 * Thus, Make sure the tlb always is clean after each PM resume.
+	 */
+	mtk_iommu_tlb_do_flush_all(data);
+
 	/*
 	 * Uppon first resume, only enable the clk and return, since the values of the
 	 * registers are not yet set.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
