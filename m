Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251FCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YhfptMFxP6fELvhH9itTPqbufVeXtJ6/BkfiXD4PQQ=; b=zJrLmhUOA62TBb
	aP8C0+/3EypNnOqJrYmBKnc8grSNK5l34Yy4COa7bWdNiJMxaZ4hsWFHa69hx/74TgnJ7xbTzn/76
	Y6Uz9lcoeDm6tue7rahu6jkKRsWv5sD3dTF9vNArFEvH1lHWMC3w5U0cSNcU+yRccaWPR0Bwp9xjw
	HLeYcqFLH0tfWimErdsNVZohcxxe5sUHiUKxVMrKo0nY/4Ml5goPO2qCaSynMRX3/VKtOZcXjG0YQ
	p4gANLw0yepYs2eA0sXpuQGZIir3raIdCdoL5oCvZv7aiRTlqBUvltWbzVebzxx+B75gHdsRWjPLL
	RfkMs8nj7hr6JLbbDBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQe-00FawE-Vj; Wed, 01 Jun 2022 11:22:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQb-00FauH-59; Wed, 01 Jun 2022 11:22:19 +0000
X-UUID: e073f8a76a61499395d40d1f364fe8e5-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c2c3e0fc-79b6-4b14-9680-6a54a1b9a08b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:ef648f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: e073f8a76a61499395d40d1f364fe8e5-20220601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1779496492; Wed, 01 Jun 2022 04:22:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:04 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 02/15] remoteproc: Kconfig: Add mt8195 SCP dual core configuration
Date: Wed, 1 Jun 2022 19:21:48 +0800
Message-ID: <20220601112201.15510-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_042217_246323_C12AC4E6 
X-CRM114-Status: GOOD (  11.23  )
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

MediaTek MT8195 SoC SCP is a dual-core subsystem. Add a remoteproc
configuration to enable support of the 2nd core.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 166019786653..bb2960b4ffbd 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -64,6 +64,16 @@ config MTK_SCP
 
 	  It's safe to say N here.
 
+config MTK_SCP_DUALCORE
+	tristate "MediaTek SCP dual-core support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SCP
+	help
+	  Say y here to support bring up the 2nd core of the dual-core version of
+	  MediaTek's SCP via the remote processor framework.
+
+	  It's safe to say N here.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
