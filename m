Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8750C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 08:32:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5271220812
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 08:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3suEbDN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e5a8fF0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5271220812
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7TpGvZ/PQ43gQVRbuy0al+ZhZyEfbou28GupZfH174=; b=C3suEbDNbUHOYq
	p7UjiXOYtbhPmhOcQEsYbhHwG0hpS1SNE+c5YkdragR9uZr/qiDCTYyjlBsCmc79ai2MczYadkOeg
	dfR3Dd6oz2i94MdtP+qSPNxpAQTInqvzDOXHlr/wdGWsd2wRUJZDNxPGQOqKpMGLrIY8BnWDJe4R5
	AR/0LOfaGMmfY72B/lgatFusYX8L8uZnMinIseAfmEIAkUNpFCLyEyePuroiEi3GT8Bml1Wtb28gK
	ltDkOKyxB4I4J5bRNWpYfWm4EiCWqjtX8N0FyRS7QQ9Pk/6Aw5aOHrvFIbiqLz9cPCTvOgLNUKYjN
	++jq9XN1OVhtMFUc9DEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc36W-0000eP-2P; Fri, 22 May 2020 08:32:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc36S-0000cC-Uj; Fri, 22 May 2020 08:32:30 +0000
X-UUID: 01f9dcf11daa48f1a3e217208d9de9a0-20200522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MH7BmKWh9VqXnU5CRrbvXVq1KYIBL96U6CDes3R2QXE=; 
 b=e5a8fF0iKhUCcdl4kjD8Kk6hknbS9dNssYQmj6gx9TF7D1Skh3xI0p086awaV8ZkY2WtEAfegrLk5+t7eTX26oUmdBD2tI37nt+yC6rVAjP3aXVFAFqljwhlVNDRHl2k05ZA7F+zgn3HxexAUv3m/94WOokNcGu6pMMG6Xzlyyw=;
X-UUID: 01f9dcf11daa48f1a3e217208d9de9a0-20200522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 143240425; Fri, 22 May 2020 00:31:59 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 01:32:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 16:32:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 May 2020 16:32:14 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v4 1/4] scsi: ufs: Remove unnecessary memset for dev_info
Date: Fri, 22 May 2020 16:32:09 +0800
Message-ID: <20200522083212.4008-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200522083212.4008-1-stanley.chu@mediatek.com>
References: <20200522083212.4008-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_013228_995957_90461350 
X-CRM114-Status: UNSURE (   7.05  )
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
Cc: Virtual_Global_UFS_Upstream@mediatek.com, bvanassche@acm.org,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The whole UFS host instance has been zero-initialized by
scsi_host_alloc(), thus UFS driver does not need to clear
"dev_info" member specifically in ufshcd_device_params_init().

Simply remove the unnecessary code.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index c3389c9a4f29..9e55c524f330 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7267,9 +7267,6 @@ static int ufshcd_device_params_init(struct ufs_hba *hba)
 	bool flag;
 	int ret;
 
-	/* Clear any previous UFS device information */
-	memset(&hba->dev_info, 0, sizeof(hba->dev_info));
-
 	/* Init check for device descriptor sizes */
 	ufshcd_init_desc_sizes(hba);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
