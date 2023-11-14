Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47286C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiASBl9VrAjzQgmOuXmfWuxNZgNwYoFGLkzwqXtE/qw=; b=Gsu3qpzHcfKOeBqtNy2oqFkg3y
	bTbNychlOeaN76ukIMdarDRZHNoHndDAtgKmHqRbruoRNhEzHg/g3VoiIdePJ7bR0FTykMy3ANU8z
	6b/d5gBAlvA4I20QPRnmbd2TfycOGx/iNIrI0koZqs9CiLxrntTupSr0bmiAmFr6KoMbKmvV94q9S
	Nfd4ZGHBkK7pW66t1iqEOdLfQ0ZcWdfGhpCCrBdJM0jx54fO1vuta6EtkiMCJ6j2ajTkAX1X3UnHQ
	PJ62n2z2yOPH25m3/VVgg8H/23yItavVTkSxdhwmruggfVirLqLo4d5KOF4fXCAny2gVIJ4NGeq+o
	WSj+8pYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ttj-00G6Ib-2r;
	Tue, 14 Nov 2023 13:56:11 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ttf-00G6Hz-37;
	Tue, 14 Nov 2023 13:56:09 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so3451063fac.0;
        Tue, 14 Nov 2023 05:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970167; x=1700574967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiASBl9VrAjzQgmOuXmfWuxNZgNwYoFGLkzwqXtE/qw=;
        b=al2wtoKjKz6XcyyF7rILVuf4rw0CTMgd1p0a/qJvlbOHcpJ2lZTSRiV1IZ6csC6DS1
         jf2koThvrXzPTrPJ+2l1ewU6hBGE659TyFH1dP8eDL+TDK5/+ERa2RVuXG++4QMrW/Uo
         e+01pAimxIqKKb57CUY2sbsGzLiOS/f7X6JFMxQbvhzn3GM9gF1gjEC1cYdLcVly0GE/
         qAs7hfEUNeJNQLgH1rlXk2ksfEnIal+qh8KjeOfl2VPLoLSLgeGZdJuskaPG6orLK2MG
         /WQKJvN3PiodOxZhKdpEwx5fKm/THuVTOfy3TcHdDCfBCFLrVwZWd2N8dtJEm83v3AVg
         8IDQ==
X-Gm-Message-State: AOJu0Yx6VoGeKfCRjEvWBIUjTxiPizilrF91aDCebjtQtTYzDWQ+b+qI
	c5XUqtdl9hb4LHx2lpCnlw==
X-Google-Smtp-Source: AGHT+IFYOuCtYvhZonQy046WfyrIoy4A+vOjsLbnefhLS1WXzW1gHM/v6TjGpVo+25v7X/N6wfLMGQ==
X-Received: by 2002:a05:6870:40d2:b0:1e9:d8a4:551f with SMTP id l18-20020a05687040d200b001e9d8a4551fmr11788936oal.17.1699970166709;
        Tue, 14 Nov 2023 05:56:06 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ec21-20020a0568708c1500b001e5ad4b2f65sm1372872oab.19.2023.11.14.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:56:06 -0800 (PST)
Received: (nullmailer pid 1664148 invoked by uid 1000);
	Tue, 14 Nov 2023 13:56:04 -0000
Date: Tue, 14 Nov 2023 07:56:04 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexander Couzens <lynxis@fe80.eu>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 5/8] dt-bindings: net: pcs: add bindings for MediaTek
 USXGMII PCS
Message-ID: <20231114135604.GA1661768-robh@kernel.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
 <2dff6aff7006573d3232ec2ddd93c1792740d4d3.1699565880.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dff6aff7006573d3232ec2ddd93c1792740d4d3.1699565880.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_055608_005319_4CA833A2 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu, Nov 09, 2023 at 09:51:47PM +0000, Daniel Golle wrote:
> MediaTek's USXGMII can be found in the MT7988 SoC. We need to access
> it in order to configure and monitor the Ethernet SerDes link in
> USXGMII, 10GBase-R and 5GBase-R mode. By including a wrapped
> legacy 1000Base-X/2500Base-X/Cisco SGMII LynxI PCS as well, those
> interface modes are also available.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/net/pcs/mediatek,usxgmii.yaml    | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
> new file mode 100644
> index 0000000000000..199cf47859e31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek USXGMII PCS
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The MediaTek USXGMII PCS provides physical link control and status
> +  for USXGMII, 10GBase-R and 5GBase-R links on the SerDes interfaces
> +  provided by the PEXTP PHY.
> +  In order to also support legacy 2500Base-X, 1000Base-X and Cisco
> +  SGMII an existing mediatek,*-sgmiisys LynxI PCS is wrapped to
> +  provide those interfaces modes on the same SerDes interfaces shared
> +  with the USXGMII PCS.
> +
> +properties:
> +  $nodename:
> +    pattern: "^pcs@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mediatek,mt7988-usxgmiisys
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: USXGMII top-level clock
> +      - description: SGMII top-level clock
> +      - description: SGMII subsystem TX clock
> +      - description: SGMII subsystem RX clock
> +      - description: XFI PLL clock
> +
> +  clock-names:
> +    items:
> +      - const: usxgmii
> +      - const: sgmii_sel
> +      - const: sgmii_tx
> +      - const: sgmii_rx
> +      - const: xfi_pll
> +
> +  phys:
> +    items:
> +      - description: PEXTP SerDes PHY
> +
> +  mediatek,sgmiisys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node of the corresponding SGMII LynxI PCS.
> +
> +  resets:
> +    items:
> +      - description: XFI reset
> +      - description: SGMII reset
> +
> +  reset-names:
> +    items:
> +      - const: xfi
> +      - const: sgmii
> +
> +  "#pcs-cells":

There is no such property defined.

Rob

