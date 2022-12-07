Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACACC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/vg4719+76MXc675xcgguoaMGBhivbvFc7/9h2WKmk8=; b=gkdAJ+WoVt+pmGzcc4eWaB5+9q
	/xk30db54aEj9sIAmFlNpc8yqUYinCT73C+iUvcq5rj6IC4E71VXTH07TZnbxUn+OiKRt8ytRP1v2
	I3xa5K5n3SMzc+tMgerp/3eBetUWIf/3ODDGvIfvw1X/bFtTzFP9Ro2SMr2MqznOXSYV9FXLUtmgU
	SBb4QD2jdDbo9iItiz5+tJKZyfc6pgabQR5yWH+hUxluxdQ8peY+fzTEjMC6ALxtLShrbB2o3+5xF
	BqdHp+kenDXzFQrdyyyBm4ihdSHO6SqJJ4MLhWCc5GfGH4Jve38Eb2YJxLtXYZAtWaLweEFFgHM9d
	FQgAdiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2nVD-00CNco-4l; Wed, 07 Dec 2022 06:01:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2nV9-00CNYO-FJ; Wed, 07 Dec 2022 06:01:52 +0000
X-UUID: 3bf76a92395d46ce8b2f30f316468605-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/vg4719+76MXc675xcgguoaMGBhivbvFc7/9h2WKmk8=;
	b=pog11NIsQk69P7XnH02tBmUnv6Nfdc7oIjGmuNpxej6Zru+HKtRe7zDZliVGQKOZrD+RVxgrGXGUxjbHhiGASpjmxaNprWDOOqvnw8iukVX9fqFQLap0WRRCx79R7uWzvqWzpbMxbdnKlQ0ctYAQx5nbdCG6wYZm02HoqXl8aZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b7f77c9b-183a-4d2a-9a2e-07e5ce374bc2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:844fe0d1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3bf76a92395d46ce8b2f30f316468605-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 9028897; Tue, 06 Dec 2022 23:01:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:51:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:51:08 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6 0/3] Add vcodec lat and core nodes for mt8192
Date: Wed, 7 Dec 2022 13:51:04 +0800
Message-ID: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_220151_549498_D4EA7E69 
X-CRM114-Status: UNSURE (   9.14  )
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

This series is based on linux-next.

Change from v5:
 - Add required interrupts for mediatek,mtk-vcodec-core
 - Rewrite commit message for 'Remove "dma-ranges" property for decoder' PATCH

Change from v4:
 - Add patch for removing dma-ranges
 - Update child names to video-codec
 - Update patch title and message

Change from v3:
 - Drop `vcodec_lat:` and `vcodec_core:`

Change from v2:
 - Add a dt-bindings patch for changing "vcodec" to "video-codec"
 - Rename child names for vcodec lat and core nodes

Change from v1:
 - Replace node names with video-codec
  [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]

Allen-KH Cheng (3):
  media: dt-bindings: media: mediatek: Rename child node names for
    decoder
  media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
    decoder
  arm64: dts: mt8192: Add video-codec nodes

 .../media/mediatek,vcodec-subdev-decoder.yaml | 68 ++-----------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 59 ++++++++++++++++
 2 files changed, 64 insertions(+), 63 deletions(-)

-- 
2.18.0


