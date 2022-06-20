Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3156C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku3lnzfc9xne6upFLL2CfPAGEQ8xMOMdfi+c57MkZXU=; b=wxFIJiPqiO42gVrH/7k+VIoEfT
	ZDEUK4cbAyYGaRao48ps+q6BIfUtbhM93kw7MTo3iThwr7CD5ElrtONSFR4RQ1l3dXy+QPme1+8pc
	x/r5/WHsGm25j+NEjwPKFHlL1f8W0RIt27Q5VpP2v5/+Wzr98R8MNu327ukeP8mZRNVe9xwwYtSU+
	kxNtXPxS7im97xfNqX5h/s19nZ+UTpKoaFKS0jJUdZvwcuIaRkKlaa4Yybjg8VptBQ8ThpWOTn7PT
	rpOdhBVkb7NTpIbl+q4JIpqG6XyO+telYKnzacw5jHxn+FxKmfHd7SLdVQAWOB3i77m9z2yTOPFGK
	CgTXKa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B9u-00GTt5-D3; Mon, 20 Jun 2022 06:45:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3B9X-00GTlG-4w; Mon, 20 Jun 2022 06:44:54 +0000
X-UUID: 8c3821d2c00b444cb97f31c24dd17c14-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:81c70dbe-2e64-487c-a5ba-38cea36d4546,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:1a9cfae9-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8c3821d2c00b444cb97f31c24dd17c14-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 376588930; Sun, 19 Jun 2022 23:44:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 23:40:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 20 Jun 2022 14:40:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 14:40:47 +0800
Message-ID: <08653b784294bb11182faf82c74757a14d780c4e.camel@mediatek.com>
Subject: Re: [PATCH v8 16/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, Chun-Jie Chen
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
Date: Mon, 20 Jun 2022 14:40:46 +0800
In-Reply-To: <20220523060056.24396-17-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
	 <20220523060056.24396-17-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_234451_232524_B6D509CF 
X-CRM114-Status: GOOD (  16.09  )
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

On Mon, 2022-05-23 at 14:00 +0800, Rex-BC Chen wrote:
> We will use mediatek clock reset as infracfg_ao reset instead of
> ti-syscon. To support this, remove property of ti reset and add
> property of #reset-cells for mediatek clock reset.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index b57e620c2c72..db16eba9d475 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,7 +10,6 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> -#include <dt-bindings/reset/ti-syscon.h>
>  
>  / {
>  	compatible = "mediatek,mt8195";
> @@ -292,20 +291,10 @@
>  		};
>  
>  		infracfg_ao: syscon@10001000 {
> -			compatible = "mediatek,mt8195-infracfg_ao",
> "syscon", "simple-mfd";
> +			compatible = "mediatek,mt8195-infracfg_ao",
> "syscon";
>  			reg = <0 0x10001000 0 0x1000>;
>  			#clock-cells = <1>;
> -
> -			infracfg_rst: reset-controller {
> -				compatible = "ti,syscon-reset";
> -				#reset-cells = <1>;
> -				ti,reset-bits = <
> -					0x140 18 0x144 18 0 0
> (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* pcie */
> -					0x120 0  0x124 0  0 0
> (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> -					0x730 10 0x734 10 0 0
> (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> -					0x150 5  0x154 5  0 0
> (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* svs gpu */
> -				>;
> -			};
> +			#reset-cells = <1>;
>  		};
>  
>  		pericfg: syscon@10003000 {
> -- 
> 2.18.0
> 

Hello Matthias,

driver part is accepted by Setphen[1].
dts part is also reviewed.
Is these dts parts ok for you? (including patch 15 and 16)
Or should I send another series for dts part?

Thanks!

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-next

BRs,
Bo-Chen


