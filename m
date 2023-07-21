Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E9C001DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3tfFTHM0Jf/OVl4gdJ7X+IwuJdw2sfr5A4+a6qIccE=; b=kCaCJciw9WDQErFzyEmaM34hIv
	q4PAFBcMEvffZh1K51X+EZtMA7QCFtoDe//mOqPLSXD/O7jXt0i91jyaRb5AIgtlakmtZrmEYMbkU
	QN+jzGy/HZwGzt2C13i+Oq0PQi57zy8M35tvcmBX5CX3+ra9UUJK2CzSmciuJFekYj4OLXrDtGD5b
	HZwJONusNYZOYbmjNv8JLE7QxKfdIHavxOpBv+zxRnLVq51oliwf9B8yYCextR4/U5Bi+2KjKs7lU
	aOL07KvHm+yR8QmLFq9OfkDcGT2I/v1irEeNCz+H5OQ7IDep6gfD+UCzbgsipZAoQqXW+d2ph30tw
	FHxT1+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMveI-00EwSY-1E;
	Fri, 21 Jul 2023 19:18:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMveE-00EwRg-1m;
	Fri, 21 Jul 2023 19:18:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EC6561D7B;
	Fri, 21 Jul 2023 19:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE95C433C8;
	Fri, 21 Jul 2023 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689967121;
	bh=4oolcSgpC5itJ5tUhjvjyvMGkMXzH6EhKOTc2yhRQ7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVCNGcYEcS2YTxWCIqgMVz9M6oR/6Eq/7vqfmhjPHc1vXEI0vGU1zSL5SewDf5v+T
	 tfGKjux777BR0kYfdZNWldPbdf7kq6TG2u4etBz0D8UWxGVZr8RHF7SOjFYgho55/0
	 BYuqFYHRFsEj1IibEiuULKR90zGpQiFj7pu6DWiM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 024/223] scsi: ufs: ufs-mediatek: Add dependency for RESET_CONTROLLER
Date: Fri, 21 Jul 2023 18:04:37 +0200
Message-ID: <20230721160521.903534222@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721160520.865493356@linuxfoundation.org>
References: <20230721160520.865493356@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_121842_644892_CAC41B94 
X-CRM114-Status: GOOD (  11.22  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 89f7ef7f2b23b2a7b8ce346c23161916eae5b15c ]

When RESET_CONTROLLER is not set, kconfig complains about missing
dependencies for RESET_TI_SYSCON, so add the missing dependency just as is
done above for SCSI_UFS_QCOM.

Silences this kconfig warning:

WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
  Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
  Selected by [m]:
  - SCSI_UFS_MEDIATEK [=m] && SCSI_UFSHCD [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]

Fixes: de48898d0cb6 ("scsi: ufs-mediatek: Create reset control device_link")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: lore.kernel.org/r/202306020859.1wHg9AaT-lkp@intel.com
Link: https://lore.kernel.org/r/20230701052348.28046-1-rdunlap@infradead.org
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Peter Wang <peter.wang@mediatek.com>
Cc: Paul Gazzillo <paul@pgazz.com>
Cc: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: linux-scsi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
index 4cc2dbd79ed0e..9b39fd76031be 100644
--- a/drivers/ufs/host/Kconfig
+++ b/drivers/ufs/host/Kconfig
@@ -71,6 +71,7 @@ config SCSI_UFS_QCOM
 config SCSI_UFS_MEDIATEK
 	tristate "Mediatek specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
+	depends on RESET_CONTROLLER
 	select PHY_MTK_UFS
 	select RESET_TI_SYSCON
 	help
-- 
2.39.2




