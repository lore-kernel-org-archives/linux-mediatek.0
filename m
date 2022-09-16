Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AA0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ysCc+dhvn7tqySdR91iBQ/hA6DIrTRnBSRjzMfKelA=; b=qcfVRTcxG7lPm4bMMWD+/ouNJ7
	aXqoiIH3pIXYhMrLUVJUY6yaVJxjPgCxQtSL757+POyUVIyibTgey8KSGlbmaxIW89WC4AJsuiagI
	Om3RPc7AO0O+14o0Ved5cSF/q6pXw5lKhvBCoQ6OhL6/TKavP9/96U536r+fc/RohtJXybsjzMivF
	xcUXmkOntd199O6/OzPsIUU8xfurgtzRimP/+Tytbd30L6G5Rp3sVRe/ky69dVntwK6rkvqMLUgVm
	TgLxORhuocMNPWgbOwp05x9TPLN1EA7UQ4mKYjYOHg61c4PsL3c8BTbVAaIeXorl1PGKhQMDW1zzG
	PHRQMYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4w6-009Ef0-0F; Fri, 16 Sep 2022 06:34:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4w2-009Edc-Va; Fri, 16 Sep 2022 06:34:48 +0000
X-UUID: 5de5ec650a6341ab8ff888d3f872089b-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3ysCc+dhvn7tqySdR91iBQ/hA6DIrTRnBSRjzMfKelA=;
	b=t9HX0hWf5XUSJ/bDwNOQr0232TliAbcI6kqzQJnOA7RhP9j99HNV371vNc1NnhSZuvY4Sd+YaQ608/2HHYA354/QvroFsG7ZTKrrf9L4pC5Ik7AGzEe2baU838rtVs4dGO14psH0dVVPXkDeJSvY9VHXwQWrEd5TeyFJV6ik3aY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5c48ce45-0a10-45df-a16f-2f2bed44ec59,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:86a4de5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5de5ec650a6341ab8ff888d3f872089b-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486188259; Thu, 15 Sep 2022 23:34:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 14:24:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 14:24:03 +0800
Message-ID: <92a39ac0e8a0ddf6040050a815ff71a13c00ea01.camel@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: power: Add MT8188 power domains
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Garmin.Chang <Garmin.Chang@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 16 Sep 2022 14:24:03 +0800
In-Reply-To: <20220916055216.20139-2-Garmin.Chang@mediatek.com>
References: <20220916055216.20139-1-Garmin.Chang@mediatek.com>
	 <20220916055216.20139-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_233447_052302_A49EC9FA 
X-CRM114-Status: GOOD (  16.27  )
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

On Fri, 2022-09-16 at 13:52 +0800, Garmin.Chang wrote:
> Add power domains dt-bindings for MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Change-Id: I62dff8af2bd74d6148712bfaa1caafc0b49e4b0c

Hello Garmin,

please remove change-id.

BRs,
Bo-Chen

> ---
>  .../power/mediatek,power-controller.yaml      |  2 +
>  .../dt-bindings/power/mediatek,mt8188-power.h | 44
> +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-
> controller.yaml
> b/Documentation/devicetree/bindings/power/mediatek,power-
> controller.yaml
> index 605ec7ab5f63..c9acef80f452 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-
> controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-
> controller.yaml
> @@ -28,6 +28,7 @@ properties:
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
>        - mediatek,mt8186-power-controller
> +      - mediatek,mt8188-power-controller
>        - mediatek,mt8192-power-controller
>        - mediatek,mt8195-power-controller
>  
> @@ -84,6 +85,7 @@ $defs:
>                "include/dt-bindings/power/mt8167-power.h" - for
> MT8167 type power domain.
>                "include/dt-bindings/power/mt8173-power.h" - for
> MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for
> MT8183 type power domain.
> +              "include/dt-bindings/power/mediatek,mt8188-power.h" -
> for MT8188 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for
> MT8192 type power domain.
>                "include/dt-bindings/power/mt8195-power.h" - for
> MT8195 type power domain.
>          maxItems: 1
> diff --git a/include/dt-bindings/power/mediatek,mt8188-power.h
> b/include/dt-bindings/power/mediatek,mt8188-power.h
> new file mode 100644
> index 000000000000..57e75cf3aa2c
> --- /dev/null
> +++ b/include/dt-bindings/power/mediatek,mt8188-power.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Garmin Chang <garmin.chang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8188_POWER_H
> +#define _DT_BINDINGS_POWER_MT8188_POWER_H
> +
> +#define MT8188_POWER_DOMAIN_MFG0			0
> +#define MT8188_POWER_DOMAIN_MFG1			1
> +#define MT8188_POWER_DOMAIN_MFG2			2
> +#define MT8188_POWER_DOMAIN_MFG3			3
> +#define MT8188_POWER_DOMAIN_MFG4			4
> +#define MT8188_POWER_DOMAIN_PEXTP_MAC_P0		5
> +#define MT8188_POWER_DOMAIN_PEXTP_PHY_TOP		6
> +#define MT8188_POWER_DOMAIN_CSIRX_TOP			7
> +#define MT8188_POWER_DOMAIN_ETHER			8
> +#define MT8188_POWER_DOMAIN_HDMI_TX			9
> +#define MT8188_POWER_DOMAIN_ADSP_AO			10
> +#define MT8188_POWER_DOMAIN_ADSP_INFRA			11
> +#define MT8188_POWER_DOMAIN_ADSP			12
> +#define MT8188_POWER_DOMAIN_AUDIO			13
> +#define MT8188_POWER_DOMAIN_AUDIO_ASRC			14
> +#define MT8188_POWER_DOMAIN_VPPSYS0			15
> +#define MT8188_POWER_DOMAIN_VDOSYS0			16
> +#define MT8188_POWER_DOMAIN_VDOSYS1			17
> +#define MT8188_POWER_DOMAIN_DP_TX			18
> +#define MT8188_POWER_DOMAIN_EDP_TX			19
> +#define MT8188_POWER_DOMAIN_VPPSYS1			20
> +#define MT8188_POWER_DOMAIN_WPE				21
> +#define MT8188_POWER_DOMAIN_VDEC0			22
> +#define MT8188_POWER_DOMAIN_VDEC1			23
> +#define MT8188_POWER_DOMAIN_VENC			24
> +#define MT8188_POWER_DOMAIN_IMG_VCORE			25
> +#define MT8188_POWER_DOMAIN_IMG_MAIN			26
> +#define MT8188_POWER_DOMAIN_DIP				27
> +#define MT8188_POWER_DOMAIN_IPE				28
> +#define MT8188_POWER_DOMAIN_CAM_VCORE			29
> +#define MT8188_POWER_DOMAIN_CAM_MAIN			30
> +#define MT8188_POWER_DOMAIN_CAM_SUBA			31
> +#define MT8188_POWER_DOMAIN_CAM_SUBB			32
> +
> +#endif /* _DT_BINDINGS_POWER_MT8188_POWER_H */


