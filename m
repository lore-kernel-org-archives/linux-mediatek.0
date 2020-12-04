Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5718AC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:53:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E988822838
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E988822838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w+iQOzBIdwcZXMdsAONjrVz0F/Q8ye4V+Yhq0uDTsyU=; b=O7V3tplUJknhzPC/oqOvNeHpj0
	5GDTbWeAdca+DkKUqM3RE6BzFEbVyCMt6i6T8LiSXRsWhWv9QnLKWAUzB5boabghAmGm5IpHZf1RN
	Uy1rsLPqkSJWQEqmahd4dzq6dJdVVg4a/Z0F2g+c8wvJIL1FRIt/XgJpSbBIT96C2+crl17Mqe+UR
	koAVYGPNLxmGBHiBSQPcDUU+abu0InPRIsxVULJpA8R8kyL+wrZLlOGEF6Z15OdebZOm0YDk6f3xT
	ZIT1DTfu3MDVzRfVojmzsjLzpJjAmgNjBmSwBYs2HIOdofHKh1ZPOWCXiz0gbQA1gctir5Na4N/dO
	v8+cnNog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7mA-0002Z4-3u; Fri, 04 Dec 2020 09:53:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7lz-0002VP-8q; Fri, 04 Dec 2020 09:53:08 +0000
X-UUID: 24467a889dfc4456a8d3308a9d86d709-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FCtZXdBWhCqu46svb1qEjZeZ/CAqZi5wiUZBlRXEPTg=; 
 b=ErOFi4C84jf8jeqcAg3xttzXst8rum34orTvGoVuKkWs7fQ8WmlwLwO0+LoAgFJzjwQaofTfEKRtAwIVeCxY2gJ3s67WU09n4a1jhg092kvALP5JbW+6FyNv/WC8Av+2d6j91D8Gs8bF/yIvXKtwcXd7HNKO1SqjtZsbmC4eM6Y=;
X-UUID: 24467a889dfc4456a8d3308a9d86d709-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 968899203; Fri, 04 Dec 2020 01:52:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:50:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:50:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:50:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 0/8] Refine error history and introduce event_notify vop
Date: Fri, 4 Dec 2020 17:49:59 +0800
Message-ID: <20201204095007.20639-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E9CA04517EA506731A4081A1E3F223875F831D9094E0AEB5CE6F1301E2DFB8A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_045307_463823_C092AFD8 
X-CRM114-Status: UNSURE (   9.48  )
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

Changes since v2:
  - Add patches for vop cleanups
  - Introduce phy_initialization helper and replace direct invoking in ufs-cdns and ufs-dwc drivers/scsi/ufs/cdns-pltfrm
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
 drivers/scsi/ufs/ufs-mediatek.c       |  10 ++
 drivers/scsi/ufs/ufshcd-dwc.c         |  11 +--
 drivers/scsi/ufs/ufshcd.c             | 132 ++++++++++++++------------
 drivers/scsi/ufs/ufshcd.h             | 100 +++++++++----------
 6 files changed, 173 insertions(+), 120 deletions(-)
 create mode 100644 drivers/scsi/ufs/ufs-mediatek-trace.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
