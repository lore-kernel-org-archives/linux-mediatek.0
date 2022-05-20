Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 03:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QP5ZAiwqqDyUu4XNkuVLMmEPF1Nc3lQp4V5aVZGZ7FQ=; b=uuFTrcdp060Tz+
	WitRsCOSnC6+FSKAMBnpj6UKvPUqCISUdhtFK0uQsrGFgK+pNKu7wVikOqwJC1BsoDAUQ/ICMYkLJ
	49J5iYXEQbep3PWW4fE2JG5/xecWDx/uOikV7y5e8W73tP9Dl7dwDu2axdYASkvwBslUNy7Jh4e2o
	ltyRhT9e6I/9cw/aq0EYrqySNZwfb1izaJ2QgUGbFhX7Lo9b9MtNBO5EjxetKnMLy6vKWXFt/2qzJ
	4FubAgxArnKKRyMruSFKKKhzrjRjr2iDKDlC+MhtpcglDbfj81nIigWlscR437UdAVUFOn4WC2Ozb
	TahNj802+Dq50xfBMWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrt0i-00ADFC-8T; Fri, 20 May 2022 03:09:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrt0V-00ADCk-Qn; Fri, 20 May 2022 03:08:53 +0000
X-UUID: 905c8db91909448ca0615d6a767fa64f-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:67caa3e8-970f-4dc6-824a-e7daebdf7631, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:d474e1e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 905c8db91909448ca0615d6a767fa64f-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1628041226; Thu, 19 May 2022 20:08:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 19:58:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 20 May 2022 10:58:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 10:58:42 +0800
Message-ID: <3f39777a225fac66f01858262defcc11c6135bb2.camel@mediatek.com>
Subject: Re: [PATCH v7 13/19] dt-bindings: reset: mediatek: Add infra_ao
 reset index for MT8192/MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 20 May 2022 10:58:43 +0800
In-Reply-To: <20220519125527.18544-14-rex-bc.chen@mediatek.com>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-14-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_200851_896711_B1E670A9 
X-CRM114-Status: GOOD (  16.92  )
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

On Thu, 2022-05-19 at 20:55 +0800, Rex-BC Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/reset/mt8192-resets.h | 8 ++++++++
>  include/dt-bindings/reset/mt8195-resets.h | 6 ++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-
> bindings/reset/mt8192-resets.h
> index 764ca9910fa9..12e2087c90a3 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
>  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
>  
> +/* TOPRGU resets */
>  #define MT8192_TOPRGU_MM_SW_RST					
> 1
>  #define MT8192_TOPRGU_MFG_SW_RST				2
>  #define MT8192_TOPRGU_VENC_SW_RST				3
> @@ -30,4 +31,11 @@
>  /* MMSYS resets */
>  #define MT8192_MMSYS_SW0_RST_B_DISP_DSI0			15
>  
> +/* INFRA resets */
> +#define MT8192_INFRA_RST0_THERM_CTRL_SWRST		0
> +#define MT8192_INFRA_RST2_PEXTP_PHY_SWRST		1
> +#define MT8192_INFRA_RST3_THERM_CTRL_PTP_SWRST	2
> +#define MT8192_INFRA_RST4_PCIE_TOP_SWRST		3
> +#define MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST	4
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-
> bindings/reset/mt8195-resets.h
> index a26bccc8b957..0b1937f14b36 100644
> --- a/include/dt-bindings/reset/mt8195-resets.h
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
>  #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
>  
> +/* TOPRGU resets */
>  #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
>  #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
>  #define MT8195_TOPRGU_APU_SW_RST               2
> @@ -26,4 +27,9 @@
>  
>  #define MT8195_TOPRGU_SW_RST_NUM               16
>  
> +/* INFRA resets */
> +#define MT8195_INFRA_RST0_THERM_CTRL_SWRST     0
> +#define MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST 1
> +#define MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST 2
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> -- 
> 2.18.0
> 

Hello Stephen,

this patch will have conflict with Matthias's commit branch for
include/dt-bindings/reset/mt8192-resets.h.

It's on linux-next.

I have fix it in this version, but I think there will be a merge
conflict if you pick my series in this run.


https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/reset/mt8192-resets.h?h=next-20220519&id=19c66219e4d5b813ebbd28621cfe9c450659ded7

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
