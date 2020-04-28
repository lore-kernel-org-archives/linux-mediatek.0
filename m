Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EEDC83007
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9021420663
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCJsfrW3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AYudQjFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9021420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HAShJdkMgfJqksXbUvDIeWDlZXCycdS1eBcWRT6qlx8=; b=qCJsfrW3XvgFse
	Bj3xzYjKWF1SaXptMzFzQBYHkFjQQv3aJzIEs+9czW7MYtnCPIxmWtHzMWCbs/b6WYaR1IuB+qMUu
	rTtklvm+CPhHQUSYBVGNNJWxCCu1vhBKC681MERSbjvv5tRlMFarD2hQvybm+FhhHYYSkgPr3lYc+
	hycOsJROVaYb+irXvCkwDanjZ/dumLXG527UOQeSnlw0c2L7a2YZx8uAboAS33JVVRJlK3DZkYDDe
	6D7Y+Dg44SMM/kFcQG9tMzKUUmwfSmo87o9Xtr/N7YSD/K0efOC+l6WYXxbyxBdqwjCj+Qf0fZUIN
	jGSTr2jadgvxg4vnpt1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTOCw-0001wV-VJ; Tue, 28 Apr 2020 11:15:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOBs-00072g-28; Tue, 28 Apr 2020 11:14:17 +0000
X-UUID: 51e8df7d3a494bcdb97a8490f5a3b99b-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QzA8ce3Zb+Cb5FxfMleVNOR9S7PdPbiRGLtF5i51lXI=; 
 b=AYudQjFw9TXnD90EGOP+OamtJm++6VgOE/utM5rRaCMSE8x2dGoM2BObN87B6jf1Br6+MrAQ1VUEfpGrzcYY0s+v0q/O4CsB4xbnZjeTYYtfbVfyKzTwJhlPVsMaF6YxpCeLdNUy44685eBMNJDZHnGpfqE0GpV7TXDVy7x6SwY=;
X-UUID: 51e8df7d3a494bcdb97a8490f5a3b99b-20200428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1553890403; Tue, 28 Apr 2020 03:14:07 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 04:14:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 19:13:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Apr 2020 19:13:53 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 0/4] scsi: ufs: support LU Dedicated buffer type for
 WriteBooster
Date: Tue, 28 Apr 2020 19:13:51 +0800
Message-ID: <20200428111355.1776-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D70ACAEADA4D6AFA83B01F72597E6A176F44B5E34CCE1D0C1C0C49672F72A882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_041416_107258_FDBB20B2 
X-CRM114-Status: UNSURE (   5.58  )
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

This patchset adds LU dedicated buffer type support for WriteBooster.

In the meanwhile, enable WriteBooster capability on MediaTek UFS platforms.

Stanley Chu (4):
  scsi: ufs: allow legacy UFS devices to enable WriteBooster
  scsi: ufs: add "index" in parameter list of ufshcd_query_flag()
  scsi: ufs: add LU Dedicated buffer type support for WriteBooster
  scsi: ufs-mediatek: enable WriteBooster capability

 drivers/scsi/ufs/ufs-mediatek.c |  3 +
 drivers/scsi/ufs/ufs-sysfs.c    |  2 +-
 drivers/scsi/ufs/ufs.h          |  7 +++
 drivers/scsi/ufs/ufshcd.c       | 98 +++++++++++++++++++++++++--------
 drivers/scsi/ufs/ufshcd.h       |  2 +-
 5 files changed, 86 insertions(+), 26 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
