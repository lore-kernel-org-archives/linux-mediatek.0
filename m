Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6ABC4361B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 12:01:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCF323102
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 12:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CCF323102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlFw16ofkZkwbG/9l5UNoRmt2dSLqfRV1NZ5oX/rH1Q=; b=3NJAXeQ34XtwxZherrLR+J+0mt
	b5KYcX/KRtwMNxdJuVnbw/NqeGGnKQDzm0F6Zy59DvIrOiNJia+/wOJztTQI4RtojQ19m6ptV75kH
	Wfu6L/0r5JU7NccAYLZhmdM3wFfjUxMokYn0MxEva1vfp4pN8BB331hGC3TM94gminnL4NEV2WvBz
	REYHQhyNknzWkHsKCIruDh1t0AWqIvf2ZtAMqPhpj1mhd1QL7NpPh0bbNSPIegWcTtGgCUe+3NH87
	jwG4hvJ8A4Zq+n7ZHqyMWKz6G0vc1GdZDGNE+U0UEOR81lbYblyhqk2MlrEleAWpFSQNGF/Y41rNo
	qTvUhG+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWFM-0000AS-Ir; Sat, 05 Dec 2020 12:01:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWF5-0008TW-00; Sat, 05 Dec 2020 12:00:48 +0000
X-UUID: c408d8b573da4b92952fac15bdec03c1-20201205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GJjMd+x1Y0A2KRO7MSKC/ywTJ6GzEkG1nd3WF5ufBu8=; 
 b=dpDd4OC0gBXq1kDc7VMrdg0Cesr2mkAztqdVnHwVrjNmxYJ/BEHxpfaUSGpDrsSADn7MYP74SUthgcp4Yz7ZpXXFhPJq6XvgqVPy6MFQ+meyP4JrhUyWUNVr4MX0fLQ9CjDYBEBCvJ4Gcw05waBR7y5qMn0bjfDbKikHh8RvquU=;
X-UUID: c408d8b573da4b92952fac15bdec03c1-20201205
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1849024669; Sat, 05 Dec 2020 04:00:45 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 04:00:43 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 20:00:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 20:00:41 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/4] scsi: ufs: Cleanup phy_initialization vop
Date: Sat, 5 Dec 2020 20:00:37 +0800
Message-ID: <20201205120041.26869-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_070047_278480_7BB304F2 
X-CRM114-Status: UNSURE (   5.88  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series simply cleans up UFS vops and shall not change any functionality.

Stanley Chu (4):
  scsi: ufs: Remove unused setup_regulators variant function
  scsi: ufs: Introduce phy_initialization helper
  scsi: ufs-cdns: Use phy_initialization helper
  scsi: ufs-dwc: Use phy_initialization helper

 drivers/scsi/ufs/cdns-pltfrm.c |  3 +--
 drivers/scsi/ufs/ufshcd-dwc.c  | 11 ++++-------
 drivers/scsi/ufs/ufshcd.c      | 10 +---------
 drivers/scsi/ufs/ufshcd.h      | 18 ++++++++----------
 4 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
