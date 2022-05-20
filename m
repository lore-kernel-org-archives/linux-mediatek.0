Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BEFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqk1UbyQSOBVDt7P7ztDgmoqDikcoSySTXhJJXcVF9w=; b=ujTnHGVmY/Vel3
	1FxbhQ7YbtPqCUCzhv5KUyZ88UwMEUgPGfEpWR0J/JCzJV1N1GN7SOAZsro5l5zd/9bdCAexLadR6
	breZCM8z4f4Hou8Mx14TGedHSm/cgyR4MpC1PFT+SC1x8wrCCBRxZsIcKT+eg2aRSsAR/2+qydnE1
	aMof/4GA0u3AWK82Zzcef418VDGOVGIV88YKEIdinH/t9Rj5u5/c4FcKLM/07X8hjlREQln8c+fw3
	8uQ/pCm+H7U2b7DorCTsTj1TI8PQOePt/2f+YY0XnwE+w98KXjKFABP5Xgj9kI9nJSVENh7+jZsEU
	twGIQnXakMsc/veFqpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4b3-00DDtA-P4; Fri, 20 May 2022 15:31:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4aP-00DDaU-PP; Fri, 20 May 2022 15:30:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 39C971F465BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653060640;
 bh=dmXpaV9RK7EYK65SYc1PAFlcJQ/aHD8qMN7i1zER+tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbyuiG1v+Mr9AKQMrqb8TVYlX4tVx7W+7mp5NVMkcvS7/CV2JBCyyMIhembjTUTyn
 +fgiKAhdfvgKszDd68j3idCylD1QNocFstG5dNF6NTIqAtyrQN4e/MQw54XJp9ZbWK
 LcyvU0i9eK7N664xdkRKg+W2NewfLLjDRwszIDtO7w1ABcHtRQM/Ko91NtJAxNeGXL
 FPztcYtRiMJrq7cK+fumdCIx84uxWK7f4f/ofJpvf6ODDOK8csLOIZubgIf9Dugeio
 f1rJfNYAZGff3BTfJT+DK4ApT76g9CObBvliJB/fpmhRZpKcyVau9C0ZIXQ4unJhDJ
 MA2b3jVHh+BpQ==
Date: Fri, 20 May 2022 11:30:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 16/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
Message-ID: <20220520153034.v4dvh4bn2pon6nnr@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-17-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-17-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_083042_007764_810393D9 
X-CRM114-Status: GOOD (  16.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rex,

On Thu, May 19, 2022 at 08:55:24PM +0800, Rex-BC Chen wrote:
> We will use mediatek clock reset as infracfg_ao reset instead of
> ti-syscon. To support this, remove property of ti reset and add
> property of #reset-cells for mediatek clock reset.
> =

> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index b57e620c2c72..8e5ac11b19f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,7 +10,6 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> -#include <dt-bindings/reset/ti-syscon.h>
>  =

>  / {
>  	compatible =3D "mediatek,mt8195";
> @@ -295,17 +294,7 @@
>  			compatible =3D "mediatek,mt8195-infracfg_ao", "syscon", "simple-mfd";

I believe the 'simple-mfd' compatible was added only to make the
reset-controller subnode probe (at least this was the case for mt8192), so =
it
might make sense to drop it here as well.

Thanks,
N=EDcolas

>  			reg =3D <0 0x10001000 0 0x1000>;
>  			#clock-cells =3D <1>;
> -
> -			infracfg_rst: reset-controller {
> -				compatible =3D "ti,syscon-reset";
> -				#reset-cells =3D <1>;
> -				ti,reset-bits =3D <
> -					0x140 18 0x144 18 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
pcie */
> -					0x120 0  0x124 0  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
thermal */
> -					0x730 10 0x734 10 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
thermal */
> -					0x150 5  0x154 5  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
svs gpu */
> -				>;
> -			};
> +			#reset-cells =3D <1>;
>  		};
>  =

>  		pericfg: syscon@10003000 {
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
