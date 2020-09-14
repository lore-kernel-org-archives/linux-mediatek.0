Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181F9C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35B9208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xH2BGBpz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tmY0psrn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A35B9208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z6ojr4mU+IrcEybJzuu9SkoNKWSoptQxUo+NRtE0fEg=; b=xH2BGBpzznFxGX9Bct0eU7Ye3
	W6LHyYp1yMEEQUjfEJJggkDrWTkS/S/mJAV21Y5MfV3qqtA0coxiYYJYY1qtd+crqbqEK/6DXi4zZ
	P3J5/P7cACOv+Apgc4+OU92QRlJkC5j5oVXcu2/sRQI16TgE7K7ChVxmfpphjsGhsPeMZr++5Jh8r
	368dH8IzW0+YVE2O2Q5xmEh8XXfyJbbBqz8a2FNoz4oFQnDeDBE0dzQxb3hB4Hv0BfVmuzMFw7m21
	7dRtlo9GrStFZKEPq1uDbKa6nueHZVZfApTM9acJU7xSOVd41GKz1ureEboGgdvil4nzUH1i4GNm1
	t1H3MJMqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHexK-0004hc-QG; Mon, 14 Sep 2020 03:15:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHewJ-00042o-Ac; Mon, 14 Sep 2020 03:14:01 +0000
X-UUID: 651041797e9447099ef90784d02e87fd-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qBymKk2B0d56MBUuX1hhxF1oOlrZkobktKD1Mxr60CM=; 
 b=tmY0psrnnHjorvlFRgOQ3ZME8VlLDd8/HyCI9NH0M2bnIgxBScnElwTOK3dD9r9AhwsCOXf0dvGHwhh2QafA07acySAI/PXp03JZy1MiSgC+IH/0wrcNsQIhCAdvcQ8xujfmCGAmljhTAcH2iyS1drtlM8LP9B5Kq5N09bM47dw=;
X-UUID: 651041797e9447099ef90784d02e87fd-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 534607486; Sun, 13 Sep 2020 19:13:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:47 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:47 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 04/17] arm64: dts: mt8183: add performance state support of
 scpsys
Date: Mon, 14 Sep 2020 11:04:31 +0800
Message-ID: <1600052684-21198-5-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231359_583764_DEFA1A4D 
X-CRM114-Status: GOOD (  13.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike
 Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Chen <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for performance state of scpsys on mt8183 platform

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index d85bae7..82ca929 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include "mt8183-pinfunc.h"
+#include <dt-bindings/soc/mtk,dvfsrc.h>
 
 / {
 	compatible = "mediatek,mt8183";
@@ -340,6 +341,27 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			operating-points-v2 = <&dvfsrc_opp_table>;
+			dvfsrc_opp_table: opp-table {
+				compatible = "operating-points-v2-level";
+
+				dvfsrc_vol_min: opp1 {
+					opp,level = <MT8183_DVFSRC_LEVEL_1>;
+				};
+
+				dvfsrc_freq_medium: opp2 {
+					opp,level = <MT8183_DVFSRC_LEVEL_2>;
+				};
+
+				dvfsrc_freq_max: opp3 {
+					opp,level = <MT8183_DVFSRC_LEVEL_3>;
+				};
+
+				dvfsrc_vol_max: opp4 {
+					opp,level = <MT8183_DVFSRC_LEVEL_4>;
+				};
+			};
+
 			audio@MT8183_POWER_DOMAIN_AUDIO {
 				reg = <MT8183_POWER_DOMAIN_AUDIO>;
 			};
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
