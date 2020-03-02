Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E20C3F2D7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 13:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE07721739
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 13:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R1fKOCb/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4c4z1jO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE07721739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GGCO6eqw6nQ+ivnROSCFxX/9v92Fre+KTLr6XxO3l2E=; b=R1fKOCb/VUp76P
	NU4HuHuDDCHOxZf5+mn/Bt9EW1pjCA+/oE5J8/AySA7+T5ynnu9qc8fzwLA4oYgbI9JHqoDZSFm9M
	8mEj3m/0undno+hXq7+h2dlcxceibhZH2a/fLaq061xra8qKkRSp18UBY5d4P+WXPucXq4HHlbwxc
	Obe6ORKB0YhkCmTGgd69uFvyxsqpDHx2qsYjluSJonieZVCyd3uO/wFOhVbHpAsBFuGCZRJBUG39E
	6FahGoJ64xtI2HrWVievFaJPD/zFXvKwtx8sVWU+YcHuhWQThO3ThtzPLEWySigdsxuylfeSn/bMH
	ssRWAEAxofhoced6pJrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8lWN-0000Ku-2p; Mon, 02 Mar 2020 13:54:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8lWD-0000BM-0o; Mon, 02 Mar 2020 13:54:02 +0000
X-UUID: f213b5ada7584b608fe2d77466c3fdb9-20200302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0RbdWX8Fxh/6C5WD9L6DJxUtCmSunSS08zgopxXghdE=; 
 b=a4c4z1jON8lv4gVbzuW37Je1lS2uRLO33ASDA5d38JEju9sybFThAOJS7j/6S4dO3TmAnb6Ilx49Lk5rK1121Fl73qRHYMR/rxJTCMRZSD8kbr6cu+pwMLn8I26rcUUbuZE3rRlf4BWtIvtqSZkxnnbq5y89bf0bH+0SPnCtkFY=;
X-UUID: f213b5ada7584b608fe2d77466c3fdb9-20200302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1621314174; Mon, 02 Mar 2020 05:53:57 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Mar 2020 05:55:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Mar 2020 21:51:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 2 Mar 2020 21:53:15 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1] scsi: ufs-mediatek: fix HOST_PA_TACTIVATE quirk for
 Samsung UFS Devices
Date: Mon, 2 Mar 2020 21:53:46 +0800
Message-ID: <20200302135346.16797-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D821A7F8565A24F42421CDA7B2AE2730833BCD91F3CAE1B5A150FD3669E3742E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_055401_072746_D617EB01 
X-CRM114-Status: UNSURE (   7.96  )
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

Device quirk "UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE" is enabled for all
Samsung devices by default currently.

However MediaTek UFS host requires different host's PA_TACTIVATE
configuration. Hence clear this quirk first and then apply vendor-specific
value in vops callback.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index de650822c9d9..3b0e575d7460 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -533,8 +533,10 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 	u16 mid = dev_info->wmanufacturerid;
 
-	if (mid == UFS_VENDOR_SAMSUNG)
+	if (mid == UFS_VENDOR_SAMSUNG) {
+		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
+	}
 
 	/*
 	 * Decide waiting time before gating reference clock and
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
