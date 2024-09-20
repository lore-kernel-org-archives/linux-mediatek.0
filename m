Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8CCC78854
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EWJ4udSgDoEgGrmmpQfYFCOlGYKVyE5VZGKmkzitpGE=; b=RPUw8MoAlz++Z9ko98vUouj9is
	fI2abA+mAx6FlLtp6pjKA09toX7wNDg1s/eGAQKmi3yl0LUI5UQ54vXnRxWzSODDoIEaf+d5kOpTI
	KiQTk3dZfAjctbgsYe8m0zzZOeyamqqHy5aHRXnQcl46mAHDPdziIVC5+fHFpItb2cvf+RU0tVYlU
	Iaklufxrq8T4tzeEZTamMh2UMQ5wSCfgwMe1emmnDKQhOtoNEMmL8mbpiJ4LBr+8VEhqGV9Q/1uO+
	j6dPKKhobbibiM6GQfNo2E7C6CgJEQHIxq2/dpfFIVggvi90Aj8s4OVN4ysxp88GA+n8PaLgfzezZ
	5zQBighA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srekl-0000000COnl-3jEV;
	Fri, 20 Sep 2024 14:36:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srekj-0000000COms-1XCc;
	Fri, 20 Sep 2024 14:36:58 +0000
X-UUID: c5fc6594775d11efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EWJ4udSgDoEgGrmmpQfYFCOlGYKVyE5VZGKmkzitpGE=;
	b=IM01aydt9hh2yi+B65iFasFiqzUedV21ZZofGT5zPYvWPURdffxL/TRlSZqOAmOJuLpxlY00WZWzUx2Jr4rxhbh38T0T+G26BHSzqwymUIy7XEufvjSK0fbm0iuXk9rxs5YTyZsqiWDm3C401FAWiKIBborbVV4CMxBACs6s5Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:eef6cd78-5b55-4584-8436-28fcf795ffb0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d4d1ff17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c5fc6594775d11efba0aef63c0775dbf-20240920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1383372707; Fri, 20 Sep 2024 07:36:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 22:36:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 22:36:48 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zoie.lin <zoie.lin@mediatek.com>
Subject: [v1,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 20 Sep 2024 22:36:26 +0800
Message-ID: <20240920143627.23811-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_073657_431730_D5E29EB0 
X-CRM114-Status: UNSURE (   7.26  )
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

This series is based on linux-next, tag: next-20240919

This series adds support for runtime PM operations and bus regulator control 
in the MediaTek i2c driver. The changes include the implementation of runtime 
PM operations and the integration of bus regulator control to manage bus power.

zoie.lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 72 ++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 11 deletions(-)

-- 
2.45.2


