Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9282BCEBF8F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m46+FnCMQHOmqn0PoIzre0+LrIPiIFVNgGTSNn1G4lU=; b=ia54jal/OEjI7ymFJenf1bS5YB
	Yl8W771O+NiWpg0ooDDJDcpB9ZisOdE6oMHCBGrqnIPPsrn3IYYP8dV1gJ89lLSR04Jt3bnnfL9Hs
	2/LyZvQjzeNvDz+y4eY8msUjrWieBpM+BmFzprusO7HR3aSNHEGX2+TDwXdclI4GfKaRKjf7d+L26
	HusNP/JA40VhEmNC4VoMe9EzZc9RJF5wnL9y/5ECSTkY+4RVl2fkTW1OCBK3SxQGcADleqN9TSj4e
	u+6Y+IE2j27+s3NPA8ti3zlbdXZRFWbCvHY20SeC72rggFzm1VpFyh8utfaSQx8GgSfQU3DJBkDt/
	JMnVsPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su8Fj-0000000Aokk-0Qeg;
	Fri, 27 Sep 2024 10:31:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8FQ-0000000Aog5-0sGs;
	Fri, 27 Sep 2024 10:31:09 +0000
X-UUID: 8e548d847cbb11efb3adad29d29602c1-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m46+FnCMQHOmqn0PoIzre0+LrIPiIFVNgGTSNn1G4lU=;
	b=HnBMVLhbPhUcs3t0NSgzyZJgxtovAZPaNcI0ORLMOmq+G36QMcdIAjAAhdYVH3V/+ZxenL18+OiKYELWCxfab731z2/zRfpjNNsxd4OVwR+ziTHYVnLAdHkNTIXxpweK/I9niv4vRy+NqDJuvqYwzKezUORbctVkCEi6oBMkQ+8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:63a7b8dd-9baa-4f24-a59e-0f167be5eb3c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:be31ded0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8e548d847cbb11efb3adad29d29602c1-20240927
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1458363657; Fri, 27 Sep 2024 03:30:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 18:30:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 18:30:41 +0800
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
Subject: [PATCH v2 0/6] Enable Mali GPU on MediaTek Genio 700 EVK
Date: Fri, 27 Sep 2024 18:29:59 +0800
Message-ID: <20240927103005.17605-1-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.806400-8.000000
X-TMASE-MatchedRID: 9hizXfD21dsmTNBjrl+CAW3NvezwBrVmojQrbrPpzzqGisL/BZ/9PdW+
	IybvzGvgNj6y7Vt/6GWC5iz+AfW7iGUlOh2o2oTOXP5rFAucBUGUi9wB9gmcSg6QlBHhBZuwdO+
	/9tNlGWiVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUhkdrz87uCrRgoB
	lboHSVM/+AFuk/l+IJhhE+xzpC0Amtj3NsCFywmxooWenQjZ+C/qp3hdj9VidpK/dq5WMpuQtpr
	0rlZmVdSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.806400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D0C318A38EBB130AA739C695458581D634A5D984CB05CC042F6AC14E61DE43042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_033052_331201_7032701F 
X-CRM114-Status: UNSURE (   9.24  )
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

This series is based on linux-next, tag: next-20240927

Enables the GPU on mt8390-genio-700-evk.dts. 
The panfrost driver probed with dmesg:

panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, 
  issues: 00000003,80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
  Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x10005 l2_present=0x1
[drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0

Changes in v2:
- Fixes the "Fixes" tag in patch ("arm64: dts: mediatek: mt8188: 
  Fix wrong clock provider in MFG1 power domain")
- Reuse mtk_mt8186_efuse_pdata
- Remove comma at the end of mainpll_d5_d2
- Add patch ("soc: mediatek: mediatek-regulator-coupler: Support mt8188")
- Couple GPU SRAM voltage to GPU voltage instead of fixed value

Pablo Sun (6):
  arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power
    domain
  clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of
    mfg_core_tmp
  nvmem: mtk-efuse: Enable postprocess for mt8188 GPU speed binning
  arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning
  soc: mediatek: mediatek-regulator-coupler: Support mt8188
  arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU

 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 11 +++++--
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 31 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-topckgen.c    |  9 ++++--
 drivers/nvmem/mtk-efuse.c                     |  1 +
 drivers/soc/mediatek/mtk-regulator-coupler.c  |  1 +
 5 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.45.2


