Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B58BCA0FE1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J7g3d4Sf0BMZgiD7mJvVRCUZXsOADAvbi+DruDyMICw=; b=a7zFkV4I5N0MXhYarL48u7Fjyy
	yDLsYoz6Q98/B+V28eFc3qALxZZwhoqcMD4aoE9/R628uQldsTGDA46aScLbdnW7bd1APNpXb3x3F
	ET0ZigN94R2RHKsZMJ+og9bnqbyC4w4aMwvE6Gm0A/hYBx6wMeokQcFQuqvhWO6oxSz0gVSzscAkV
	z0LxVzqqDWgokCQ5l3XaIgzBMsL4b74LTdYc0+5W5hHyzqFahJIibSKxQta2S+lNdyW3l76BnROT/
	kgyMsiSUaKb6MiaHsliKjAh+px5xLL3eoHeryCcXuwnXIlK5L63IHj79JyWdl/irg8y3JIvMyn4ct
	DjMtpZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVag-00000007nvn-2AUw;
	Mon, 25 Aug 2025 11:42:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUHS-00000007c7y-31hh
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 10:18:28 +0000
X-UUID: d2a24f3a819c11f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=J7g3d4Sf0BMZgiD7mJvVRCUZXsOADAvbi+DruDyMICw=;
	b=f3sa8kkWn7/tAv1EigGjPsQctxHfBDBUMk6xt9fOEe3f6CbDpZ7BuKBsZtipAgIduwwsmWUjntORxoGH3g/Ylnb9IZ4VCki8NUdruPy0QEx3Ej1C9znFo7jtf57IZuJ9eqwcXSfUsnt6fLUm9zwxyCQ8hhc2oISNR3SatPgMTvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:7385ea63-476c-4b38-bdc3-666dc1d37fb9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:6cf8956d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2a24f3a819c11f09f706fa2197c6ceb-20250825
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 284812461; Mon, 25 Aug 2025 03:18:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 25 Aug 2025 18:18:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 25 Aug 2025 18:18:16 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <sanjeev.y@mediatek.com>
Subject: [PATCH v1 00/10] ufs: host: mediatek: Power Management and Stability Enhancements
Date: Mon, 25 Aug 2025 18:10:08 +0800
Message-ID: <20250825101815.2891905-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_031826_759845_C3A85F90 
X-CRM114-Status: UNSURE (   5.50  )
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

These patches collectively enhance the UFS host driver's reliability,
power management efficiency, and error recovery mechanisms on MediaTek
platforms. They address critical issues and introduce optimizations
that improve system stability and performance.

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

 drivers/ufs/host/ufs-mediatek.c | 176 ++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.h |   1 +
 2 files changed, 147 insertions(+), 30 deletions(-)

-- 
2.45.2


