Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6897EC63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE392222C4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYxfSVox";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rfhjE4x8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE392222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yo4Cri5PO/LWUDJEiZH26k5ZfEIDVjdYcbIYIJ5Aagk=; b=pYxfSVox6T08ARqQ6k7qy/Q/BZ
	gR8spL2GDgWiSNhEl8l6LCkyPOW2sAHmYG2qg7cnRJY9YdSQfzxi3T8+glUg49Q/ReYXFLkpZ+EsA
	MomtTp4zAA6tEKYxLHKisrpTzzYEW6KhicvBSFw/YCIXw+Dr3U5hrLaPbSXDzRMB74f9uTuDFSvia
	lRdEwyTJQAgbL3fj8ZH2/ZHYIx25QfcF+x0iG4ZOzlxyppPLNIzOCMPnr0eGY19JzzXhvd51urc/Q
	4YWgzRNX2XhK19WVjpzkXoCagTlfYdRAQZoiQp2cXvDaw9N+DIRR/wEmetS7JurDSyObsE+Lbi2LB
	lz1LBcYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWg-0006Ok-Mx; Mon, 16 Nov 2020 07:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVp-0005xz-8s; Mon, 16 Nov 2020 07:01:18 +0000
X-UUID: b16b801f78fb4259bef7ac69b61be368-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TevHg3dPl5c+y454MJMGgIYCQ95SlT1KNCAuPGuKzVQ=; 
 b=rfhjE4x8mnPHnSSelK00kwllqBg4M2Khft336ao9dJLgl8HsWT+mYySJXlBCxrsQK3SBWVnSbP6CAeARv0RSTXyvwtrgPcO2fLjSb34dzSxKFDGbp7IkIU0Psadq1aIk2uzI/8E3Sq9S6yUBOhn9BX4eg0lpn5zj6ivXDnJbmCA=;
X-UUID: b16b801f78fb4259bef7ac69b61be368-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 357018359; Sun, 15 Nov 2020 23:01:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/9] scsi: ufs: Refactoring and cleanups
Date: Mon, 16 Nov 2020 14:50:45 +0800
Message-ID: <20201116065054.7658-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020117_480591_1BFA627B 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series simply do some refactoring and cleanups in UFS drivers.

Stanley Chu (9):
  scsi: ufs-mediatek: Refactor performance scaling functions
  scsi: ufs: Introduce device parameter initialization function
  scsi: ufs-mediatek: Use device parameter initialization function
  scsi: ufs-qcom: Use device parameter initialization function
  scsi: ufs-exynos: Use device parameter initialization function
  scsi: ufs-hisi: Use device parameter initialization function
  scsi: ufs: Refactor ADAPT configuration function
  scsi: ufs-mediatek: Use common ADAPT configuration function
  scsi: ufs-qcom: Use common ADAPT configuration function

 drivers/scsi/ufs/ufs-exynos.c    | 15 +---------
 drivers/scsi/ufs/ufs-exynos.h    | 13 --------
 drivers/scsi/ufs/ufs-hisi.c      | 13 +-------
 drivers/scsi/ufs/ufs-hisi.h      | 13 --------
 drivers/scsi/ufs/ufs-mediatek.c  | 51 ++++++++++++++------------------
 drivers/scsi/ufs/ufs-mediatek.h  | 16 ----------
 drivers/scsi/ufs/ufs-qcom.c      | 27 +++--------------
 drivers/scsi/ufs/ufs-qcom.h      | 11 -------
 drivers/scsi/ufs/ufshcd-pltfrm.c | 17 +++++++++++
 drivers/scsi/ufs/ufshcd-pltfrm.h |  1 +
 drivers/scsi/ufs/ufshcd.c        | 16 ++++++++++
 drivers/scsi/ufs/ufshcd.h        |  3 ++
 12 files changed, 65 insertions(+), 131 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
