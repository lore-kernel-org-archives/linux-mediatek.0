Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B83CA0FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijrT0jwd9zxSdfUaWVtis7trkc+f2nnBLIWNiEhbTHM=; b=ydzsRW5o7upSQpkVTIXO+rLoiP
	s4YmEfrPBDYMW2pg3uSZshjJi48WE8xKpUbKxgFBnmh8nRIyVXKUJgAqKnsi+QK0vX5q7CNNlDni7
	jb8/MiZXMTiG/SpqMaVGCTxzKz9JGq/p639icVOKyoutiABcSlPYMhqE7blKlKOVEviXo/BVrbUUB
	5JaK/dI50CuVZW6gO7gXKcFj1EYkHolYHrw2igCTPX2zFgldP9KsdN8/GHuK9Mg5JTLxdS8klCjSI
	dFqw0Td8MuVobAQgIEGDEEXIf+ZnyVoiWMXtAkCnemmfLxYw0GSoAy/WhpXtfG3tifDB4j+D4CYex
	fG0KEVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZZ-0000000AlVL-1JbB;
	Tue, 26 Aug 2025 06:54:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn5b-0000000Agh1-1NcU
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 06:23:29 +0000
X-UUID: 2a2e1d94824511f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ijrT0jwd9zxSdfUaWVtis7trkc+f2nnBLIWNiEhbTHM=;
	b=dkKfcQUZ+1RyspQN2GkLpz2LvK1zNITaYnbYsOm7zt51fguxMk4sGvuyn/F8F2U5heOUA/z0NaYczbIjZgZ62iMvcjQXQ9Z3mGGoB+pjp/4BQijFQPQfhjKjaCtfCwFqbmtcdL8XiEsLUybHGyrSz4CAT80qf8HZhafXNXbzrjo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:d2acf2d9-d0ad-40a0-a239-0e3cc2d4f341,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:e6e09d6d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a2e1d94824511f09f706fa2197c6ceb-20250825
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1339426982; Mon, 25 Aug 2025 23:23:22 -0700
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
Subject: [PATCH v2 08/10] ufs: host: mediatek: Fix adapt issue after PA_Init
Date: Tue, 26 Aug 2025 14:22:22 +0800
Message-ID: <20250826062314.3070425-9-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250826062314.3070425-1-peter.wang@mediatek.com>
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232327_415973_63E21268 
X-CRM114-Status: GOOD (  10.94  )
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

From: Alice Chao <alice.chao@mediatek.com>

This patch addresses the issue where the host does not send adapt
to the device after PA_Init success.
It ensures that the adapt process is correctly initiated for devices
with IP version MT6899 and above, resolving communication issues
between the host and device.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Alice Chao <alice.chao@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index a6f812713345..1342fe7d8e2b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1551,8 +1551,19 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 
 	return ret;
 }
+
 static void ufs_mtk_post_link(struct ufs_hba *hba)
 {
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	u32 tmp;
+
+	/* fix device PA_INIT no adapt */
+	if (host->ip_ver >= IP_VER_MT6899) {
+		ufshcd_dme_get(hba, UIC_ARG_MIB(VS_DEBUGOMC), &tmp);
+		tmp |= 0x100;
+		ufshcd_dme_set(hba, UIC_ARG_MIB(VS_DEBUGOMC), tmp);
+	}
+
 	/* enable unipro clock gating feature */
 	ufs_mtk_cfg_unipro_cg(hba, true);
 }
-- 
2.45.2


