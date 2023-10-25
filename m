Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E9C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5zkch3mSEJZ0E9AdlA4GQWgLG+OEFfNA8pOLGU7VfLY=; b=2QLH6AgJFn7Nt4Fy1wBDirxQ2s
	II+PuF5IikrFVLwC7LVkqyKbnJBBptuFRmbW0y+SaKG6zxGzBvy8ASrZfG0c9YXDzyUJLjujSpmoi
	L7Y2V+JsGTSigENdgKygoFyy5r37tJ+RJKGFD2qx+Q+FuvH277/32Nk8LxVgkm5JhrPI9XJALV/zJ
	OeZ4YUT5am10Y2w4MbJak1319sdvuwajP9KGvHcS5BA3pXDWGtfphVCrsb7kO06NZ3vd/3cgOPXo6
	r6BUQJXgjyNv+L1iUUicUphb03ogfjDqVqAyZcdIVis4FBEWHCXbB5o8LqUaoPXFKM93OG165D7Hu
	8FBWOitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZiB-00BlRU-1n;
	Wed, 25 Oct 2023 08:57:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZi9-00BlQX-0Q;
	Wed, 25 Oct 2023 08:57:58 +0000
X-UUID: 93d2c6b0731411ee9b7791016c24628a-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5zkch3mSEJZ0E9AdlA4GQWgLG+OEFfNA8pOLGU7VfLY=;
	b=giOou+BurqmiI5tLpdca/H8HEfU716IzOYKEEBMWAMSyTjbIOo1HwixBAqct9ZowU6xpJDY/gkebwVVIHdOfTjJD31WQz0/2CY77RC+lC6eKQXISJiPn1Lr7ELZlSGygIBZs03Wg3f9EVYV5/WQWKyd11kREOIBUXxx03QssO8Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:1be0bb45-8954-4634-a53f-9a30478fb974,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c8e2c0fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 93d2c6b0731411ee9b7791016c24628a-20231025
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chun-hung.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 384164979; Wed, 25 Oct 2023 01:57:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 16:57:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 16:57:12 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E . J . Bottomley"
	<jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Can Guo <quic_cang@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>, Asutosh Das
	<quic_asutoshd@quicinc.com>, "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
	Yang Li <yang.lee@linux.alibaba.com>, Eric Biggers <ebiggers@google.com>,
	Keoseong Park <keosung.park@samsung.com>, Arthur Simchaev
	<Arthur.Simchaev@wdc.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>,
	<peter.wang@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <lin.gui@mediatek.com>, <eddie.huang@mediatek.com>,
	<qilin.tan@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-team@android.com>, Chun-Hung Wu
	<chun-hung.wu@mediatek.com>
Subject: [PATCH v1 0/1] ufs: core: Add host quirk QUIRK_MCQ_EXPAND_QUEUE_SLOT
Date: Wed, 25 Oct 2023 16:56:53 +0800
Message-ID: <20231025085656.10848-1-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.511800-8.000000
X-TMASE-MatchedRID: uajpMFX5fhcAb75z7qUG0lz+axQLnAVBK2i9pofGVSu6SmGkMbaxzqPF
	jJEFr+olKE0Je8DR/D4Qr/RhSnHzg90H8LFZNFG71sULACB0qRKUOL+zMbQzLC1Pjbl2IIImF+6
	oUWsfRNyCu9TcHpuLYi2cdJTMdLTMF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3B
	ndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.511800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 843DDFDE3226983DC684E2279F9EB70224AF7BBF85DA7A8D9AAA75B38B48E7E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_015757_174056_C94C4FD1 
X-CRM114-Status: UNSURE (   7.34  )
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

Support quirk for host controller not able to distinguish
queue full or empty.

Alice Chao (1):
  ufs: core: Add host quirk QUIRK_MCQ_EXPAND_QUEUE_SLOT

 drivers/ufs/core/ufs-mcq.c |  5 ++++-
 include/ufs/ufshcd.h       | 11 +++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.18.0


