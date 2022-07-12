Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FD8C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4m2k9y2Sz0f2JB0Au3ff5JfvClVS4y0G3VR2U+IlyA=; b=HWh553I2VhLFCbfRfr01xnRaVj
	dnfFU3WeZA8huVlxqd4q+BJh8y1uh6+GAFvrCYZRLGNKPms2KXroMtfYiRRtFoKG4k4Cla5v5Yn9g
	Yo46rAmIOYVCotJYsaeJ/UOTfmqowNEEoAbP/JRbQEpWL6CBpJPG2qH4slKlfTu9MRhA/Ps/oxlfg
	vQOcgOhIH33+7UC+vUnOFShhQJwaeBlz+Hmp+ywAl1AaiHrBt6aMZTGwgkEuE8RbwFgJ1s+BXOz3U
	06d5VMz2+kdQbhzpx2BMMtSDdSdJwbgCLsjQ1JFZ0WzVzqNGQIDotIPyghQsUFDaeZ2m/3QJkB9Pd
	UFKbYfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBEGp-00AYeL-PB; Tue, 12 Jul 2022 11:41:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBEGd-00AYUU-42; Tue, 12 Jul 2022 11:41:30 +0000
X-UUID: a75cf46808d34e2b921bc5010c65939f-20220712
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:644980a7-bcaa-406b-9c96-bd2d7d117b5c,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:5ebec332-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a75cf46808d34e2b921bc5010c65939f-20220712
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 682287343; Tue, 12 Jul 2022 04:41:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 12 Jul 2022 19:40:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 12 Jul 2022 19:40:48 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/5] Complete driver nodes for MT8192 SoC
Date: Tue, 12 Jul 2022 19:40:41 +0800
Message-ID: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_044127_198939_B6644099 
X-CRM114-Status: UNSURE (   9.35  )
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

This series are based on matthias.bgg/linux.git, for-next.

I remove vcodec lat and core nodes PATCH from series and will comfirm
clocks usage then resend PATCH.

Also should reference below PATCH for dsi in chunkuang.hu/linux.git
dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml

changes since v2:
 - add mmsys #reset-cells PATCH
 - add missing fallback compatible
 - add display aliases
 - remove vcodec lat and core nodes PATCH

changes since v1:
 - add Reviewed-by Tag
 - rename dsi-phy from dsi-dphy
 - add missing power-domains in disp mutex
 - Add remove mt8192 display rdma compatible PATCH in series
 - use "mediatek,mt8183-disp-rdma" as fallback
 - remove mediatek,larb from rdma node
 - remove syscon-dsi and add power-domains in dsi
 - add reset property in dsi and mt8192-resets.h
 - correct Typo: s/ndoe/node in commit message

Allen-KH Cheng (5):
  arm64: dts: mt8192: Add pwm node
  arm64: dts: mt8192: Add mipi_tx node
  arm64: dts: mediatek: Add mmsys #reset-cells property for mt8192
  arm64: dts: mt8192: Add display nodes
  arm64: dts: mt8192: Add dsi node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 188 +++++++++++++++++++++++
 1 file changed, 188 insertions(+)

-- 
2.18.0


