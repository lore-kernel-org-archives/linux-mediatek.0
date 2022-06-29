Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fYre1V/fGs3ROkKPntceEwd0mJ1c+FHPklBWFPPOobI=; b=HRV8drD8tjHl0K9zYXVZqFjiM5
	PsmkbSxV/+itAi+wa0TYQ3qjSaZP1Yu4tDE9R6piDtqhOrNKkeopAWnXnw9fJsB6+63Sqkb2dQz8x
	L3KWhSkN5NXvUKpGfLuGI9H20upNvPQHx1gVjnjidDBkp/i1vVIgmUT5R2fDcHF7dXbNAGSZXDnWi
	UHBTTl1d2D4tXeQkm1J3tHBBGOprISk+1qhjgehFzvVvWRbGvj36xA9UjpihktKkpUlDX0zB41UAj
	gXVF8l9WgLI0JH5C8xp5Gfe+IVknLbHzLOPoAMU8C2c7egmHJ8Z3O0ec8sTdYWU+ATMj+p0TkqIPV
	PqKpxIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XF9-00C03p-Dm; Wed, 29 Jun 2022 12:56:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XDV-00Bz6T-A2; Wed, 29 Jun 2022 12:54:50 +0000
X-UUID: 463ee5b945e04684910b80be516e884a-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:8e900977-ded4-41f3-bdfb-0b352d0e805d,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:87442a2,CLOUDID:5d331a86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 463ee5b945e04684910b80be516e884a-20220629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2078017613; Wed, 29 Jun 2022 05:54:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 20:14:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 29 Jun 2022 20:14:00 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/5] Complete driver nodes for MT8192 SoC
Date: Wed, 29 Jun 2022 20:13:53 +0800
Message-ID: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055449_400150_22980E18 
X-CRM114-Status: UNSURE (   7.88  )
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

This series are based on matthias.bgg/linux.git, for-next

Also need to reference below PATCH for dsi in chunkuang.hu/linux.git
dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml

Allen-KH Cheng (5):
  arm64: dts: mt8192: Add pwm node
  arm64: dts: mt8192: Add mipi_tx node
  arm64: dts: mt8192: Add display nodes
  arm64: dts: mt8192: Add dsi node
  arm64: dts: mt8192: Add vcodec lat and core nodes

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 235 +++++++++++++++++++++++
 1 file changed, 235 insertions(+)

-- 
2.18.0


