Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzyK1yHqJxG84wIrGFZIhEqRjq4q0xU718rsBc0v2G8=; b=br1jSiRF65Fic8
	EbREQCkxFsPUTtUcfSI1816iGdRu0atoZs0MU96Qa59Wqr7+mGeyHlExihFfSy8WakO7uwtbRRklJ
	o6wb+LHB4IUjGeHvBQo0kOXm/2Z22pGXLnX8uCwBa949inLVHTOST0KOaYTCbpWdrXDNQbmpFaTeP
	XuYZX5HpFqwKh9ZgrIk95JnE63fdHqmy4DaVSF9mTCNQoU7o/HOgiUVtGzLHBYfgqfVzxslnGNwrx
	5J1mfbMTaR3ee5jtALcSR8DQextmuAmZHGECXdxBy5TInVR5A5lq3e9i0BwVLc+NzIO8KMYXZDG0S
	VHdgHyjzs7qlfvyHLPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMbu-00Fe6O-HQ; Wed, 01 Jun 2022 11:33:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaJ-00FdEx-2g; Wed, 01 Jun 2022 11:32:20 +0000
X-UUID: ebc538c82c124223bfed3000c7281501-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d4d9192c-f3d2-4282-a2ab-15e252c00f7c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:67d9268a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: ebc538c82c124223bfed3000c7281501-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 113539524; Wed, 01 Jun 2022 04:32:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 19:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:06 +0800
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
Subject: [PATCH v1 15/15] mfd: cros_ec: Add SCP core 1 as a new CrOS EC MCU
Date: Wed, 1 Jun 2022 19:22:01 +0800
Message-ID: <20220601112201.15510-16-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043219_246045_6A195335 
X-CRM114-Status: GOOD (  14.13  )
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

MT8195 System Companion Processors(SCP) is a dual-core RISC-V MCU.
Add a new cros feature id to represent the SCP 2nd core.

The 1st core is referred to as 'core 0', and the 2nd core is referred
to as 'core 1'.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/mfd/cros_ec_dev.c                      | 5 +++++
 include/linux/platform_data/cros_ec_commands.h | 2 ++
 include/linux/platform_data/cros_ec_proto.h    | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 596731caf407..07cc31d92edc 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -64,6 +64,11 @@ static const struct cros_feature_to_name cros_mcu_devices[] = {
 		.name	= CROS_EC_DEV_SCP_NAME,
 		.desc	= "System Control Processor",
 	},
+	{
+		.id	= EC_FEATURE_SCP_C1,
+		.name	= CROS_EC_DEV_SCP_C1_NAME,
+		.desc	= "System Control Processor 2nd Core",
+	},
 	{
 		.id	= EC_FEATURE_TOUCHPAD,
 		.name	= CROS_EC_DEV_TP_NAME,
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8cfa8cfca77e..9fbf1c5eb8d3 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1300,6 +1300,8 @@ enum ec_feature_code {
 	 * mux.
 	 */
 	EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK = 43,
+	/* The MCU is a System Companion Processor (SCP) 2nd Core. */
+	EC_FEATURE_SCP_C1 = 45,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 138fd912c808..da06dc7cf1cb 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -19,6 +19,7 @@
 #define CROS_EC_DEV_ISH_NAME	"cros_ish"
 #define CROS_EC_DEV_PD_NAME	"cros_pd"
 #define CROS_EC_DEV_SCP_NAME	"cros_scp"
+#define CROS_EC_DEV_SCP_C1_NAME	"cros_scp_c1"
 #define CROS_EC_DEV_TP_NAME	"cros_tp"
 
 /*
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
