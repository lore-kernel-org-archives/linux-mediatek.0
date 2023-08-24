Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0FC6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P4XtuswCj5NJ4ljKORmSqie4pBZOU6uSzYQ3SfzIBS0=; b=EuAQW/IbTKcXl8jhQT49lbOQVK
	RHmFmwHcDXudqiw8lF+bQHz6pORUfMu4pKbmQxQLIvXo5GWMvCJir8PN5Pg3a2MGhv11bznYioZSq
	u59BtcjWnuK3MajVtP/sJ8X2RWu0tRw8i4ptlNR0/bMJ2XkTrELg2c1u65HXebEIeOyYKtyag1NKd
	AUpci2j5w8UhOLkdVOxTG5+wZzRyGBlqgoeeDarxcc+8wZZwok4uWT+KYiC37r2p9FwQWbHQnxpSH
	0wzi/kROLVDb/1o+L7BeKSALEkKODrNMqzN/98CFcpo6ivsAmDhPjeoulMhQGUMyBcQ9i91h5eJde
	/byWzwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZA6a-0037Qd-1J;
	Thu, 24 Aug 2023 13:10:32 +0000
Received: from mail.astralinux.ru ([217.74.38.119])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZA6W-0037OM-24;
	Thu, 24 Aug 2023 13:10:30 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 641B71866664;
	Thu, 24 Aug 2023 16:10:12 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fThewjPZHioT; Thu, 24 Aug 2023 16:10:12 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 17BC31867F66;
	Thu, 24 Aug 2023 16:10:12 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uK8xMjecZl51; Thu, 24 Aug 2023 16:10:12 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.233.235])
	by mail.astralinux.ru (Postfix) with ESMTPSA id D2124186765A;
	Thu, 24 Aug 2023 16:10:10 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Joerg Roedel <joro@8bytes.org>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [PATCH 5.10] iommu/mediatek: remove redundant comparison
Date: Thu, 24 Aug 2023 16:09:54 +0300
Message-Id: <20230824130954.29688-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_061029_186954_8E2CF27A 
X-CRM114-Status: UNSURE (   7.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

iommu_device_register always returns 0 in 4.11-5.12, so
we need to remove redundant comparison with 0

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b16c0170b53c ("iommu/mediatek: Make use of iommu_device_register i=
nterface")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/iommu/mtk_iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 051815c9d2bb..208c47218b75 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -748,9 +748,7 @@ static int mtk_iommu_probe(struct platform_device *pd=
ev)
 	iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
 	iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
=20
-	ret =3D iommu_device_register(&data->iommu);
-	if (ret)
-		return ret;
+	iommu_device_register(&data->iommu);
=20
 	spin_lock_init(&data->tlb_lock);
 	list_add_tail(&data->list, &m4ulist);
--=20
2.30.2


