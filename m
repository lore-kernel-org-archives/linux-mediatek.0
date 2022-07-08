Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B1AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMtU/m1zsrjymLTpNGGDK2t/1buhZcAVcu+458Nd9kg=; b=Q8Fx+FRlf39zFUAA624wKllepV
	Zn1GYSokS83t4KTcK6r/ozaVNMBk/JGuvu1WmL4WS+25upO9JiEy+rCdMm3g+Akrkud9Rtg70yorX
	a/KHJ1nFKotXcKmjaAa7jelc0lySJG8cwMpit2V3Qj6Q5//OTqaCHB0O9b3sS8dEdrJi12xejs4Gb
	eNpNe9Fr6BfwK7dgUHK9zd93U76Km75UVdvQDhSS0sVXb0zVuoUH1lZ/+PqYS2LwBhZODw7Qa+Jyb
	qdB5hSGFazypEdCVa0kMGjRgX084IiJfVJCReubopO6i7JFMN2+CC8wR5W/SBjsipXM0WmVjU/e53
	Dx+5oENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dk8-001Lgs-Ry; Fri, 08 Jul 2022 02:29:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9djs-001LSt-3q; Fri, 08 Jul 2022 02:29:05 +0000
X-UUID: be8380b0ffbc4288af91f4ffdca82e18-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:aff612cb-0da5-4776-afff-a04bced22fed,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:c918ecd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: be8380b0ffbc4288af91f4ffdca82e18-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1691799185; Thu, 07 Jul 2022 19:28:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 10:18:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 10:18:20 +0800
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
Subject: [PATCH V2 0/2] add i2c support for mt8188
Date: Fri, 8 Jul 2022 10:18:16 +0800
Message-ID: <20220708021818.21400-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_192904_203299_2C960BF4 
X-CRM114-Status: UNSURE (   7.45  )
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

---
Main changes compared to v1:
added mt_i2c_regs_v3[] to replace slave_addr_version.

Kewei Xu (2):
  dt-bindings: i2c: update bindings for MT8188 SoC
  i2c: mediatek: Add i2c compatible for Mediatek MT8188

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |  1 +
 drivers/i2c/busses/i2c-mt65xx.c               | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.18.0


