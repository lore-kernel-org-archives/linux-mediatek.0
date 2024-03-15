Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD07C54E6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGMXrYi4YYk2oO+1rHTixLpzrViU6sTS8OtZxl3LaJg=; b=SZTRbQaFideoo29tHo6bIe5Csf
	BIHqv0GYwKXhwq5vt1BwlfNDbxkQDPh4bAsC1z6FW1CjHvFAbYQMVcglEpsHYa+iQI86mFOJgEpZs
	DzgEXzJm+OK2I2rycmdc7z5EGa3T4LKaX27USwvMFBxJYFKgCth3YYSlvK3PAGnIf+Pxt3MvnCJX4
	zBhbMZM5IBlXix0kTGcDJP8ZDRu17IFT6xGB/Ky/5yvEWAH/gU/HghWPAREDp4i2H3aM5BpBKdNqU
	ZLt5IwRRb4ZZDYmIc+BqDLz99EzJKNuC44dyu5hqgMEiBVwd9h/xo52Zc7A0yg7VAIF76E8SUExSK
	nZ0laI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31s-0000000HAgH-48oi;
	Fri, 15 Mar 2024 08:35:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31n-0000000HAce-3N8u
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 08:35:03 +0000
X-UUID: e5644e66e2a611ee9aa9374d6d45775a-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uGMXrYi4YYk2oO+1rHTixLpzrViU6sTS8OtZxl3LaJg=;
	b=A58ctQlK34Yke0UrVDV8N2Y5FaRn/E32cYJQMjydBq8dw7f+cV+K+Te385V9ob0qSWDpL22N4dIcFkji2GVg6cYqYyfNLaogPPVJP/9gsA9l74pvwNZSjjxy/6hpRyYh8oBNdvrQIQJBPN3trZlDvJAAn5HX0ci1PirYXQqwRkw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:24f164e8-c864-4340-a3fb-51995a815b22,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6f543d0,CLOUDID:58e68981-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: e5644e66e2a611ee9aa9374d6d45775a-20240315
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2141824055; Fri, 15 Mar 2024 01:34:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 16:34:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 16:34:50 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v2 0/7] ufs: host: mediatek: Provide features and fixes in MediaTek platforms
Date: Fri, 15 Mar 2024 16:34:41 +0800
Message-ID: <20240315083448.7185-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.666600-8.000000
X-TMASE-MatchedRID: BPqRySCXgbcMQLXc2MGSbDPDkSOzeDWWkZs6eeBnIM1UjspoiX02F80U
	/azwU24yldfHsj3+ZpRJA2NzGyeAU/2PG17cgWyQP0HVIeixJdCxIYWToTws93O+ZmsO1h7REct
	wVVwptQsrIhHNwiG1WXATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW3UT84tBOoB65tU
	1gK/spum+VOFU1oMkKGNlDATRRDjEM1mXw2ZmBS0MMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.666600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D35BB8CBDC66BB90B42695C6C42DE5695E2BA2B75AF040F0EB5499AD9A2740812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_013500_257777_65D8EB0B 
X-CRM114-Status: UNSURE (   5.03  )
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

This series fixes some defects and provide features in MediaTek UFS drivers.

Changes since v1:
Remove unnecessary "!!"" in patch:
ufs: host: mediatek: fix vsx/vccqx control logic
ufs: host: mediatek: tx skew fix
Add some comment and patch description in patch:
ufs: host: mediatek: fix vsx/vccqx control logic
ufs: host: mediatek: ufs mtk sip command reconstruct
ufs: host: mediatek: rename host power control API
ufs: host: mediatek: support rtff in PM flow

Peter Wang (3):
  ufs: host: mediatek: fix vsx/vccqx control logic
  ufs: host: mediatek: tx skew fix
  ufs: host: mediatek: support mphy reset

Po-Wen Kao  (3):
  ufs: host: mediatek: Add UFS_MTK_CAP_DISABLE_MCQ
  ufs: host: mediatek: ufs mtk sip command reconstruct
  ufs: host: mediatek: rename host power control API

Alice Chao (1):
  ufs: host: mediatek: support rtff in PM flow

 drivers/ufs/host/ufs-mediatek-sip.h |  94 ++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.c     | 130 ++++++++++++++++++++++++----
 drivers/ufs/host/ufs-mediatek.h     |  90 +++----------------
 3 files changed, 220 insertions(+), 94 deletions(-)
 create mode 100755 drivers/ufs/host/ufs-mediatek-sip.h

-- 
2.18.0


