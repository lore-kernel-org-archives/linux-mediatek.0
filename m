Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29280C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnwF08B9AAJ2TBhWr4r4R044KL9UxiJm1ar3GV8XKMU=; b=5EnvD0LDX9tFi1
	5cxIAzXJHdESm1K09ruqhqNXdFCQyqeNIB4BeIMbRvbg9uCZmpyDxAKe//WZqk2/RmiZ5X0IVljAt
	ca87JmLOGWjtJXcWJeqH5adzdOoO8x0e14OIRRx0Kg2J5pAXqVkZStpMFdjGFm+efxN/NvsOmazEX
	iO9/pz/3qXu0q99it1mOk+HrK494HmpGyz6GWVEdnV4SHigkF/MZZn1aVmr/qRcNeWMsyR3zD3F8k
	s90cCh7Os7f7eMQGYrnOhYT/8ODW0VFXIQwd3HfC6z6nxEF8JdsvDy0d8XYKVjbwdHDxm9HQRLi+9
	bWk0NZH1E4cL7lOG39SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRQl-009OrM-OX; Mon, 21 Mar 2022 23:27:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRQY-009Omr-RL; Mon, 21 Mar 2022 23:27:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B251C1F43C95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647905222;
 bh=YfOseyYYNtgwVpfTGjA3bqGA2K2nb9b7uI+RBSwgmUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T6L1pRqk5jtI5BIq/oxERd8AafUJBe/N5RQOSJzTFuRAa1le7WyF/rxgeEDoQVivH
 +ijVN5/jLghtNAvDjanbWKkAaH5AqsqCMlIWTnQmzPRBvobCD42H2j5n5C4WXKgMi0
 NbPlYLAmlV+hFcLcG2uvVpI8r4Djc2k6RChlsO/l4vNomPU6V4IxvHLfaXpXwtKMv9
 fPBTBCGX0TunfrfBGfDzAgUgff22eXG/OgNORVC7a0nWSofWhHNFv4QyP97+lwl6He
 6loJfvaOAE0Cy718tMUsHOW6OzSKokCariFJgk8HgHAP7evsBB+PPHylM9nF4tkvnZ
 dll6miS7BBR3Q==
Date: Mon, 21 Mar 2022 19:26:57 -0400
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
Subject: Re: [PATCH v4 18/22] arm64: dts: mt8192: Add display nodes
Message-ID: <20220321232657.6z2g3p2aflixzamp@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_162707_171764_85DF21D0 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Allen,

please see my comment below.

On Fri, Mar 18, 2022 at 10:45:30PM +0800, Allen-KH Cheng wrote:
> Add display nodes for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 111 +++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index a77d405dd508..59183fb6c80b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1205,6 +1205,13 @@
>  			#clock-cells =3D <1>;
>  		};
>  =

> +		mutex: mutex@14001000 {
> +			compatible =3D "mediatek,mt8192-disp-mutex";
> +			reg =3D <0 0x14001000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&mmsys CLK_MM_DISP_MUTEX0>;
> +		};
> +
>  		smi_common: smi@14002000 {
>  			compatible =3D "mediatek,mt8192-smi-common";
>  			reg =3D <0 0x14002000 0 0x1000>;
> @@ -1236,6 +1243,110 @@
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
>  		};
>  =

> +		ovl0: ovl@14005000 {
> +			compatible =3D "mediatek,mt8192-disp-ovl";
> +			reg =3D <0 0x14005000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&mmsys CLK_MM_DISP_OVL0>;
> +			iommus =3D <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> +				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +		};
> +
> +		ovl_2l0: ovl@14006000 {
> +			compatible =3D "mediatek,mt8192-disp-ovl-2l";
> +			reg =3D <0 0x14006000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks =3D <&mmsys CLK_MM_DISP_OVL0_2L>;
> +			iommus =3D <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> +				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +		};
> +
> +		rdma0: rdma@14007000 {
> +			compatible =3D "mediatek,mt8192-disp-rdma";
> +			reg =3D <0 0x14007000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
> +			iommus =3D <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> +			mediatek,larb =3D <&larb0>;
> +			mediatek,rdma-fifo-size =3D <5120>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +		};
> +
> +		color0: color@14009000 {
> +			compatible =3D "mediatek,mt8192-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg =3D <0 0x14009000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks =3D <&mmsys CLK_MM_DISP_COLOR0>;
> +		};
> +
> +		ccorr0: ccorr@1400a000 {
> +			compatible =3D "mediatek,mt8192-disp-ccorr";
> +			reg =3D <0 0x1400a000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks =3D <&mmsys CLK_MM_DISP_CCORR0>;
> +		};
> +
> +		aal0: aal@1400b000 {
> +			compatible =3D "mediatek,mt8192-disp-aal",
> +				     "mediatek,mt8193-disp-aal";

Typo: "mediatek,mt8193-disp-aal" should be "mediatek,mt8173-disp-aal", othe=
rwise =

the drm driver doesn't even probe. Typos happen, just please make sure you'=
re
testing before sending to the list so these kind of issues can be caught
earlier.

Thanks,
N=EDcolas

> +			reg =3D <0 0x1400b000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks =3D <&mmsys CLK_MM_DISP_AAL0>;
> +		};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
