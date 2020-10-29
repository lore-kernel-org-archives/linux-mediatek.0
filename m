Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C91CC5517A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D01220825
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlNdAv0/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VoR6k2bp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D01220825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4xlbBunhswdzzfFOM0FII2Qmia/U5iKCCRZQEm4jLcg=; b=rlNdAv0/vVAfyfvOAuyuh3XwPe
	jq8nlufJzPbdnwqZF5ZDWzjUy1hdXlxgBP0fZZ6ulTnxNGr5NLeNloD7gS61JiVcOncAxv1js+sdm
	3G9zDihxR0P/8T5R9Wlvcib5TPHzjI7clKeqPMsv6GSf5pa5d0rS/IM35xacdRo+2nypnEFIwyPaX
	ZlWensfRH+s5wfl0+RNyuat26FsUjp4bNU8Ybqg2U+LFX4ehJV0h/Oig5DmYbGD0U5Cxc1LiaOAdY
	SrYYsdcTzljiwJKE/62eKbdBl7KAYKuvyFtLcwdXGCr/n7OmnoApxFpzeFbu7ApLuOOnq7F2AE57s
	OS8Zjf3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6ak-0006Cb-Aj; Thu, 29 Oct 2020 11:59:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6aD-0005ww-Am
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 11:59:12 +0000
X-UUID: 6a8a330e5d0e45bfb78eaf422c24bdc8-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TLQL1F5nx2wwKalpLHC2wUfSew2UGwvEZg1kmpw5dJM=; 
 b=VoR6k2bprBy2BJe6DSH62HZqQsfj/Ii20ViSwhqDK4NlWNA3Bx0sogyX7wWBw756r0hCX+W3f639mhmzv1IaRhQW20hzJCgR7Cc27aw5FRgFP2LrXy8pSPtEGUydJp57jpYyQJIMgSMB8Wd1uSgGmBswEVsvrmbaMTzgwn2oiWY=;
X-UUID: 6a8a330e5d0e45bfb78eaf422c24bdc8-20201029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 153101152; Thu, 29 Oct 2020 03:57:54 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:57:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/6] scsi: ufs: Add some proprietary features in MediaTek
 UFS platforms
Date: Thu, 29 Oct 2020 19:57:44 +0800
Message-ID: <20201029115750.24391-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075909_595965_69FDFE40 
X-CRM114-Status: UNSURE (   7.64  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This patch series provides some features and fixes in MediaTek UFS platforms,

1. Support VA09 regulator operations
2. Support option to disable auto-hibern8
3. Support HS-G4
4. Decouple features from platform bindings
5. Misc fixes

Stanley Chu (6):
  scsi: ufs-mediatek: Assign arguments with correct type
  scsi: ufs-mediatek: Support VA09 regulator operations
  scsi: ufs-mediatek: Decouple features from platform bindings
  scsi: ufs-mediatek: Support option to disable auto-hibern8
  scsi: ufs: Add enums for UniPro version higher than 1.6
  scsi: ufs-mediatek: Add HS-G4 support

 drivers/scsi/ufs/ufs-mediatek.c | 218 +++++++++++++++++++++++---------
 drivers/scsi/ufs/ufs-mediatek.h |  22 ++--
 drivers/scsi/ufs/unipro.h       |   6 +-
 3 files changed, 179 insertions(+), 67 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
