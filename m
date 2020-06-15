Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265A7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 06:48:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A6A20776
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 06:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2oKWUVC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n22tBQ8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A6A20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imCnus/Fe6E5XlpOn2u2eOCksgjmc9mfh2Gy7xg+ORM=; b=d2oKWUVC35iQSb
	iB+PgDQeFMSb9wVDwfD2jFHCqwQtkl5Z9QEWvDZL5bUdACrnXCGafRQnfQdryR6NTJk2nbFCWA/2Q
	Ira0GP99l4so/gd35WmlqTSSLHHlYKVpq/szTaaltCD2bEeTNb4ShJDzaQoBHWOc9zp19XBE+vgAT
	JqZQqDiTRyMvYfDIQjNdU62Ic3nCC6Bb7p/ILXeYsagdAzP4rHw3dLtusIFyFYNrclXoS8FzWBm6b
	BJh4ZnI5jqxdlIZOl2Bqz3f/Z8WS0SQNBP2ATXbdUqIEY6oZB5dPe4UMJVveZQF83luddBfe64tJF
	nAY+D3o8Lce89ZQBGeVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkiul-0002ZE-1A; Mon, 15 Jun 2020 06:48:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkiuY-0002NP-Eu; Mon, 15 Jun 2020 06:48:03 +0000
X-UUID: 623e0f63732545d9a1b96217e6465b93-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NX2+h82NMuVzjAxKBumSAQWD3ozofhPE4z0/RVmqYDE=; 
 b=n22tBQ8JucIlMt+hec5sT9QgpLKWnCYCCavG+/4iV7DxLtlKEU/xun6o0f2CLxyiYgX+o45uFNRJUuzf5x14M35x6KJ3O+OpNET//TCwYD+VKZSBJA0a+Q2xWolNivMRTf0NyvcAadPm1Ct8XIoo4xs07/C9rdhAixi0Y7G3Oj0=;
X-UUID: 623e0f63732545d9a1b96217e6465b93-20200614
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 302216593; Sun, 14 Jun 2020 22:47:57 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Jun 2020 23:47:55 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 14:47:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 14:47:53 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 1/2] scsi: ufs: Remove unused field in struct uic_command
Date: Mon, 15 Jun 2020 14:47:52 +0800
Message-ID: <20200615064753.20935-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200615064753.20935-1-stanley.chu@mediatek.com>
References: <20200615064753.20935-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_234802_502990_D9089382 
X-CRM114-Status: UNSURE (   5.62  )
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

Remove unused field "cmd_active" and "result" in struct ufs_command.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/scsi/ufs/ufshcd.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index bf97d616e597..7fa35c78342b 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -88,8 +88,6 @@ enum dev_cmd_type {
  * @argument1: UIC command argument 1
  * @argument2: UIC command argument 2
  * @argument3: UIC command argument 3
- * @cmd_active: Indicate if UIC command is outstanding
- * @result: UIC command result
  * @done: UIC command completion
  */
 struct uic_command {
@@ -97,8 +95,6 @@ struct uic_command {
 	u32 argument1;
 	u32 argument2;
 	u32 argument3;
-	int cmd_active;
-	int result;
 	struct completion done;
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
