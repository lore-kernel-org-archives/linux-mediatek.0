Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B345ACD1284
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 01:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFeBk0+DU89vq1hnnaI6Bl2UJs+AoSLPwHXjH8VzhJc=; b=WakzxpuppK9i5Mm/EdLKDPKFNT
	KmBhcLYqdBowz7WPu6OY+jN4d2/VjL+fNQ0ajpF9HJzfaykoRBAftNGMBBJGGo1DYipsmuekZyXZw
	gdK1FA3abUD5ilJ0X4pD3V1cxEsIW0gToKKZSgKUdssml9BN15HHSbUBFJMNpVre0s/GdtQb/K7iO
	Y4DB0u2YHtui+0C5ObyaGQhRpNqtgVgmcYr1YDtiDZW/4eKAqjEUFE51BY9emgthliVD71L3EgS/N
	6qJCkTkiH8BXAtvj1/x+z2vXeQiYy5lipxF/WHFTTvw9THrMgj70fteQc3E150eR0yBSS0ejpIRO5
	r63VQ20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq1PC-0000000GQbd-0ztu;
	Fri, 29 Mar 2024 01:51:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq1P9-0000000GQav-1mcW
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 01:51:40 +0000
X-UUID: de90a40eed6e11eeac1957ae9f99f617-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JFeBk0+DU89vq1hnnaI6Bl2UJs+AoSLPwHXjH8VzhJc=;
	b=ZYMtxWa/DQkQkb2okA5e8dQhKKRHNEeonRrEwuughBkwtl6a10IghucEGzzseYEPNZTTaDjzlKMeA+GcttyVl81LFaD9R/SvNnzxj3n3CcAIlFncbG6fBcZJ2DUf6hhkOdyWts1AJlp7IP0qaoyvKjPMBSxFHk99BTEMdVOyHfc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b8d0744d-61e0-4735-9ed5-18e2f0a6ef87,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:6f6c9085-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: de90a40eed6e11eeac1957ae9f99f617-20240328
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 946284137; Thu, 28 Mar 2024 18:51:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Mar 2024 09:50:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Mar 2024 09:50:38 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v2] ufs: core: wlun suspend dev/link state error recovery
Date: Fri, 29 Mar 2024 09:50:36 +0800
Message-ID: <20240329015036.15707-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.622500-8.000000
X-TMASE-MatchedRID: ivhBngArENGAAYHsHSPDcxn0UD4GU5IqKx5ICGp/WtEmu2XKsBcW8RUO
	nrDGROOdLqWDA5QpvGM5QOj/9mEf0+DjmHulaCpRKaMQ6tw7oDJMkOX0UoduuQqiCYa6w8tv0Qx
	Bl5kNTScp3hgx44GaWoAGGZdCG6IYHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWU4F/Jt8R932aVJ
	EcZrHk0BlgnfyUVZLGJaK2yJXqOmyluwNqrgYVCguKdSkv7OH9i00MVOIfvt402JboeFS9LaIYp
	U3TtDF2wZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.622500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 707F0AFAE786535E85E36500F0A0D11221CD9D1ADC9505F9C3C461812A0605812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_185139_473670_F700511D 
X-CRM114-Status: GOOD (  12.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

When wl suspend error occurs, for example, BKOP or SSU timeout, the host
triggers an error handler and returns -EBUSY to break the wl suspend process.
However, it is possible for the runtime PM to enter wl suspend again before
the error handler has finished, and return -EINVAL because the device is
in an error state. To address this, ensure that the rumtime PM waits for the
error handler to finish, or trigger the error handler in such cases,
because returning -EINVAL can cause the I/O to hang.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e30fd125988d..292b06f361a2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9791,7 +9791,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	/* UFS device & link must be active before we enter in this function */
 	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
-		ret = -EINVAL;
+		/*  Wait err handler finish or trigger err recovery */
+		if (!ufshcd_eh_in_progress(hba))
+			ufshcd_force_error_recovery(hba);
+		ret = -EBUSY;
 		goto enable_scaling;
 	}
 
-- 
2.18.0


