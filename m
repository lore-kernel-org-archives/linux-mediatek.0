Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694D9C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDF32339E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDF32339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xyrjlOojNR8n4M+W+hOqTDJLMO88WwVUCBgu1UYRGik=; b=IYEB0SjrXLxMHZMMAx4zeos8C
	ru/Enz8b0fRniydDRaaXLG2FIgen5uxVtXUP+b7Rt1AZMpkwMgjTPNNcFf2DER4pD4IyOgSSMqJAL
	P3DlONBu9FBhc/258N+XZjFa+Op4jtzSYIBjCEObHxDuEr3DcxCSeWWHPYKfXCKR4go+/ZF1wjSH8
	VS2viRsGbZR5tmwTE7ZGkpmYFPpGoOAIziWS2fDY8Ix+Sx4ya3qDj+pbfFrSUY41yhAe/+WP0IJCJ
	yKZxrKAbmVk22rwZQSNaKXH0m6+vjK6fzgKScG3qhcB9QsdKkRLzyPDZU6chFJN1syNrqHzgOgrtf
	JsP5Q23hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpWpV-0001Jj-2J; Wed, 16 Dec 2020 13:26:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpWpO-0001H5-Nt; Wed, 16 Dec 2020 13:26:51 +0000
X-UUID: 5507422be2aa4a3eb9b64f885fc8e811-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=228gMpoCIwSl5bhbKqK8kdSleBNkS6Z8MsjK0k9cDpQ=; 
 b=KM+ygeRalLTkpKEHiOco32zcoRUD77YC3Yv2DsEJ2fRLpPdUecVRu/1ArsC6kTu6kjRNVLMLp8vDOZaaZdU/hgYSOP0PVGS0Au+0yuLiK0Q6r6/K+2oJXPQQL1sE1yQt1GLKpehXS3oC5ymlzfJIyt3lff1GnnqF91V0R4Y3TwE=;
X-UUID: 5507422be2aa4a3eb9b64f885fc8e811-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1354272718; Wed, 16 Dec 2020 05:26:45 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 05:16:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 21:16:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 21:16:39 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 2/4] scsi: ufs: Remove redundant null checking of devfreq
 instance
Date: Wed, 16 Dec 2020 21:16:37 +0800
Message-ID: <20201216131639.4128-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216131639.4128-1-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 25B50F542834B30D2391DB7057EA934F6ACF8A9CC0F1E2E4EB05BB593B2F80292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_082651_035178_1557D892 
X-CRM114-Status: GOOD (  11.39  )
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

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index a91b73a1fc48..9cc16598136d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7636,15 +7636,13 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 			&hba->pwr_info,
 			sizeof(struct ufs_pa_layer_attr));
 		hba->clk_scaling.saved_pwr_info.is_valid = true;
-		if (!hba->devfreq) {
-			hba->clk_scaling.is_allowed = true;
-			ret = ufshcd_devfreq_init(hba);
-			if (ret)
-				goto out;
+		hba->clk_scaling.is_allowed = true;
+		ret = ufshcd_devfreq_init(hba);
+		if (ret)
+			goto out;
 
-			hba->clk_scaling.is_enabled = true;
-			ufshcd_clkscaling_init_sysfs(hba);
-		}
+		hba->clk_scaling.is_enabled = true;
+		ufshcd_clkscaling_init_sysfs(hba);
 	}
 
 	ufs_bsg_probe(hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
