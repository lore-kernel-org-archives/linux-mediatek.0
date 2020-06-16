Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BF9C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FFD2071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HYGDmLJh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UEtOfsuq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17FFD2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MOUgK4GmTS99RD+It2hgAiV0mcgBsSW235eulFh2Ck4=; b=HYGDmLJh85q+Dg
	xYg6WAR1Z4/ktAiBSPaQH4UT1IrJnoVyDWckkbxcrZBbGtsLyUFJtua22i26p+6fkpH3/Movn3vnK
	X/BZtRXt78VF3Rvf+YxHQ9qZulE3O1yDNyZO0kKGqzIH125yu73t56KSUzL441srNXIa1lx0EiFYb
	QQzfc005cCtMaQX4h3t2DPP3NI4HHVjfBZt6wnQ3K2FiDeGt08VSVuBjbC63rc9BnA9ODpCX3cikS
	aa7nZ64hKsQBRqcaJg3y4n5kJ5ybJb0gMbaIzXhaCNnATWw+oBgoJM+RPJeY70fTbw/wW7zW5CdFk
	1DzKuWjmIGMpkt2bySnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl8Fo-0004x1-47; Tue, 16 Jun 2020 09:51:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl8Ff-0004nI-Mv; Tue, 16 Jun 2020 09:51:32 +0000
X-UUID: 38caec1d4db34960a03bab1618a19f0e-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PUmd0x9RibPQtgq71WhoBPwcOlI5fEGWCsbX2zCT6VQ=; 
 b=UEtOfsuq7DAjTXOjStRaimXdavQ70uYZhrfrMF/JC850yawuL0VNDaueBR8jq6YoQcClIGW1X4+7BnHLhI68YaERECB1gBD30a6PONW36gouybWqtqxxHnHmpC+csfIn3fIoA2QthvxmVKzmmMjF9J9sn1a3Bd62wiFCH+TvZSM=;
X-UUID: 38caec1d4db34960a03bab1618a19f0e-20200616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1078669262; Tue, 16 Jun 2020 01:51:24 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 02:51:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 17:51:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 17:51:19 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH] scsi: ufs-mediatek: Make ufs_mtk_wait_link_state as static
 function
Date: Tue, 16 Jun 2020 17:51:20 +0800
Message-ID: <20200616095120.14570-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_025131_751062_6804B186 
X-CRM114-Status: UNSURE (   6.97  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix build warning reported by kernel test robot:
Make ufs_mtk_wait_link_state() as static functon.

Warning:
>> drivers/scsi/ufs/ufs-mediatek.c:181:5: warning: no previous prototype
>> for 'ufs_mtk_wait_link_state' [-Wmissing-prototypes]

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 9a4432c9f7dc..ad929235c193 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -185,8 +185,8 @@ static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
 	host->ref_clk_ungating_wait_us = ungating_us;
 }
 
-int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
-			    unsigned long max_wait_ms)
+static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
+				   unsigned long max_wait_ms)
 {
 	ktime_t timeout, time_checked;
 	u32 val;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
