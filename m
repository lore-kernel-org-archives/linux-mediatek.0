Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABEC19F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u6hkK46ngLpCt0luG58MPzBjhMAPwpKKkRvCmtebNw0=; b=mkx45bgihjNACOpTS840Ki5FMf
	1AdusfW4XyaUW1GNRUKM+KmdNmsQn1h8ZfnvnGxRjcPMtJ3h30FvZE5o0+bbWpSqMrd5H56B1/6Ou
	oPH0QoK12rO+AEQJZ8wnpGVYBvZaPWBoDSJ+nTvTsZMaCGLcVINiHetRxtzrkn5wEpScKzAhmISGL
	a7ZYNkYjmLTUqURM+lKatg7JDiosTLKbxFV5dVqk2isG74QB9OWKgDrgVCtZsspeIVTGTDUAWAzjh
	W5eb0l+qJSqKiWqZ0d+xi9sQZzwz2gwk93QhvFEaMmlsf4YF0mFhgp66RBjj/q8Zzz7xkgab55J4m
	kYIuqqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsyT-00F0gf-CD; Tue, 02 Aug 2022 14:34:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsyR-00F0dP-52
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 14:34:20 +0000
X-UUID: 37f840c66d5e4a7a97dee0d42405db58-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4c7027c3-4a4f-4e19-a436-80e213b72522,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:c7ce06d1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 37f840c66d5e4a7a97dee0d42405db58-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 204286482; Tue, 02 Aug 2022 07:34:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 22:33:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 2 Aug 2022 22:33:39 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v3 0/2] ufs: allow host driver disable wb toggle druing clock scaling
Date: Tue, 2 Aug 2022 22:32:21 +0800
Message-ID: <20220802143223.1276-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_073419_270593_41ECB5D5 
X-CRM114-Status: UNSURE (   6.84  )
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

Mediatek ufs do not want to toggle write booster during clock scaling. 
This patch set allow host driver disable wb toggle during clock scaling.

Peter Wang (2):
  ufs: core: introduce a choice of wb toggle during clock scaling
  ufs: host: support wb toggle with clock scaling

 drivers/ufs/core/ufs-sysfs.c | 3 ++-
 drivers/ufs/core/ufshcd.c    | 8 +++++---
 drivers/ufs/host/ufs-qcom.c  | 2 +-
 include/ufs/ufshcd.h         | 7 +++++++
 4 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.18.0


