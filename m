Return-Path: <SRS0=lRAH=3A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D724C33C9E
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBF02082E
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZzgRX92";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A4tXQFid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBF02082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3UFGFlR848gfqDC6st7CEl2M6HrgyhFpvSVydVYEzo=; b=GZzgRX92lILw0D
	0/8WaBYas8cBQQ3okg1HL4UwQC+0JX1ENMVUpwwzUa9sigTEHEHaiOW2MMNUjP4JK7JkdG9Q0Z6GG
	B6uIv/2v0RBgwQ7458iDcUhpod6zKABalW2fp/JuaD80OZySBpDK+KkbdCnytsDB0OjXGVi240VKQ
	jJshi1bC2tGG7xQUxdMc6M7vkUlm/5C8CmWpngICtt45LEYlCktepVCDtSliwoVdqRPBtLsma1iQL
	JNyhYkCH9XtXwIfgyhA8Hu7zgAVjIyhGUEjOLyvZJ02LmkBUSleEqKiPRKfZEnsjgbGfMQ5IoNfEu
	agHVINf+aNn0GNfNTaJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqAwc-0003TT-9B; Sat, 11 Jan 2020 07:12:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqAwU-0003Lx-Qp; Sat, 11 Jan 2020 07:12:20 +0000
X-UUID: 96841ec7371f408e9175583e27b0c137-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9mo99xIvkfScUshABg5R+2UHB6H3sxJILIKNOtsoiKk=; 
 b=A4tXQFid6+6alC3FPA7e+ahoHXHoVpynmgTpuqCgwqnxGxISFxEWFm54ES3r3D68vgfztmPCFWc1a+uVRXjhfoC2EIX5tGbXds0UXHegfbZAAe5J/4gfJ0AzCxkPf/gs+mLDXOclNqjPncFKf2NEhyz4CfbsyGtGUtxcqFfkmrg=;
X-UUID: 96841ec7371f408e9175583e27b0c137-20200110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1047609019; Fri, 10 Jan 2020 23:12:13 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 23:12:10 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 11 Jan 2020 15:11:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 11 Jan 2020 15:12:37 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 0/2] scsi: ufs: pass device information to apply_dev_quirks
Date: Sat, 11 Jan 2020 15:11:45 +0800
Message-ID: <1578726707-6596-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: F766C1091C1913520CE1D9691BC16BBDA3D7AF20A07BA51859A15704091991D62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_231218_872639_9DE30819 
X-CRM114-Status: UNSURE (   7.12  )
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

Currently UFS driver has "global" device quirk scheme to allow driver applying
special handling for certain UFS devive models.

However some special device handlings are required for specific UFS hosts only
so it is better to make it happen in vendor's callbacks only to not "pollute"
common driver and common device quirks.

We already have apply_dev_quirks variant callback for vendors but lack of device
information for handling specific UFS device models. This series provides such
information to apply_dev_quirks callbacks, and applies related modifications.

In patch 1, since QCOM vendor driver will be built by default as a module, UFS
core driver and vendor driver can not be split to different patches, otherwise
separated patches will not be built singly.

v2 -> v3
    - Fix ufshcd_tune_unipro_params()'s users to have correct parameters for invoking.
    - Rebase to Martin's latest queue branch.

v1 -> v2
    - Squash patch 1 "scsi: ufs: pass device information to apply_dev_quirks" and patch 2 "scsi: ufs-qcom: modify apply_dev_quirks interface" to resolve build issue.

Stanley Chu (2):
  scsi: ufs: pass device information to apply_dev_quirks
  scsi: ufs-mediatek: add apply_dev_quirks variant operation

 drivers/scsi/ufs/ufs-mediatek.c | 11 +++++++++++
 drivers/scsi/ufs/ufs-qcom.c     |  3 ++-
 drivers/scsi/ufs/ufshcd.c       |  8 ++++----
 drivers/scsi/ufs/ufshcd.h       |  7 ++++---
 4 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
