Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA1EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZK6v7E8kHCPjtinARHKKSNSSSYIxdy5ZnnahfjvQeo=; b=lN8AiG2/jXimkjEew6skVcfqvY
	+w2U0PEnatuq0Jj1Ig84GefYukCwaMHPSdxKMUSVkw0CKenTLPX3FFu6der2vBZREHzphu/JW02aV
	Lrs/J3RDgBmB3ILdL5wLSSPJkUrP9+XwwNYO9xowL+xxOV2rusAxr5+X5lkeriMsNgW6xKsxTZy1y
	x/skyRqn9v3wguN/u1uBeKWUjRE0uTFa2XYFVsjRUpCv2omaBB/rSA1BwYuXvTBHQMt5GNNMGDlht
	1Znqst/8s3nhr1bQLzHb4JU1KOtB3BeZLaDBnmOI6tElAyWD1z/wHX1hU+y4zt6eU0KhgZKM4Z86B
	OTnWr22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmdL-000IxB-1D;
	Thu, 29 Jun 2023 08:04:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmdH-000IuO-1V;
	Thu, 29 Jun 2023 08:04:04 +0000
X-UUID: 7d4223dc165311ee912e1518a6540028-20230629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KZK6v7E8kHCPjtinARHKKSNSSSYIxdy5ZnnahfjvQeo=;
	b=t12ckbwpK+DrNF3nDPfBJvF/qrk+il5UL+EdGJKnDz8evxOzREqhCaDqtthgqVDbC/hESHK7cux/F5MGpzfQLMOTP89WSiMuzmBmwEWhkDN4vE0O4xHN4wME/RNt+m2XzUYxDO6zIej38lxo+TJeij0azmS1QwLj96I76dAInCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:7b57343f-f727-4169-85a7-0ad37cb8266d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:66436eda-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7d4223dc165311ee912e1518a6540028-20230629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 865634339; Thu, 29 Jun 2023 01:03:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Jun 2023 15:43:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Jun 2023 15:43:50 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mt8188: add memory-region support
Date: Thu, 29 Jun 2023 15:43:46 +0800
Message-ID: <20230629074348.21670-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_010403_507241_893C7F98 
X-CRM114-Status: UNSURE (   7.30  )
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

This series introduces support for memory-region, allowing afe memif to
utilize the region specified in dts.

Trevor Wu (2):
  ASoC: mediatek: mt8188: add memory-region support
  ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region

 .../devicetree/bindings/sound/mediatek,mt8188-afe.yaml    | 7 +++++++
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c                | 8 ++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.18.0


