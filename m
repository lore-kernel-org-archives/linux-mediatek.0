Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 05:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5MbJ65whJezsOxzVMTb4jX2RNqOYVs2prEBd/IYAvYU=; b=jUqZDmJAdriYqLRKvUVF3OkknH
	CkOgkFYQpo0T4vLubUPXeCnxwbtYu/UtzZ91h6LIWhtNpT/HEICQP0/Uf+fsUU+NrPslM+n+Eyn2Z
	Gd6MatuYJY5fSkfcFhf0rnQnBqppdPKtPldL8WL0dVXiDgktUjA21qOvYIOo2uWiAPl/XU0ZkgRzC
	uOJhe08ikkjIW+rkqx26SVyaMwct+N/5cEs3LJfxH3+ROfAt5MAY8aHgcHpqvyZozue5ek9v0OYFO
	ioaqk3HDU/+6nQRJH7/V1rsBbE5jcJ1Qiblrk8jEKXXm9C0KE3AZiBUsBNiY6ZvQGBDh6wgI5+AvC
	43rWN8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iQB-000dAA-P5; Thu, 16 Jun 2022 05:51:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iPl-000cuT-P0; Thu, 16 Jun 2022 05:51:35 +0000
X-UUID: ce7698d47b64449ca5e2ecde7d44f709-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6ed565ef-91a3-4e3c-aae4-384989107a6e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:70df6ff6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ce7698d47b64449ca5e2ecde7d44f709-20220615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 421403886; Wed, 15 Jun 2022 22:51:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 22:42:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 13:42:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 13:42:22 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yong
 Wu" <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH v2 0/5] iommu/mediatek: Improve safety from dts
Date: Thu, 16 Jun 2022 13:41:58 +0800
Message-ID: <20220616054203.11365-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_225133_833088_1C543F32 
X-CRM114-Status: UNSURE (   9.13  )
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

This patchset contains misc improve patches:
[1/5] When mt8195 v7, I added a error log for dts parse fail, but it
doesn't ignore probe_defer case.(v6 doesn't have this err log.)
[2/5] Add a error path for MM dts parse.

[3/5][4/5] To improve safety from dts. Base on this:
https://lore.kernel.org/linux-mediatek/20211210205704.1664928-1-linux@roeck-us.net/

Change notes:
v2: a) Rebase on v5.19-rc1.
    b) Add a New patch [5/5] just remove a variable that only is for v1.

v1: https://lore.kernel.org/linux-mediatek/20220511064920.18455-1-yong.wu@mediatek.com/
    Base on linux-next-20220510.

Guenter Roeck (1):
  iommu/mediatek: Validate number of phandles associated with "mediatek,
    larbs"

Yong Wu (4):
  iommu/mediatek: Use dev_err_probe to mute probe_defer err log
  iommu/mediatek: Add error path for loop of mm_dts_parse
  iommu/mediatek: Improve safety for mediatek, smi property in larb
    nodes
  iommu/mediatek: Remove a unused "mapping" which is only for v1

 drivers/iommu/mtk_iommu.c | 86 +++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 25 deletions(-)

-- 
2.18.0



