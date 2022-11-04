Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA439C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWDvI9g2pRQ52ZMOm1a7Y9bqu87BMMp4jVyuY1u4zSw=; b=jDPbNGEZMyDXG7o00EH7e74CHc
	1sr1AzZ+kZ3QV9mReDWptmEdEa2AA3RjUyXcGTgNPHT4wrNxvSsu1iPo1vPYmsYzRhNBOgKzT5t79
	iO6IuPOi2gJXYpdqc7xmx49oBIYrrmj3KXNdTnNKthLNT10ISqAg6MmRNepJtVenWQK7ZH+Ma3JkN
	NTiAA2YRXUTxnaz1dxj5pgW5mojo5uXLvoui92uBpCXRAgcLwSP+OPS1jzJ5LxLem2sUT8sKYC1UC
	SaoLrVYy7Y9xlENFSTSeBfh0Kw9T1nJwJtNhWgHb1GWNcGDlJRQ5qq0MpWCqsimRJ7XjtVQ1N4aEd
	p8ZNcohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqtMP-0038qS-OR; Fri, 04 Nov 2022 09:51:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqtML-0038oO-Kc; Fri, 04 Nov 2022 09:51:35 +0000
X-UUID: 0b2b6e2ee06a4775a5b7c9fd055e295a-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vWDvI9g2pRQ52ZMOm1a7Y9bqu87BMMp4jVyuY1u4zSw=;
	b=HJG3N0xnjx28Ilih3chP00cD9FlbdImcqXdZqTqjhq2sHs4Rsv6j2FBlQJZVb8YTT8YrHhZAxBSpJp6+0HYRCNANVJrEZHJXSdv9w5SHwp84VulmcU1qx5swL6+PKMOyvOYCvG5AaBDtNRzQ+i+spE6R1LBVMxqWZUAgiy7AmTI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b0336ab6-3920-44d8-b196-c0ddfd5a933b,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:62cd327,CLOUDID:82ce72eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0b2b6e2ee06a4775a5b7c9fd055e295a-20221104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371915333; Fri, 04 Nov 2022 02:51:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:51:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 4 Nov 2022 17:51:15 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] Mediatek eMMC Inline Crypto Engine support
Date: Fri, 4 Nov 2022 17:51:10 +0800
Message-ID: <20221104095112.27348-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_025133_813579_EB0EC540 
X-CRM114-Status: UNSURE (   6.41  )
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

Change in v2
- change patch 1 commit title
- change patch 2 commit title, and correct commit message
- add crypto clock description base on new code base

Mediatek eMMC hardware IP has Inline Crypto Engine (ICE), we support inline encryption now.

This patchset supports Mediatek eMMC inline encryption which meets the upcoming version of the eMMC specification such as v5.1 or v5.2.

Patch 1, add crypto clock control flow in mtk-sd driver, patch 2, document the device tree description about crypto clock.

Mengqi Zhang (2):
  mmc: mtk-sd: add Inline Crypto Engine clock control
  dt-bindings: mmc: mtk-sd: add Inline Crypto Engine clock

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     | 12 ++++++++++
 2 files changed, 34 insertions(+)

--
2.25.1



