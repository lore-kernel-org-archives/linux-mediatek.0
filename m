Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5F0CF884C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5O3QSTjG/GYo1v2aEYGeurT8OjIk96rTbcs+GIL+0MQ=; b=ikGDmpKy/NIpJ4FnV13vy6OSrD
	BynJ1f8IE8TW09g7yJ7yArs/qU9qUoaIBquWr81CjuXKGwfaOdYu/ZCu0Cnu+sU3khrNs7yyLh8DQ
	dQ26gkDyHM9msTZOJy6VQ1+X4vwCCB1nNrfdKzakpTxkSb3WE6iY04lL14lpbyNxUfNOR8lhMvc97
	rSw3ZvAaZtOq2yzMUnqTL3bi9oA7Rw2q45FCDUgNc6GRNCTBuASzpNx7ggoKN7Yh61fDltutW0flm
	kyc8uyvja+Tf2YqvYDqu8xQ8G5M8PLvBfLMoPibX7WyvAb6Y4x9cS9le4AFQYHayd2IM/PGwXkmoe
	dbAk6hEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cB-00000006eNY-15EN;
	Thu, 20 Nov 2025 12:18:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3c6-00000006eMD-3olC;
	Thu, 20 Nov 2025 12:18:17 +0000
X-UUID: fa8344b6c60a11f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5O3QSTjG/GYo1v2aEYGeurT8OjIk96rTbcs+GIL+0MQ=;
	b=tTRTnU+fTdPzygTjmujJJcaroT1gjqb01wJfCGiNU8sC2STNDUS34XzS0hmbBvK28nLn6D11C1dTuPTN3cYiLAqv30uTIaMlAacYUuNK8Mx6cNrtrBDhOGThJi30v2N63HAjXTLNLN2oyYGqYxsS4Pjnwuz0a56cuFlYXanikhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8b1086a6-5762-4268-be0e-b0a62de8b89b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8bdab1e0-f48b-4fea-bcf0-ae56d774aa1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa8344b6c60a11f0a52f393f94899d25-20251120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 130002763; Thu, 20 Nov 2025 05:18:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 20 Nov 2025 20:18:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 20 Nov 2025 20:18:06 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eddie Huang
	<eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>, <Vince-WL.Liu@mediatek.com>,
	<sirius.wang@mediatek.com>, <Jh.Hsu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/5] rtc: Enhance RTC driver with BBPU bit definitions and shutdown handling
Date: Thu, 20 Nov 2025 20:17:56 +0800
Message-ID: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_041814_968750_BD4EE9FD 
X-CRM114-Status: GOOD (  12.54  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

(1) Add new bits definitions for RTC_BBPU register.
(2) Add new functions to reset the BBPU alarm status in mt6397 RTC driver
(3) Add mtk_rtc_shutdown function to handle RTC shutdown events.
(4) For the V1 version comments, the following modifications are made: 
(4.1)the formatting changes are separated into a distinct patch. 
(4.2)Since the rtc-mt6397.c file is a fusion of multiple RTC drivers 
for the mt6358, mt6359, and mt6357 RTCs, the definitions of certain bits 
in the RTC_BBPU register differ among these RTCs. The mt6359 supports 
the alarm status bit, while both mt6358 and mt6357 do not. Therefore, 
the alarm-sta-supported property is added in the mt6359.dtsi file to 
differentiate between the different RTCs. 
(4.3)Additionally, the operation to disable IRQ in the shutdown function 
is removed.

Shunxi Zhang (5):
  mfd: mt6397: Fix formatting of RTC_BBPU_KEY definition
  mfd: mt6397: Add bit definitions and struct members to support alarm
    status
  rtc: mt6397: Fix formatting of platform driver structure
  rtc: mt6397: Add BBPU alarm status reset and shutdown handling
  arm64: dts: mediatek: mt6359: Add alarm-sta-supported property to RTC
    node

 arch/arm64/boot/dts/mediatek/mt6359.dtsi |  1 +
 drivers/rtc/rtc-mt6397.c                 | 32 +++++++++++++++++++++++-
 include/linux/mfd/mt6397/rtc.h           |  5 +++-
 3 files changed, 36 insertions(+), 2 deletions(-)

-- 
2.45.2


