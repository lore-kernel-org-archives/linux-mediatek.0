Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E855FC00523
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 00:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA431215A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 00:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjcLaSS4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ry324sGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA431215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELicMxi7al9S+pS+QIRu0lVPbjEkQ5aayXHvchL5s50=; b=DjcLaSS4XAdzKE
	Qihr4iL9uynHUdA6c05CYFJDrrz7hQqfVLZhdVNe11kN+zHyflvm8xZsk+RrsPYKCYbDte9sk6wXs
	1C5Md9bnIXqztWayOhHd9oAiYq8AlZkzzsswK6qBWBy+IM87zq4s2tdTWRYz7lv8GSZ19HAfbXthg
	H5Jbh4VQZXO3adqRWEtWEo6Ed1Yu10V68LI4E9PvgP5wtua4+La5hXaoDFDJKm6IEA/zdaOr401DO
	Zs9tAp32yJQaDEePVV8rcoacyrzfYunSkRqCvJ6NblrRijjrppEAeosvw+Ri+xUMEx1H8lQ3IveVZ
	0UKt+p+9epUZkWFE9Nfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioGFh-0002ej-Dd; Mon, 06 Jan 2020 00:28:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioGEy-0001BB-HK; Mon, 06 Jan 2020 00:27:30 +0000
X-UUID: 258ae10170a042efa5b15a8e00265149-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8BzC12aG5DHtHZ2qSHgLaSvaZKEz7ErXAlzHysQ8AUI=; 
 b=Ry324sGHxLqVHmRoBKJu0wrsH6bmmgdJ39/oul5CroLAEDNc6QcgWOiDk+m7/oVyBB3fDfnx820SfRVwzvIZOpLE8uZ/aEdKj9rQk++jOu0VBlvRe/5ZgDhlMQ2Bd4c2JSIxJgKnJONehwTsLzRtB8TaAB+y1G6q7uWNDS3txJI=;
X-UUID: 258ae10170a042efa5b15a8e00265149-20200105
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 355555144; Sun, 05 Jan 2020 16:27:24 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 16:27:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 08:26:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 6 Jan 2020 08:25:44 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 2/2] scsi: ufs-mediatek: add apply_dev_quirks variant
 operation
Date: Mon, 6 Jan 2020 08:27:11 +0800
Message-ID: <1578270431-9873-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1578270431-9873-1-git-send-email-stanley.chu@mediatek.com>
References: <1578270431-9873-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF9F7240A7E5841972FBE79599879B822F061DC521957848BA3EC05D9979D0962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_162728_593154_08D19586 
X-CRM114-Status: UNSURE (   8.19  )
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

Add vendor-specific variant callback "apply_dev_quirks"
in MediaTek UFS driver.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 41f80eeada46..8d999c0e60fe 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -16,6 +16,7 @@
 
 #include "ufshcd.h"
 #include "ufshcd-pltfrm.h"
+#include "ufs_quirks.h"
 #include "unipro.h"
 #include "ufs-mediatek.h"
 
@@ -405,6 +406,15 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return 0;
 }
 
+static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba,
+				    struct ufs_dev_desc *card)
+{
+	if (card->wmanufacturerid == UFS_VENDOR_SAMSUNG)
+		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
+
+	return 0;
+}
+
 /**
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -417,6 +427,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.link_startup_notify = ufs_mtk_link_startup_notify,
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
+	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
 	.device_reset        = ufs_mtk_device_reset,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
