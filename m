Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A6C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 06:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6215D20867
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 06:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5aMrgUP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fBX50hsn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6215D20867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vt+RvK3vbNTV/IgR0x1JiGngvjfXNW2LinVWCAUfs5k=; b=E5aMrgUP48ewhX
	MX2SUSR1/3UTtgKIPG1lRi041+nFzka0ZjFkla/PNL/3+ZdLmeqhCf7HUBWOlfTuVJFPm+rmyVgro
	UXzNdN7FQi3SPpM904DLiob3MB5FeA+csGhODJV47EuFj3stOwwU57lwWFmsLBcWA8+MLDAfae3WY
	4piJqoddMtWnBFpFdooHIx/06aZ9MZIt0XGRAbjJ1pNBnZEgFW2guBoE0vAQsOeHNUsAHgIqQWbJa
	1inpuBTm6dH5mre4QTvnz9bzkc9c9pdrp5mtp8ZsO1zTkfBZeLM4RttvVJbN4KMaDfDbfVM4wGtL5
	isuF68YDxj39gCMntCgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idTuK-000768-MG; Sat, 07 Dec 2019 06:49:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idTuG-00074g-AJ; Sat, 07 Dec 2019 06:49:33 +0000
X-UUID: 438ea6b941964df19ac2e420ca7b9611-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6pTSCSjrn28TvfGT/brokgQkzDrJ7jz09v0SGNUY0AI=; 
 b=fBX50hsnMPczBvupi1NhxT48AhunHc2O6GhTyioaEmvB5LtGWVkfK2C6hBbs3snjqKWbirSe3AHtVXUlctFT1wlcOTA7p70/m421P1KgW4HW1Acwe3U13cDA/oHuw/ERj/pFPblHcDyH2OmDuHHVk/UBbgPJZ6Du74wnqVOOUzA=;
X-UUID: 438ea6b941964df19ac2e420ca7b9611-20191206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1012611117; Fri, 06 Dec 2019 22:49:26 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 22:39:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Dec 2019 14:38:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 7 Dec 2019 14:38:43 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 0/2] scsi: ufs-mediatek: add device reset implementation
Date: Sat, 7 Dec 2019 14:39:06 +0800
Message-ID: <1575700748-28191-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6A5321628A49D3B31F32B5F0218FA327838C542E2A65577B39D2A68EC24ADD6F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_224932_369565_B6ADF845 
X-CRM114-Status: UNSURE (   4.01  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset add implementation of UFS device reset vops in MediaTek UFS driver.

Stanley Chu (2):
  soc: mediatek: add header for SiP service interface
  scsi: ufs-mediatek: add device reset implementation

 drivers/scsi/ufs/ufs-mediatek.c          | 27 ++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h          |  7 ++++++
 include/linux/soc/mediatek/mtk_sip_svc.h | 26 +++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
