Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7432AC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 02:50:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0614B22DFB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 02:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0614B22DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NBdf5/1B4XoGklBWH+KLdjHZuTtBd197a5M1KVDtW1g=; b=wdkO1PniiP4mihak/9RRuYnHN7
	ewHM++ssasF2/3AroL3bWuMqdnTZKdaEddn/feB5gC96xJjZmCqTtj+OnlBExEGt1u6px/5xuMXif
	0PyapXOPpLmlQu5LNlEr5O8IRLJU4bddF3+p95DJ6vJ1bnX97jZjwAGIVDGTkbE3oD3b2G1Itn8kV
	EWdNzaBXaZYp4rwr6EDICv28H+Xx3M2/oe66heZe/54hFh57DCkiy9/QHqZN8KYGo8+dsI8e51nS9
	6DC5UwYNTPjYp8YQQpKI4SevOARe8yDNs/l8DrceJyICNfg0kKIHm2+++JCisF9zUY7XQhWZ1tq4Q
	2EIOAIEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klNeC-0005Rh-3m; Sat, 05 Dec 2020 02:50:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klNds-0005Kd-FE; Sat, 05 Dec 2020 02:49:49 +0000
X-UUID: 3822b600cd8a469d84fef7b17e693af3-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eeHMfg4p/+msGsBFnS5rz7pxpMPmbQOrK4k+AQe6G+g=; 
 b=qAQER0PS4rPiuN7wcYrzV9MbWgALmdrzN1UJZi5IewHrcpiet7rWvlailUfTPcXur++g06qrcHz9NTOA/d7HpiezwdoYv1X4ayjCxdOmZfOCkOXCO7p/E+6XDi329nkhgGWU+D5D1/H+YjFAcHvAqfye9K8ObH3fpeQkkeounnE=;
X-UUID: 3822b600cd8a469d84fef7b17e693af3-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214670600; Fri, 04 Dec 2020 18:49:43 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 18:39:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 10:39:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 10:39:35 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v4 0/8] Refine error history and introduce event_notify vop
Date: Sat, 5 Dec 2020 10:39:30 +0800
Message-ID: <20201205023938.13848-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_214948_686192_E5F23D5B 
X-CRM114-Status: UNSURE (   9.32  )
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
This series refines error history functions, do vop cleanups and introduce a new event_notify vop to allow vendor to get notification of important events.

Changes since v3:
  - Fix build warning in patch [8/8]

Changes since v2:
  - Add patches for vop cleanups
  - Introduce phy_initialization helper and replace direct invoking in ufs-cdns and ufs-dwc by the helper
  - Introduce event_notify vop implemntation in ufs-mediatek

Changes since v1:
  - Change notify_event() to event_notify() to follow vop naming covention

Stanley Chu (8):
  scsi: ufs: Remove unused setup_regulators variant function
  scsi: ufs: Introduce phy_initialization helper
  scsi: ufs-cdns: Use phy_initialization helper
  scsi: ufs-dwc: Use phy_initialization helper
  scsi: ufs: Add error history for abort event in UFS Device W-LUN
  scsi: ufs: Refine error history functions
  scsi: ufs: Introduce event_notify variant function
  scsi: ufs-mediatek: Introduce event_notify implementation

 drivers/scsi/ufs/cdns-pltfrm.c        |   3 +-
 drivers/scsi/ufs/ufs-mediatek-trace.h |  37 ++++++++
 drivers/scsi/ufs/ufs-mediatek.c       |  12 +++
 drivers/scsi/ufs/ufshcd-dwc.c         |  11 +--
 drivers/scsi/ufs/ufshcd.c             | 132 ++++++++++++++------------
 drivers/scsi/ufs/ufshcd.h             | 100 +++++++++----------
 6 files changed, 175 insertions(+), 120 deletions(-)
 create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
