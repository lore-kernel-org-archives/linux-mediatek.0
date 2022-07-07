Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F03C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 05:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+P64XOEtw78nS3VgUgroZPCDUswdAccXc0p6qRuCWM=; b=QZRXB/+jP+mZxOAAUwTohgea0x
	lP/dg2BsZUcNiwRocUFvRop05zMG2DdmyYsJ4KK2DGHeta4Uoxd6Pgp6pBfHJj0iyMZCGIlylZWyO
	SGZrg3fLBUH4y8DkHQraBktmTmQMTMuKI5S5Y/I7fVMMztZY37nJj2hkonzI04eNNmTHmUtc06Oue
	pXEIuWIHISOkKGWI8w1LlfUXwdCdBIeB7uHtc2vXPYRB6qxRgYCMCgUm1fIUMyP2XW7hJwfPvIYHs
	wR6LCWxEi1M+CjvdJzexl0jq8y4R1MJcMLeYZrGlgFQTW2ijdwB5LgXKXUedsRFckHX51HvSHzo5G
	4v2h9aRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KLV-00DnSy-K6; Thu, 07 Jul 2022 05:46:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KLT-00DnSA-RA; Thu, 07 Jul 2022 05:46:37 +0000
X-UUID: e7ae770d957a46caa965b0069e3a613b-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:55d61732-f9ec-4342-8fbb-f8cd86df4b43,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:52d2d6d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e7ae770d957a46caa965b0069e3a613b-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1303158194; Wed, 06 Jul 2022 22:46:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Jul 2022 13:46:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jul 2022 13:46:20 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
	<liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
	<housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
	<kewei.xu@mediatek.com>, <david-yh.chiu@mediatek.com>,
	<liju-clr.chen@mediatek.com>
Subject: [PATCH V1 0/2] add i2c support for mt8188
Date: Thu, 7 Jul 2022 13:46:15 +0800
Message-ID: <20220707054617.13583-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_224635_918052_6C70974C 
X-CRM114-Status: UNSURE (   7.22  )
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

Kewei Xu (2):
  dt-bindings: i2c: update bindings for MT8188 SoC
  i2c: mediatek: Add i2c compatible for Mediatek MT8188

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |  1 +
 drivers/i2c/busses/i2c-mt65xx.c               | 41 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

--
2.18.0


