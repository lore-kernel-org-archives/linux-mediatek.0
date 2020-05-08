Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DB2C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 17:25:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19172218AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 17:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuEiRtVO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jb1ZHoTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19172218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WIo/TTA512QgXHqgZCCJUVfMoAMEuVDNmvS3EcSkIj0=; b=TuEiRtVOfpozTr
	Xc12I7+8bEyBnbn2LsZTk+5VJQSJ+inr6y2w910MI4amRwvLBnkwdg5W6lzc3/8Ut8gt0Mx8WqRQq
	2ux3hBn8aMxmDIXxy+jmCwhgF2CyxUatjL6zp022mi13PmemX3Xjlz1MLkYHjIjPCEG3XmgzybPZz
	e/7iOR2cG2Ox31Ppe2NarnLluJukAPWwU3IU+pf1zkP8pAIp29/G/iqVkzI2ntNMOx/0A1XF0ZsZi
	6k7V2yY8dd0NUT/gltP4AdNPspK/DF0RAka5Qi2M6ntNY1mHkvT9b2GHcWTAkBs+83eXwwPPYhVU6
	IcDtRt+D20fdZEFtiVSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX6kk-0001CF-R6; Fri, 08 May 2020 17:25:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX6ka-00011F-2y; Fri, 08 May 2020 17:25:29 +0000
X-UUID: 706d676d0c9542448787566cfd93cd4c-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0knH9HNnIx9SRZudXymGnZJ0S7xeMFAxCHgdkhMyXYU=; 
 b=jb1ZHoTbS6RmvKKyVnkkYGuNz4QeH4brKBU9QKshK9Ucv8FXhWVonTeyRElPwWz6fGDFBVoIyedng4IzfI6De7MHje+8LBccoNlzRjddd3/ne/U6CdQkF4li5vmEBO2k2D2yCEStfUzjQCPD/n9vZNwkqWXMY0EQQFSR+CZXVhw=;
X-UUID: 706d676d0c9542448787566cfd93cd4c-20200508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1334446526; Fri, 08 May 2020 09:25:04 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 10:15:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 01:15:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 May 2020 01:15:11 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 0/5] scsi: ufs: allow customizable WriteBooster flush policy
Date: Sat, 9 May 2020 01:15:08 +0800
Message-ID: <20200508171513.14665-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7A3837055F0D783E3D514AAFE929BFFDF806506BD535D7E485499953F07CA592000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_102528_138580_E4937F54 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This patch set tries to allow vendors to modify the WriteBooster flush policy.

In the same time, collect all customizable parameters to an unified structure to make UFS driver more clean.

Stanley Chu (5):
  scsi: ufs: introduce ufs_hba_variant_params to collect customizable
    parameters
  scsi: ufs-mediatek: change the way to use customizable parameters
  scsi: ufs: customize flush threshold for WriteBooster
  scsi: ufs: use flexible definition for UFS_WB_BUF_REMAIN_PERCENT
  scsi: ufs-mediatek: customize WriteBooster flush policy

 drivers/scsi/ufs/ufs-mediatek.c |  5 ++--
 drivers/scsi/ufs/ufs.h          |  5 +---
 drivers/scsi/ufs/ufshcd.c       | 46 ++++++++++++++-------------------
 drivers/scsi/ufs/ufshcd.h       |  9 ++++++-
 4 files changed, 32 insertions(+), 33 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
