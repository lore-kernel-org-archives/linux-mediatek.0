Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mjTyiWJcuEnhp0kqkRMd5McAEJRlLKLaF1q2/Gv23uc=; b=RTK0cro1E9ysRo
	ah17AcfPbWC0Bt8wNbmy+mNm0jeEFCIOz07xsnmees74mBNXJzydqVbfXkbMX/56PHUFTKCdQoGUQ
	UDidImyRPhG3PPFPfu5oLtPLzYUa925IYIe+mmqpSHH62oV9Pa4by1O7X0Ze2Umq4WGy2PmLmDIZ/
	YMSOdOhrBoE6/2F+vgn9Nmq9MwWPwj4sg3Zyux4KE/2E98uZH34Q2b4eMLN87XCikkPxnx7+yv1Fw
	abaJcG8B23rWCagHIzQ+IXgVFZ0wEpfu4nWIrugj0mSp8mIukemfrS1THxmJiEj4ZIoux1dsWlhYg
	HwXErZTeykSgiVVK/8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Vg-002u3A-3i; Mon, 23 May 2022 09:37:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3hd-002Y2G-Cf; Mon, 23 May 2022 08:46:14 +0000
X-UUID: 665225ad3b334014a08455e3ac0bc879-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f3910865-bd98-4f1b-bc2f-3a24cbcb093a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:73c135e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 665225ad3b334014a08455e3ac0bc879-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 778286692; Mon, 23 May 2022 01:46:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 01:41:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 16:41:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 16:41:40 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>, Jia-Wei Chang
 <jia-wei.chang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/4] soc: mediatek: svs: add support for mt8186 and
Date: Mon, 23 May 2022 16:40:30 +0800
Message-ID: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_014613_511069_C1CAEB47 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
hardware which used as optimization of opp voltage table for
corresponding dvfs drivers.

This series is based on Roger's series [1].
[1]: Message ID: 20220516004311.18358-1-roger.lu@mediatek.com

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
 drivers/soc/mediatek/mtk-svs.c                | 502 +++++++++++++++++-
 2 files changed, 498 insertions(+), 7 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
