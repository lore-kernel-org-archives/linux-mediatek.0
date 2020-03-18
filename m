Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69D6C5ACD6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 10:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725E220768
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 10:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LhdDNfUQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UETJou+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725E220768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qw6G0M3D4EsMsm3uvekD4FCq9+J+6AiWPMzQk+uNBIQ=; b=LhdDNfUQs9g1TY
	51JQwMOJU7mV4bFmNw9EyruF740KrEvC0/L6LX13j1FJ9j/APGTy6EJzSB8RPhNGGwEhKBw1LZhCM
	LY7Di9deuzATHGAsajjUVuTeschcMfiEQbtrQNvCd79Fu1QsrRuXDhUT4yuPhfg9nvO0zxxdhuyJy
	AqBOUtnezDxKv9qQtRohhfOMoR0XERBZ598038G8L58kmpNVJE9+V9Qm/YRCMjYvHX+p3HY78QYDD
	NwxllxRkAnwMMZXIgctMjk+PdrdOPAoIboZcv4jeaeMdpEcISHatFIh7v1GA2+dAp8IPvzC8apl88
	HjDyU0r8ftYszEc2tryA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEWHT-0005Qt-9p; Wed, 18 Mar 2020 10:50:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEWHH-0005HX-KA; Wed, 18 Mar 2020 10:50:24 +0000
X-UUID: 780ae06a83354419acbce42051d9c7ad-20200318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6CR+BpbbxcrWvJuUIoPEHgkb6Ulk4lyekUc8d6UiinI=; 
 b=UETJou+uMeWp+FRI1wXr4nEq/XZdiDcGwvQs3c2dqk04hEC6QoFSHH9UPORF8WPmGFkBUVHXMvb/3PCj9HEX0vzhanU4NXX2L1ZTmp43xXgrqPPFxzpG4HmyReZZkg6qvLcvH3E79tO612PeLGFw5wgdvm1Ka7b00OS0BN1DJNc=;
X-UUID: 780ae06a83354419acbce42051d9c7ad-20200318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1860601892; Wed, 18 Mar 2020 02:50:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 03:40:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 18:39:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 18 Mar 2020 18:40:31 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.peter~sen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v7 5/7] scsi: ufs: allow customized delay for host enabling
Date: Wed, 18 Mar 2020 18:40:14 +0800
Message-ID: <20200318104016.28049-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200318104016.28049-1-stanley.chu@mediatek.com>
References: <20200318104016.28049-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_035023_668357_2C336AF7 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently a 1 ms delay is applied before polling CONTROLLER_ENABLE
bit. This delay may not be required or can be changed in different
controllers. Make the delay as a changeable value in struct ufs_hba to
allow it customized by vendors.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 drivers/scsi/ufs/ufshcd.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index a42a84164dec..c5ee77a5bfc7 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4301,7 +4301,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
 	 * instruction might be read back.
 	 * This delay can be changed based on the controller.
 	 */
-	usleep_range(1000, 1100);
+	ufshcd_delay_us(hba->hba_enable_delay_us, 100);
 
 	/* wait for the host controller to complete initialization */
 	retry = 10;
@@ -8424,6 +8424,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	hba->mmio_base = mmio_base;
 	hba->irq = irq;
+	hba->hba_enable_delay_us = 1000;
 
 	err = ufshcd_hba_init(hba);
 	if (err)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 9a14ff3d5f8b..fa81dac9ae5a 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -663,6 +663,7 @@ struct ufs_hba {
 	u32 eh_flags;
 	u32 intr_mask;
 	u16 ee_ctrl_mask;
+	u16 hba_enable_delay_us;
 	bool is_powered;
 	struct ufs_init_prefetch init_prefetch_data;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
