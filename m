Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B0C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MH6dYmQyhSE1302eUMFhKU681PeVCQBf2giSqmdTtj8=; b=H4/lWjE4geUu41yNSmKOQsYZXw
	L9lpDAL6ZxoUl9cGn/9movyI7pd/2sH5o+ESIAbuwYFgbky3jVsxUcSgwnRrO8It2MbyuTABPaMsJ
	3+5Ps5pxe2sbd0G2FUGjLytiyb50wwjcy4m1mMp2HG3SZxvd+fgtOdl8QS1Yj/YGkXiHTvzpBvR+2
	jwbVCjhyC1QOEDZxWEtXdOtjboHJyNOOncFs7XFzTukVcTfVXztbJX1fuJbbxxbvb+628SPDQtyvW
	EVMZCpSJwVvfp7G2IaE9gHTRZGd+FXux84/7AlFK1Gi2ox0LpfSrAFNRVKZoK98UiFPqNa1/0q+Fm
	A+47qYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKy4M-0000000Bs8q-10Ik;
	Sat, 22 Jun 2024 10:34:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKy4H-0000000Bs7h-1YUS;
	Sat, 22 Jun 2024 10:34:02 +0000
X-UUID: eb77cccc308211ef9daba96ee3f3cc8c-20240622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MH6dYmQyhSE1302eUMFhKU681PeVCQBf2giSqmdTtj8=;
	b=qx9jTpzNRZKJG/+lil+51Qj8nu83Tj/peQE5MrJixrQ0b1K0ISMwt2Bqe3L2BAaUj8aqE72j/DH45JLk5k8k4tBwVwbbAw/yEVVEaaypbZ5vI+YHYAZNFpdj4DAlZ013Ke0u6w4/sJSHkS3EEzUhiRtwcITdjCGlRmrwemqxJ0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:329c098f-62f8-4e5f-9ae9-bbef893e72ed,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:56014d94-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eb77cccc308211ef9daba96ee3f3cc8c-20240622
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 895454676; Sat, 22 Jun 2024 03:33:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jun 2024 18:23:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jun 2024 18:23:49 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 
Date: Sat, 22 Jun 2024 18:23:46 +0800
Message-ID: <20240622102347.7004-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_033401_435510_0F2F8594 
X-CRM114-Status: UNSURE (   6.53  )
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

Dear linux-firmware maintainers,

The following changes since commit 77eb1a9398784c42e23ad087acddef599f0dd9d7:

  Merge branch 'robot/pr-0-1718900951' into 'main' (2024-06-20 16:54:34 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.2.0.git  v1.2.0

for you to fetch changes up to 9e6aff680098f0def484e018413ad7c002c2f4fd:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0 (2024-06-22 18:06:17 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



