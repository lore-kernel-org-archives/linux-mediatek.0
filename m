Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE749C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A708420643
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LcgMB1XS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LM79fXQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A708420643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XsuaAC0FOM7yD0iHzD58GJFIdVfENZYjYYyVqtYIkY=; b=LcgMB1XSaKcP6C
	gdKddEfI6LkYamnNrp5ZTjIr6C2VkFiRoHmCiEHhfU4RdnEFVClKcydjqE0HLrYs1hKnL+e8TdJYl
	1AL8TbnrCLHFLctDn7LXbbwfi6kK0EChnCe+lDw8j4fjIZmNWkDwj/MPvPw+lNkluhNy/a12nO6Cv
	BMhHKi6NAhTksgFtKh2b/gk6zEGjfdyq9H8SMZXbPHaLze9gDW3ex6p+H6CBMvGzcM1oQmgN9oOpu
	WSCBbq4VcRYKL7ix5kKrVlI2NYVtnqQbcJA+e9Q1s7rudajQLB9m0tQBU8CG8D2IM+nABzwZhbBc5
	rXwDtL723TrZaqu1Ongw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZFOH-0007u9-Gx; Thu, 14 May 2020 15:03:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZFMd-0007DQ-IJ; Thu, 14 May 2020 15:01:39 +0000
X-UUID: 26478943be6f4755801cd06620ebe610-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=shvkj9A9bwueIh1LMlmBnCkpSglW983N02ZzRfmxG8k=; 
 b=LM79fXQpLxg9nVaRgeO6D1J9tdaAudN+SvyYWVGzBObBZRo6wB4h3RQdI5JXq/B4pDa3vcUTGuTZkl/vZRS9tMQpgdL1Sfh6I5NOuxiKkZ5c4rD6h747FhsMusKWfeqcNRlKT5SbGd4GYmrQn/9K7Zk3eDQzK1m4IoF6H1iDr4U=;
X-UUID: 26478943be6f4755801cd06620ebe610-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1272763319; Thu, 14 May 2020 07:01:33 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 08:01:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 23:01:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 May 2020 23:01:20 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 2/4] scsi: ufs: Allow WriteBooster on UFS 2.2 devices
Date: Thu, 14 May 2020 23:01:20 +0800
Message-ID: <20200514150122.32110-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514150122.32110-1-stanley.chu@mediatek.com>
References: <20200514150122.32110-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_080135_607761_17B0ECF8 
X-CRM114-Status: UNSURE (   8.28  )
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

According to the UFS specification, WriteBooster is officially
supported by UFS 2.2.

Since UFS 2.2 specification has been finalized in JEDEC and
such devices have also showed up in the market, modify the
checking rule for ufshcd_wb_probe() to allow these devices to enable
WriteBooster.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 41ad4501b0d0..b298bdd3e697 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6942,6 +6942,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 	 * UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
 	 */
 	if (dev_info->wspecversion >= 0x310 ||
+	    dev_info->wspecversion == 0x220 ||
 	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
 		ufshcd_wb_probe(hba, desc_buf);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
