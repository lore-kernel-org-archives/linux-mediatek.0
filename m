Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F169CD4958
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EWhNJUZu5Z/Tip7T2l6e0SxlNLO3our8/wpCQafOB/o=; b=TbAMn/vZYhtyq/CO7sO67iXPEK
	ms/k61074f0/nrbJkgkHuzy8065TgRsY6hqYQ1svawfpxTelNhkTjLLJMr6VOftfyEo+zbzmTgEZQ
	Cxn1BIsEWhM1a7IhX3g1Ut8sWOM8Z4ktIdNHxsoZUytzwIL/+d//CoJWgr21tzA/tau4k3Uj1i9HV
	7lMlDfAxVmDUZoypiIpGjQFs+PijlaZhtEj4WijIVfHaoheWMoCQuq6lc3aWrdseRJ+7dSI3MWtC1
	95FH5IlBvMvJdqbfm1Kdlfo2ZnnuRlyu0A+TJmr8dXqHKPjQOQ8iOCWpDG680VG2WPll+RVHh4WF+
	wm+BUHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCm3-005ElR-2o;
	Thu, 21 Sep 2023 06:02:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCm1-005EkD-0o;
	Thu, 21 Sep 2023 06:02:50 +0000
X-UUID: 79e4f6a0584411ee9b7791016c24628a-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EWhNJUZu5Z/Tip7T2l6e0SxlNLO3our8/wpCQafOB/o=;
	b=czp2U5KbJR90VgSzXGViGBJicUN151f1UClpbZSiA633cbEnaYK+/eqTfkdy7MbIUiH504yXIH/hM47zATMTNVPw5SvExsT5OUjphUcfN2rUP2NQ8DcFlwH+Tn+lAt+kREjVyudAUg/a9/t1jeMyD0iMMqj6zflOd+j+DxKWzjU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:3b875a63-8fbb-47e3-b1cb-74a5471cb642,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:110ef4ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 79e4f6a0584411ee9b7791016c24628a-20230920
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 700700683; Wed, 20 Sep 2023 23:02:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Sep 2023 14:02:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Sep 2023 14:02:38 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [RESEND PATCH v4 0/4] Add basic node support for MediaTek MT8188 SoC
Date: Thu, 21 Sep 2023 14:02:31 +0800
Message-ID: <20230921060235.32478-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.917900-8.000000
X-TMASE-MatchedRID: 4M8Lw78TDBC57gDVLy87eqDKPaVrGhelnF8rflXuiRWLYYF0ANN+FM79
	PlJmAmXDw6u+ET+UDSLCsyZB1bKGqA9FV6kNYiPHcFEiuPxHjsVMkOX0UoduuZjk0EbtghtXRRZ
	I1R6hQzaMENdLhjEPNHATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW3RMO1vCX2BONXw
	kPEO+4GwmUKXRz5/kyHY8rUJbT9fBeEdd0tvLkfTSPadpOKohE/hInS/lBNZcc8kewVHD7dwXxZ
	AfqSp37wZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.917900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 10F5DF882A4120FA076CD7F133625259A899C92C29EB1633CA6B00F40409C17E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_230249_292764_000F4170 
X-CRM114-Status: GOOD (  12.52  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

MT8188 is a SoC based on 64bit ARMv8 architecture.
It contains 6 CA55 and 2 CA78 cores.
MT8188 share many HW IP with MT65xx series.

This patchset was tested on MT8188 evaluation board to shell.

Based on tag: next-20230920, linux-next/master

Changes in v4:
- Explain the reason of modifying pwrap binding file, and correct the
  subject
- Fix reviewer's comments

Changes in v3:
- Remove the duplicated part of mt8188 in the pwrap yaml file
- Fix reviewer's comments about coding style

Changes in v2:
- Add MT8188 PMIC Wrapper compatible to binding document
- Fix reviewer's comments

jason-ch chen (4):
  dt-bindings: arm: Add compatible for MediaTek MT8188
  dt-bindings: arm: mediatek: Add mt8188 pericfg compatible
  dt-bindings: soc: mediatek: pwrap: Modify compatible for MT8188
  arm64: dts: Add MediaTek MT8188 dts and evaluation board and Makefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   6 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts   | 400 ++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 951 ++++++++++++++++++
 6 files changed, 1362 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi

-- 
2.18.0


