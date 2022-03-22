Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpClmwSE0jbWagFjEgFgTIYHu4M8ZAmmZ+lCjlTCD8A=; b=ondt9sMsIdOh4M
	NSoKljwrbEmbOpwbe5sSIxdJjZtv9JWB9DWWh0kAfRxERugaMJnpuub5pWIT13dZg/TrLhwpu9iil
	ybQyFX4Wx9YOP74edH3Og6itrnj6gCmHH5Ah7PXGzlP690fujMNSoKE8A/Ir8c5PIv6pgKb6UO5jd
	K4Mm24QuUfrW3txm50dzacyKD3SmB9ZXSEWeqYJGme8l1WUXbD4SW01xVQ/lWkrDEsYr8CdZEdYqb
	Aq6X9RMLv6MseO7MfQA+rkuOH77/6NE1qOkT+USw6mSo1KHGSlNnqz7r2f8Dg9RQEmYRjlJIS+rc0
	/qNjWDtwnfuaS5EbF9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWm0P-00CCFf-11; Tue, 22 Mar 2022 21:25:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWm0C-00CCD5-JY; Tue, 22 Mar 2022 21:25:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D03E61F42E1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647984315;
 bh=FN4g7OUcn1ja9g5IGVEoumm6Jbs/S5KfOE1/HCBlfhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjndmY3/tEwT1vjYFlZRlDw6u0KBWVKjhGOHT4IhFIuw6jPMHZdgJ7iu6yXmzLF6Y
 vL7ytXr1343H/gWInrvFG++p2Yx+bWzQbgY6zSTaPAV+OSNKxf1bcofIkpPiLPbN04
 uJuTGgI1VpAP4Dqh1n76QmRtu7opiiIGmSfN9IJHwJiPwfBmNcRr2+l2wSbUQEZ5dK
 5sH9U9kDalMDd0CxOJc9U2uJdIJWCkWAOTv09gAP9PhtNc5Kwvmms4wFTSXQWEtPac
 Crbv7yNxHqa806N0jrJtBo9Lbr5gblH0lNUHUwOPmnhqpR9SRVOk2Eewkyx8VjtZXj
 Fc+WE8lm5LyIg==
Date: Tue, 22 Mar 2022 17:25:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v4 21/22] arm64: dts: mt8192: Add gce info for display
 nodes
Message-ID: <20220322212509.nviacy3dk4mpvz6f@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_142516_982928_8196031E 
X-CRM114-Status: GOOD (  15.78  )
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

On Fri, Mar 18, 2022 at 10:45:33PM +0800, Allen-KH Cheng wrote:
> Add gce info for display nodes
> - It's required to get drivers' CMDQ support

It's better to use complete sentences instead of bullet points like this. A=
lso
you could be more descriptive in the commit message. Suggestion:

Add GCE (Global Command Engine) properties to the display nodes in order to
enable the usage of the CMDQ (Command Queue), which is required for operati=
ng
the display.

> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 08e0dd2483d1..f0f0f067c023 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1203,6 +1203,9 @@
>  		mmsys: syscon@14000000 {
>  			compatible =3D "mediatek,mt8192-mmsys", "syscon";
>  			reg =3D <0 0x14000000 0 0x1000>;
> +			mboxes =3D <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0 0x1000>;
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
> @@ -1212,6 +1215,8 @@
>  			reg =3D <0 0x14001000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
>  			clocks =3D <&mmsys CLK_MM_DISP_MUTEX0>;
> +			mediatek,gce-events =3D <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> +					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
>  		};
>  =

>  		smi_common: smi@14002000 {
> @@ -1253,6 +1258,7 @@
>  			iommus =3D <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
>  				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
>  		};
>  =

>  		ovl_2l0: ovl@14006000 {
> @@ -1263,6 +1269,7 @@
>  			clocks =3D <&mmsys CLK_MM_DISP_OVL0_2L>;
>  			iommus =3D <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
>  				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
>  		};
>  =

>  		rdma0: rdma@14007000 {
> @@ -1274,6 +1281,7 @@
>  			mediatek,larb =3D <&larb0>;
>  			mediatek,rdma-fifo-size =3D <5120>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
>  		};
>  =

>  		color0: color@14009000 {
> @@ -1283,6 +1291,7 @@
>  			interrupts =3D <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
>  		};
>  =

>  		ccorr0: ccorr@1400a000 {
> @@ -1291,6 +1300,7 @@
>  			interrupts =3D <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_CCORR0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
>  		};
>  =

>  		aal0: aal@1400b000 {
> @@ -1300,6 +1310,7 @@
>  			interrupts =3D <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_AAL0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>  		};
>  =

>  		gamma0: gamma@1400c000 {
> @@ -1309,6 +1320,7 @@
>  			interrupts =3D <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_GAMMA0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  =

>  		postmask0: postmask@1400d000 {
> @@ -1318,6 +1330,7 @@
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_POSTMASK0>;
>  			iommus =3D <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
>  		};
>  =

>  		dither0: dither@1400e000 {
> @@ -1327,6 +1340,7 @@
>  			interrupts =3D <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  			clocks =3D <&mmsys CLK_MM_DISP_DITHER0>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>  		};
>  =

>  		dsi0: dsi@14010000 {
> @@ -1351,6 +1365,7 @@
>  			clocks =3D <&mmsys CLK_MM_DISP_OVL2_2L>;
>  			iommus =3D <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
>  				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
>  		};
>  =

>  		rdma4: rdma@14015000 {
> @@ -1361,6 +1376,7 @@
>  			clocks =3D <&mmsys CLK_MM_DISP_RDMA4>;
>  			iommus =3D <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
>  			mediatek,rdma-fifo-size =3D <2048>;
> +			mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>  		};
>  =

>  		dpi0: dpi@14016000 {
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
