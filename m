Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8F9C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IWgtTywyS2CwR6Os274LzfF46NxmrtBxvgdrjBg4Jpg=; b=dWmLi0tqZ6+8JHuIHN/06/Exe9
	cMz85YXThpq1Rglr5aCVg910Ha+VaGzVDU1Wsadw++fhpf0hV/rYwuPPKibE6X+jyT3APRXdE/jx/
	EnbkiaPaU9JP4KHRNkgR1kpmZxVmlvdi8hHzXonEqZJzIIz13Ktq3xbrMloMt8PEInj9nVG0PxKAh
	Brz0BzfBITSdQuTg9Rn9lhlVTNF+3bxwtkWVBUSfL1+s4pRPJvOr0IpYhLuifdeY+KqSyj8GgCDCn
	AstNMUeC8iAZ2mkJWXJcwW2cwZgQVAB7rm7S0cUE5jpil83Ug9DG5IkIe86pqOzfRoxn8N4eed7yw
	PIn6/xgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQ5S-004PdC-0s; Tue, 23 Aug 2022 09:20:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPz2-004MBI-0P; Tue, 23 Aug 2022 09:14:11 +0000
X-UUID: 97eb4be0bab942cb82a5707aeaf9e731-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IWgtTywyS2CwR6Os274LzfF46NxmrtBxvgdrjBg4Jpg=;
	b=aLESzwmMEveAWzBKsSMuEn30r3SgGD7Wq+klOduHofvPlWfABb3cu5hpAvi4BUNzBR8juu5AekQJVJbP+t1GrHcl653yEQcriIo0oyFa98y946BYOHHngZVtvWBgCCxrzR7WZf4t7z++aEbS9iHx/L32VCVDMXXVpOOIV3p9llE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1f3b3b9d-5779-4e5f-8e5a-624a26669b03,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:612987c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 97eb4be0bab942cb82a5707aeaf9e731-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 583724721; Tue, 23 Aug 2022 02:13:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 23 Aug 2022 17:13:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 17:13:53 +0800
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
Subject: [PATCH 0/2] soc: mediatek: svs: add support for mt8188
Date: Tue, 23 Aug 2022 17:13:44 +0800
Message-ID: <20220823091346.519-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_021410_018396_1EF794A7 
X-CRM114-Status: UNSURE (   6.90  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

This series supports MT8188 Smart Voltage Scaling (SVS) hardware which
used as optimization of opp voltage table for gpu dvfs driver.

This series is base on the series [1]:
[1]: Message ID: 20220823071708.30927-1-jia-wei.chang@mediatek.com

Jia-Wei Chang (2):
  dt-bindings: soc: mediatek: add mt8188 svs dt-bindings
  soc: mediatek: svs: add support for mt8188

 .../bindings/soc/mediatek/mtk-svs.yaml        |   1 +
 drivers/soc/mediatek/mtk-svs.c                | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)

-- 
2.18.0


