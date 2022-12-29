Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 03:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5APWQ/KbXgNbszB/TlGiUT+18qB2uNXqqSohrW/gfYk=; b=mfriuAFC7Bn3/V79AG4qYW30jJ
	HWzV+Sf0ZqzzT/NWelj2NCUyx/N13ckZUFE4pe6o/2A1g91DxhjvzA0ov8GJIJ3bD/z17CX7JfjZX
	DfKqd2fhAlSWRa0QqB/iRZcT0TzNLSx1rReHCbv4ncsmFhjdauuSg0G5TG0oN7sVTClR+4z82vvPW
	qRiZRLjQS+ksRld6pn7BUD+Je7y2/dWGxgt3Wtp/NWb2wdgF70TdUALA4DhUyXHn+B2qxSwoinjAO
	slSPAJdXijW5J9JMA1we5ngnWru7uJrVT5BIDfIPLEXAiBxWiKZmtUMarUPZQrxkiNcfphqHPxK6J
	QDnUpEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAjH6-00B8NI-RR; Thu, 29 Dec 2022 03:08:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAjH5-00B8MW-40; Thu, 29 Dec 2022 03:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5APWQ/KbXgNbszB/TlGiUT+18qB2uNXqqSohrW/gfYk=; b=e9uyhAcBHO7MvtkeR8nLm/RxzV
	i/fPxzKnPHh1hymnRyQ28B0d5UUOo2uthRK5RSR/xnDxCs6YlwSEQA4Qn/EeUdckoKpyA9pqL5tfM
	dRTUjwuuvLT/uueeW/rZWc88/mLzrzLG3fWTZmGqVTanqrUMTDw4miDNI+R0eFfsCk2yM01VRX7LZ
	7C8V5DxD1bbd1oMFyopYLcCGUiAUYW+QJ+Ta1hi36QUxTTQzApEiZztF7lhL4PzxwA3+dIDBzGD0g
	Olw4mu4VgpWiwR65Cq+/3iiUu/mZEJFYqPPhdFeJybOuYK+sfuLQaoeMlyrfyQ3QwFesmAJgDh/2e
	yq4Zj2SQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAjGw-00GHUS-1e;
	Thu, 29 Dec 2022 03:08:01 +0000
X-UUID: 5c189f2b58fc4ccf83df6946ec62af06-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5APWQ/KbXgNbszB/TlGiUT+18qB2uNXqqSohrW/gfYk=;
	b=M+SEdy1odN/D7M0XvmrsTCkZL4+LGihKK/MHy+ImExNMtwEhw8rg4WxKkSYwEICe3F3L1UooFt0rF8nasF5GuH0ffEqBXno2BaUe19JG5Go0PILseVDes41t5TOmH2PGtUBlcpZ0K9OzW9ZXSD7OiReaaRtKgMiGJ+WTwxRyMY0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:891043db-1425-4fb7-90da-32c546dea9fa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:643f40f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5c189f2b58fc4ccf83df6946ec62af06-20221228
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 47579237; Wed, 28 Dec 2022 20:07:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Dec 2022 11:07:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 11:07:17 +0800
From: Ed Tsai <ed.tsai@mediatek.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
	<linux-scsi@vger.kernel.org>
CC: <peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<powen.kao@mediatek.com>, <naomi.chu@mediatek.com>,
	<stanley.chu@mediatek.com>, <wsd_upstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Ed Tsai <ed.tsai@mediatek.com>
Subject: [PATCH 1/1] ufs: update the timeout timer after resume
Date: Thu, 29 Dec 2022 11:06:45 +0800
Message-ID: <20221229030645.11558-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_030759_374608_C0414BAB 
X-CRM114-Status: GOOD (  10.52  )
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

The tags allocation is limited by the number of active queues and a
queue is marked as inactive by the queue timeout worker after up to 30Hz
by default.

Therefore, tags for the general I/O may be limited to half of the max
depth up to 30HZ after resume. To make sure the ufs request queue for pm
usage can be inactive immediately, trigger the timeout worker to release
the tag set.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e18c9f4463ec..c77570caa3a8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8842,6 +8842,7 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 		hba->curr_dev_pwr_mode = pwr_mode;
 	}
 
+	mod_timer(&sdp->request_queue->timeout, 0);
 	scsi_device_put(sdp);
 	hba->host->eh_noresume = 0;
 	return ret;
-- 
2.18.0


