Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93242C35240
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 07:40:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B5020708
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 07:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/HTY//7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M7uGF+zW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B5020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4rWwL8aO/BpcI/DeWgxDBwDP9he8+qvMh2N47Ie35s=; b=M/HTY//70o4I2A
	kI4k7PYVytAoMeX8hSamwlgvkh4RjV7PU+22tNwZr3muxBd4NtmMIy5YDN0n7q1HxzSp4jRxUE/rN
	ltsxbBef/IAu7mv2rvbCxfawpaMCYu/B1xU7piGX0e/N6aBn0ZPhDkH/lJvx6AFhp2LCnmQjBTg7H
	wkSVHyKUGf1kWwRFWILYpTdMGbm3tVgA0wuhUsbzJ9g+dmPU/3szk79mKOks7D1qPpLnlYjNwOk7e
	Tw/RtWxdurfxRQT51FtGSO/IUUHyqDisy0+k/l3FrZsNAZrP70JUme0jOT4uv+1Ms4vZv1elORJg5
	w9bEoSkYMM3OjJTSDaZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwhx1-0001KP-3G; Wed, 29 Jan 2020 07:39:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwhwY-0000u2-V2; Wed, 29 Jan 2020 07:39:26 +0000
X-UUID: eb6fa4cf10464de1b7aaa87e703d4331-20200128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7gNPecS1EJzqmeFhY3wJ8BbZtF2s1Gokz2MxXu14+jM=; 
 b=M7uGF+zWpVLXSEVO75MVbg52A7zcr0RlbEJQaRbW5tKSaLx8noZWaCseDWfttHNCeouhNnVRhkbouHhzU9EgeJeTSuwfzqygAWwz348darDQqUCGlrbZl/HbrBJk+3ibmCD3w+6RyAZB8hgexZ4q+7/PEhmev0rCG4HQWieX68s=;
X-UUID: eb6fa4cf10464de1b7aaa87e703d4331-20200128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1732607220; Tue, 28 Jan 2020 23:39:19 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 28 Jan 2020 23:40:32 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 15:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 29 Jan 2020 15:39:11 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH v3 0/4] MediaTek UFS vendor implemenation part III and
 Auto-Hibern8 fix
Date: Wed, 29 Jan 2020 15:38:58 +0800
Message-ID: <20200129073902.5786-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3DECD09A3C884DAB6A535DB35BC0270C3BA4EBCFB82570349D130702622213F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_233923_006099_C314D7F5 
X-CRM114-Status: UNSURE (   7.42  )
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
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series provides MediaTek vendor implementations and some general fixes.

- General fixes
	- Fix Auto-Hibern8 error detection

- MediaTek vendor implementations
	- Ensure UniPro is powered on before every link startup
	- Support linkoff state during suspend
	- Gate reference clock for Auto-Hibern8 case

v2 -> v3
	- Squash below patches to a single patch (Bean)
		- scsi: ufs: add ufshcd_is_auto_hibern8_enabled facility
		- scsi: ufs: fix auto-hibern8 error detection
	- Add Fixes tag in patch "scsi: ufs: fix Auto-Hibern8 error detection" (Bean)
	- Rename VS_LINK_HIBER8 to VS_LINK_HIBERN8 in patch "scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8"

v1 -> v2
	- Fix and refine commit messages.

Stanley Chu (4):
  scsi: ufs-mediatek: ensure UniPro is not powered down before linkup
  scsi: ufs-mediatek: support linkoff state during suspend
  scsi: ufs: fix Auto-Hibern8 error detection
  scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8

 drivers/scsi/ufs/ufs-mediatek.c | 67 +++++++++++++++++++++------------
 drivers/scsi/ufs/ufs-mediatek.h | 12 ++++++
 drivers/scsi/ufs/ufshcd.c       |  3 +-
 drivers/scsi/ufs/ufshcd.h       |  6 +++
 4 files changed, 63 insertions(+), 25 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
