Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7DCC282E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=njLuTkbdipKmSw0XWHLdaUkq+1a52QY2MIrUxhRqVRM=; b=VimU4Sojd7EKTDmMrTRT1OF2x2
	9G9CMPnHJkt5vez1eTKnBczrNmZ2jKCKaPuUMcyPJY9Q7GZzGRe7fmetB11cOJXjg3PpKY1WwVt9X
	GKdzcA7ZIDq+f78cDdN3IL5e2/GKuZXdT+R66PSzkPB5xVptALZ76I3TdM5M8A7Ki3ClqXw0CTdfh
	EcKntCkfko+Py2NTDeWzKW8BNczELPxvpgA3r+GbmnLZrnLpREOATCbLyxBGeshheWY2MNHzFtSME
	hkYlSLu8LdAbAkOo6Ls1GYE7zWmIc3TZLm98kHbFunBmTJS5wGJzeIsILIRDhJVz7Z0FW2bKxzEi5
	pqnNKKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRln-004x6p-Co; Fri, 12 Aug 2022 10:19:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMRle-004wvg-Em; Fri, 12 Aug 2022 10:19:54 +0000
X-UUID: ff34090908da4a8aadcac86e72172436-20220812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:ffd53673-9200-43fa-a1a2-ef25d09fd57a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:2a3fa3ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ff34090908da4a8aadcac86e72172436-20220812
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1480479686; Fri, 12 Aug 2022 03:19:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 12 Aug 2022 17:29:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 12 Aug 2022 17:29:02 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
	<macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/1] Mediatek MT6366 Regulator patch 
Date: Fri, 12 Aug 2022 17:29:00 +0800
Message-ID: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_031950_563444_6F8E2FC2 
X-CRM114-Status: UNSURE (   7.10  )
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

Add mt6366 binding documentation

Changes in patch v3:
1)change patch title
2)change "regulator.yaml#" to regulator.yaml#
3)remove regulator-name
4)fix 4 space for DTS example

Changes in patch v2:
1)fix patch title description.
2)fix patch maintainer description.
3)won't cc to srv_heupstream@mediatek.com
4)fix patch commit message description.
5)add properties node and compatible
6)put "unevaluatedProperties: false" after $ref
7)remove underscores in node names.
8)change Filename to "mediatek,mt6366-regulator.yaml"

Zhiyong Tao (1):
  regulator: dt-bindings: mediatek: add mt6366

 .../regulator/mediatek,mt6366-regulator.yaml  | 287 ++++++++++++++++++
 1 file changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml

--
2.18.0



