Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 05:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3190F20663
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 05:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PY72xVm8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nAqTsord"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3190F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ayKIVR91Q7Ng4TCoQAcqO6KZLF3E+4udv2VaZXs18B4=; b=PY72xVm81EkL5eEATjfyAbAlG
	G1fQ4k3jQ0JuioSMwk3fW04Lbd0mek0I2IyEpdxWUbX8eHlIZSHQUDc8NiDEVuNYAxfnKdzEGPNcF
	L/4jmPFOvG291xWovxBchluj428ko5Pz94i5xNNGuEf9qZkZ3ATe/LfGILvosjcRo+NfuzIGOB1FS
	JaZyFz4uAmtZw6yEUT3cBqVsQOjfVQZMtej8eJ+9cH45yOzGfvul9mPikcUP8rnhl4MeTXZaMPjIc
	1N9owcN1zfpUbLA/NO1T+2flZZVLEmzRlGq1g33DzliEHRmsqA1i3gnRV/DFwrI4zCJSVPYAF+5iM
	t1LliOa/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0eUQ-0004Fp-2y; Wed, 29 Jul 2020 05:18:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0eUK-0004EN-Ti; Wed, 29 Jul 2020 05:18:50 +0000
X-UUID: ef9257c97b0247fbb41c1a41842c9044-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QUhdKvtEZ3oYulCgHXYM8lA8sxpnG1aE1NCi4A96spY=; 
 b=nAqTsordxVAavwTJNPrCThmnaKk7QOfXlVZe4k7rKk2dWesmJXpuCHOkeMUP4XRvDxfH7zmORxyAwujiKdD+5SpnNwpw5HNjX48RAjbRkQHYX4Lp/lh8xmP0dSD/z37JTNtIu/HMxVg/vy4uF3zKHXZETbxw3kVPwIdvwSDl29k=;
X-UUID: ef9257c97b0247fbb41c1a41842c9044-20200728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2146657778; Tue, 28 Jul 2020 21:18:45 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 22:18:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 13:18:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 13:18:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH v1 2/2] scsi: ufs-mediatek: Apply DELAY_AFTER_LPM quirk to
 Micron devices
Date: Wed, 29 Jul 2020 13:18:40 +0800
Message-ID: <20200729051840.31318-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200729051840.31318-1-stanley.chu@mediatek.com>
References: <20200729051840.31318-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C22D0764E2EC598E7EB26704ED03C2DE7AD0BD31B37A81BA375C253C04D04AC52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_011849_096121_AF914DEC 
X-CRM114-Status: GOOD (  10.72  )
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
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Micron UFS devices require DELAY_AFTER_LPM device quirk in
MediaTek platforms.

Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 31af8b3d2b53..7ff2682f481c 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -36,6 +36,8 @@
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, high, res)
 
 static struct ufs_dev_fix ufs_mtk_dev_fixups[] = {
+	UFS_FIX(UFS_VENDOR_MICRON, UFS_ANY_MODEL,
+		UFS_DEVICE_QUIRK_DELAY_AFTER_LPM),
 	UFS_FIX(UFS_VENDOR_SKHYNIX, "H9HQ21AFAMZDAR",
 		UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES),
 	END_FIX
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
