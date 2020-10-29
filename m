Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6B0C55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCCB207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hj+JdWP/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n408Xbl4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCCB207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SjZCSczUst2r3Fd0tAT2E1JGkGbTTqhu8PD/kPNV6Z8=; b=Hj+JdWP/AcE4Vz2SmlU6Ivpr1
	H8qd8QvWL1WNydntbkDSWV/BRk/cBcF3/HWMQxfPKhC5LlLZyN9YA/L40eIZiBN4dq5M2p8hUUZxS
	6NsChsZ4h8Ccy+O81zTrKDKGL6Ve5Y/yexVXP2TED5OsKCyvvXW1+RShQjEMz3Y8sWSDdcDi/wP3g
	Z9kVKN3oTuXP2/Vn76OKFo9haC5RS29SLYGSz2hAhnNWq5cNMUGskX4vnt3RXTwxFTfTrL6N4rep0
	2COXZI9XjR2a/hyMm47Py4vFjYH8DJiaodCOXCKKM0kgdFM0zFo4tsm0UfI4x7pj/82FtHUwjCkTz
	UFO4tKrzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6a1-0005s3-MN; Thu, 29 Oct 2020 11:58:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6ZI-0005bg-Sd; Thu, 29 Oct 2020 11:58:15 +0000
X-UUID: dc85802c65c54a809ca5792ea29ff7a8-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2FzU62fRjwCs/KkG2WvyHpAvZ/TJYD3zMGaS2CVuTCk=; 
 b=n408Xbl4Etl3WB+IiHajCCub/y/CDBqr44BIX9VCOcPRtQexXNv66mOq6vobIqF8yFtkeIZ7jAxl4J+42aE8P5bP0/N0Gd3CeKRwb8ENynXhOtaPxz6jG7K1bvQ5Khp3qYuEnPabX2TgsJscwz0cmfZTO6P0eCoDJi44n1U2GvA=;
X-UUID: dc85802c65c54a809ca5792ea29ff7a8-20201029
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 827718872; Thu, 29 Oct 2020 03:58:02 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:58:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:51 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 5/6] scsi: ufs: Add enums for UniPro version higher than 1.6
Date: Thu, 29 Oct 2020 19:57:49 +0800
Message-ID: <20201029115750.24391-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F023B1AB7780F37F1C657FD9D5F3F5C0639BA911D2E0B7AF094F2D751CCF322B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075813_127687_FAD026BA 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some vendors need newer UniPro version to decide if some features
can be enabled or not.

Simply add missing enums for the latest UniPro versions.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/unipro.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/unipro.h b/drivers/scsi/ufs/unipro.h
index f6b52ce36de6..8e9e486a4f7b 100644
--- a/drivers/scsi/ufs/unipro.h
+++ b/drivers/scsi/ufs/unipro.h
@@ -237,8 +237,10 @@ enum ufs_unipro_ver {
 	UFS_UNIPRO_VER_RESERVED = 0,
 	UFS_UNIPRO_VER_1_40 = 1, /* UniPro version 1.40 */
 	UFS_UNIPRO_VER_1_41 = 2, /* UniPro version 1.41 */
-	UFS_UNIPRO_VER_1_6 = 3,  /* UniPro version 1.6 */
-	UFS_UNIPRO_VER_MAX = 4,  /* UniPro unsupported version */
+	UFS_UNIPRO_VER_1_6  = 3, /* UniPro version 1.6 */
+	UFS_UNIPRO_VER_1_61 = 4, /* UniPro version 1.61 */
+	UFS_UNIPRO_VER_1_8  = 5, /* UniPro version 1.8 */
+	UFS_UNIPRO_VER_MAX  = 6, /* UniPro unsupported version */
 	/* UniPro version field mask in PA_LOCALVERINFO */
 	UFS_UNIPRO_VER_MASK = 0xF,
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
