Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C4C46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BB/db8kwBAgYmnmKYFiiM6LqADno4HrExJ7cxr5YTxs=; b=YJotA7MHsGWCsWo/LUAYubOFrN
	R+tLt/m7rmOwqVCke2eGpVB7A+NTRFrZpfKrjDKyX5wofe4PzMc0oyLucsm59rOQI+K7yQH3rLBLa
	zteowGTCkXP8pAV5QsbQu53FEmqM5HJY/FtLmJLoxstx2YPdfPMC/2mAdRvcIOG9maImow5HO1b1l
	43fhjDLn5d711zzcc41sSeZMMFvf7B+MRZ9/301clcda1c//OmwEjguo7Qr4kze/maLgCtx5IUS5F
	67JcvL17AWPReYn3W+KalAd0PmOYwccdAIkcVd1ZSBTwS4Zel4/INCv5UHSuEGyXdF4/ERqvVkpkB
	DMwIAUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtVi-00GptZ-36;
	Wed, 20 Dec 2023 10:09:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtVe-00Gpoy-1F;
	Wed, 20 Dec 2023 10:09:04 +0000
X-UUID: c9e51bfe9f1f11ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BB/db8kwBAgYmnmKYFiiM6LqADno4HrExJ7cxr5YTxs=;
	b=lIBMkDL7bs2HWDaru4WTJBYrxXDHxu4xeOtt3LVm1sJpFeWJnH2KYxbHSHRo5deRMtnsmr1s2wrGMpLO6XZs5HIyroFKuok4PpM/+jA8Rp3vd1dMRplVV4ck6WCvdB9bn59u/Y0ks5pK8liTpsTPPGLhL6MV/mo6UQz6laHg5IM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:54ee3c83-dc7b-4d93-ac69-303ea51c52fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:a5537a7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c9e51bfe9f1f11ee958cff29c719f35b-20231220
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 15996744; Wed, 20 Dec 2023 03:08:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:08:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:08:54 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.corp-partner.google.com>
Subject: [PATCH v10 00/16] introduce more MDP3 components in MT8195
Date: Wed, 20 Dec 2023 18:08:37 +0800
Message-ID: <20231220100853.20616-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_020902_471458_F2E118AD 
X-CRM114-Status: GOOD (  15.23  )
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

From: Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>

Changes since v9:
- Rebase on linux-next.
- Dependent dtsi files:
  Message ID = 20231030094840.2479-1-moudy.ho@mediatek.com
- Depends on:
  Message ID = 20231214055847.4936-1-shawn.sung@mediatek.com
- Include the missing compatible name 'mediatek,mt8188-vdo1-rdma' in
  patch [2/16].

Changes since v8:
- Rebase on linux-next.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
- Depends on:
  Message ID = 20231024130048.14749-9-shawn.sung@mediatek.com
- Following Rob's suggestion, the number of 'clocks' and 'mboxes' items are
  restricted using the 'minItems' in [2/16] and [3/16].
- Revise the dependent mt8188 disp padding compatible name in [16/16].

Changes since v7:
- Rebase on linux-next.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
- Depends on:
  Message ID = 20231024130048.14749-9-shawn.sung@mediatek.com
- Correct the bindings of the four components: FG, TCC, TDSHP and HDR.
  The names of the first three are expanded in the title, and
  the descriptions of all four have been enhanced.

Changes since v6:
- Rebase on v6.6-rc5.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=792079
- Depends on:
  Message ID = 20231006073831.10402-5-shawn.sung@mediatek.com
- Discard splitting RDMA's common properties and instead use 'allOf' to
  isolate different platform features.
- Revise the incorrect properties in FG, HDR, STITCH, TCC and TDAP bindings.
- Adding SoC-specific compatible string to components, like WROT and RSZ,
  that are inherited from MT8183.
- Fixed typos in TCC patch and enhancing its hardware description.

Changes since v5:
- Rebase on v6.6-rc2.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
- Depends on:
  Message ID = 20230911074233.31556-5-shawn.sung@mediatek.com
- Split out common propertis for RDMA.
- Split each component into independent patches.

Changes since v4:
- Rebase on v6.6-rc1
- Organize identical hardware components into their respective files.

Hi,

The purpose of this patch is to separate the MDP3-related bindings from
the original mailing list mentioned below:
https://lore.kernel.org/all/20230208092209.19472-1-moudy.ho@mediatek.com/
Those binding files describe additional components that
are present in the mt8195.

Moudy Ho (16):
  dt-bindings: media: mediatek: mdp3: correct RDMA and WROT node with
    generic names
  dt-bindings: media: mediatek: mdp3: merge the indentical RDMA under
    display
  dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
  dt-bindings: media: mediatek: mdp3: add compatible for MT8195 RSZ
  dt-bindings: media: mediatek: mdp3: add compatible for MT8195 WROT
  dt-bindings: media: mediatek: mdp3: add component FG for MT8195
  dt-bindings: media: mediatek: mdp3: add component HDR for MT8195
  dt-bindings: media: mediatek: mdp3: add component STITCH for MT8195
  dt-bindings: media: mediatek: mdp3: add component TCC for MT8195
  dt-bindings: media: mediatek: mdp3: add component TDSHP for MT8195
  dt-bindings: display: mediatek: aal: add compatible for MT8195
  dt-bindings: display: mediatek: color: add compatible for MT8195
  dt-bindings: display: mediatek: merge: add compatible for MT8195
  dt-bindings: display: mediatek: ovl: add compatible for MT8195
  dt-bindings: display: mediatek: split: add compatible for MT8195
  dt-bindings: display: mediatek: padding: add compatible for MT8195

 .../display/mediatek/mediatek,aal.yaml        |  1 +
 .../display/mediatek/mediatek,color.yaml      |  1 +
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 92 ------------------
 .../display/mediatek/mediatek,merge.yaml      |  1 +
 .../display/mediatek/mediatek,ovl.yaml        |  1 +
 .../display/mediatek/mediatek,padding.yaml    |  4 +-
 .../display/mediatek/mediatek,split.yaml      | 27 ++++++
 .../bindings/media/mediatek,mdp3-fg.yaml      | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 93 ++++++++++++++++---
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  6 +-
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 29 ++++--
 15 files changed, 442 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

-- 
2.18.0


