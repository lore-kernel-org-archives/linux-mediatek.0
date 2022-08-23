Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED0C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PQTErR1P4IYW5YIbzTPUG9tqLfhlzi+rJNNhHtzWz4c=; b=3fwAEDCdwsdFT7RILQLAy0EZui
	2Zc13UFPao89UMgILKg00HJ6M/uAyNaScPhwzzuyrkXvgchn2gZV4Q9GjgibcYhRrQuZJYlmihI5L
	W1MsfXHTnN9GZWWZEuOff++lX7GrvZhMW7z5Oi7b+YF9r92N0hNJpRcRMlTCZ7DtbXf95sY2hK7+9
	xiVKYiPVYfohHi1R9l+RJk0eOC3Bq/ZBzKLprMDzDMJOl9RK2qMeC2ByuWamAo9dOoywMuvD5ReZz
	S4VbU/9aMnwUQutYbtA2eT8k8ohUCUDVcOpcophIPmvuqijCYl92cUn8rIhYl7dGIL0Bd3amA4oJ9
	A2elhPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOAY-003LZZ-L2; Tue, 23 Aug 2022 07:17:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOAV-003LXf-Pt; Tue, 23 Aug 2022 07:17:49 +0000
X-UUID: 30fbe84fbff84ef186a09e606c3add09-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PQTErR1P4IYW5YIbzTPUG9tqLfhlzi+rJNNhHtzWz4c=;
	b=haYyzfhraqMlQ47q3Dm6TvoZ1HCz2sJI1GiGoJRjr0qPOzNvPkMcbqsJCzb40gwtquOjKwIkIPsnUKe/5Hrk0byKezLHS9a76AvJUjnrxhA/ID/IB7pEPbjd37qeTEbj0ToYeADlEX3dnE3iUmJcmOeJSP3DpduP/vwJbEZCnEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:409a036c-7a1b-4b40-aa95-18b43b0218af,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:16040668-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 30fbe84fbff84ef186a09e606c3add09-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 18957252; Tue, 23 Aug 2022 00:17:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 15:17:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 23 Aug 2022 15:17:16 +0800
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
Subject: [PATCH v5 0/4] soc: mediatek: svs: add support for mt8186 and
Date: Tue, 23 Aug 2022 15:17:04 +0800
Message-ID: <20220823071708.30927-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_001747_882239_663CAFA5 
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS)
hardware which used as optimization of opp voltage table for
corresponding dvfs drivers.

This series is based on [1].
[1]: Message ID: 20220817080757.352021-1-bchihi@baylibre.com

Change since v4:
- Modify svs_mt8192_platform_probe to recognize correct lvts node names.

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
 drivers/soc/mediatek/mtk-svs.c                | 502 +++++++++++++++++-
 2 files changed, 497 insertions(+), 8 deletions(-)

-- 
2.18.0


