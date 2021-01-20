Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC14823356
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC14823356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/7siF5S94yNdV5lUWavq0g0u2EL/ZODgjpVo5MiLggI=; b=soNqP2FyaieM/dfs1GadvJclu
	OFW54G35ZnLbAjIXZIoOf32lw7jALkoVx6TTFkh4bRwGqFfSTajU1rCSBh8iMqD7ogB7X058NAxKP
	8myQ/MKy0GiJlV19ugvHLR1YL3duPFBZdHCwrl2v7qZglmCk9xFxEJXTzJmT+SrxrCe3BiAZrmwfz
	P3asrqKpN++WIeRoejRV2CVO/ZpEYS2fjJkzsKxExvBWzBSXdobEipNgjW4IIg+qaMN34U9ER550e
	49WQEOTvEyePTE1Y13rn1ak98r4EzYn6zD7pd8zol2w/de+GszwnYu351C0Ut/u2ZRY5b6f/sLHJR
	PqN//mVfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2F0A-0002Kp-3B; Wed, 20 Jan 2021 15:02:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ezs-0002En-AW; Wed, 20 Jan 2021 15:02:13 +0000
X-UUID: ab74317b27644bb6bf327b64af07d5e9-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ILtdS5MSgU/R9VAXP8+6ClPfPiBDAVmP6iZT4fIBKcU=; 
 b=kmf+nq3MZCK0vCcgJSd1ytGzi62QfdUDaUs1iQCtZpy+CqOGp5tqz7uJ2wK7/g6zIHCDMGKe6VnnC1Z8DGFbHmktOZzGeT/aEDDzNUwdttlNVqLNYssg76H2Oy6w+WopqO0H1QC/Do0ECLpUlgZre4u9LqdwPEGhwasZ5rujCj4=;
X-UUID: ab74317b27644bb6bf327b64af07d5e9-20210120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 399587265; Wed, 20 Jan 2021 07:02:09 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 07:02:07 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 23:01:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Jan 2021 23:01:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 2/3] scsi: ufs: Remove redundant null checking of devfreq
 instance
Date: Wed, 20 Jan 2021 23:01:41 +0800
Message-ID: <20210120150142.5049-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210120150142.5049-1-stanley.chu@mediatek.com>
References: <20210120150142.5049-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C5A84FA892E3D92BCD69FD2DE6C606591BAE42D86A4743273246598E464558032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_100212_525828_3E5F0F0C 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

hba->devfreq is zero-initialized thus it is not required
to check its existence in ufshcd_add_lus() function which
is invoked during initialization only.

Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 226504d05c14..f707234580ea 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7777,15 +7777,14 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 			&hba->pwr_info,
 			sizeof(struct ufs_pa_layer_attr));
 		hba->clk_scaling.saved_pwr_info.is_valid = true;
-		if (!hba->devfreq) {
-			hba->clk_scaling.is_allowed = true;
-			ret = ufshcd_devfreq_init(hba);
-			if (ret)
-				goto out;
+		hba->clk_scaling.is_allowed = true;
 
-			hba->clk_scaling.is_enabled = true;
-			ufshcd_init_clk_scaling_sysfs(hba);
-		}
+		ret = ufshcd_devfreq_init(hba);
+		if (ret)
+			goto out;
+
+		hba->clk_scaling.is_enabled = true;
+		ufshcd_init_clk_scaling_sysfs(hba);
 	}
 
 	ufs_bsg_probe(hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
