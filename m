Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28486C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E98E022527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3+iTHek";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EpaJD7RW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E98E022527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AL4IDnTbuNkLi62nensSo3rz5hQulcuJOTCMtSATnU4=; b=L3+iTHektOi6Y3
	0wwz1WmnMXMJNxmpyMDCGTO0AFmPU67kkpcWuRqjIlb7JU6DJ9uwrHDDf3aUPDzQKXlzmkj8JwKmk
	4Ofiymj6vqLayJXuyBxyq1Z650UHJ0PVxwkM2S5w7kBatxDnoQ8a3CRsLsy2Sop2OgHkVjQkVJMts
	YjPDv42jB/cdAAxKQifGMs6s7ElnZAoQzDRJvX4rzOS2Y3a+IqbQCHU/1rYdi7NCx+NW5rVZsqcS2
	Z95FNoWXBMoMSpesMMyF8laOwYKeizafav8DK9fSE8vuB/KqoZFnRUe0yyd4o5Yr67aF6tp7EUugJ
	f708aHpC4VCJwZkXwiHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifg46-0000vL-S0; Fri, 13 Dec 2019 08:12:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifg3M-00008y-Ol; Fri, 13 Dec 2019 08:12:02 +0000
X-UUID: eb62da947dd74c48bceee061c5e91ae3-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VlbmHzvmIOMrtNrr7bRhgkYfE8bVDzx/HFbQW2aC+F4=; 
 b=EpaJD7RWjJdz4CLXUCVZjxA+W9/F4772lmY49vKdgckM9LGyPjOXNSJGDZiSvLCLDf8DYXoLwrtyc+gFxb/LfaH42TXXAi3byxkfjNpHQ1CNwTQiyltFS+salJuTRxW6Q7VZc7MWbAc8sWmZoeGBCkTb0LiiGd09+1R20c6bYO8=;
X-UUID: eb62da947dd74c48bceee061c5e91ae3-20191213
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2015418338; Fri, 13 Dec 2019 00:11:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 00:12:15 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:11:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Dec 2019 16:11:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 0/4] scsi: ufs-mediatek: provide power management
Date: Fri, 13 Dec 2019 16:11:31 +0800
Message-ID: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: EADCA4A00BE1D93B32B7DFD36F29DF1E98405723AD033FCEF1A3219B7668779A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_001200_837231_C79125CB 
X-CRM114-Status: UNSURE (   4.36  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch set provides power management on MediaTek Chipsets by

1. Introduce reference clock control
2. Configure customized auto-hibernate timer
3. Enable clk-gating with customized delayed timer value

Stanley Chu (4):
  scsi: ufs-mediatek: introduce reference clock control
  scsi: ufs: export ufshcd_auto_hibern8_update for vendor usage
  scsi: ufs-mediatek: configure customized auto-hibern8 timer
  scsi: ufs-mediatek: configure and enable clk-gating

 drivers/scsi/ufs/ufs-mediatek.c | 93 +++++++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h | 20 ++++++-
 drivers/scsi/ufs/ufs-sysfs.c    | 20 -------
 drivers/scsi/ufs/ufshcd.c       | 18 +++++++
 drivers/scsi/ufs/ufshcd.h       |  1 +
 5 files changed, 126 insertions(+), 26 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
