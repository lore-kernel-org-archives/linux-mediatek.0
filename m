Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C76C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 01:48:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65638206DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 01:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BGObC0Jm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pNzeSiPW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65638206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+AL+EO7VCysph0qtil/okvqSk/jvCActHys/9CF36zc=; b=BGObC0Jm6zAY3BkInSSSNCeLVW
	nJokREq8zQxa5XIjQiGeIz7Ks8sAU72ciNxN8uikgwErZriVRMRpJTdYF3fSa4Y0EBjUsTUrAzuAl
	1+KSPm43OnfTmNyQlhxkW3t6Gzgp5251tSyMf9PGTqFK1K6B2AeYlD+xod8hELchs+yvMBdn0xBlF
	SPiO9aMeCqJRfuhrGAOxb6noxUvqLiAU7xmysMBvYuo9MGDuocMa45KPjsp4LnaSqk4PMJ0/XIZI3
	i9CRX3LKHTMtQUzqbzP99LmWiEfLYvgoWoc7DAPrb6422uB8sjPZKoxmw0u7Lod9q6NbEjzwgSH5+
	VgphyAyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGBhN-0006cv-Ar; Thu, 10 Sep 2020 01:48:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGBhK-0006c7-PM; Thu, 10 Sep 2020 01:48:28 +0000
X-UUID: d0704e511ae24d88996f283e4fe9dfa9-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/kpiSBfDpcyE748DN9WDHc2W37kjiStGnsyZ7yp56L0=; 
 b=pNzeSiPWeWjfzL2aW5NgVC1CC5xJFh47nUNG/ao7Jr4fF26Upi8Z92/Ru5dqzsDH3Y3Bu9zECtlIadBCaB16X1ZaKvIbhmyVodLO4rsGWZ8eHf/zypE6R5id1YlJ43N8+DnqCDbvAnxw+NgElfozVwsak0Aivic3Dv22MMNOS1E=;
X-UUID: d0704e511ae24d88996f283e4fe9dfa9-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1129404060; Wed, 09 Sep 2020 17:48:10 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 18:38:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 09:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Sep 2020 09:37:58 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH] scsi: ufs-mediatek: Fix build warnings with make W=1
Date: Thu, 10 Sep 2020 09:37:56 +0800
Message-ID: <20200910013756.11385-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 38E1E23B3D021B9BE7FEBC5B0F21E00D3CD02EEAB16EADD8D4E73E28F58D18842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_214827_008757_4131E8DA 
X-CRM114-Status: GOOD (  10.97  )
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

Fix build warnings with make W=1 as below,

1.
>> drivers/scsi/ufs/ufs-mediatek.c:116:22: warning: format '%d' expects
>> argument of type 'int', but argument 4 has type 'long int'

2.
  CC [M]  drivers/scsi/ufs/ufs-mediatek.o
../drivers/scsi/ufs/ufs-mediatek.c:749: error: Cannot parse struct or union!

/** is used specifically with kernel-doc tool.
As a quick fix by removing dubious /** in the comment block of
struct ufs_hba_variant_ops ufs_hba_mtk_vops.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 1a9133ac6efb..3ec44dfa2567 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -113,7 +113,7 @@ static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
 {
 	*rc = devm_reset_control_get(hba->dev, str);
 	if (IS_ERR(*rc)) {
-		dev_info(hba->dev, "Failed to get reset control %s: %d\n",
+		dev_info(hba->dev, "Failed to get reset control %s: %ld\n",
 			 str, PTR_ERR(*rc));
 		*rc = NULL;
 	}
@@ -727,13 +727,13 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
 }
 
-/**
+/*
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
  * The variant operations configure the necessary controller and PHY
  * handshake during initialization.
  */
-static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
+static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.name                = "mediatek.ufshci",
 	.init                = ufs_mtk_init,
 	.setup_clocks        = ufs_mtk_setup_clocks,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
