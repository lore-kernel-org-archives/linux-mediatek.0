Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 02:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bnlUV++8wE287LSAKD4LBPHZc1pA425sZejfQM0uYZA=; b=iQD6vmRocyF2yN65+o11laV2sX
	+ojLV0wNHQnn9o+tdr+ilPdr0L6ZOIhmMkOgAFRbD44E2m7FsmV+9VbMf8ePht6dYl1VGb5ZBdo7m
	FnN2TlHcsqzQkSXQyfWDgpmxCRbmFvxv8Q81X1RN9IxT78KWcXtNwV5MDMF3q8cERcHwtB4zyU0Dg
	k982Z3MhoV+TAG0KiacqU+7DvrT4v7DzLW14+2889vp1X1mAOWpG8sbrJ6TxdeTkOjsa+3ncx+GcF
	JwGe1PTXctCB06HhsQHupYjksa+0wG+UfpV/aTcDOMLq4lotBIsDq5i4cDYXbjhSHgVBNl5ckr7tq
	bFSS+Lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dYu-001AoK-Eu; Fri, 08 Jul 2022 02:17:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dYs-001Ans-87; Fri, 08 Jul 2022 02:17:43 +0000
X-UUID: c3718b82ee834722978045590808ebc6-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5880de5d-e275-40f1-b171-bf3a1b602b52,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8970b963-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c3718b82ee834722978045590808ebc6-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 69175815; Thu, 07 Jul 2022 19:16:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 10:16:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 10:16:01 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH V3 0/2] arm64: dts: mt8173: Fix nor flash node
Date: Fri, 8 Jul 2022 10:15:46 +0800
Message-ID: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_191742_330141_08D562B0 
X-CRM114-Status: UNSURE (   8.47  )
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

Add axi clock since the driver change to DMA mode which need
to enable axi clock in dtsi and dt-binding example for mt8173.
And change spi clock to 26MHz as default.

Changes from v2:
- remove assigned clocks and parents in binding file

Changes from v1:
- Modify nor binding file

Xiangsheng Hou (2):
  arm64: dts: mt8173: Fix nor_flash node
  dt-bindings: mediatek: Add axi clock in mt8173 dts example

 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml      | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.25.1


