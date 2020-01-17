Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6B9C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 04:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E15A20728
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 04:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYM7YGxc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iLTSp5hc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E15A20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rXHOm+4XNtrk9ipFV6vpcGncJrL+MzY+6cMybkpEfj0=; b=DYM7YGxcyPvrJF
	uKlI9hCBLleJiVwe6pssMksLvC/PbRnyqxSIXu/unqbvmfMbTwn1ofJGemAdCibWlXT1zwYc1NrKE
	qsISa7/19OD5zp9lp1Qq7GNoy4I1Sg0BSkmsE8IPc9ZfhyzuhnI5cb0cRx4s/doY4fLRIzoL39FP9
	qUiLMZkqXaLPXCXt7ymebwdGd+qOdgiPSqQ7LpzfqZNJgu6ejuz2fMSmx6FBwErD6Pcpit7bRbrDm
	cXgIqXQEsvYfQqtY3atd/rvDTbRsj8aS8zIMJIIiS6CGvSdHr/x1JTj7PGtmionxnrTO92beYSZ+H
	NXY60TJPdMVZCA2S9gLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isIpt-00028p-0m; Fri, 17 Jan 2020 04:02:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isIp0-0001Ch-1l; Fri, 17 Jan 2020 04:01:25 +0000
X-UUID: f71da81012594a5cbd0ea412cf314bb4-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VjZO8NXrEdygh8unLaMlK+CBj4HVc+zbQuqJLK0MpHk=; 
 b=iLTSp5hcnEEBPvLkOeoDxXrjyGkAzjUoajAoqkCX0J9Sfye+1631IoZtlpcvHpXMziPlNeArWMr0VmuD5za4aHLAwtp8zRu8W+Eg5RXDxkwuvbU6sQ+QrnWYChmcYzk45+GqQMcjR1aS2+SbRC5w+8kkqgyrCaWFURCMYtqufUw=;
X-UUID: f71da81012594a5cbd0ea412cf314bb4-20200116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1245933847; Thu, 16 Jan 2020 20:01:13 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 19:52:06 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 17 Jan 2020 11:50:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 17 Jan 2020 11:51:08 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/3] scsi: ufs-mediatek: add MediaTek vendor implementation
 part II
Date: Fri, 17 Jan 2020 11:51:05 +0800
Message-ID: <20200117035108.19699-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_200122_130256_B3FCBAB6 
X-CRM114-Status: UNSURE (   5.44  )
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

This series adds some MediaTek vendor implementations in UFS driver:
  - Callback dbg_register_dump
  - Low-power mode for hibern8 state

Stanley Chu (3):
  scsi: ufs-mediatek: add dbg_register_dump implementation
  scsi: ufs: export some functions for vendor usage
  scsi: ufs-mediatek: enable low-power mode for hibern8 state

 drivers/scsi/ufs/ufs-mediatek.c | 70 +++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  5 +++
 drivers/scsi/ufs/ufshcd.c       | 11 ++++--
 drivers/scsi/ufs/ufshcd.h       |  3 ++
 4 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
