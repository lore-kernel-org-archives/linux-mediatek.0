Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EECC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P2zT/r2bVi/d2QVdd5JYEV02+mzWI1LsMedVToFKq4c=; b=c0SWl3Jay5RvYdHEvA56I3NfK2
	fDFL86WXuQMWxe6DK4d5b6IX9/rdvG9481/5rj7ARWIL+SGTTOSPD5Bq4tur1OHafHdBx7xumFBKY
	gTr04JMBvGiTmGHS9eUSRjn7AOD22V0vfLF/dFkVHI4wMtNrIcRIqp0SQEk5haxZgDl0lkeHrLws+
	EI5lNDYtWYBuAyQ1Y1GYOv5wj5MBB9DITov4sJ4yf1PL3DHTEUw8u7GF03GkFg2cDFEpQphSa9KeV
	vGK90EnE706gvIRC5bdrBOfM1sWxUa1aieszcN+OY27Ujm9WSJx0NUzlJQ2txxk06zuP+bb7Eyows
	ID8SXP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi5d-00668t-LL; Tue, 19 Jul 2022 07:56:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi5a-00666k-GX; Tue, 19 Jul 2022 07:56:19 +0000
X-UUID: 064794d2559d4f018e1aaaa497f4f680-20220719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:34caa1c8-136a-4658-be84-877737d6341d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:96935d33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 064794d2559d4f018e1aaaa497f4f680-20220719
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2031755874; Tue, 19 Jul 2022 00:56:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 19 Jul 2022 15:25:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 19 Jul 2022 15:25:37 +0800
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
Subject: [RESEND v4 0/4] soc: mediatek: svs: add support for mt8186 and
Date: Tue, 19 Jul 2022 15:25:20 +0800
Message-ID: <20220719072524.11371-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_005618_580356_F8F90FAA 
X-CRM114-Status: UNSURE (   8.63  )
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
hardware which used as optimization of opp voltage table for
corresponding dvfs drivers.

Change since v3:
- Remove irqflags of MT8186 and MT8195.
- Replace tab with space in assignment statement.

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


