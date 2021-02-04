Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83CBC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:00:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7812D64DBA
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7812D64DBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UY1Jmy+mZ25+ICa8LRlQ1+zvF/5zMjnF+mfC00/yQrM=; b=0cHlPkeWeTiAa2IE69h4GaMKfx
	spVpveZKCmNy/4fe/ls/390fv1Nigo4yP4dObFBIE+TOB31+mMeWlHrDRG/ozyq5N1iRhvuYlkzUF
	Qo8JTBk3YK7n1FWaIngqSuGil1cMeQlH/BkDOEg9FZh/a+uAacwOgdw7yfQ3XdLajTTkUb7uZRvtS
	7WylxZrX+Nof8N0P36hKmrJpAfnnTcu95vjqHL6pABVNM0/kBO9bN6QqZjfZEwJeyiBHp5Gn+LxK4
	cQtJ0LoWPA4e/6Rh4CaRyOFPnEZQo8+sLTMhFVrPo2vW8QBHjwQtLYFiNWa02X6I7TIer1RgMg/BW
	puOGZYkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7g79-0006Ru-Qp; Thu, 04 Feb 2021 15:00:11 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7g75-0006QX-6A; Thu, 04 Feb 2021 15:00:08 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l7g6z-0005kW-QQ; Thu, 04 Feb 2021 15:00:01 +0000
From: Colin King <colin.king@canonical.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH][next][V2] iommu/mediatek: Fix unsigned domid comparison with
 less than zero
Date: Thu,  4 Feb 2021 15:00:01 +0000
Message-Id: <20210204150001.102672-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_100007_333649_3387D1F9 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for domid < 0 is always false because domid
is unsigned. Fix this by casting domid to an int before making
the comparison.

Addresses-Coverity: ("Unsigned comparison against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: cast domid rather than making it an int. Replace L with : in
    the commit message.

---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..1f262621ef19 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -645,7 +645,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
 
-	if (domid < 0)
+	if ((int)domid < 0)
 		return;
 	curdom = data->plat_data->iova_region + domid;
 	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
