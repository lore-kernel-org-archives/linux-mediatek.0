Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E78C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQYA3m+ah+QJcg3qodgZfwq+zqG1L7F3yWg0Nt6l8hU=; b=wpGLf4ZJo0X8MP
	Y0PyC4uAe6pXVsVZ6E2zOKOvdmPC8bp39X1RpSj1VJi9+PMvF+GEwIAplmMXADpDsqhtZapfRiqh5
	QmAt2U8X1V3HOg3BqGu8dPg7m07Sr8zmECZ0rZtviFyvVLoB8ckSyOGRPqzyItanTQunbx5Y7c6vc
	0AQqEO4ABwUxVvbEAwnSpRFB7XEw5zPLa7yjliR2Qx35mm6Xcr5SxdVQzCGB66wJtdGH/TZWAz6bF
	FM0beaKQU7UbAXu/3LGcrRd/BA4BVbCDLZxleY0T09WjSePz1P5Tb6vJJokozv/pKyu5guAXDcATJ
	TNJNY4F3KDRobKVecOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqYe3-007FD4-C2; Mon, 16 May 2022 11:12:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqYde-007F3U-EY; Mon, 16 May 2022 11:11:47 +0000
X-UUID: 8294845af923465ab273a45e54e657d8-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fdf7255e-65bd-467b-866f-64087e2a1b40, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:8f872f94-563e-4fc2-8a0d-fda4821947ab,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 8294845af923465ab273a45e54e657d8-20220516
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 328820483; Mon, 16 May 2022 04:11:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 04:11:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 16 May 2022 19:11:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 May 2022 19:11:31 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v7 0/3] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Date: Mon, 16 May 2022 19:11:27 +0800
Message-ID: <20220516111130.13325-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_041146_552391_0ABFFB27 
X-CRM114-Status: GOOD (  11.24  )
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

Cpufreq is a DVFS driver used for power saving to scale the clock frequency
and supply the voltage for CPUs. This series do some cleanup for MediaTek
cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
devfreq[3] which are supported in MT8183 and MT8186.

Changes for v7:
1. Drop all drviers patches because they are all accepted.
2. Correct clock/clock-name for cci in dts.

Changes for v6:
1. Reorder patches in this series.
2. Add a new patch to do unregister platform device.
3. Modify drivers from maintainer's advice.

Reference series:
[1]: V1 of this series is present by Jia-Wei Chang.
     https://lore.kernel.org/all/20220307122151.11666-1-jia-wei.chang@mediatek.com/

[2]: The MediaTek CCI devfreq driver is introduced in another series.
     https://lore.kernel.org/all/20220425125546.4129-1-johnson.wang@mediatek.com/

[3]: The MediaTek SVS driver is introduced in another series.
     https://lore.kernel.org/all/20220420102044.10832-1-roger.lu@mediatek.com/

Rex-BC Chen (3):
  arm64: dts: mediatek: Add opp table and clock property for MT8183
    cpufreq
  arm64: dts: mediatek: Add MediaTek CCI node for MT8183
  arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  36 +++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 286 ++++++++++++++++++
 3 files changed, 326 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
