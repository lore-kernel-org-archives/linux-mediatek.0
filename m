Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3ADC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BB92065E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pY7rcMUS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BHDKsJwh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BB92065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1e3aWzcO5du8tNDguqDGaR4MCx+MIOjviWehZhV366A=; b=pY7rcMUSs97au/P16uSjpp25k
	YHFEAo7ITNaJL1xZywYSk00g8L1OAwfXjR+U6zVfIomg9FiYSSzhQJzH3pc6zS7qywSv47xmgU3Y8
	AwOanOSshJObjDU2Y2kQ+olRNRYqxBPHkc9u9bNmL9+OqQNQTSJ/7rYBy75T0DAs/2OEqFupthCFK
	nCYvegPU4TFEGyHKcXU0Z4OUkmjf8LbQQdA6rrdMlI6Bk/RxlMIrHvET13SzgXNYB/+jgzKujM87T
	1dt1G4h6q1CF/Gfd5enUxfFRamAzEfI+RwVMNsE9kjsrT4lRCOwQpx5hG/LYsQqLlYEXZtq3OcAbg
	59ALRepOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXNi-0004SL-TW; Tue, 08 Sep 2020 06:45:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXNc-0004P5-9A; Tue, 08 Sep 2020 06:45:25 +0000
X-UUID: 31df335e890545e289e248f37062c27e-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2vPo2/6SWh33ktkAO3akjLdPD6CXJMF1HZ7GeTdKNVI=; 
 b=BHDKsJwhismPLDdjnUL0WUichZGiN5ewYYgBkqHkaOH5U8S59oT75CPqUqloPqE/YQJrzb2AqK9WOLnlZBYVKR/1U/KuKImepV5vKzz6IapAs/e/sveFRjchGhyja6VgN3HcMseeiYPk/dfLp3LOzzvm934VKZcPvBnJU1Iiv0E=;
X-UUID: 31df335e890545e289e248f37062c27e-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 423538681; Mon, 07 Sep 2020 22:45:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:45:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 14:45:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 1/4] scsi: ufs-mediatek: Eliminate error message for unbound
 mphy
Date: Tue, 8 Sep 2020 14:45:04 +0800
Message-ID: <20200908064507.30774-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200908064507.30774-1-stanley.chu@mediatek.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09CF89399DBA7DE7D6B84CA40E7393B33CDCBF42D6BC4B72E193E381E4D0D5B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_024524_452622_B2736A4D 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some MediaTek platforms does not have to bind MPHY so users
shall not see any unnecessary logs. Simply remove logs for this
case.

Fixes: fc4983018fea ("scsi: ufs-mediatek: Allow unbound mphy")
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 29cd017c1aa0..7487b25fa651 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -129,7 +129,10 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
 			__func__, err);
 	} else if (IS_ERR(host->mphy)) {
 		err = PTR_ERR(host->mphy);
-		dev_info(dev, "%s: PHY get failed %d\n", __func__, err);
+		if (err != -ENODEV) {
+			dev_info(dev, "%s: PHY get failed %d\n", __func__,
+				 err);
+		}
 	}
 
 	if (err)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
