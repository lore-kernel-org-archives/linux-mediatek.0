Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F3C4724C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 14:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0F42173E
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 14:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1KggLzY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oYTqZP5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0F42173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z9dWdwnqOSYJJxcbZUq+ELxcHUT5CIW6BRxIoS0UseU=; b=Q1KggLzYMC0H/0
	bm1AS5ezQ9i6ChxJiOESlW5ju14+3qZouZyMSV6pgGkQ5gy4ELQSV+gWwotQxpt8edj5WfsaE7kpl
	w+nwxNXB/M3E25THUQhpA8461RqO/98De+7nEr3336pKYgnfWGgSPv+gpubN0W7uiLCoY37ftX7iI
	MycSbp1ySKFNGPq46pIoXCl2bpwivP3QL0M434uvnTKM3lQq4BDYWfhD89CqRI0uFiCWVhT+C2cJ7
	jPI1TMf/APcqEirwByBsoJZoWz3F6xke+vLDwRzLLbNSWs0KcROxNIXJwI53s1DM9mJoUGJRSHCrz
	u5ycUz5DdGOfAP1PCO6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWp2-0000oL-1r; Fri, 01 May 2020 14:39:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWoU-0000DE-0f; Fri, 01 May 2020 14:38:51 +0000
X-UUID: b3fa2ccd07f34682a06f46604b1fd4c9-20200501
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=76OLCwfX6Gu9wxMlwzFdygqKRZ9AvkGO+i5uev8RfB0=; 
 b=oYTqZP5ogRhcen8vD/zje7xCWAjRNo/j7nsSNUDGSMUCvQYXJ4erAb6yqZD3+lHQMsEKrTtbDJvsrcleSozmtpkJExeCw/J5glPFHyMnqmNyq7moOUqfC+2YQbA9TGN6qHsde+v8rSxVm9WwT8bxZs3Ro1wpyXJSor1pm2jTfhY=;
X-UUID: b3fa2ccd07f34682a06f46604b1fd4c9-20200501
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 518298180; Fri, 01 May 2020 06:38:32 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 May 2020 07:38:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 May 2020 22:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 May 2020 22:38:33 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v3 0/5] scsi: ufs: support LU Dedicated buffer type for
 WriteBooster
Date: Fri, 1 May 2020 22:38:30 +0800
Message-ID: <20200501143835.26032-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 75152929AB62C60A90DD79E3896054B044F54FEB05576F22D2B5529405A9B3A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073850_068804_1EC73397 
X-CRM114-Status: UNSURE (   6.21  )
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

This patchset adds LU dedicated buffer mode support for WriteBooster.

In the meanwhile, enable WriteBooster capability on MediaTek UFS platforms.

v2 -> v3:
  - Introduce a device quirk to support WriteBooster in pre-3.1 UFS devices (Avri Altman)
  - Fix WriteBooster related sysfs nodes. Now all WriteBooster related sysfs nodes are specifically mapped to the LUN with WriteBooster enabled in LU Dedicated buffer mode (Avri Altman)

v1 -> v2:
  - Change the definition name of WriteBooster buffer mode to correspond to specification (Bean Huo)
  - Add patch #5: "scsi: ufs: cleanup WriteBooster feature"

Stanley Chu (5):
  scsi: ufs: enable WriteBooster on some pre-3.1 UFS devices
  scsi: ufs: add "index" in parameter list of ufshcd_query_flag()
  scsi: ufs: add LU Dedicated buffer mode support for WriteBooster
  scsi: ufs-mediatek: enable WriteBooster capability
  scsi: ufs: cleanup WriteBooster feature

 drivers/scsi/ufs/ufs-mediatek.c |   3 +
 drivers/scsi/ufs/ufs-sysfs.c    |  14 ++-
 drivers/scsi/ufs/ufs.h          |   7 ++
 drivers/scsi/ufs/ufs_quirks.h   |   7 ++
 drivers/scsi/ufs/ufshcd.c       | 156 +++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h       |   3 +-
 6 files changed, 135 insertions(+), 55 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
