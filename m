Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCAAC433F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 14:11:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEBC206F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 14:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxxD1swL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="apE8fI/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AEBC206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TnV8zZqk+nX5oicrCndmq+d4jbmMOtGtLsEpCayzQ0c=; b=oxxD1swLeh1ULWeyzl5chSm0y6
	io0JcRpYJI+1lOdxNtpatBhb4uu0z6Qxirl4WdyvlWX8TpvzOdznDSLsm3/izsZ1BjUs1lCU/YuEw
	YdGONvFe6fEnXGKZern3xQpVn9o+sz/c9g76Co9ePDINR1eNKHO16ade194fHiM9pZfAuj3kwrup+
	qJdv92DQC0nCYNmaHIH/VJB8p1j/zdRBfbmmb4cNJUbG7O3nO5eNQsSUumHR2jUkXoHpzD7/lkFt3
	3eqye5MkW81oNjmSytkNpEQj+92P+t1U0flkoyI8UxyNGnlM0BVVrULlhiOhjwzMvaIzTOf2UH3EW
	+ekR1mbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0QK8-0006MI-QG; Tue, 28 Jul 2020 14:11:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0QK5-0006LL-KH; Tue, 28 Jul 2020 14:11:18 +0000
X-UUID: c9adee0edd3c480a8bdab6c8190d91e6-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=suEMosAXJcsVRBqEPCC9fdQP59XGs0hD3Jn+cHeYz6A=; 
 b=apE8fI/qTpyi8svFmT4raknEZ4iQy/Wg/7sBZGW3hjb99/aLJwdS/ev7cadKXgbVgmbfEu2MyH1/UyK3R4eq2HYi9DWEoDAPYkx9U5uPTvvyzikmHgN3MkYdz1SPPPtkWIQwYlG0KqA3jqduKJsOovY5jL+RSIL/DpaI8mWbQQk=;
X-UUID: c9adee0edd3c480a8bdab6c8190d91e6-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 131678763; Tue, 28 Jul 2020 06:11:06 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 07:11:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 22:10:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Jul 2020 22:10:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v1] scsi: ufs: Fix possible infinite loop in ufshcd_hold
Date: Tue, 28 Jul 2020 22:10:55 +0800
Message-ID: <20200728141055.22160-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_101117_804647_F5FD8B7B 
X-CRM114-Status: GOOD (  12.72  )
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
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In ufshcd_suspend(), after clk-gating is suspended and link is set
as Hibern8 state, ufshcd_hold() is still possibly invoked before
ufshcd_suspend() returns. For example, MediaTek's suspend vops may
issue UIC commands which would call ufshcd_hold() during the command
issuing flow.

Now if UFSHCD_CAP_HIBERN8_WITH_CLK_GATING capability is enabled,
then ufshcd_hold() may enter infinite loops because there is no
clk-ungating work is scheduled or pending. In this case, ufshcd_hold()
shall just bypass, and keep the link as Hibern8 state.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Andy Teng <andy.teng@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 577cc0d7487f..267b02e1afd6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1592,7 +1592,11 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
 				break;
 			}
 			spin_unlock_irqrestore(hba->host->host_lock, flags);
-			flush_work(&hba->clk_gating.ungate_work);
+			rc = flush_work(&hba->clk_gating.ungate_work);
+			if (hba->clk_gating.is_suspended && !rc) {
+				rc = 0;
+				goto out;
+			}
 			spin_lock_irqsave(hba->host->host_lock, flags);
 			goto start;
 		}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
