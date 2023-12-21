Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D78C46CCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jC0sXjCnIhbt918CnedQVH2uV5YUh3c631Te5mtBE6A=; b=qrprwDmpQdygwZya+BPJUXFMQI
	1NxCp/mXG/tRLP30jC9H7nCIHcjDAe+tAQguzMfUTgPbzgvhEV+fYpYlZ45jCwpoVrc7wOVOWIYbM
	T9suhDAl4qer4VKA/PaaDOl/k+OCy/WosFodbk9s8DQnONHe1DhURxO2gHf8i3yHdj62IZoGOSEVt
	qBNu4lWoncNTiEnhNuKS2LrzKKy+sF2Cqg+0OhpCS/d0lCsFnx0H/7lRsDC7oORpnvwihJohI/qHM
	3J74Hx1zKjVXUcxw1oCUOeSXPRSRUIMqKo+f2tPE10o4MknwazLg6Drkd/QRG8U7CS28CXamsTTI9
	k1x8Cpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqv-002WjQ-1W;
	Thu, 21 Dec 2023 11:04:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqq-002Wi2-30
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 11:04:30 +0000
X-UUID: b1cc82749ff011ee958cff29c719f35b-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jC0sXjCnIhbt918CnedQVH2uV5YUh3c631Te5mtBE6A=;
	b=Ies/gdVPPBq4WlcybG4s7ik1c3OYhpuIBrQHP74TacFR96sFrxIn1Fmq9HqlZ+vB4q4kVpQodTAcrWGV3J6T0nZ+a821ctHGmHTv9H45icpsbc2YrrXODeaoPlLMd6P+VsEaLVxCEgWUFxKIYXOJGr505D4+BKKh64n6zW2wrwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:4d7cd36c-5fb1-435f-903f-95f5ffc7e5e8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:bfba857e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b1cc82749ff011ee958cff29c719f35b-20231221
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1929503426; Thu, 21 Dec 2023 04:04:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Dec 2023 19:04:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Dec 2023 19:04:17 +0800
From: <peter.wang@mediatek.com>
To: <chun-hung.wu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 0/3] ufs: host: mediatek: Provide fixes in MediaTek platforms
Date: Thu, 21 Dec 2023 19:04:13 +0800
Message-ID: <20231221110416.16176-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.376000-8.000000
X-TMASE-MatchedRID: oS9YGR9UQY0MQLXc2MGSbJdc7I2df+msBGvINcfHqhe7qpOHKudqc0as
	gt8eEZ2k2Bzgv79yUtegVbxI8zQaQh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyMdRT5TQAJnA/O1
	sc2r+KcGSLJ3M/MszziBrI7cC63na+4yKBglQj0jBkGBTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkx
	J+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.376000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86ADD0A0C4021EACE501C0B6233AE3A0C0134712D9E0241B417570C86B3773B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_030428_972857_BD6C3B44 
X-CRM114-Status: UNSURE (   5.83  )
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

This patch fix MediaTek platform exit hibern8 and mcq related error.

Peter Wang (3):
  ufs: host: mediatek: check link status after exit hibern8
  ufs: host: mediatek: fix mcq mode tm cmd timeout
  ufs: host: mediatek: disable mcq irq when clock off

 drivers/ufs/host/ufs-mediatek.c | 65 ++++++++++++++++++++++++++++-----
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.18.0


