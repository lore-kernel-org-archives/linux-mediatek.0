Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A78E78D40
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbnBCI5kFYUDAvzmdDZ+LPmZZWAhzsgOBo5AF9tO3eM=; b=Uzxkh0yC3RloyVtpnqKEux69gU
	uZSYRLvHl9X6a663xRMJ97sT2GyDcRzbRkC3+Kx9U+UFF78tD03PJVSBE7FFFVz81xB/3a+4edyPW
	QDaZhR8VDZi5Gg9WRHGZamNrxMoDoFC9QZ4kocgP7yFfs9NUy/4Sn2TibNLz8AxMFjUCI64u09F4w
	FBmQWUNuknEI9ulKrBNTkDuEUmfhqJLaV8TqUbgO9muq4dyYJunZ5HvHpcOwKbqQIkupAMoVPNpYm
	RMqGVsslV90dGruveSXCY76iJYA4N8xsLMPHF7pos5F4j83rDMqRz8BqtXNYLajp3t5XqREUGgeGX
	uuNxvFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMg1-0000000F2cg-1pj3;
	Mon, 09 Feb 2026 08:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMfx-0000000F2b9-3FeS
	for linux-mediatek@bombadil.infradead.org;
	Mon, 09 Feb 2026 08:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rbnBCI5kFYUDAvzmdDZ+LPmZZWAhzsgOBo5AF9tO3eM=; b=hECiO6j8IUNHba0q8oC0otwO6V
	3+cpfDYWsKRYqror020keYLqYKQ5gSbIinFLjgKyIOW5wCotDXVbG0TO1JWeXNvQLtmIir0ooQ7ag
	THnxHdhVKtc0KLD60u9gGEZbxKB5VXvMa9Dyvg/MFNLBd+jO9g5qpr7H4c32XJ7ArsDnGaRcGaGLn
	HiTUYi6TL8VLrxVlKl8nv9q7BBfl2dQXGa3g0pCKIhXB2LHmGoj6dJaZ+AfXksQ9X70AXhgEGZMzK
	TgCcWs5KK/RWsfmkYOSyHG8XUAYDVgQTy2SKwPjhbJw2j6xjHJOcpl8Zs/KaiMeEX5kIkLZHIu7LH
	hFvr4rqQ==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMfp-00000006VTq-3CEO
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 08:31:20 +0000
X-UUID: a87b0d0e059111f1ad39f32c34db0b1c-20260209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rbnBCI5kFYUDAvzmdDZ+LPmZZWAhzsgOBo5AF9tO3eM=;
	b=TZ5UyrEG00rivC7CMzGc0f7xR+2ICcKtfZx9szXr/nZeY93PRe4K6kK098Cq4E47vegCIuKOmc59vjzHfBoLBVkjXySM4l+s8FcPyMLxVF/8QR4eocWko7Lr7aDeu3Raww47bRWHwWwJMU+B3oxpvGjGZ6kPQK73MmuLxJQ1+E8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:bcd123c1-5d85-4de8-a3ac-15b6f334d873,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:08c2bf7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a87b0d0e059111f1ad39f32c34db0b1c-20260209
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 445537904; Mon, 09 Feb 2026 01:30:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Feb 2026 16:30:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Feb 2026 16:30:55 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v1 1/2] ufs: core: add debug log for uic commnad timoeut
Date: Mon, 9 Feb 2026 16:28:47 +0800
Message-ID: <20260209083053.1467647-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260209083053.1467647-1-peter.wang@mediatek.com>
References: <20260209083053.1467647-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_083114_635404_9346BF8F 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

It is difficult to debug when a UIC command timeout occurs
simultaneously with a UIC command complete interrupt.
Currently, we only see the timeout log without any debug
information, making it unclear whether the UFS device failed
to respond or the host entered an incorrect state.
Add a one-line log to cover this situation.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 604043a7533d..8c3d13f59cf5 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5564,8 +5564,11 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 
 	guard(spinlock_irqsave)(hba->host->host_lock);
 	cmd = hba->active_uic_cmd;
-	if (!cmd)
+	if (!cmd) {
+		dev_err(hba->dev,
+			"No active_uic_cmd, may timeout and be cleared.\n");
 		return retval;
+	}
 
 	if (ufshcd_is_auto_hibern8_error(hba, intr_status))
 		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
-- 
2.45.2


