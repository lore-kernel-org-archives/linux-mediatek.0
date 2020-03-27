Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BE5C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2755206F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MyZ5wy2i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KUG0oKg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2755206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDkJDb3GPKPWJG7cvG89PSG3UYQwJBYlhf7A1I3UStg=; b=MyZ5wy2i4akhY1
	5ZMjzXBr5VICleKre7t/BdHib3Ku/4lbE1Dpo9wEFS9D7Vib5PU4407CuYkpZjtwuylxnkbMw083A
	1dlAPHvUcZIihBEAdwSZ1KXRldjSuBcJeA4T0c23zj74+/FLaMwn0xR7swHmUMpWf2WrZa5WRfSSW
	WARMfErXh61ZyaAPRqipOdMOimf99yN6WxcZDI0i1skLhUrzAUIQgn7ylrTa/MqVhH3gfTvydXe1d
	dKFQcbadEsAdN1syHOGV4ylDe/vJBrqwXgSBxDtJ9LMMMbE/dBqFzUAW+ufVe2T/FwOnmi89oAx9r
	tHNxkZPRA6XouSmS4gNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlnb-00019X-U3; Fri, 27 Mar 2020 10:01:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlmc-0007zr-S1; Fri, 27 Mar 2020 10:00:15 +0000
X-UUID: 5d1753f0dc3f4f1cb00a144f2a30bdfc-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X65KhStxBXm6tC9CI8ImCK/G24gu+sDu1lPtIdSpMxY=; 
 b=KUG0oKg0QJqdYbm1dzR5NyuVycOTFoTvook9jaL7ZMTNzbr53I1f44sYBD5b2j50Tp2MbpG5TtYYzgou5UiCXcK99WZwvaDhSTG5L09jwFm/nek6dV6vNcOijW5j1KPYx4sKVsHueu28pEjNgAzuT+jsKSEvGx7lf0mV3DcbvXg=;
X-UUID: 5d1753f0dc3f4f1cb00a144f2a30bdfc-20200327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 500816332; Fri, 27 Mar 2020 02:00:05 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 02:53:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 17:53:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 27 Mar 2020 17:53:30 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 2/2] scsi: ufs-mediatek: add error recovery for suspend and
 resume
Date: Fri, 27 Mar 2020 17:53:29 +0800
Message-ID: <20200327095329.10083-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200327095329.10083-1-stanley.chu@mediatek.com>
References: <20200327095329.10083-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_030011_471346_2BB239D9 
X-CRM114-Status: GOOD (  11.45  )
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

Once fail happens during suspend and resume flow if the desired low
power link state is H8, link recovery is required for MediaTek UFS
controller.

For resume flow, since power and clocks are already enabled before
invoking vendor's resume callback, simply using ufshcd_link_recovery()
inside callback is fine.

For suspend flow, the device power enters low power mode or is disabled
before suspend callback, thus ufshcd_link_recovery() can not be directly
used in vendor callback. One solution is to set the link to off state
and then ufshcd_host_reset_and_restore() will be executed by ufshcd_suspend().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 40a66b31b31f..673c16596fb2 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -499,8 +499,15 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
-		if (err)
+		if (err) {
+			/*
+			 * Set link as off state enforcedly to trigger
+			 * ufshcd_host_reset_and_restore() in ufshcd_suspend()
+			 * for completed host reset.
+			 */
+			ufshcd_set_link_off(hba);
 			return -EAGAIN;
+		}
 	}
 
 	if (!ufshcd_is_link_active(hba))
@@ -519,8 +526,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
-		if (err)
+		if (err) {
+			err = ufshcd_link_recovery(hba);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
