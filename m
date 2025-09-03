Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435B8CA0FED
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TAoBlYksGK5PxxO/QDG8OKY6NfvTD6divmIC/9zQRik=; b=rxHZ0R88l5eC5Q6yqjijlP4ACF
	GzgykZONxshSNq21N9ztGVH8/IHiwziKWpqnOIWJ2E6GdO2ptcc+DeWDpcpTaKFYU43Sl1ltgcpYP
	BnA1D2l2hp540H9o20voCFTwYZZnOIKOJCH0rZSw6wnOPI/rvZA2gWJOH2/hAKA7O6v9i9613Sq+2
	npZhJTs4rn9E7lv7LEHabpkC9OlLhHCK3gSDie8a7lWa5Wc1tOLr5LEFPiebm6kHn7JcYegtTjuaL
	0EFjR7QuCdlfyTEjDFUW0k7kzwL1ytBhTXGZ5eXE2tPoSJ9KkcB2OD8+QrJoZc2YiL1E3eykSnm3Z
	etfqrk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdWK-00000003L3i-0EcO;
	Wed, 03 Sep 2025 02:46:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdWF-00000003KwY-0dCE
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 02:46:44 +0000
X-UUID: 34ebcf3e887011f09eb0dd999d3936bf-20250902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TAoBlYksGK5PxxO/QDG8OKY6NfvTD6divmIC/9zQRik=;
	b=DLzArD899z/QEp84t10JGZXDazgYQ75T+2ZPvOfvRm48ggsvABKjUh2zX1geTP6jEYk9kHR4GV6TDevP5Iyfqv1Wivcq2I0Soz/WtC7ByI/BYMhdMjvrfXroY0V6OTGxKAtRToqgoueuhqm2V7NM+YlEEeAMg3BWqvNfssIzE5Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:35e978c1-8630-4e15-a352-7ac36e70555b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:103b5f84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 34ebcf3e887011f09eb0dd999d3936bf-20250902
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 849060531; Tue, 02 Sep 2025 19:46:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 3 Sep 2025 10:46:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 3 Sep 2025 10:46:32 +0800
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
Subject: [PATCH v3 00/10] ufs: host: mediatek: Power Management and Stability Enhancements
Date: Wed, 3 Sep 2025 10:44:36 +0800
Message-ID: <20250903024631.496693-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_194643_198917_88EF93C4 
X-CRM114-Status: UNSURE (   7.51  )
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

Enhance the UFS host driver's reliability, power management efficiency,
and error recovery mechanisms on MediaTek platforms. Address critical
issues and introduce optimizations to improve system stability and
performance.

Changes since v2:
1. Change commit message to imperative mood

Changes since v1:
1. Export ufshcd_force_error_recovery instead use force_reset
  ufs: host: mediatek: Enhance recovery on hibernation exit failure

Peter Wang (7):
  ufs: host: mediatek: Enhance recovery on hibernation exit failure
  ufs: host: mediatek: Enhance recovery on resume failure
  ufs: host: mediatek: Correct system PM flow
  ufs: host: mediatek: Support UFS PHY runtime PM and correct sequence
  ufs: host: mediatek: Disable auto-hibern8 during power mode changes
  ufs: host: mediatek: Fix unbalanced IRQ enable issue
  ufs: host: mediatek: Fix device power control

Alice Chao (2):
  ufs: host: mediatek: Correct resume flow for LPM and MTCMOS
  ufs: host: mediatek: Fix adapt issue after PA_Init

Sanjeev Y (1):
  ufs: host: mediatek: Return error directly on idle wait timeout

 drivers/ufs/core/ufshcd.c       |   3 +-
 drivers/ufs/host/ufs-mediatek.c | 171 ++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.h |   1 +
 include/ufs/ufshcd.h            |   1 +
 4 files changed, 145 insertions(+), 31 deletions(-)

-- 
2.45.2


