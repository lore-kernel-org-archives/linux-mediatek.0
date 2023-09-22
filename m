Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19E9E7D0D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkPdE+JpZv0itBrojOt0/OyskmwK7mG0qvuyuXxtTvc=; b=W3pvIDcrnUZOwEOHeFaePQmiPZ
	I4ZiXcFAe5wSmqHOYGaySPmYnGP8qM3MXZUu4oebzaQ1s5eLVHlK2UambtKRAG87wAUPRE60p+Kdr
	kzEGI7vdpdvZjbPgCzfDZKbCXXfARKDUKQxv7KYv5lcVhdzR5oJ1YyV9OzItx5iZXntktZ0zeARxs
	GfSpxic588wNjYCNygio3fUlO+7IZ7TgQWXuhRLUNB5FVsnMO5mBcYE/0J5tkinsZkwUb0Efd52Gs
	I2VmRv34BeP4rYt7YEeX8ds+19ZNZnnZdWxLD5TNlovi4erDN2DJOQYFmovuCrrC+4Mwj0bJsg3qJ
	U6GCFpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaV2-008B3s-2M;
	Fri, 22 Sep 2023 07:22:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaU9-008AVW-2E;
	Fri, 22 Sep 2023 07:21:59 +0000
X-UUID: b5a46822591811ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RkPdE+JpZv0itBrojOt0/OyskmwK7mG0qvuyuXxtTvc=;
	b=jNEjCDkXh8yH3cmQm+7QaiGg+WWR4LVk5IM/ZhB7qYoGWVSYj/aXVnReUNfJ/GaIgsx7e5OzCCrsE0vV5akdyZp/xB81XIlWoZRXmBjXnn9PGVVl0v6oXE5LTBoU6lQyOITz68xqjW58zkiGB+nsE2f6L7t1c7waa1u9LDKWhAE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:13ca61b8-2223-4a46-ab4b-e24c42189d7e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:4b5c3e14-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5a46822591811ee9b7791016c24628a-20230922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 804870611; Fri, 22 Sep 2023 00:21:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v6 11/16] dt-bindings: display: mediatek: aal: add compatible for MT8195
Date: Fri, 22 Sep 2023 15:21:11 +0800
Message-ID: <20230922072116.11009-12-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.483900-8.000000
X-TMASE-MatchedRID: jhJi18RLqAImeoNhEXvE7APZZctd3P4BKhNpTcvbdUKbKItl61J/yfJv
	ocwUrWp7FBpuM64i9KELbigRnpKlKZvjAepGmdoOYoA+nD7xVad5qhBJY5JJjmakIbtSjeZf+AH
	DiUteGjEPI7HokaJEMKpR55DoyBe8BrKBANChwr75p1ytgG5qdI5TTO5rqA7wSZrfNhP3sgUBh9
	AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.483900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 702825D3CBC96F7A3D6D82BBBC654B6051F82FBA5CAC3C640907218BFCCE434F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_002157_746783_5941D8D9 
X-CRM114-Status: UNSURE (   9.13  )
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

Add a compatible string for the AAL block in MediaTek MT8195 that
is controlled by MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 7fd42c8fdc32..b4c28e96dd55 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
+          - mediatek,mt8195-mdp3-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
-- 
2.18.0


