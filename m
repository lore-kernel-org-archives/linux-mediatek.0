Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C49C001B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTdqgndZioahB36TamwdXkWsk/lwWHQXh9oJU7H/fNE=; b=F3FOsYmkNVQM3m68yqodCGDqXL
	bQRAjRIm8/agQtZMaNk6EeISLNyv0vgntzbosJoYmjx5BmZ1QI+ZA7VBFVYMD4whhMmc11+3m+1Xh
	tfs4YVFT1144DsS7j7/YB2unRN3wpOJTmX7CH1sQw4d/z8I3Vk/97GCcZa5PMbRdfBGMg+0YRvNDf
	N3dWeZ8mlnYJwIedIEVzz7UA1Nn+y7HkLp9KMGq7tAw3zLxZrvjHPwEsX3nk1QmKamTSpKGyzJpbt
	EXUrzVJxCT4hc5SbzNMQKVcApdqppCfIMPR8eCRyLmGebCf/6n4UMLNYd1pyMGe3QSo0ufaywvP39
	FaJ0TMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxP5p-002zIF-0l;
	Mon, 30 Oct 2023 10:01:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxP5D-002yfz-1D;
	Mon, 30 Oct 2023 10:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sTdqgndZioahB36TamwdXkWsk/lwWHQXh9oJU7H/fNE=; b=igd70fAXCeIlAhcaE5QP8Okk6d
	hDQ6eTYZTD6hlVFQj3OnaSNtTPFpfQO0Top6R/U9mlx9QJD0PQCNgEtmc7DttnRGO6sEJr4gbDLwp
	gVUX8wANJrrQ7T12+ahsOZLuehBbwMsC4g+7q13Y/owKFjcsHZiowQxCV1FCVs3x+mLFMvmaVpSSA
	kJWd8yv/zbLs/iUIP1qItCU36foQdVKlp23O28D47KsarKelMkE/kdAeLIUxwM7fFa1Ui5S+Afz9V
	0UBkSQPvt8e21gJ50XCQ9DSQ9Tx0IVw13E2i6h1al/M8XsJzRV2gBTkHaqttFjcukkTD5fr6bOhWA
	95kR7JXw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxP59-003p0I-0Q;
	Mon, 30 Oct 2023 10:01:18 +0000
X-UUID: 3bbd0b70770b11ee9b7791016c24628a-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sTdqgndZioahB36TamwdXkWsk/lwWHQXh9oJU7H/fNE=;
	b=RNb6WbonhbtJkUf+vLEAs0VC1UQNszjBaXI1xNLP5Kaj+dvBQd0ZhhYaXuSp9NLeeV921+84xB1Wq+Xwh5MPJzZPEKqUPEZfvHoEUI9eWyAcYfiZuxCj9O/i+SWKQOBzDLvVLq2QxPKWLHOn1mO8EsMiRe7iJHVi7+I1pDsxVEQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:f3a45da1-ac52-475c-96ad-138693e8f7f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e43b0e72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3bbd0b70770b11ee9b7791016c24628a-20231030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 31353327; Mon, 30 Oct 2023 03:01:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 18:00:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 18:00:25 +0800
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
Subject: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add compatible for MT8195
Date: Mon, 30 Oct 2023 18:00:22 +0800
Message-ID: <20231030100022.9262-17-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231030100022.9262-1-moudy.ho@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.396600-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+smeoNhEXvE7APZZctd3P4Bw8djaG0FrZsCsxyhR8y7CcWF
	IdIOy0D44vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8ifEzJ5hPndGUWfnWTctzBf+OB
	ug60jVLXJBEI9NAtDYW2HFo0yIP2iw8b/NMMrngvXDpEFsZAfSZZpMVRjqqOQsSC3YENW09G2mp
	J7z7tekHmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.396600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 97323CFA7FE59B36D41D87ED604BB08D57D30C3A2D2979CFDBFAA5FDCD476C4E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_100115_653017_68B76B27 
X-CRM114-Status: UNSURE (   9.73  )
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

Add a compatible string for the PADDING block in MediaTek MT8195 that
is controlled by MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index db24801ebc48..19858d826808 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8188-padding
+    enum:
+      - mediatek,mt8188-padding
+      - mediatek,mt8195-mdp3-padding
 
   reg:
     maxItems: 1
-- 
2.18.0


