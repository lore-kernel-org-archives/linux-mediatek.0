Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A72C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeFEXEeuxQywhhUwc04U+bwz5KZPm/3fkyXZz25KGfw=; b=Z5mlFb9LkFZKYs/LcZsumeesGa
	/nnW4QF6gGfvfQxowBn2cESBIs7LoZFRG2VZ+75jm5xWXOL2G6ALS6tzRel5Y2iKnqj+EKUTvNfLr
	de0B5NzFF95qom6L8GFhVOTHWFblGQEQNxODvkEn4QznkUf8XhZ5vZDGXueB3EBvxNObf7/mdYD+e
	CtYBSu2u6yUkKSh9qr4iCrG8MXD/+wromv0HcL8rqn1st18nW58KT/9UeHPtxrXIvIQv9NrEpoE7j
	jxEmjxGxtXrXiCyL7NQj/tKPAsvJDAQ9klX/aGHQdLl6tTV5t8wfdxKCPaTG0YivOcAenWPItAPLt
	LrAjCAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Fbk-004kvd-LT; Fri, 01 Jul 2022 12:18:48 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FbY-004kgu-HQ
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 12:18:39 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3176b6ed923so21467137b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OeFEXEeuxQywhhUwc04U+bwz5KZPm/3fkyXZz25KGfw=;
        b=GMYOB4VdXQqK5nQ9DdqjYthCByYBWHMC7PS9aK0vdB5WHIw00SEFRbeqrOTkOva5+0
         9vDIoZ79WqQbQFjjERSMdXRtELXY8HlLo14SRigLhueM/WNJJx76gYuylaT12KWvdfnK
         DQTlAPDX1Tar+g2CrgdghnZ3wJTIX2IhoKV6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OeFEXEeuxQywhhUwc04U+bwz5KZPm/3fkyXZz25KGfw=;
        b=oP5gY+5G+98aw3fvsMCoEeib5f2YAF4XsRx0UQkR2iHWiYIg9trZa3G+sOflwRSJY+
         0UzZEragzK8dceVtiMLHLZ/hzV6EUhHQUKih5NDl8FMyTpThAK/kYVBjXwxVVKWpnVkj
         nbXzx60qGAsK6Kvw3D8h1anLTXp8ySsIS+56YOHe9cgeKC8Pb6RAP4w32XAti59e70qZ
         C1dKmZM0dEDu8K6a//L7Lsblg86m8nbSXds/BS2F7dwUmCkuuiNpvWhEPGiMavWfcqyc
         djPRVGplls3yHAAE1YlR8wpdyb7dLYH6YiXNVykYda1KzPeCS5shaAyyAIgGcreJ9oqe
         I2SQ==
X-Gm-Message-State: AJIora86hBS+cHWSo6YhkSSr+JpbwwwxMRXaM/JGjMLb9WXLKYtBHEJU
	RtXFsGtjmptpBwkDXq5j6d56yYm4kolN29yGH/uLfQ==
X-Google-Smtp-Source: AGRyM1uZNWNmWtR0njNvXbQvTDKxY2Iko1JAqKD5WQuetGxzVxS5CuRnlks1P2s3aeTr4thJjl4ATAYe10bhQxmCwR0=
X-Received: by 2002:a05:690c:295:b0:317:759b:a661 with SMTP id
 bf21-20020a05690c029500b00317759ba661mr17180203ywb.144.1656677875926; Fri, 01
 Jul 2022 05:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com> <20220701090547.21429-5-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220701090547.21429-5-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 20:17:44 +0800
Message-ID: <CAGXv+5F_Gi_=vV1NSk0AGRVYCa3Q8+gBaE+nv3OJ1AKe2voOwg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: mt8192: Add display nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_051836_639440_205BEAB9 
X-CRM114-Status: GOOD (  17.75  )
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

On Fri, Jul 1, 2022 at 5:06 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add display nodes and gce info for mt8192 SoC.
>
> GCE (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 137 +++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index a789b7c9b2af..c4dc8777f26c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -6,6 +6,7 @@
>
>  /dts-v1/;
>  #include <dt-bindings/clock/mt8192-clk.h>
> +#include <dt-bindings/gce/mt8192-gce.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8192-larb-port.h>
> @@ -553,6 +554,15 @@
>                         assigned-clock-parents =3D <&topckgen CLK_TOP_OSC=
_D10>;
>                 };
>
> +               gce: mailbox@10228000 {
> +                       compatible =3D "mediatek,mt8192-gce";
> +                       reg =3D <0 0x10228000 0 0x4000>;
> +                       interrupts =3D <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       #mbox-cells =3D <2>;
> +                       clocks =3D <&infracfg CLK_INFRA_GCE>;
> +                       clock-names =3D "gce";
> +               };
> +
>                 scp_adsp: clock-controller@10720000 {
>                         compatible =3D "mediatek,mt8192-scp_adsp";
>                         reg =3D <0 0x10720000 0 0x1000>;
> @@ -1186,9 +1196,22 @@
>                 mmsys: syscon@14000000 {
>                         compatible =3D "mediatek,mt8192-mmsys", "syscon";
>                         reg =3D <0 0x14000000 0 0x1000>;
> +                       mboxes =3D <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                                <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0 0x1000>;
>                         #clock-cells =3D <1>;

This also needs #reset-cells =3D <1>; othewise

    resets =3D <&mmsys MT8192_MMSYS_SW0_RST_B_DISP_DSI0>;

in patch 5 will fail to be parsed by the kernel.

Can you add this in a separate patch?

>                 };
>

[...]

> +               ovl_2l2: ovl@14014000 {
> +                       compatible =3D "mediatek,mt8192-disp-ovl-2l";
> +                       reg =3D <0 0x14014000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>=
;
> +                       clocks =3D <&mmsys CLK_MM_DISP_OVL2_2L>;
> +                       iommus =3D <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
> +                                <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX=
 0x4000 0x1000>;
> +               };
> +
> +               rdma4: rdma@14015000 {
> +                       compatible =3D "mediatek,mt8192-disp-rdma";
> +                       reg =3D <0 0x14015000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       power-domains =3D <&spm MT8192_POWER_DOMAIN_DISP>=
;
> +                       clocks =3D <&mmsys CLK_MM_DISP_RDMA4>;
> +                       iommus =3D <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
> +                       mediatek,rdma-fifo-size =3D <2048>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX=
 0x5000 0x1000>;
> +               };
> +

The aliases for these need to be added. Otherwise the display pipeline
will stall.


ChenYu

