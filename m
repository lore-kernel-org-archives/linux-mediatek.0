Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ADFC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 11:59:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D2023102
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 11:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D2023102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N5fMFwKuKpGCf+iq1x90QwzwTCpcu8bh3KJ+zlQntoM=; b=zJWG5gZRwMHT+Gx4d3OxCRtWQb
	VLXkhqfHSQo4VIvG1BWEwCtp0n7pFRYY6YYKI5VBn2gY1442vw/IB3seTPbtkid3eScA/sGiBr0nm
	DCIl/JhjYbZqle3+k6lfJuEdFvgjkSiNhkgefePu9oeSO0zFZ3SpBDzf6//mYNND7L+EEMEcNWQjt
	u1QCFO8YlFizZxlbo6Wvwduuzt8Rs3IHwH5Qm5+BgnrYYKCCuqvpL1AM9A/+78x4ww2f9IuLuSBQe
	7gJCB8BEZbQOd117/KDhfzbgGFpHzVi4zwqzh1geIaRlLqrcdwELlgUS8DHS/N8i3upBCyc0giTN1
	QQM/NBgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWDw-000809-71; Sat, 05 Dec 2020 11:59:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWDi-0007vf-Cx; Sat, 05 Dec 2020 11:59:23 +0000
X-UUID: 0d3a8c6964d344aaa768da79ce514b75-20201205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jLd7Nm3oFSn11RyJKpMgLON+6J8shy7TQyZewplsuGg=; 
 b=mqCg6+GnJnwRJ9cR/rRixQ4tq38usGDC4BajuHbzdA1LNuWoQ3zKbB3JTxxrLnmaDIHgtNTbo4xpK0i6Upz7pmTCr0k/zXqIOfX709QLccsGZFMHSFfBCVtL28IeftvJOdbO1UEfu38JoBP2ocr64vupcFHGcctzRbCt8vl9Cy8=;
X-UUID: 0d3a8c6964d344aaa768da79ce514b75-20201205
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735197263; Sat, 05 Dec 2020 03:59:12 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 03:59:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 19:59:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 19:59:02 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v5 0/4] scsi: ufs: Refine error history and introduce
 event_notify vop
Date: Sat, 5 Dec 2020 19:58:57 +0800
Message-ID: <20201205115901.26815-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_065922_688222_55AE273D 
X-CRM114-Status: UNSURE (   9.21  )
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
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series refines error history functions and introduces a new event_notify vop to allow vendor to get notification of important events.

Changes since v4:
  - Seperate patch sets according to Avri's suggestion

Changes since v3:
  - Fix build warning in patch [8/8]

Changes since v2:
  - Add patches for vop cleanups
  - Introduce phy_initialization helper and replace direct invoking in ufs-cdns and ufs-dwc by the helper
  - Introduce event_notify vop implemntation in ufs-mediatek

Changes since v1:
  - Change notify_event() to event_notify() to follow vop naming covention

Stanley Chu (4):
  scsi: ufs: Add error history for abort event in UFS Device W-LUN
  scsi: ufs: Refine error history functions
  scsi: ufs: Introduce event_notify variant function
  scsi: ufs-mediatek: Introduce event_notify implementation

 drivers/scsi/ufs/ufs-mediatek-trace.h |  37 ++++++++
 drivers/scsi/ufs/ufs-mediatek.c       |  12 +++
 drivers/scsi/ufs/ufshcd.c             | 122 +++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h             |  82 ++++++++---------
 4 files changed, 161 insertions(+), 92 deletions(-)
 create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
