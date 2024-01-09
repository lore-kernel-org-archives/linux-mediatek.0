Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5C8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N7nHaY1I5LnfvEwQ7ggCcVfjDHhMZ7XKaKi9cDsT4Bc=; b=KgTY6xoKxbqXLtSDU5jn3m3z/r
	qTdCDhJVjaZtGwQFxFKkMf9eafa4yMVCzeo6atKAz2NvGUhxsUxik574uZCzxxSVrTI9fE6/6MCL6
	gAT6/emCTJcY2UgH+fce6aU8UVKHvkKgit37AkE1t99pfCzIwCxKK6uqPeZXUxPl2aw/N7ilnbOId
	mzGugwNUlqAQRkQqAsjQhAV6frtqvZAGt3tWv2aClU1PPe78nZ5zNaBf8DWRNZaikkhCiJUNG0lL8
	Xse+FhmEwynZ3Lf5NOM5bVE6TkLAw1HmNSRj77mdnofcVEkiWvy66hjj4Iuz7VBfmDMEMhTazBivY
	La/X9NSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBPE-008GJ0-1Y;
	Tue, 09 Jan 2024 12:40:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBPC-008GH1-06
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 12:40:31 +0000
X-UUID: 3ff607a0aeec11ee9a662f17bb45267e-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=N7nHaY1I5LnfvEwQ7ggCcVfjDHhMZ7XKaKi9cDsT4Bc=;
	b=DjQO3xKklIG3KWM15GvJ5oa1xsHE4l1sU7y5tNtJTyBWh+8kPLdmRQ2da7ffXey6ZSnsNm8fNgerNtM6rsgj3XEtKdDViLZ2+btVQouX12sptz+urHsQPeBFBfRxzpT1n8VrVIR33leF9/X6po8YtbTe9apg8zcC1bGP9hhSIYY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:4c4f6b72-daa8-43d7-ac32-e0725877da4b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:a44b287f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3ff607a0aeec11ee9a662f17bb45267e-20240109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 163701583; Tue, 09 Jan 2024 05:40:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 20:40:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 20:40:17 +0800
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
Subject: [PATCH v1 0/2] scsi: allow host change auto suspend timer
Date: Tue, 9 Jan 2024 20:40:13 +0800
Message-ID: <20240109124015.31359-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.705200-8.000000
X-TMASE-MatchedRID: 19mYHspCoIeAAYHsHSPDcxn0UD4GU5IqXs5nqGvDCfP7efdnqtsaE1KT
	eW+F3fxdT4hrqjpfaZikeU7arquyzkkjllSXrjtQFEUknJ/kEl4RTILTyAA+ovoLR4+zsDTtjoc
	zmuoPCq1ZRUwzXy/+utN/h9wesHlSrX1FKKjdWOn3YAizmQdU5AxaakXpnihf
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.705200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DDFD86B58787EE8D420B5793A26BD63AAB035909B05C7B70FACCD81BBE1FBCAF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_044030_072264_8CFE7545 
X-CRM114-Status: UNSURE (   6.96  )
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

This patch allow MediaTek platform driver change auto suspend timer.

Peter Wang (2):
  scsi: core: move auto suspend timer to Scsi_Host
  ufs: host: mediatek: change default auto suspend timer

 drivers/scsi/sd.c               | 2 +-
 drivers/ufs/core/ufshcd.c       | 9 +++++++--
 drivers/ufs/host/ufs-mediatek.c | 4 ++++
 drivers/ufs/host/ufs-mediatek.h | 3 +++
 include/scsi/scsi_host.h        | 6 +++---
 5 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.18.0


