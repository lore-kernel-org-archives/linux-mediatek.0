Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6B6C001B3
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQ3CY3DSxMPgvage0n7qBERGbm8CdKlLpzRcwX86590=; b=Atwlz0mRS/o0YD7bHm0herioZp
	rXpgOAQKxlI+sfsqootrO1SgX/LDkPzFKZamuEqc/eEpzf6OydEWJdVVxQJvhh/qgWcN+nqiomWkv
	KwjWJJf7UN/H0r8EBdW7JdcdtXafV1tYFe3adVjX7Pv6dkauJYO7if8ALuKTH1PmAqT72Io8JH9Gn
	OVgaDHn/YkRKY24U0Z7uEZcSjb3JwErj+7OCyXRlwaJHz5WabAJfkHcee57Ul+deXsuKE2gk4sVDN
	NNHT0B4in2yqum4VHWF9rif8syH+7kjBb2lv+oVeAI11vjOeFlACYaxfG0tq9MxA3AZxjzUtku8s5
	87wL0LxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwSx-00ExtQ-2W;
	Wed, 05 Jul 2023 06:58:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwSu-00Exrh-2v;
	Wed, 05 Jul 2023 06:58:18 +0000
X-UUID: 4ea9e4ee1b0111ee83ed1395ce914268-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JQ3CY3DSxMPgvage0n7qBERGbm8CdKlLpzRcwX86590=;
	b=l/sVOOBVkmXwfj6sCtXjLdYnDSivRatpc1aUGVKhssf3muJA1g1KfQFaOweZ2pUJb9RgtzimSBQptk0H3/3PeTxZiH+DqcOHkXXp9xAMw665plCMohVjNN0XWXYzGiaSx4epT0boVe27D7JGkH2ErC5OYptrc7Ak2VbGz8sa2yQ=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:ba0e09a6-a6d9-41da-9f0d-7aa070ed6587,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:ba0e09a6-a6d9-41da-9f0d-7aa070ed6587,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:efa7b782-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:230705145813W67ZHPCR,BulkQuantity:0,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_USA,
	TF_CID_SPAM_FSD
X-UUID: 4ea9e4ee1b0111ee83ed1395ce914268-20230704
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1157831640; Tue, 04 Jul 2023 23:58:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Jul 2023 14:58:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Jul 2023 14:58:09 +0800
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
Subject: [PATCH 1/3] dt-bindings: arm: Add compatible for MediaTek MT8188
Date: Wed, 5 Jul 2023 14:57:42 +0800
Message-ID: <20230705065744.25848-2-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
References: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_235816_943939_F7E37540 
X-CRM114-Status: GOOD (  11.00  )
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

This commit adds dt-binding documentation for the MediaTek MT8188
reference board.

Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..4f4910d7a1e9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -163,6 +163,10 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - items:
+          - enum:
+              - mediatek,mt8188-evb
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8192-evb
-- 
2.18.0


