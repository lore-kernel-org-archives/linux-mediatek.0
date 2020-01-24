Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D783C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 06:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23FD120709
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 06:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPCvGtbc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JBwBcLgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23FD120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cBoqOVQZG6ZFNG+T2353bMofbgvECTV+GDVef7puxo=; b=BPCvGtbcxMR7ka
	AGHDIbjrLtbfJMYMcphehCnXctw6oNrIFo/roqD2M8qHSv1indoRZAovKgRpE21Oq/+7x2j8ArNQ9
	KI+oR1MQU4jck1ymZb38zXguHE1i3qMud0tb7eC7Wa7/+ErPq+FCXKV3PfMtWUlttxxfIhJBfN5HS
	7RBAncfrLDTsIQMwyXy1kzuS1uK8HiZFTEfftOwZDHa+vVhYoz+d/AV8nA1oKi0y7nOC4XnMMJzKF
	OdkOE13ZmSKUGctSbFslGxv3U4cPxRYc6tEnuVDx8ETMX+KV1pze/CT8TAxIdJWE/gELhNMfxDrGM
	W743pO4XXxPL+kzcMjew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuso5-0004rz-IS; Fri, 24 Jan 2020 06:51:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iusmq-00025I-ET; Fri, 24 Jan 2020 06:49:49 +0000
X-UUID: c8c3b63fcb9b4eb6b44b3d43af5b1eda-20200123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M4aLG1u5om4evGkmKFBHNNwLCDYqri4fDoY+xM2E/LE=; 
 b=JBwBcLgjsUKfyFz5vPGsHakGNW1Yir1llZAu8XOtDka2dDVPrFGxDQU7tHaYDvT3Ekh49UofIoHK7X8RAD3BvvGeigdPHvEvxFnPj4j2mT2t3y7b1F28MpizeDXPNK00aiMloFZzh21/B73RhJVclxcxrW+hXs8IXPQHXcQpxmQ=;
X-UUID: c8c3b63fcb9b4eb6b44b3d43af5b1eda-20200123
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 200379901; Thu, 23 Jan 2020 22:49:43 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 Jan 2020 22:50:46 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 Jan 2020 14:50:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 24 Jan 2020 14:48:58 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 4/5] scsi: ufs: fix auto-hibern8 error detection
Date: Fri, 24 Jan 2020 14:49:25 +0800
Message-ID: <20200124064926.29472-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200124064926.29472-1-stanley.chu@mediatek.com>
References: <20200124064926.29472-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_224948_566652_69A13AF4 
X-CRM114-Status: UNSURE (   9.26  )
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

If Auto-Hibern8 capability is supported by host but not actually
enabled, Auto-Hibern8 error shall not happen, thus bypass
disabling case in ufshcd_is_auto_hibern8_error().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index abd0e6b05f79..214a3f373dd8 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5479,7 +5479,8 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
 static bool ufshcd_is_auto_hibern8_error(struct ufs_hba *hba,
 					 u32 intr_mask)
 {
-	if (!ufshcd_is_auto_hibern8_supported(hba))
+	if (!ufshcd_is_auto_hibern8_supported(hba) ||
+	    !ufshcd_is_auto_hibern8_enabled(hba))
 		return false;
 
 	if (!(intr_mask & UFSHCD_UIC_HIBERN8_MASK))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
