Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25RNeIIw/G3bez/vC9UE+XXUruQ/kfx4NbkgNbrqM6o=; b=fLJ7NGDgnfvuS7
	RFPl5GUMbfRT2zCc57qV2+Ir6fc6tuGNjmQ8PxjybnlH/42qKcs+VZSqOkPDCo9KP8oXtK8KZknj3
	08WAbxHeIwdHtyfuqk/B/J7/QZHo8hEiE054cGmJ2/qk+6PBz8qIfDYpwKdtASXU2u0kppIS7zPYC
	WLsQIgEwQHswLlxzaDvbSJwD23aQE/8Piugz820Yo+a2wvXZ46SdQTwhFVnp+bbQXgE/gM8sytZC3
	ql47tuwaAjLkL1ROdG2wEIyiyo6DjEgcHXiRBESJ6kvMNlYUboxwRucc06IpXzEHl9t2hB7rYcNDQ
	woEztvL4SOnsjfdM82LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXOIg-00Gpbl-A8; Thu, 24 Mar 2022 14:18:54 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXOHz-00GpIe-Uq; Thu, 24 Mar 2022 14:18:14 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso794512ooe.6; 
 Thu, 24 Mar 2022 07:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Jna4fyumBD0bsBuDM2E70JQUhEhnD+mfetOCaVsAbQk=;
 b=qbSnoHvUnfTezkeX1D+piNsPoJo0Tjdh+1ZNVfGq2u2VJ4DSnB4CwWIFzcAHOHLO87
 glL6rIlCfy3zHZepbKeGAv2E6Kc07FLlFFUFMyL0t4aEAxodDOMPkFpegMU0Q0GR6oJ+
 FA3hddW3W6McvHPvQVF5+0g+Tcn8PBdj4LTsruy3NxNyvYmUCjZUes7pNNrpRedNODpS
 vMRcMuOoJk6TxIP0QP+CR7ZLIFTzgLD5OkB0VM7zylAC1xhotNswMVBxJAeeJIWNd5bY
 Zy/sIreL/+oASGpiwxGf6sqGstbVnPB3CtKVbAM/7w0Ra62JP0YuI5o+ptWgNfp2ZClb
 KZqQ==
X-Gm-Message-State: AOAM531c4yk4QfdPgph94M9FC1FuQ+Aj31/M/PTpClf5ZWDTyQMOg2D/
 ClYR8WKNyXmdE6XTnSEqeQ==
X-Google-Smtp-Source: ABdhPJzJuf8Db7RwHK6W2v9lHlH2Uobl2lgItPUE3wBiHzc1/e/y0yGslIGw8IsCKFJahe0bJkm/iA==
X-Received: by 2002:a4a:de52:0:b0:320:d6a0:cf7f with SMTP id
 z18-20020a4ade52000000b00320d6a0cf7fmr2025395oot.83.1648131490312; 
 Thu, 24 Mar 2022 07:18:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x65-20020a9d20c7000000b005cdaeec68d5sm1349219ota.37.2022.03.24.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 07:18:09 -0700 (PDT)
Received: (nullmailer pid 1995382 invoked by uid 1000);
 Thu, 24 Mar 2022 14:18:08 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 macpaul.lin@mediatek.com, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220324012112.7016-2-biao.huang@mediatek.com>
References: <20220324012112.7016-1-biao.huang@mediatek.com>
 <20220324012112.7016-2-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next] dt-bindings: net: snps,
 dwmac: modify available values of PBL
Date: Thu, 24 Mar 2022 09:18:08 -0500
Message-Id: <1648131488.593520.1995381.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_071812_046406_6203EE8E 
X-CRM114-Status: GOOD (  12.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Mar 2022 09:21:12 +0800, Biao Huang wrote:
> PBL can be any of the following values: 1, 2, 4, 8, 16 or 32
> according to the datasheet, so modify available values of PBL in
> snps,dwmac.yaml.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1608860


dwmac@9630000: $nodename:0: 'dwmac@9630000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/stih407-b2120.dt.yaml
	arch/arm/boot/dts/stih410-b2120.dt.yaml
	arch/arm/boot/dts/stih410-b2260.dt.yaml
	arch/arm/boot/dts/stih418-b2199.dt.yaml
	arch/arm/boot/dts/stih418-b2264.dt.yaml

eth@5c400000: $nodename:0: 'eth@5c400000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c400000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c500000: $nodename:0: 'eth@5c500000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c500000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c600000: $nodename:0: 'eth@5c600000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c600000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c700000: $nodename:0: 'eth@5c700000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@5c700000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear1310-evb.dt.yaml

eth@e0800000: $nodename:0: 'eth@e0800000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear300-evb.dt.yaml
	arch/arm/boot/dts/spear310-evb.dt.yaml
	arch/arm/boot/dts/spear320-evb.dt.yaml
	arch/arm/boot/dts/spear320-hmi.dt.yaml

eth@e2000000: $nodename:0: 'eth@e2000000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/spear1310-evb.dt.yaml
	arch/arm/boot/dts/spear1340-evb.dt.yaml

eth@e2000000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear1310-evb.dt.yaml
	arch/arm/boot/dts/spear1340-evb.dt.yaml

ethernet@c9410000: 'phy-mode' is a required property
	arch/arm/boot/dts/meson6-atv1200.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

ethernet@e0800000: compatible: ['st,spear600-gmac'] does not contain items matching the given schema
	arch/arm/boot/dts/spear600-evb.dt.yaml

ethernet@f8010000: interrupt-names:1: 'eth_wake_irq' was expected
	arch/arm/boot/dts/artpec6-devboard.dt.yaml

ethernet@fe2a0000: clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref', 'pclk_xpcs'] is too long
	arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml

ethernet@fe2a0000: clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185], [15, 172]] is too long
	arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml

ethernet@ff800000: reset-names: ['stmmaceth', 'stmmaceth-ocp'] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff800000: resets: [[6, 32], [6, 40]] is too long
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff800000: resets: [[7, 32], [7, 40]] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml

ethernet@ff802000: reset-names: ['stmmaceth', 'stmmaceth-ocp'] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff802000: resets: [[6, 33], [6, 41]] is too long
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff802000: resets: [[7, 33], [7, 41]] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml

ethernet@ff804000: reset-names: ['stmmaceth', 'stmmaceth-ocp'] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff804000: resets: [[6, 34], [6, 42]] is too long
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml

ethernet@ff804000: resets: [[7, 34], [7, 42]] is too long
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
	arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dt.yaml
	arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dt.yaml

eth@f0802000: $nodename:0: 'eth@f0802000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

eth@f0804000: $nodename:0: 'eth@f0804000' does not match '^ethernet(@.*)?$'
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
