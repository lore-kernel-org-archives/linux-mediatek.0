Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFFC00142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dho3kofawX3gdG2rhey1ygZEL7JRhX4DhhjZ3wIH6A=; b=1Q2MzEbtIceyZtL+nomNwcoXNJ
	XyulTkaEBR/S/HTWtutdv92ACDuAugQF7ODSq96+ADiiZ6D2tZw0HHZGoK0kUmJ6A498WKs7lz5UT
	50Tt6tFSxBpdsS1jsBVloBjovosXZ21ohkbRshhmcYn6EPLUgTlFzcWyOZTwwxdAMhiNCGeRWdk3G
	R8v2v2mVGeNYy8pcARKGpkMM81xSJyYTQh7rpw4w8PfDD63TO6nbkLAcr8xjGg+XXW2DXmh/qNSPB
	gChToet1q/zhshGNnb3+PF8+7Y4a2BBBQ4sL0YMCKogqgRrzmfjcSyrisTEXRDNymkW9jsma4PV5g
	P6J8hfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkD8-004m76-1B;
	Tue, 31 Oct 2023 08:34:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCl-004lsI-2I;
	Tue, 31 Oct 2023 08:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2dho3kofawX3gdG2rhey1ygZEL7JRhX4DhhjZ3wIH6A=; b=OvJkjKUt9O3CaMR7uEx970kzhs
	ZaXsKHG3ZWQgysMgbz5zUnkjitB0yKZRCkpcDSO4uJFdB6I7oK2K21eCbBT3WYiKlKUsLD88gse9B
	MGDAjZdQ4pDAuhIcrOxooG+gyyt/f+HnzXLb84FA6BkRVUsQrt/fnExFMMTvQlpph/8Uq9VUUd5bK
	o6MgEa2Uz9CaC4TnJmYviSn8eY8mwKR7Qd8mdPsUFirOu/RlpmodCyfqRLK/9YFOiPTrHZvjPEeZx
	BA9Md8Nux7kwTQ4Ea0Bsd8S3znS7UihVlfBFAk6orFU7EzvFPHj/aR+Z7F166xuf0sQizsp9/M44E
	jX8jH1vA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCd-004h4X-37;
	Tue, 31 Oct 2023 08:34:30 +0000
X-UUID: 451005f277c811ee86758d4a7c00f3a0-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2dho3kofawX3gdG2rhey1ygZEL7JRhX4DhhjZ3wIH6A=;
	b=LndMvSKj7gP+Lr59fJ2DfcOcwMNuk9WhRstVSnJftkRZc/cgwMkp416F0imVZ7RyIABBCOyElNhoO6XLAOiLuTbERKZkBq/myPtnBEkBCKu259RpoKxV7SyIvga4HM/0tbvS+lhAnataVU5RudhD4Z1FgCE/pCsyGpCHAdff+V8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:95decab7-8eff-4776-a746-a18af22a67f3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:de90d694-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 451005f277c811ee86758d4a7c00f3a0-20231031
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 673641780; Tue, 31 Oct 2023 01:34:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 16:33:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 16:33:58 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v9 00/16] introduce more MDP3 components in MT8195
Date: Tue, 31 Oct 2023 16:33:41 +0800
Message-ID: <20231031083357.13775-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.189900-8.000000
X-TMASE-MatchedRID: 8nwnnPisK37NwJnbTIxiVZ1U1lojafr/KFFZAe4nyZ5ZLD9SNJ9sEjfy
	D4B1B1XwODsAqLXNLAhy3XpFb4YV0BNj8dEIVpt0syNb+yeIRAohHWssEmb8zmq//5Ao1w8uDYX
	q2a0NnVWRrMe2UQ2pNI8v5ywzoFfttgIE2xggPK+xo9yzdPhMvZJOcXMQc4jBx8cf8zkUc1oCYy
	wzM82Z8wChddk7F3kP8R18cQDv3dl0lqR8D0fH0e7KTDtx8CggKhNpTcvbdUKbKItl61J/yUGDD
	kbg1gJkOAawE8JvIaIgBwKKRHe+r6dmDvuXKsTktJGWVKDL1blgNLGTi1Pwg+DcyQ53mukoslWk
	bbo7nKs=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.189900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 60B4B42383B723072FABE98B6874E704B2139217F9A938259D421BF4D3D557162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_083424_661944_CF84DF0A 
X-CRM114-Status: GOOD (  13.94  )
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
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 ------------------
 .../display/mediatek/mediatek,merge.yaml      |  1 +
 .../display/mediatek/mediatek,ovl.yaml        |  1 +
 .../display/mediatek/mediatek,padding.yaml    |  4 +-
 .../display/mediatek/mediatek,split.yaml      | 27 ++++++
 .../bindings/media/mediatek,mdp3-fg.yaml      | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 92 +++++++++++++++----
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  6 +-
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 29 ++++--
 15 files changed, 440 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

-- 
2.18.0


