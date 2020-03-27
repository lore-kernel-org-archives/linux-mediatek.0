Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92124C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEDC206F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E4l7pci1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SDgIljdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FEDC206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/FFKxPx10LOtF+n3R88PuGb/4rmHd5x7nHYduNykZb0=; b=E4l7pci1aexGa7
	9Sbv5PCrLHOgoF+V5vWXlB0KYRmXu9MreR4f/HMNHwlK+dERENJgmTxDe/Y5/l4ecqojsOvqo4XkP
	V2JxIFwPgdCy820WcxVuPTXlRSWsbMSj773ukyBThw8azmYZ3F5kj74ZS+Lcu06NoBj9a2CezdtUX
	4q4Nc6Ni7EE2cdwVmByv96OTdgfnJvNMrsLap7lx4S3uZ+kzMtafFs4O2Sid4EYGLKC+lEvBpgLZH
	Q95hreid3cVXlqA+P5gYwTD1+ATGNhUlt86crP/pvuRNCSn6QKRuFQQtBLrlH/32R/yXk4i6UAPIE
	59m8FtsYQjrMQah/OyBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlna-00017D-CO; Fri, 27 Mar 2020 10:01:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlmd-00086c-Ds; Fri, 27 Mar 2020 10:00:15 +0000
X-UUID: 5c95723b017f4df7beed77f7e848dbe1-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=UC7oHlWaYRbuhG1CU6ttQB0ttxFaJYCjrCK3+rWYMl0=; 
 b=SDgIljdpplohuBA2YaBHQ9rGl/6oeoFQ/PGsOPGdx1T/BctUQ4Dywqko2bDKNaUxNn4ceCXT6SElPtr0xOLuyIJTYZaZslUexgX/345Tsa9kUF9r/2ZYnJJKeL2hK2AFadSN2eQ+rw7IWvlpUGOiCK5S3eIaxmM9/U51FNNcT2s=;
X-UUID: 5c95723b017f4df7beed77f7e848dbe1-20200327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1879570345; Fri, 27 Mar 2020 02:00:05 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 02:53:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 17:53:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 27 Mar 2020 17:53:29 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 0/2] scsi: ufs: add error recovery for suspend and resume
 in ufs-mediatek
Date: Fri, 27 Mar 2020 17:53:27 +0800
Message-ID: <20200327095329.10083-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_030011_937263_6AA47F94 
X-CRM114-Status: UNSURE (   6.18  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This patchset adds error recovery flow for suspend and resume in ufs-mediatek driver.

v2 -> v3:
  - Fix commit messages (Avri Altman)

v1 -> v2:
  - Fix format of comments

Stanley Chu (2):
  scsi: ufs: export ufshcd_link_recovery for vendor's error recovery
  scsi: ufs-mediatek: add error recovery for suspend and resume

 drivers/scsi/ufs/ufs-mediatek.c | 13 +++++++++++--
 drivers/scsi/ufs/ufshcd.c       |  3 ++-
 drivers/scsi/ufs/ufshcd.h       |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
