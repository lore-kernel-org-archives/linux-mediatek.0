Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356A4C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF3F62067C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0lrpzzz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VswJ+/5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF3F62067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5vtE3k5jc4OfeObOSiScD7vD9aFPSpHl/mIBFzUZAls=; b=W0lrpzzzX4il6SiSO41JMKn1L
	gS4MkPvVzUKGMJShE8Rme0hpL6DTKUAEddz0kZtUwo9u1F5fZ6xspkiYrpmQH0J4pNeTyPaNjZLMK
	iZ3LgVFHoOykbLnNqhw1LsgKX4RpbwJWGxMwuau6gcv+0UFN51wI4StMv53wNO9iqebKMH000obhU
	0+dy9w7nWb6wy24UZqXR/kwirNnOIHnOBEpzwmGj5zUVhkLg06kkgYrI2hfaAIYnhRq4kF8QhfBbW
	OS/uqAGxjzNtTKeWftfb0utHSHHkQ7v3eA/ux+cevozTeLveXYQPmwDbAQdat0R/tS0hKGXYsrEcI
	C+erZvgmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYW8-00068R-CB; Mon, 16 Nov 2020 07:01:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVj-0005xz-RM; Mon, 16 Nov 2020 07:01:13 +0000
X-UUID: 0a503d19e4e54fb2b5ff74bcb25e255d-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lxTEI2W6rBNmdevySAyMHjPQS/uRMZrjwgm4K8FZsHU=; 
 b=VswJ+/5n1Cey0/hADrl/546xCAid2lnQp77clTkETfkd/vnbYPacOJ/+1p923+uOnGdXsH3yKCVkP09FpxpBMVi3UeFO+h9GuvemUwO2cIXYPVZlpYBBqlMowRw3m0NGDJ3nsefM1GVlEDQlb3YM+OrhbvA/Q5wAp7SdztYWtNE=;
X-UUID: 0a503d19e4e54fb2b5ff74bcb25e255d-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 964641143; Sun, 15 Nov 2020 23:01:05 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:04 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:57 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 9/9] scsi: ufs-qcom: Use common ADAPT configuration function
Date: Mon, 16 Nov 2020 14:50:54 +0800
Message-ID: <20201116065054.7658-10-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020112_118203_3B076A60 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use common ADAPT configuration function to reduce duplicated
code in UFS drivers.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 04adfbd10753..1e434cce0f79 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -723,17 +723,9 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 			ufs_qcom_dev_ref_clk_ctrl(host, true);
 
 		if (host->hw_ver.major >= 0x4) {
-			if (dev_req_params->gear_tx == UFS_HS_G4) {
-				/* INITIAL ADAPT */
-				ufshcd_dme_set(hba,
-					       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
-					       PA_INITIAL_ADAPT);
-			} else {
-				/* NO ADAPT */
-				ufshcd_dme_set(hba,
-					       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
-					       PA_NO_ADAPT);
-			}
+			ufshcd_dme_configure_adapt(hba,
+						dev_req_params->gear_tx,
+						PA_INITIAL_ADAPT);
 		}
 		break;
 	case POST_CHANGE:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
