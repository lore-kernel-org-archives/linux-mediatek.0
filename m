Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8GpvIEiwWhU8RKlvdim92pWyaS3wh8/dC+4hYXwQf3Y=; b=x7o/cmwuNm12TrICuP/Bytskxu
	6w6OT7pDrlZzshyLilZ3TA9Iu3hqGSlyI6J5ZAX65fgM9RFhRjkjWJsJwK3nSVQnbidlP/3KMpGs+
	Baalama2/P3NapYckpMeX3BPkaw2XbVoI/wDKRChaLdLqV6OljONQb5rgSBMETJlGiObCPZOk6Sjj
	MOuoXooEYatPktoRFQ8YBGx3BbOmKICvRIOqYViBbTXo821xXpOkjc7go61EW6icpL6McnOuH6kWS
	k1dzPwHetNaiGR+s+KGkpM/Rb1iD17QGSpWZLkouSXiu3dBRueNC2BmY5BwkUjt292k5ScufN7vBx
	32pymD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPJg-0032fR-39;
	Mon, 30 Oct 2023 10:16:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPJR-0032YH-35;
	Mon, 30 Oct 2023 10:16:04 +0000
X-UUID: 2dfa2eb4770b11ee9b7791016c24628a-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8GpvIEiwWhU8RKlvdim92pWyaS3wh8/dC+4hYXwQf3Y=;
	b=udU1KS88YQyMBdmHjfm5W35NYVfnHSTlxAdXJKoqjZYd1iLSJfK7IHub3uDHvZuwWKRRe0GlUGV1jh6HSqp5bZAEy4r6/iJ7s7GYsjyMQbyynREfbKgn6xi8fAkKzdAqLix87x2iuhtHU0QIv11WNDcgvNbvGw/6NQeQe9CcIxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:2d7c1727-12fc-43bb-928f-3aaa764c319c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:983a0e72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2dfa2eb4770b11ee9b7791016c24628a-20231030
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1443914967; Mon, 30 Oct 2023 03:00:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 18:00:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 18:00:23 +0800
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
Subject: [PATCH v8 00/16] introduce more MDP3 components in MT8195
Date: Mon, 30 Oct 2023 18:00:06 +0800
Message-ID: <20231030100022.9262-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.909000-8.000000
X-TMASE-MatchedRID: EhRRFMJzlGHNwJnbTIxiVZ1U1lojafr/KFFZAe4nyZ5ZLD9SNJ9sEj5R
	eTebdoC/Wbe4BkYia1jA5ntiOI3uVsvTk9bUe4riYwaJXrf2IXSUi9wB9gmcStzOQo7mTgA+BgU
	z7G4QtepyZ31c4wqcRNA3oGNsECK+XTMLnxLtxim1PiMh4ZF39QGZ/+APXW9kXCmcAC8DBrMxaH
	TqWa9z/Ev0kiPhd5nbsdZTJ6++iZVrP7RcOmU0Fp4CIKY/Hg3Am4n49vyf9XENX1NatttCayq2r
	l3dzGQ17x8qjHDOOyPTKUhTZZIwZ1NtZM/cICz9HA4OxVIZNIi0P0OUmtxVRg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.909000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B21737E40C354B8B69A2DEAE31A4F9153334F63ED173CEFF1F4B9531B8BD21662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_031602_004042_24196CA7 
X-CRM114-Status: GOOD (  13.06  )
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

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  88 --------------
 .../display/mediatek/mediatek,merge.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,padding.yaml    |   4 +-
 .../display/mediatek/mediatek,split.yaml      |  27 +++++
 .../bindings/media/mediatek,mdp3-fg.yaml      |  61 ++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     |  61 ++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 108 ++++++++++++++----
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   6 +-
 .../bindings/media/mediatek,mdp3-stitch.yaml  |  61 ++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     |  62 ++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |  61 ++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  29 +++--
 15 files changed, 450 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

-- 
2.18.0


