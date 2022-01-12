Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B23C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9snimfJAFsBZchxo/LUiTWUvoR1YTb/wCSFjBbKTGM=; b=Hs06TgNbSj3Eo6
	tTPHcEfEQ67epgwKZu80P7QCJuK0BdZ8z0jfeVvRhuErNwOWOsCCzyy+tgPln3U1tnJ36BhkIGJPA
	oNAwK1hBJL3x+MCokdMvFNU7tBTCrwRHIKunuG1Y6ZtfzvABN2p5JvHKgNhqafpeeIheVodvjIOiM
	bhFmRXLoqgROs7SWrDbP0ceg5iAQFsxU6y5MG64F/8TwX3XkVbgkL572M6H3OfeABd2LHvcT0BuMG
	PiqaauhHxpj21R1XZeC9cuDBE3gmWqvBTxyckf59P10kWSbKx2SHC2zEU/vjrulz+cVnnZWzD8XJj
	tUUjeuXfLAa+kM8yInig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7azf-0029Ji-Bv; Wed, 12 Jan 2022 10:36:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7azM-0029BX-0Q; Wed, 12 Jan 2022 10:36:21 +0000
X-UUID: 076c0e27c8e7403294e7de8099b3d48f-20220112
X-UUID: 076c0e27c8e7403294e7de8099b3d48f-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237858385; Wed, 12 Jan 2022 03:36:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 02:36:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 18:36:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 18:36:13 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH V2 0/3] Add compatible for Mediatek MT8186
Date: Wed, 12 Jan 2022 18:36:06 +0800
Message-ID: <20220112103609.17421-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_023620_078919_9663010F 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Subject: [PATCH V2 0/3] Add compatible for Mediatek MT8186

v2:
1. Fix Rob review comment.
2. split spi-mt65xx & spi-slave-mt27xx to 2 patches.

Leilk Liu (3):
  dt-bindings: spi: Convert spi-slave-mt27xx to json-schema
  dt-bindings: spi: Convert spi-mt65xx to json-schema
  dt-bindings: spi: Add compatible for Mediatek MT8186

 .../bindings/spi/mediatek,spi-mt65xx.yaml     | 100 ++++++++++++++++++
 .../spi/mediatek,spi-slave-mt27xx.yaml        |  73 +++++++++++++
 .../devicetree/bindings/spi/spi-mt65xx.txt    |  68 ------------
 .../bindings/spi/spi-slave-mt27xx.txt         |  33 ------
 4 files changed, 173 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt

--
2.25.1




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
