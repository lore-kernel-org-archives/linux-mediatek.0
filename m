Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Frhxa4F28je2U/FCw9H9G3VOPjVsCiPHSXSe7PXPaBE=; b=wek2XGeJdQnQPMf8SXMtUNSwPO
	xL2r3Q5jdJG8STsDSqvW508y4SGeTQQyg0wVX/f8f/8fYM31+iCT9e8Cp4ChfxQJrbmXeHxuJPAvu
	99SFpdJ7AoD642PG1e20CKocsKmRkDk0YXm0Z+/kXyxr2rsdkuem+pr2X3VoQsXNz/I6CMjegPM6m
	K3dqGQA5BrHCoq2ZecCYK/wNG2kLlBfE8V6+Nk4BKIY4+h7RFJyZfApls/2lQHS5GzbF2mM91TBhN
	pmPPqvHk6e5G2/djAUacpMMTc2XWQUm96K0yNJkLPxzkxcFsPdKIwU6NOEazp3k5zDWSRjWK0i2uT
	tUeGEIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q4i-00G8lJ-Py; Thu, 30 Jun 2022 09:03:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q4e-00G8jT-JU; Thu, 30 Jun 2022 09:02:59 +0000
X-UUID: 778acce3436f45b5ba9e0eef325e6d02-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:a8c64ca5-56b5-437f-b39a-96c31fa9d964,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:d48f2f86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 778acce3436f45b5ba9e0eef325e6d02-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561450116; Thu, 30 Jun 2022 02:02:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 17:02:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jun 2022 17:02:25 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v2 0/2] arm64: dts: mt8173: Fix nor flash node
Date: Thu, 30 Jun 2022 17:01:55 +0800
Message-ID: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_020256_680584_31567212 
X-CRM114-Status: UNSURE (   6.95  )
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

Add axi clock since the driver change to DMA mode which need to enable
axi clock. And change spi clock to 26MHz as default.
Add assigned clock property and axi clock binding file.

Changes from v1:
- Modify nor binding file

Xiangsheng Hou (2):
  arm64: dts: mt8173: Fix nor_flash node
  dt-bindings: mediatek: Add assigned clock property and axi clock in
    example

 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml  | 10 ++++++++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi               |  7 +++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.25.1


