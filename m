Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF25CA0ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sxDC13hCNox3S6xlws8mBAukgeaNZbyMb2eB2sZfjGc=; b=XE5lh8VYCE9BlilJCH5r32q2s8
	Vp5EO7RAQmCxVwYayqhI6koW9BYmTOtSbFRTrkV5XZ+U/gis7fS9676V8zPt7KqH5/0IHeLM4QC/G
	35vc6tjI8lglObtGIDOmZNnSs9vu6479+G93POl/5azEB/1lU97X8EztF5KzHi246eRNdRWZQ0guL
	9otC6KvuJ69DFNZCsgAyq9wCT6Dw9RmlMbSB1fczymG/Nuu226nHSVIwrnrBQ+rUiacSA+Rii62nh
	3rxCFbCfnypcaeBTBT1X5fVRvpBJWrzGCIH6iwAtf5C+tEULDE+mq5ulSzs9tFRDvuhYamkfxWZhM
	wqu69k+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyGg-002Sjt-0W;
	Tue, 12 Sep 2023 07:57:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyGc-002Shd-2M;
	Tue, 12 Sep 2023 07:57:04 +0000
X-UUID: f1a0a6bc514111ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sxDC13hCNox3S6xlws8mBAukgeaNZbyMb2eB2sZfjGc=;
	b=dFL6ydiIGttUFya+PXjfAl8xF9il871Ww9bBPrfsZKsf+VKAqtEbC0i1U6D6HMBve0RvHSYxU5Wn+qZDEYWqFlNmTNXkRiBEOGIx1LO4dvLc/7iosVKAL+6uLbSG3WzpT8R9yE9qOZSpsRgKk6XxEy+3VAnXY7vYSNO2xHyG+ro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:969227a5-b840-4fa9-b904-2a09ac7d5052,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:29a6edc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f1a0a6bc514111ee9b7791016c24628a-20230912
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1414669953; Tue, 12 Sep 2023 00:56:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:56:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:56:52 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v5 0/3] introduce more MDP3 components in mt8195
Date: Tue, 12 Sep 2023 15:56:48 +0800
Message-ID: <20230912075651.10693-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.185700-8.000000
X-TMASE-MatchedRID: lxKo1glhVxhA90k3OkvQzh+WEMjoO9WWI6PHNDZGGCKna6U74e0+qA42
	cI60OgkFzP/fGiNMYHUSEYY/Eb/3khnsS71Oo/HwA9lly13c/gF3Bf9JIqsoeMRi+FlXlWiFsk7
	1rgcu7T4spKJBx9J3JKwxH8BPFMeNkfRhdidsajMURSScn+QSXl1PyA7eE+Ph+gtHj7OwNO2BSJ
	y8ngwKGc9RwvxNQhb0/u1OPsVHrBSWSDISjkI9kZHHe0WsQTWZSQTg4dNf2V4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.185700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A97BFD844A2DBEFEF0FD06966CC60338C9A0F77A08E0794D06F696412DF613902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_005702_797287_631DE325 
X-CRM114-Status: GOOD (  11.25  )
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

Changes since v4:
- Rebase on v6.6-rc1
- Organize identical hardware components into their respective files.

Hi,

The purpose of this patch is to separate the MDP3-related bindings from
the original mailing list mentioned below:
https://lore.kernel.org/all/20230208092209.19472-1-moudy.ho@mediatek.com/
Those binding files describe additional components that
are present in the mt8195.

Moudy Ho (3):
  dt-binding: mediatek: correct MDP3 node with generic names
  dt-binding: mediatek: integrate MDP RDMA to one binding
  dt-binding: mediatek: add MediaTek mt8195 MDP3 components

 .../display/mediatek/mediatek,aal.yaml        |  2 +-
 .../display/mediatek/mediatek,color.yaml      |  2 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
 .../display/mediatek/mediatek,merge.yaml      |  1 +
 .../display/mediatek/mediatek,ovl.yaml        |  2 +-
 .../display/mediatek/mediatek,split.yaml      |  1 +
 .../bindings/media/mediatek,mdp3-fg.yaml      | 61 +++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 60 +++++++++++++
 .../bindings/media/mediatek,mdp3-pad.yaml     | 61 +++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 50 ++++++-----
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 +++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 +++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 23 +++--
 14 files changed, 412 insertions(+), 121 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

-- 
2.18.0


