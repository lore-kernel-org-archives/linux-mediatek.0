Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D390CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 06:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+j82QJ8lYo/MAHZZmWoxi0zzrZsX1jjOPGO72MO1N4k=; b=WChYmq3nUOclnr
	pfJtCcuErIAjKdyH48ToQYL3tlVouV4lEPzgiZJs4qiNYp4RKvkGoFLzEZzVoQCDGq9PXQjoG5uUV
	5C9GzyhuuyeBhXRpg7CWYG1gyvssoykeRD/nqQ2SxQLIXh8zVwo/pdFZC0Z8urwpxJOUNTVCxU8N8
	DIgZGwuMbxPXAoJc2bgUiBm5VY2+0ds3s5ec6lEG6K/GerHvqbkaetGpb4+FcMzckbWg8He1rbv/E
	UCmuxczJOaO6OelR1h1oCSCZtj6r3YFBolefctJRSwAwza/VC24zXoZHjhTcrIIY3DWxw+TwXfsD6
	9v/54jE26JhLrq0IVsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzv3X-009LKq-8F; Wed, 22 Dec 2021 06:24:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzv3U-009LJc-IQ; Wed, 22 Dec 2021 06:24:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso4785128pjc.4; 
 Tue, 21 Dec 2021 22:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=vP1LOViFn0+7V0Z8YFpxh/XwEIUum39ijaW3BebLLxI=;
 b=fagiSX0TlmeVqPVl5MegpvdJMrKjEx47q+BE0Uo/MmVO64pFRvoE3+1lcwGvPDWaoc
 /QeDAOQ9H+Sae1Yom3iXDYGAHBiO2SkkOK4PbA+owI7UBxwh0mouiwNJnKF4E0FYo+aL
 niNCwmOvBEWDJ5cUk1VzGCyRWrQVpxZwW+HfARrnv0rzKtmg7y5fZnq1lGyOtBvGOQ2P
 A75tHkBbFDLYUIihoTwALQD//WrtURNpY2TPJVwQVUgsVAmNnL/EQFd/SkvNPJNOemKf
 GchWJmHPPF5qAMA/pgciCDbnVz52zgkbTvS5+YU9EohPOwCe8Ju7SpZBN1VMvbr2EAJi
 RRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vP1LOViFn0+7V0Z8YFpxh/XwEIUum39ijaW3BebLLxI=;
 b=R0HEjjGmrt0IF+OJ8VHkbiylOcdSnKSIHJ8lnVg3j0b18DZI42fvi+p2Y32XHYH9/r
 MhBx+9cyZv9zzsILbbmwXNkuQ1ewveCVwOFdhgyihqDoSRV5tIWMU3j4z4Okxr0lyFYB
 rjW2AY2zV7j8+nJuLJFsh1fgIJQp3AxjK1jdOvzxIOD87Stx3avqXAxC67cDe+W5pY1Y
 ++LK/hOUHolMKL2Rx8FPNpSXzEiAGQzZK3Svy7wN754msDmrudU658zSFQftiZiZs6nc
 zs8VnVQFH6wBcrS2ZmxKfqfF/rEOgoRn7kXAmtomhbLj0J9KdxDsoHojJeboc1M4RFnx
 FBsQ==
X-Gm-Message-State: AOAM532TC3RofBXj81mRq/iYEfsmt8Qc3irtKnU/HDuB0/gqXKY89Kut
 o4moIwEAHe63ObT9D+VNvFc=
X-Google-Smtp-Source: ABdhPJzrFTfdWCZJJj7PQimEL7SGlhd9TvjzNv+9aMRbe+1PjRHxoh7SdCQwTik/GTySzujwK6NFaw==
X-Received: by 2002:a17:90a:ab0f:: with SMTP id
 m15mr1881870pjq.91.1640154291500; 
 Tue, 21 Dec 2021 22:24:51 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id j20sm4109730pjl.3.2021.12.21.22.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 22:24:51 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] scsi: ufs: ufs-mediatek : Fix NULL vs IS_ERR checking in
 ufs_mtk_init_va09_pwr_ctrl
Date: Wed, 22 Dec 2021 06:24:44 +0000
Message-Id: <20211222062444.16144-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_222452_652281_10445FDC 
X-CRM114-Status: GOOD (  11.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The function regulator_get() return error pointer,
use IS_ERR() to check if has error.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 5393b5c9dd9c..86a938075f30 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -557,7 +557,7 @@ static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	host->reg_va09 = regulator_get(hba->dev, "va09");
-	if (!host->reg_va09)
+	if (IS_ERR(host->reg_va09))
 		dev_info(hba->dev, "failed to get va09");
 	else
 		host->caps |= UFS_MTK_CAP_VA09_PWR_CTRL;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
