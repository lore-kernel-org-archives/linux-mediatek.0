Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BA4C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947E923AA9
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947E923AA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1iiblJrwa1mb1ngoeEDmRR3jHzxZm+xqDVUCItXCLzI=; b=P/RmJy7wqX1H9UuHpwYrbi9Yj
	HNXObl/47WmfE0s50Buvl/+FtW8raxAolVFPf854JBeNYLMls4pa7qXsrz1NUbIePyRKZNLshuIyP
	qN+0bj71hBJHxfYgPItLXB52Qs/rkW2gcz+hsuYb4Nkk8y5Y48FOiC7hZfLS5PddYkNPClaNsshHe
	ELoNSEN7nheNpO1QVlBkI+u4PoAai6GQgZubWIUUR3CUEPl8IMYOQ22RDo1GKwdNXc1L1opiVIXiQ
	0McxB9zxmgfOh1F6ykv213qYdXvqWJy6AY/dpAZV61cJiKWigSewfQ4FMj5Rq9tvVGHS1swE5GO1X
	ucKn1ibPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdU2-0000hi-GJ; Tue, 08 Dec 2020 13:56:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdTy-0000eY-Ey; Tue, 08 Dec 2020 13:56:48 +0000
X-UUID: 0db4a970b7144c698cd059301b4367f9-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Co+OOr3KYggelm+IGmD6LtTfybVt8t8jRSGk5TvnfEY=; 
 b=ggFR1MwNKjyc7+Dkdk7mMUM+P6Or28lh6C2c4uGRVDnH2sO8r6WJAOEAQHQIg9UrwpvgdHvd46o0yr4J43suYbOGzR9+tytPQJyub/NMLrwSrLFZF4cFt6orzuENNQMF2WqmGaTYKq1KGml6iB+WvllnZnLPL8Rj4AbGgBdX/TA=;
X-UUID: 0db4a970b7144c698cd059301b4367f9-20201208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 574089983; Tue, 08 Dec 2020 05:56:39 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 05:56:37 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 21:56:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Dec 2020 21:56:34 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 1/2] scsi: ufs: Re-enable WriteBooster after device reset
Date: Tue, 8 Dec 2020 21:56:34 +0800
Message-ID: <20201208135635.15326-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201208135635.15326-1-stanley.chu@mediatek.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_085647_337233_57F5F7B2 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: bjorn.andersson@linaro.org, Stanley Chu <stanley.chu@mediatek.com>,
 alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UFS 3.1 specification mentions that below WriteBooster flags will be
set to default value, say disabled, after power cycle or any type
of reset event. Thus we need to reset those flag variables kept
in struct hba to align the device status and ensure WriteBooster
related functions being configured properly after device reset.

Without this fix, WriteBooster will not be enabled successfully
after by ufshcd_wb_ctrl() after device reset because hba->wb_enabled
remains true.

Flags required to be reset to default values:
- fWriteBoosterEn: hba->wb_enabled
- fWriteBoosterBufferFlushEn: hba->wb_buf_flush_enabled
- fWriteBoosterBufferFlushDuringHibernate: No variable mapped

Fixes: 3d17b9b5ab11 ("scsi: ufs: Add write booster feature support")
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 08c8a591e6b0..36d367eb8139 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -1221,8 +1221,13 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 	if (hba->vops && hba->vops->device_reset) {
 		int err = hba->vops->device_reset(hba);
 
-		if (!err)
+		if (!err) {
 			ufshcd_set_ufs_dev_active(hba);
+			if (ufshcd_is_wb_allowed(hba)) {
+				hba->wb_enabled = false;
+				hba->wb_buf_flush_enabled = false;
+			}
+		}
 		if (err != -EOPNOTSUPP)
 			ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
