Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43005C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VL2GVh6JL+m8Dz2jxULGal6eqzKagu90UUNLC71Q4Ro=; b=x/j5Iq6keIQbFq
	G6/F1CkfDwgCxFrtj3QCo6QkglgoTFsEkhlgaPbgek2RmH66ZErhk/D8Rz4tuV4/JF9cJYLSbEcvN
	LybgDZ565vRF6U++/yUAvd8t83GR+nlpT/GUYZQ2q9a4YTQ5lyRSVanKhYkjMTXwGs1o9bD2DG+Qq
	amFz7Atkndt1d/yuELm/ac7J/F7mE/QPa6ulEO8mhCZML8PVWVZjKLgxY8RsRKLLeNBRbbkWsvvoO
	JR8i+Crz1WrmwkRRobuwtZrJC+M0131AgahODejPeHzIrfUdrKkh2AJNiimgyE7pDbjjKUGYU3yeG
	vtr8S3Liz8VJV2uDsUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzvky-009R8d-HG; Wed, 22 Dec 2021 07:09:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzvkn-009R49-R7; Wed, 22 Dec 2021 07:09:39 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so1633303pjq.4; 
 Tue, 21 Dec 2021 23:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9GdW/41SP4WrMLD62L5i1Oi6nl/ztOuq8F7Z8uPVG5M=;
 b=d4xX+3wfxCkfdGqTy8rJxAzpQr5osvD4jWUvj06/jX7cTZCMpr9oUsuI6ui82n7U1D
 sx7f0A2Xg6Z7MN/C/tZTEMzSu6D8BNtjQk3bfYORQFJwPbmUN6Hrz5H49gc7+YxRVZKs
 plo2+CvVgPK4uj4I3ZPSDoyO3FY8VWde4O/+tT4jbakkywcnra9dPmcD11tVF+0TJ7kZ
 m9zwbT+CrQMhvsA/FToYb6gXl1aaSHyuQ8Vu8gWJI0wUlfhMlsBH+R0g2lRcK1TlbqtT
 Ltz+fHUrez6g+FyOtbX2uk9Ja3BIwVvDPuc8cw9wFZ+bq6u4jL4Q+L9ZuQrhMuGY8YgH
 qCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9GdW/41SP4WrMLD62L5i1Oi6nl/ztOuq8F7Z8uPVG5M=;
 b=k1GJrxSUX3+p2go/lBgKnzQ05FwthxM00O2Rs9Bv+hetOD7pSBP4TWOFIQUIekvR1w
 V62vRn5hnub74hGdoLMrsPM6CWV1lHMk6GpchsPwNRe0L/aMIUOqRl9U60YaJwLxSPCE
 IAO2jVmADA4FYqz4/MD5AC9jp2cMBEyDEUy45g7MelTzWDGhzC1941d1MMVKwQEwawfI
 K3beh1bpunfvQkhmnMziH9Mt4lZa7mX81SKUzXcmibByL8xlViSFtuFFXgBxGctV4oew
 lncvn93M8BBPz10odGUuuws5zI6nfhxK3uhw/XLHsEibsOUhS5Zmr7oJNu5LC1+CVHsY
 B2xQ==
X-Gm-Message-State: AOAM531m/faLvBYknTSd8c7NI82BU8VU57dx0v+kQr3y/5zZOAf0p40f
 IBOKG+ePy/jLjQtnYCYJ7QQ=
X-Google-Smtp-Source: ABdhPJwZMIWyuezHxoS0eEV1QyePk8qBBpAvONjwkpZ0nJM/hOCtaZAmf0Gi3iURX9rUP4RvQ8bBXw==
X-Received: by 2002:a17:902:848b:b0:148:a2e8:2c53 with SMTP id
 c11-20020a170902848b00b00148a2e82c53mr1563940plo.162.1640156977237; 
 Tue, 21 Dec 2021 23:09:37 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id q10sm4546268pjd.0.2021.12.21.23.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 23:09:36 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] scsi: ufs: ufs-mediatek : Fix NULL vs IS_ERR checking in
 ufs_mtk_init_va09_pwr_ctrl
Date: Wed, 22 Dec 2021 07:09:30 +0000
Message-Id: <20211222070930.9449-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAGXv+5GF1WOeXVtnknAa4GYXE3Hd-UzcCBCyQzT6KY3tJCrVGA@mail.gmail.com>
References: <CAGXv+5GF1WOeXVtnknAa4GYXE3Hd-UzcCBCyQzT6KY3tJCrVGA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_230937_907690_84DA656D 
X-CRM114-Status: GOOD (  12.23  )
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

Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
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
