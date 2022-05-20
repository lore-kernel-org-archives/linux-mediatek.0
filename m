Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1kzYR8GpEqdRfEL2dwjdK9YwcUYG54BSJJIa+kdcFM=; b=eKGN+hU8leClfk
	TYpqTk12ytWCAAl2iTBS0kgT3nBl66qeI2SaLiuqYLF6KHfEYF8VokjbN/1jfuaEFZZxxnC4H+Jr9
	B5eE7EumKkeyXpat9/mF6zEGtkl2exRkYrL2KqIG7C8rM8D2L1nCXBgW7gz0R/u41EgeuHPpUnv45
	90toQQ4IWHjkMHTx5W1s+L92or5rXzP57SXjH0jSKDDI8alLMm58GM4V+V70sVunbxcoHvH7UN6Aj
	ATjP3rJwaUoPfPpaKjkDGJXgexQ429lVTkZqizz4k3UgtiEbuL5MzkD18sCbnI8N2MEp0eJctoC8l
	xCGlGSbQ1fYboJ83suEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4kD-00DI1v-Ta; Fri, 20 May 2022 15:40:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4js-00DHqi-4T; Fri, 20 May 2022 15:40:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id BD8201F465BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653061226;
 bh=yoKFIOuJFjcpwDMOjsEHzdGLdIc03w5D68Xc3yzKzAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jbpr2YTZeoUG+rwaC/OO4MDeTDKG2yZdpcZOPXhVSWOVID/70YrC7K+04roRBxWbQ
 2XWcDqf0XXWPxPqTYPV6HcnIepPxvVChCNor2WBBr7w6O4j/kFU6cKk6vP2Z+Z9dE5
 7tgmyu4ouwDDcQ0dtQp8e4PQRmB5tRIBJspFmBTBKpGkE66u1x51+FG/h/TQZNXV2D
 ZGUpKZVvuaNylRUK6SrqWYIxnWw4/mV6NR7KkJ4WR73Djtj6MkJvnMbv+3+fknfBxB
 w3GH+ndrbZBberSAFrHjC0BO5mZVe+/NaEf8hZzevRiT7UlgeAi566XzqEOih6eyld
 5TZZOfTB8t0cg==
Date: Fri, 20 May 2022 11:40:20 -0400
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
Subject: Re: [PATCH v7 00/19] Cleanup MediaTek clk reset drivers and support
 SoCs
Message-ID: <20220520154020.dywardvr3silhjwk@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084028_355646_8BF199D9 
X-CRM114-Status: GOOD (  13.27  )
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

On Thu, May 19, 2022 at 08:55:08PM +0800, Rex-BC Chen wrote:
> In this series, we cleanup MediaTek clock reset drivers in clk/mediatek
> folder. MediaTek clock reset driver is used to provide reset control
> of modules controlled in clk, like infra_ao.
> =

> Changes for v7:
> 1. v7 is based on linux-next next-20220519 and Chen-Yu's series[1].
> 2. Add support for MT8186.
> =

> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D6=
43003
> =

> Changes for v6:
> 1. Add a new patch to support inuput argument index mode.
> 2. Revise definition in reset.h to index.
> =

> Rex-BC Chen (19):
>   clk: mediatek: reset: Add reset.h
>   clk: mediatek: reset: Fix written reset bit offset
>   clk: mediatek: reset: Refine and reorder functions in reset.c
>   clk: mediatek: reset: Extract common drivers to update function
>   clk: mediatek: reset: Merge and revise reset register function
>   clk: mediatek: reset: Revise structure to control reset register
>   clk: mediatek: reset: Support nonsequence base offsets of reset
>     registers
>   clk: mediatek: reset: Support inuput argument index mode
>   clk: mediatek: reset: Change return type for clock reset register
>     function
>   clk: mediatek: reset: Add new register reset function with device
>   clk: mediatek: reset: Add reset support for simple probe
>   dt-bindings: arm: mediatek: Add #reset-cells property for
>     MT8192/MT8195
>   dt-bindings: reset: mediatek: Add infra_ao reset index for
>     MT8192/MT8195
>   clk: mediatek: reset: Add infra_ao reset support for MT8192/MT8195
>   arm64: dts: mediatek: Add infra #reset-cells property for MT8192
>   arm64: dts: mediatek: Add infra #reset-cells property for MT8195
>   dt-bindings: reset: mediatek: Add infra_ao reset index for MT8186
>   dt-bindings: arm: mediatek: Add #reset-cells property for MT8186
>   clk: mediatek: reset: Add infra_ao reset support for MT8186

For the whole series:

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

And also

Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

on mt8192-asurada-spherion. PCIe resets work as intended by adding on the p=
cie
node =


+                       resets =3D <&infracfg MT8192_INFRA_RST2_PEXTP_PHY_S=
WRST>,
+                                <&infracfg MT8192_INFRA_RST4_PCIE_TOP_SWRS=
T>;
+                       reset-names =3D "phy", "mac";

Thanks for the great work on this series, Rex!

N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
