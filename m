Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED47C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 01:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xWGXY03/zjwZLkRVWbjaq8wp6/J0+PRq7y7cndrU+o4=; b=UyGr0pucow201d
	+q1+t4oViQh/M1oFXgK5kMHhwRgoiERrc6g5d6xGpmCPVH6kpyS/TB2ekXUCt58DJOWg7SJ49DmeY
	M3BtUaR7OvMsST8UEpWCLSDJ+tAC7RgnEhrDZ7JawzqcOhW3NFhMkVkUTrakVwqKg/WHMn9fsmGUE
	S+diNAdiuNZjTbq6+DIjdCuOZfVxPdz5lnpf5yG76bhwvDrIE4eq06Ogubr4PMFMz5BJWvDwyv8mC
	RLuNXu+2OzEn1IqeKFTtMbeamLq4KQDyfm3ljYLoUppoeByF9zg8Q7JB4M+MTWjBveL/SODFRqZIV
	L0d3NvGw6ZjvOrrNdfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCAbt-0062lb-5C; Tue, 25 Jan 2022 01:27:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCAYc-0061Wp-J8; Tue, 25 Jan 2022 01:23:41 +0000
X-UUID: 7605bf4695374d348afb005e09fd7dbb-20220124
X-UUID: 7605bf4695374d348afb005e09fd7dbb-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1469747114; Mon, 24 Jan 2022 18:23:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 17:23:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 09:23:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 09:23:31 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH V4 0/3] Add compatible for Mediatek MT8186 
Date: Tue, 25 Jan 2022 09:23:27 +0800
Message-ID: <20220125012330.13449-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_172338_713523_A9186C55 
X-CRM114-Status: UNSURE (   9.74  )
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

Subject: [PATCH V4 0/3] Add compatible for Mediatek MT8186

V4:
1. add "dt-bindings: spi: Convert spi-slave-mt27xx to json-schema" to
this series again.

v3:
1. Fix Rob review comment in v2.

v2:
1. Fix Rob review comment.
2. split spi-mt65xx & spi-slave-mt27xx to 2 patches.

Leilk Liu (3):
  dt-bindings: spi: Convert spi-slave-mt27xx to json-schema
  dt-bindings: spi: Convert spi-mt65xx to json-schema
  dt-bindings: spi: Add compatible for Mediatek MT8186

 .../bindings/spi/mediatek,spi-mt65xx.yaml     | 102 ++++++++++++++++++
 .../spi/mediatek,spi-slave-mt27xx.yaml        |  58 ++++++++++
 .../devicetree/bindings/spi/spi-mt65xx.txt    |  68 ------------
 .../bindings/spi/spi-slave-mt27xx.txt         |  33 ------
 4 files changed, 160 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt

--
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
