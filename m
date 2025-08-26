Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE4CA0FF0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M48CFblWzNfJZwxWjPwDyIHvbOpeJKFs3QwHpUFncII=; b=23F1NrEpYKYWU0HpLt7SuHYnCh
	f9HI4oIHU2n+Zg6a/C7U72b22Ne1SyrjQA9akkx5fkMgmrLEFHJhQ4WRC8NNRli+LA0SQ5zhxnetp
	gfeFAWS5PlsTeo68peSVZ0pSQ9whEpNzPyITMBUYXsBmXMCJoqoUZsLy/d4bt+AljZpvN8u0gOeFt
	LzXvwIGSW+48Hk6JARTr9paqU7lWVuVlpu5nX30FNfnlsyP0NmZWze6mjmUUG5rpvFlvuwctMiB48
	SzKywzmE2FDeJhPMAOtFBc/9MIcvo4Wdu55P4zOLRQ3yN/KYSUFPh7NK4NILbc7ScR5NK6Mu6guga
	jHiiG6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZY-0000000AlUE-36sz;
	Tue, 26 Aug 2025 06:54:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn5a-0000000AgiG-3GHv
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 06:23:28 +0000
X-UUID: 2acc7ee4824511f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=M48CFblWzNfJZwxWjPwDyIHvbOpeJKFs3QwHpUFncII=;
	b=hTjugeWCEf6kWyk6YaA6FMKxJTNy3WmJQ+PjS8DSE/l+4oVq+o+OWj/7ejnVBzPHWAVg/CQCN5ODii78ptSncpoM4oUPkrmwMgNBSMCuyAzT1LQwrU+D0y/yXJs0hwob4Cae17Kwt0MRWEwhW5cpqYbTKifHfnMaySywzLfjNEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:207697ba-7978-4e35-9417-10b45d52b618,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:c2c7877a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2acc7ee4824511f09f706fa2197c6ceb-20250825
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 831332514; Mon, 25 Aug 2025 23:23:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 14:23:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 14:23:18 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <sanjeev.y@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 09/10] ufs: host: mediatek: Fix unbalanced IRQ enable issue
Date: Tue, 26 Aug 2025 14:22:23 +0800
Message-ID: <20250826062314.3070425-10-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250826062314.3070425-1-peter.wang@mediatek.com>
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232326_845960_67CE7823 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

This patch resolves the issue of unbalanced IRQ enablement by setting
the 'is_mcq_intr_enabled' flag after the first successful IRQ
enablement. This ensures proper tracking of the IRQ state and prevents
potential mismatches in IRQ handling.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1342fe7d8e2b..af5574ac0b3c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2190,6 +2190,7 @@ static int ufs_mtk_config_mcq_irq(struct ufs_hba *hba)
 			return ret;
 		}
 	}
+	host->is_mcq_intr_enabled = true;
 
 	return 0;
 }
-- 
2.45.2


