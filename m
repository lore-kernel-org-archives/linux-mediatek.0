Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904CEC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:17:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CBD02075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+vQ5FCu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pAmuNmpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CBD02075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V5bWYYzEtXslsIkimrTKkqTqB2wz2ZLT9RVvHPV7ETg=; b=W+vQ5FCuqig8JGynXgKrqO5iD
	adcXFvSlQosF7TEE+qULcgo8DFRk/Uo9I6J4fYXj+CGStXTY9Od5xXSiiyE48wmPwHpnpNBLpCnz8
	A4JNeTck/9ti7LYw8NIBurHT8KnlfcTk9Bi5MsH9LjRe5wo3oHqRtnl61in514LE7F5HASwIg2O+p
	5fRlEijt0ce7kfcMLhHZyjM38F481tchpIwQzR4vzZqiudX+e+VAKDRsmLohFCz5Q6rMJsxRqwnPs
	5l1L7fg5P+M3ilmwPxbtBWJ3GkMv1xZtbPEVSGWFBWge1F2QYUlrtfOLb8MR1iUEEVmpYxuZFF2A7
	+8Cdolw3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWMk-0001nw-8X; Wed, 30 Sep 2020 07:17:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWMg-0001lY-GM; Wed, 30 Sep 2020 07:17:28 +0000
X-UUID: 4e2ec0b5ecdd4c79a6c070113dec36e2-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u5tqR9ENhht0ilsy0f2kHtyPEnKLMCniBaBxwf4wdHg=; 
 b=pAmuNmpm4zZR3Bdo3+QuDPMQfSnZs57hZyYG6HqfDXKPIrxl8t8HzXKA/w1tvw0PDs/vXxnvPyWpuCyn2VNJG91OSLeTerdWXI6q5Yf17ypAhfW63I3vfzj+X7vHZeaoj0oJGzhAWA810/FMddTc9pVIeRA+qSl0j4Ml6108quc=;
X-UUID: 4e2ec0b5ecdd4c79a6c070113dec36e2-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 421227825; Tue, 29 Sep 2020 23:17:23 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:08:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:08:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:08:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 08/24] iommu/io-pgtable-arm-v7s: Use ias to check the valid
 iova in unmap
Date: Wed, 30 Sep 2020 15:06:31 +0800
Message-ID: <20200930070647.10188-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031726_671585_B84F07E3 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the ias for the valid iova checking in arm_v7s_unmap. This is a
preparing patch for supporting iova 34bit for MediaTek.
BTW, change the ias/oas checking format in arm_v7s_map.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index a688f22cbe3b..4c9d8dccfc5a 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -526,8 +526,7 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
 	if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
 		return 0;
 
-	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
-		    paddr >= (1ULL << data->iop.cfg.oas)))
+	if (WARN_ON(iova >> data->iop.cfg.ias || paddr >> data->iop.cfg.oas))
 		return -ERANGE;
 
 	ret = __arm_v7s_map(data, iova, paddr, size, prot, 1, data->pgd, gfp);
@@ -717,7 +716,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
 
-	if (WARN_ON(upper_32_bits(iova)))
+	if (WARN_ON(iova >> data->iop.cfg.ias))
 		return 0;
 
 	return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
