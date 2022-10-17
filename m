Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED8C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9nM+HJkIZYFDdoIM0Yw1SMU/i8YQxRIRZyTgOy4hyyU=; b=X13pGUHG6kNBZFuQOnxGkcPsGz
	NRx9QHmIJ02Apv/aAcPyAkyEzGb2WVmjkBG0doRkAXSOMUrcQTKjLbaxHvVsm4VhLSAm0/4boi1Tx
	puIHx6er50tebPhDpouwhKKeo/hWqbPLQxy3LwzWqY6BDzbVD+XtoTPHWtvw/UsLmI0g8j8kQZ7V2
	e90rkQXlA+BFfJczhT/OmvavyxWdGRc0FWexef/iPCAPv3RLiy7Y8CZpZ90UhV9NBDJa+8sayRiWj
	yhf0qr7pSdnYjlyGuxZ51C8CJBzszT564Ds+EyoID9RVHYpv0M5elMl+gmScRcag35DxfJsFBF2Mp
	Vhj9/OVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQyr-00Ce60-N1; Mon, 17 Oct 2022 14:20:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQyp-00Ce46-HQ; Mon, 17 Oct 2022 14:20:36 +0000
X-UUID: 94b4550856ff4c9cbcef53df18f7a6bd-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9nM+HJkIZYFDdoIM0Yw1SMU/i8YQxRIRZyTgOy4hyyU=;
	b=ROd+uF908endJGyK+g1D0dHapZNUj9TACl6FN9I6P94plGkK5K3XH9Xc/Sex6CMbVuAqyiIEBFGfCHmPjf708GQ8yCisO2no4VeJaTddsQPDDKRwLL/UWxrCEclz5/iF2Ay5q1yVVSM/+UXxviq1CW/ROYJWoCDbwGY109aSoos=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a8c7d3b8-7ea5-4db0-9644-0326e1b84d14,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:b32b5ab6-a023-44ff-92b1-76c504f71c7a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 94b4550856ff4c9cbcef53df18f7a6bd-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1820742660; Mon, 17 Oct 2022 07:20:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 17 Oct 2022 22:20:10 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 17 Oct 2022 22:20:09 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] MediaTek eMMC inline encryption support
Date: Mon, 17 Oct 2022 22:20:05 +0800
Message-ID: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_072035_601536_725C261F 
X-CRM114-Status: UNSURE (   5.64  )
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

Hello,

Mediatek eMMC hardware IP has Inline Crypto Engine (ICE), we support inline encryption now.

This patchset supports Mediatek eMMC inline encryption which meets the upcoming version of the eMMC specification such as v5.1 or v5.2.

Patch 1, add crypto clock control flow in mtk-sd driver, patch 2, document the device tree description about crypto clock.


Mengqi Zhang (2):
  mmc: mtk-sd: add Inline Crypto Engine support
  dt-bingdings: mmc: Mediatek: add ICE clock

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  4 ++++
 drivers/mmc/host/mtk-sd.c                         | 12 ++++++++++++
 2 files changed, 16 insertions(+)



