Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A3EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqiLG4bTjy4LKDdKavagAAOMkmtgSgEQVjWMF2eRyWg=; b=npGbCRNWPr0wEdRkKEptYlwu36
	3m/up22/Tu9K8CspT8V5vavEMaLWSU5lybGzwaBkDUzOV6Zy5KJBN6i4IO6KrjFkYYAU7z7KHl6Bq
	3qCVE3tBvp83r8t7k4WhYpvw84WyHhYDPokSN7+F+QzwAcPmsoouRg11m6gZDxNNGE47St18YowH2
	LL8dNnJw+dD5Q4MUJotz/fIxe82pgd00YycR844P9m0J8Yi7LIWWfKYZF9tZlSGM/k5g15PvryyZg
	3IFxyrCcmzmBAsfKsJIYXu5/UomCtvI19brWdg6hbhwSEkQKfSCgl3WP0thdjv9l1O7tRAH45hpT/
	AS7/P0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5mvI-009Bkr-Ns; Thu, 15 Dec 2022 12:01:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5mv2-009Bcm-Cd; Thu, 15 Dec 2022 12:00:58 +0000
X-UUID: 46fedf2702af4cdab5737704f445ed83-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oqiLG4bTjy4LKDdKavagAAOMkmtgSgEQVjWMF2eRyWg=;
	b=XrIn9qHqrlstUaM3CYzksVj5FYstvMRPrSL6ttNmH70nn/cZ7HSwVxLfenYKptPaW8QpNx/tIvIyjjcV+eI7beybAfUm4Ovs9z0WN9qExsINwA25Nb45Ai4x8ZRQyLOXSWdvNAfwuo9v37ww1x5douJYh0QVJpP9LL0X28GHKek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d156866e-bc69-42f5-8d03-3eded4ae04b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:e8c8b0b4-d2e2-434d-b6d3-aeae88dfcc78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 46fedf2702af4cdab5737704f445ed83-20221215
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 862779439; Thu, 15 Dec 2022 05:00:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 20:00:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 20:00:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/4] Add ADSP power domains controller support for MT8192
Date: Thu, 15 Dec 2022 20:00:12 +0800
Message-ID: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_040056_520203_8128BC87 
X-CRM114-Status: UNSURE (   8.03  )
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

This series is based on matthias github, v6.1-next.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20221201073328.1559-1-allen-kh.cheng@mediatek.com/

Allen-KH Cheng (4):
  dt-bindings: power: Add MT8192 ADSP power domain
  soc: mediatek: pm-domains: Add ADSP power domain data for MT8192
  dt-bindings: arm: mediatek: Add missing power-domains property
  arm64: dts: mediatek: Add the missing ADSP power domains controller
    for MT8192

 .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi        |  9 +++++++++
 drivers/soc/mediatek/mt8192-pm-domains.h        | 16 ++++++++++++++++
 include/dt-bindings/power/mt8192-power.h        |  1 +
 4 files changed, 43 insertions(+)

-- 
2.18.0


