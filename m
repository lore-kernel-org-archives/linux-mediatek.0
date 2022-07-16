Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D93C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtH5UW9X13Km7NClUl0eg7OuS7KtauMg6JKfsbNYwvQ=; b=LCDiHvj71Y3MLZGcGP2TLm/qve
	qfAXhLEo6BxGZOXWeeHx0sX2kY332nvWYRAjWdVx8koF93+fq5KAk7dh2rQ7iY1xpVWkGqKTri19d
	l+/mwcOKqfv8yVjVhqF5gDEszmIfaZ3C9Ja1mj/M8bEXnO7FWqZjQjUXxH9Obz1ZlhYkYsT9tQ0dA
	bo0wgfs6wnPVt150HvvrpDccHpOjSvqQfgOCwnjJQakU0eKBB4nHh8eswBposr/upVpC/Ku3WFeJH
	CGzG+JLP6x6y1jZaER+gUYsVvevm+rKKa5KfF+uzqGXxj5gEwVwnwBByegl0TYuAlb3476Gjb7WHY
	ziY8P+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcTO-00EW8A-Qt; Sat, 16 Jul 2022 07:44:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcTC-00EW3k-Nv; Sat, 16 Jul 2022 07:44:13 +0000
X-UUID: a9c5de52c5fc4106bcfb325c59a897e5-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f97dfbe2-8f42-43f6-8e39-1c78a0f3b565,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:94997364-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a9c5de52c5fc4106bcfb325c59a897e5-20220716
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1127548702; Sat, 16 Jul 2022 00:44:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 16 Jul 2022 15:44:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Jul 2022 15:44:01 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
	<TingHan.Shen@mediatek.com>, <Liju-clr.Chen@mediatek.com>,
	<Jian.Yang@mediatek.com>
Subject: [PATCH 0/2] dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
Date: Sat, 16 Jul 2022 15:43:47 +0800
Message-ID: <20220716074349.28655-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_004410_802037_15B019AA 
X-CRM114-Status: UNSURE (   6.64  )
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

These series patches add dt-bindings compatible string and new clock name
to support MT8188 and MT8195.

Jianjun Wang (2):
  dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
  dt-bindings: PCI: mediatek-gen3: Add new clock name

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 51 +++++++++++++++----
 1 file changed, 40 insertions(+), 11 deletions(-)

-- 
2.18.0


