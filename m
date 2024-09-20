Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3656C78845
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdGS2Redugm+6yZAwL+vZjmNIVgfyGtJQLHlHzdoyr8=; b=3JoSzC68URE6D4fWvVom4sCpQ7
	kpQduNDTa6D6vvrJ/s2u7w6uF3l0SNM8rKsplaF+5QRKQoZacsHhoEEVOXeb+1wokwo4/aQaFlQvZ
	UWahqLNxufuGdV4Q3Tkd0z/RtvneBIJ24dxpBw9bQa+Egs6bcZb9A8c2PlYttvKY0WVkdx+wkZ+oT
	VGNuwBMsGYH1XDXL3kEom3jxbgelPEEYxDK/at2BzcgyW3wdezYLdWMVXiVif/NLJ6ZJWqH4Yz2mJ
	4wWUYPQmV6XeYXw5Ffmat02K2g8C96aOUJuZot28MjyqcA9STrVXpxq6vBJlCkRgCaZPwWTYMGvlU
	ZOwc/9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdtv-0000000CHgL-1E7c;
	Fri, 20 Sep 2024 13:42:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdts-0000000CHff-3bi7;
	Fri, 20 Sep 2024 13:42:22 +0000
X-UUID: 250e7f34775611efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jdGS2Redugm+6yZAwL+vZjmNIVgfyGtJQLHlHzdoyr8=;
	b=cLrYyQSrvVQ0Cw7c8sRJzWPRIwo/KrBm8gIeyXnOpHhic8hlmxYGO4sZr1a9d08efdROnHi0Nfpf1VQxfX/dLrmqWQvN+gG6JiQxIAA6ADugYW8h5pekiofPZb5KHvmPr51uvEMo+vvAMruQJGNzDNpFOWhtia8x3aIyc2FEcSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:345d3275-8355-438c-a8a7-049bf851a587,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:64b94e9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 250e7f34775611efba0aef63c0775dbf-20240920
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 12508377; Fri, 20 Sep 2024 06:42:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 21:42:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 21:42:10 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH 0/5] Enable Mali GPU on MediaTek Genio 700 EVK
Date: Fri, 20 Sep 2024 21:41:06 +0800
Message-ID: <20240920134111.19744-1-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.191900-8.000000
X-TMASE-MatchedRID: 9hizXfD21ds77EsBOi8++odlc1JaOB1TnhD9A3Sa7pa48McbajxWsC/k
	D8Mn5brMtJRCaLO6y7uf4k2rUca3tGGBe5Zc3tN2kPoFsM336M4xXH/dlhvLv1wpnAAvAwazdO+
	/9tNlGWiVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUYlEZe7KrQtZx+J
	e1fezGIAwOQ5ymuQBGw4C83QCL2crUqZcgNHQfiSeTaJ1EC2jFSb5MQ3rtK9UN2krgd0tMduYLh
	V1S6S8pSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.191900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6C40CAEC85C00BB6034421F075345033D6F50A9AE679C36B035BBA50599BD0782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_064220_929084_3FB5B1D6 
X-CRM114-Status: UNSURE (   7.53  )
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

This series is based on linux-next, tag: next-20240920

Update efuse and clock settings for mt8188, and enable the GPU
on mt8390-genio-700-evk.dts. The panfrost driver probed with dmesg:

panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7,
	 issues: 00000003,80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
         Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x10005 l2_present=0x1
[drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0

Pablo Sun (5):
  arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power
    domain
  clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of
    mfg_core_tmp
  nvmem: mtk-efuse: Enable postprocess for mt8188 GPU speed binning
  arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning
  arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU

 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 11 +++++++--
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 24 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-topckgen.c    |  7 ++++--
 drivers/nvmem/mtk-efuse.c                     |  5 ++++
 4 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.45.2


