Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEBBC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8UWo2XovqgYHs1QY4JjTgk1+oCej6jXzZZznbbgyuDY=; b=DXCfkKFEsB4KTOaD128qDy94L8
	272/6DmK1UgH/6aBqDH3cs9bs8zryIZ4vaSGuXbKcGocUcl5b3frF+2/D/nODqvxfv1cslvJkre5X
	fRIRffrORWY0DHZCnl98t+EJo/CyFpXfzp3Tmv/W/QqEMR8u6/qKph2WQLJisP1ky05/YcUBgilIz
	GdxmofnuOdLDMUXdoHh19cg0eTwcqXyFhCITYVA6cWRyQ/lqWgJ1sqsPIvic1H3zi8mEL110v4RZV
	Zy2mT7+LA0uinHjSKtt5DhluNqn8URtM4m+0cNBK/rdcpOucWTvOPrbp18l5Qzf3/WAwaxU/6jUNM
	raklE+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wmY-006FTU-TM; Wed, 07 Dec 2022 15:56:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wmW-006FHI-Gu
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 15:56:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id gh17so15038453ejb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Dec 2022 07:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8UWo2XovqgYHs1QY4JjTgk1+oCej6jXzZZznbbgyuDY=;
        b=NIcT+iuluektAZ43nD5zND2pW7Pc6Jne9R/wMULrDfJFGi3VEUvXX1rJXafGRDitnM
         kAET1yXrKXXyXo40lWfPfDkxnEtfANlOJL5MmHgH0r6E9/38BKXryJbKsifW12TiEs7i
         98JieEasaAgLxnXWwA7NnJDAiByLxFAMPFq8U0OG4WSnCVLVf5EVzJ1OY67vdNOvYWLA
         5YKlMoY52hlo7l2oELGnElAn9yRysk2OLsDB6fDMtmZVyPOerYAqnufkgnCJsyjDEdu5
         RY2JqW33Cl10HzlsabUkgZXKxuqZZqRtz0b62+7Qi2b/BnFwZpD5Q7cIR7QIHPs2fvo2
         5oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UWo2XovqgYHs1QY4JjTgk1+oCej6jXzZZznbbgyuDY=;
        b=HdEe+dhyCCX5Owg9YrSABDTLZX3HWfbqG0NmZ3wNO642laJhygeNXOvb+Ebx9ekcNZ
         jbOYcRCTrPo3TRqLWDjRCiq/5Pc2N+xx8BCHIfTF1LevjTTP2GoWLAY3W9lpys9XLgI+
         wHHv1OBbCZ8kT7K/isSLzZEg9M6eZFWrzswZro+rDtRjOs3sFm4TuA8XoL8TAjgqRsH4
         TQ9q3TJ3UErdEjiFB74Dj4DsTwUVRoDoYkCWeS1BaqlIKtr/FENQkW9Ru/NjKz2e7Tku
         ygZqm9quPNGKxVsAcqQLruqhV0yZR8YQxJnl8GO8Ubfp4nbkxWd0SY88TrX2+NdWM/u5
         XV5w==
X-Gm-Message-State: ANoB5pkaYpNRZd24HIxjZn5ccK55k0qd4uG3FfIVD1TX4FQ/3ogm3SLK
	M7GjVYeGNSpJ/gGrZIof77A=
X-Google-Smtp-Source: AA0mqf5WSh1ldUWiKlJTCUx19cpUJYc2SS9QTb71YZMoHc1TB56et+PDXLAokItPHooMeJ9Aa04teA==
X-Received: by 2002:a17:906:ca0e:b0:78c:1f2f:233e with SMTP id jt14-20020a170906ca0e00b0078c1f2f233emr64572621ejb.307.1670428574062;
        Wed, 07 Dec 2022 07:56:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709066b1200b007bf988ce9f7sm8715501ejr.38.2022.12.07.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 07:56:13 -0800 (PST)
Date: Wed, 7 Dec 2022 18:56:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/mediatek: Fix forever loop in error handling
Message-ID: <Y5C3mTam2nkbaz6o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_075624_580383_8F319529 
X-CRM114-Status: GOOD (  12.26  )
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

There is a typo so this loop does i++ where i-- was intended.  It will
result in looping until the kernel crashes.

Fixes: 26593928564c ("iommu/mediatek: Add error path for loop of mm_dts_parse")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3e46bc8b0714..2badd6acfb23 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1160,8 +1160,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 	return 0;
 
 err_larbdev_put:
-	/* id may be not linear mapping, loop whole the array */
-	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i++) {
+	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i--) {
 		if (!data->larb_imu[i].dev)
 			continue;
 		put_device(data->larb_imu[i].dev);
-- 
2.35.1


