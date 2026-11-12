Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1DF606A334
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nh5g2lZi;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oqc0vXr6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2pI2qUJfyIRhJ5YXQ0suS5d2nYo3nqfrvbF+nFQsyXM=; b=nh5g2lZiFQGZon4pdyCIB7o2yl
	kVoR6kk85oG5WfI30LKOJND1Er+gg14C0YzKEU9HWq5QuqSeiD6lHWfokUkr5EB3FgXPNuGGT3wHz
	sBmcdyLxmS6dyKrbx2QMBKLUeXA+a+2pOMbqV9wY3Oe6Ui1vRyXHhHJkZHseAa7kq7Z1CtbdS3N+U
	83P6/PL+KNtQhdd8gT+FTD7cMAtNKmeehbJeJUW3Ub+nzOHVj4dl2S5iKkVfJWVtrteT9M+CNSREW
	vcmb/CUPQZ2XptiAxTceUintxT3JcpjygWeF1rFmu5JqFHs2v5Xea6cCHusF3pnNV8GklUfrqcUm7
	wfOHmB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPHX-00000008wGk-3TKb;
	Thu, 12 Nov 2026 07:31:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPHR-00000008wFu-2bDI
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:31:38 +0000
X-UUID: 14beee24de6b11f1acbe4559397dec65-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2pI2qUJfyIRhJ5YXQ0suS5d2nYo3nqfrvbF+nFQsyXM=;
	b=oqc0vXr6v/QSASYWvsjWtc5sta2PNkdjpZzfmlJmChpIrDhfj0Hcq6g7M7dwODOcsdpRNOrgkT6u9bxJaik2+bIqWbcAEGBcc0c3t8Jiiqrq+6Q7WhZLdtONg5tgSasacL5lED8NHOKhQCWXxjIqajuWAfOfYMnkSCNiYmlPpLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d19bb125-5223-4c76-ab79-629f9a40a5b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f7c73066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14beee24de6b11f1acbe4559397dec65-20261112
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 298847284; Thu, 12 Nov 2026 00:31:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:31:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:31:29 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac: read token_count under token_lock
Date: Thu, 12 Nov 2026 15:31:27 +0800
Message-ID: <20261112073127.1798821-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_233133_763033_8550863B 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

dev->token_count is always updated with token_lock held
(mt76_token_consume(), mt76_token_release() and the tx token cleanup
paths), but mt76_connac_skip_fw_pmctrl() reads it without the lock,
which races with the tx and tx-free paths.

Read token_count under token_lock. All callers hold pm->mutex and run
in process context, and token_lock is never nested with pm->wake.lock,
so spin_lock_bh() is safe here.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 9af25eb48531..4e373dadf640 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -415,7 +415,10 @@ mt76_connac_skip_fw_pmctrl(struct mt76_phy *phy, struct mt76_connac_pm *pm)
 	struct mt76_dev *dev = phy->dev;
 	bool ret;
 
-	if (dev->token_count)
+	spin_lock_bh(&dev->token_lock);
+	ret = !!dev->token_count;
+	spin_unlock_bh(&dev->token_lock);
+	if (ret)
 		return true;
 
 	spin_lock_bh(&pm->wake.lock);
-- 
2.18.0


