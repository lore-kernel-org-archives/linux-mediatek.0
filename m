Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E06FC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D87E208DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CiOffXcb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kc6siXQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D87E208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gKgTm86kdsMoXgvgdBkeTpQsdeRoe9AFJPQpCa3UlFk=; b=CiOffXcbsCy2vW
	kG94BBjV0XjgL+KI5LisB/9v5fcu/mXj1KRofe9BjrQBUrwngkfjoxryngzgZJSOVKNkD6aySqA8/
	Anu/OYi0aTrndTqBf3GqlKGrnvrwWKyc9lad2McMkQfgHEDCUUGD1w13FA4ofbAVMKQNeFZEuba7J
	yIqJvEjZOidsDMyHHxc0efhFEoBA1gNbNmwYzxlR9rp7YAKToquXCwR0le7tpXx03sVyzMnZP8JY6
	64kLV1hTSXlmwSJl3QAp2f1uhjSiebwf9ebM3ozKn8bWfR0mBjYPcSzKInl/k7cIvU4Ll8XVFMMo6
	aGhJVPhw+LwmrMDeX5Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXLwS-000711-Pf; Sat, 09 May 2020 09:38:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXLvR-0005wR-Dd; Sat, 09 May 2020 09:37:43 +0000
X-UUID: 52b06c11e12a4455aa744f3480f88579-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=F8cqGTFPa4dEjB85G+SFRDrbwr/BV4Ro5sIuH3SpCf4=; 
 b=Kc6siXQcAhmoe5vzzz6CtuO+H2p6N97g2KRyrWe/wixONXkOLwRR82ksRNqXiho7/yF+DxpiRTBwcDYI/RfDmUBV4jPXRBjC5m5HnNGIzzhGgIM23CEmGukiv0XLnD1h4AKDfIloNzzoe168VwQvE3a6rUWV9B4jvuWDxbog3WQ=;
X-UUID: 52b06c11e12a4455aa744f3480f88579-20200509
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 277925037; Sat, 09 May 2020 01:37:25 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 02:37:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 17:37:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 May 2020 17:37:16 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 0/4] scsi: ufs: allow customizable WriteBooster flush policy
Date: Sat, 9 May 2020 17:37:12 +0800
Message-ID: <20200509093716.21010-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_023741_468533_2C6C28E7 
X-CRM114-Status: UNSURE (   5.04  )
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

v1 -> v2:
  - Squash patch [3] and [4]
  - Remove a dummy "new line" in patch [3]
  - Fix commit message in patch [3]

Stanley Chu (4):
  scsi: ufs: introduce ufs_hba_variant_params to collect customizable
    parameters
  scsi: ufs-mediatek: change the way to use customizable parameters
  scsi: ufs: customize flush threshold for WriteBooster
  scsi: ufs-mediatek: customize WriteBooster flush policy

 drivers/scsi/ufs/ufs-mediatek.c |  5 ++--
 drivers/scsi/ufs/ufs.h          |  5 +---
 drivers/scsi/ufs/ufshcd.c       | 45 ++++++++++++++-------------------
 drivers/scsi/ufs/ufshcd.h       |  9 ++++++-
 4 files changed, 31 insertions(+), 33 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
