Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFA5C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 05:47:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01358207ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 05:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lberPEwy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WznV4C0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01358207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xJeaP8WnQdDPB+IcfuBbSD2CCy6EUzeayoAl5GH8vo=; b=lberPEwy0OZaVb
	LvxUSijhmqbxG/m9NrlEM47A9taZ5g5vWJrlGXLT+wpahWh8oEdnsQBUqH2Ax3oM1l0ZMiINmxOSw
	WJBKtxiVZac/NSxpEzFw8Gi+HEIyNSQI3YkeNeKLwdqOxIihwM9WiOnQNqJgpHNzuaGEeTlOKzK34
	nUBNunEj/GMx3DYeJJzOiwmPDs0c5ICeJo6jyYCoBnQK8DIwK9CqM+ND5UpT+Dm73SL4bMhfogfEt
	YzL/Y8611bviD4b7PnfU3RRVEOOzyrkzoSP2YoxAUL5QYAVWI6Yi3aJy1L2BqB6EgrU9CBA+tvUvH
	cey/fMEmSSdvwDdKRp9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jitaO-0001lk-5R; Wed, 10 Jun 2020 05:47:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jitZq-0001I2-VX; Wed, 10 Jun 2020 05:47:08 +0000
X-UUID: 62e29d46fd374d8eb2ab7b76f0813f79-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P4ir2L+O0CL9udXrFkoeOl6qfpnyyIFELvh2AjIFg7I=; 
 b=WznV4C0Tgrn7s+stUeAl5aT1Qb3J2RYwhrDMnctCo0WcsKwQM9It9UJC0B25CLhQ5WRHbfUYbOPJ3PcEDwCcLNcz5KaIGWSguT78cNVFXn1vJSYeG5MOcVFHMY6UWnLWNctv2enVpMraKmHLFcWfIF8zXoEQje54ra8H3a19f2A=;
X-UUID: 62e29d46fd374d8eb2ab7b76f0813f79-20200609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 604862879; Tue, 09 Jun 2020 21:46:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 22:37:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 13:36:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Jun 2020 13:36:53 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 2/2] scsi: ufs: Cleanup device vendor and quirk definition
Date: Wed, 10 Jun 2020 13:36:45 +0800
Message-ID: <20200610053645.19975-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200610053645.19975-1-stanley.chu@mediatek.com>
References: <20200610053645.19975-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: ECA4F3CB4DEFF80CD6B31B8B0CD1BF9841AFE6F22FE8BBC5C983FD9B0DB3DAD22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_224707_020591_46943781 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cleanup below items,
- Arrange vendor name in alphabetical order
- Squash device quirks as compact as possible in device quirk table
  to enhance performance of the lookup.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs_quirks.h | 2 +-
 drivers/scsi/ufs/ufshcd.c     | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index e80d5f26a442..2a0041493e30 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -13,9 +13,9 @@
 #define UFS_ANY_MODEL  "ANY_MODEL"
 
 #define UFS_VENDOR_MICRON      0x12C
-#define UFS_VENDOR_TOSHIBA     0x198
 #define UFS_VENDOR_SAMSUNG     0x1CE
 #define UFS_VENDOR_SKHYNIX     0x1AD
+#define UFS_VENDOR_TOSHIBA     0x198
 #define UFS_VENDOR_WDC         0x145
 
 /**
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index dea4fddf9332..7c93cb446f51 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -219,10 +219,8 @@ static struct ufs_dev_fix ufs_fixups[] = {
 	UFS_FIX(UFS_VENDOR_MICRON, UFS_ANY_MODEL,
 		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM),
 	UFS_FIX(UFS_VENDOR_SAMSUNG, UFS_ANY_MODEL,
-		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM),
-	UFS_FIX(UFS_VENDOR_SAMSUNG, UFS_ANY_MODEL,
-		UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS),
-	UFS_FIX(UFS_VENDOR_SAMSUNG, UFS_ANY_MODEL,
+		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
+		UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS |
 		UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE),
 	UFS_FIX(UFS_VENDOR_TOSHIBA, UFS_ANY_MODEL,
 		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM),
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
