Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF093C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=35OV9bm/nJfNjbrb7yi/BB0BrjLFYQJ7Jo6Rx4Ol1pg=; b=QqfylGmUh2pTGHT+Pxr84ZhUBH
	dSTW8eq+Y1RJSjYYG0/2W2AZqlyR3oF2XzaABBXAFB2ZxRnS7FJqBer3O3PMzsAMawBotpiT+J3bv
	2D4D0Afxuw3YmHoBRR/dhJ6NrlMOW7Z0qy8pqa35g7Ci4voGxZtuCEGmG2qMVh5CGXhdLveVQL+1/
	JAi6ONZljxPNyFSJIlvXRn/4dLDkFz316Z6KpBTH98Crp66kGiJYDdBY7LA4bbo1bjfbE6YlYqGgQ
	3o8xA6bi1vsMXCAbWN4COWLze1R7jUdv1QkS6FciLiW1pscmyZ1MBpTGiKmmT9kbNdHUVmAoZQzIP
	0TI/8PWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGT-000000084Kb-2kky;
	Fri, 08 Mar 2024 07:03:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGN-000000084Dp-1fpB
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:03:30 +0000
X-UUID: f155d77cdd1911eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=35OV9bm/nJfNjbrb7yi/BB0BrjLFYQJ7Jo6Rx4Ol1pg=;
	b=Hz+pQfpIBBmRt3VRq8xBDvbQEj7d6dRAchxdt+KRnY5CGKIGjmfPnEdlzPAwtekxFKG6aPhnm1zdNlx8ojG78yHqTSdB+lAZ6Jf71BPQ/oMYZSQaK1j+zae+mzSEIkg1LRr/86xd7HjLmV6wSUdOMO+8XQXJ47giHuQ2JQlctkM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5642d666-bfd4-4b4d-8128-2f9b4fdc70b7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:0a9ca8ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f155d77cdd1911eebe6b57d01cc416d2-20240308
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1303003582; Fri, 08 Mar 2024 00:03:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 15:02:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 15:02:43 +0800
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
Subject: [PATCH v1 0/7] ufs: host: mediatek: Provide features and fixes in MediaTek platforms
Date: Fri, 8 Mar 2024 15:02:34 +0800
Message-ID: <20240308070241.9163-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.753000-8.000000
X-TMASE-MatchedRID: sBypFcuOxUYMQLXc2MGSbDPDkSOzeDWWNNuh+5zmS680QmmUihPzrEI+
	GPbgg5kxzd7s/pivV7Ebeq8jPqXwbj95f95FaTdFP0HVIeixJdAraL2mh8ZVK0k7tZaD19NMo8W
	MkQWv6iUoTQl7wNH8Pg1fA1QHegDv3QfwsVk0UbuGrPnef/I+esSfI/a4Ki1CnfkRCpX3LDY2KU
	2TjSiKo14YemAKcq+3l5lPxc0kjNU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.753000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A66417B6A0862F3EBCC3F098BB2B814C3613DB32401881B33D6B87E704E73AC52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_230327_451424_D06006FE 
X-CRM114-Status: UNSURE (   5.26  )
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
 drivers/ufs/host/ufs-mediatek.h     |  89 +++----------------
 3 files changed, 219 insertions(+), 94 deletions(-)
 create mode 100755 drivers/ufs/host/ufs-mediatek-sip.h

-- 
2.18.0


