Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E34C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 12:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F882082E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 12:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtYP875M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Id0VyHB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F882082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76DR2RExfi9ZerhfTgfDfuw56sndbgq4NBn1HYoL6Z0=; b=UtYP875Mt5m+J5
	HzAwvl412f6cHVEzvRBwQ5u3htpgj/hFoT9EIwI2buD6o32EzxV39M6qw2qsnqIVm22P4jDM8QMg+
	emXUx6Jpmso/vYeHm+OGwpHpgC4znuhE6TempWwJ634nKtiJLGu+xlDgwcUpCnK2p3rTRocDFmAyW
	kLoUra4kiwDaEzezoQT53DS35qfUKpAeT0oM2ChflFZs2etOPZ4qUcm2fm3tywFFtsNbaNexKHp1f
	jKHOHnKKZoNy8ZMjIwfXOLw6gLyzZ1ScthGd+XL3Oki7H5FXqMTty3uskq9TTxKrc1AQwliQwU8uG
	cyGhCnWjAZcdAzB69HwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idZGD-0006qB-Jo; Sat, 07 Dec 2019 12:32:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idZG9-0006ok-K2; Sat, 07 Dec 2019 12:32:31 +0000
X-UUID: 3fb7472110cf46cea8265afea735757a-20191207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x9J++tnSYtzHVx3/Z80sxjIENo1114b2ATMpoEVh/84=; 
 b=Id0VyHB4ckC5PZpX2mlw7STOS4+Ll+bfD1EspH7J8Mqq62vgfTwoVMznnCTkbdiOn30vVBtFukTpxEHTDNT98FlvO0nqb0L+lLMFlPltpO4+7/6gCjbpEKxI4+lB6uKthtAgVdfa1arqNgNLVlVh7IjxqvJ1HqLAQmH6R2qjL5Q=;
X-UUID: 3fb7472110cf46cea8265afea735757a-20191207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1225987949; Sat, 07 Dec 2019 04:32:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Dec 2019 04:23:22 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Dec 2019 20:21:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 7 Dec 2019 20:21:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 2/2] scsi: ufs: disable interrupt during clock-gating
Date: Sat, 7 Dec 2019 20:22:01 +0800
Message-ID: <1575721321-8071-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
References: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_043229_759750_6ABD1C05 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to suspend, ufshcd interrupt can be disabled since
there won't be any host controller transaction expected till
clocks ungated.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f80bd4e811cb..5de105e82c32 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1490,6 +1490,8 @@ static void ufshcd_ungate_work(struct work_struct *work)
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 	ufshcd_setup_clocks(hba, true);
 
+	ufshcd_enable_irq(hba);
+
 	/* Exit from hibern8 */
 	if (ufshcd_can_hibern8_during_gating(hba)) {
 		/* Prevent gating in this path */
@@ -1636,6 +1638,8 @@ static void ufshcd_gate_work(struct work_struct *work)
 		ufshcd_set_link_hibern8(hba);
 	}
 
+	ufshcd_disable_irq(hba);
+
 	if (!ufshcd_is_link_active(hba))
 		ufshcd_setup_clocks(hba, false);
 	else
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
