Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mchwasCUe6KwJ3yFK2VVKi0RyQHyzQW+dqaDfsMLVko=; b=zPWsdLcx6JKqkURl+VTAmetEMh
	Cny34tRgp7EzJG9en4nvVhOgpZzYmFdZzUULugyQYVg/PmvQw6atbZiJt4/Uq8g26IbZj3vlrgNt5
	lXXdIPit5HDZED/fK3IipLsoMpegQWb4VZ2g8egCXNKi7INaKX9WWRA6Rz+oomnolxMgblTGnbFbJ
	EamATI6hZoekLufjgPL1pwvXLCMxD9MICF7b7/YZYBgP7k8IimV8s8LxUN2OS3gp6hYrk92vI1YE0
	spi46x7X3SAhZcA3cNBHnaTxEq/ilOh8hN9l00txKpHc+ZgTjyaKMdSrQJjimGH4p0BBLoBq4dI+u
	CDbkMaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o38Js-00G0Bq-5c; Mon, 20 Jun 2022 03:43:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o38Jg-00G07k-I6; Mon, 20 Jun 2022 03:43:10 +0000
X-UUID: 451ab3cc0baa45c39d61dee786631c36-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:f1a80d6d-00ad-476e-98cf-4725ce0cd1cb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:5596f5e9-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 451ab3cc0baa45c39d61dee786631c36-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1307235972; Sun, 19 Jun 2022 20:43:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 20:33:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 11:32:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 20 Jun 2022 11:32:59 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
	<roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>, Jia-Wei Chang
	<jia-wei.chang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 0/4] soc: mediatek: svs: add support for mt8186 and
Date: Mon, 20 Jun 2022 11:31:52 +0800
Message-ID: <20220620033156.21489-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_204308_642038_ADA30A1C 
X-CRM114-Status: UNSURE (   8.65  )
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

This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
hardware which used as optimization of opp voltage table for
corresponding dvfs drivers.

This series is based on [1].
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

Change since v3:
- Remove irqflags of MT8186 and MT8195.

Change since v2:
- Reuse platform probe of MT8192 for MT8195.
- Remove unnecessary svs bank parameters of MT8195.
- Remove sw id check for MT8195 efuse parsing.

Change since v1:
- Add myself as a co-maintainer of mtk-svs.yaml.
- Fix MT8186 error handling in platform probe.
- Add dt-bindings and support for MT8195 platform.

Jia-Wei Chang (4):
  dt-bindings: soc: mediatek: add mt8186 svs dt-bindings
  soc: mediatek: svs: add support for mt8186
  dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
  soc: mediatek: svs: add support for mt8195

 .../bindings/soc/mediatek/mtk-svs.yaml        |   3 +
 drivers/soc/mediatek/mtk-svs.c                | 500 +++++++++++++++++-
 2 files changed, 496 insertions(+), 7 deletions(-)

-- 
2.18.0


