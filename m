Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2F3C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 04:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWDvI9g2pRQ52ZMOm1a7Y9bqu87BMMp4jVyuY1u4zSw=; b=IuDZ64llHxgNoNWwRF8AX+OYgy
	/14qgSGmkcsIhh4oAfF6H6tQUpp48O8zREUUga4NMCk61TRTSxWSjRk0FBhksfdV5X+shOTJp3EYn
	BkglJQ7HXDQcEkGtblmgf3rMUBPNQ0PMVdx5Lel5Yoobb3eDCVYrOniZh5KrZN4UJ8bPPvz4RCs3Q
	en7on7Bhk9B41RQ3ciKA0ihMbHL59NaRBUPYqn1SxUkDVPlmoQqig+ANuiG31AF0E3ebibbfwp5uA
	FKGnCLwXz8irdWpOqWTG8MNVvu0cs75NEpt1iDlBxxk+C7XvbTqF3XYzPfH7Eycfxj26kmTSuysbG
	Jo2cAC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orWyg-007U22-80; Sun, 06 Nov 2022 04:09:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orWyd-007U1g-Ks; Sun, 06 Nov 2022 04:09:45 +0000
X-UUID: 4032f6166c144bb884dfaab4b220a37d-20221105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vWDvI9g2pRQ52ZMOm1a7Y9bqu87BMMp4jVyuY1u4zSw=;
	b=GG1jFMIQmLxHd7H4Lt+Zn9M4ki4f1kpPvjW6XLtv4Wa9GFYqU3pi9kcOQB3nLO+7k0ceqzTjalqTpnNcGk33Q1RS7WDY28FQ8i+b15V6X0/AVnvbPiHG6Uz424KLFmMmDB97r4QStMSr3hY4FbG5O+mi0xfDpf2VvBeMwkF459I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:a021b66b-bbc3-44d9-aba1-5b2130487fe5,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:62cd327,CLOUDID:685fb390-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4032f6166c144bb884dfaab4b220a37d-20221105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1432103103; Sat, 05 Nov 2022 21:09:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 6 Nov 2022 11:39:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sun, 6 Nov 2022 11:39:34 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <mengqi.zhang@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND v2 0/2] Mediatek eMMC Inline Crypto Engine support
Date: Sun, 6 Nov 2022 11:39:22 +0800
Message-ID: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_210943_715045_6DFCDB58 
X-CRM114-Status: UNSURE (   5.63  )
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



