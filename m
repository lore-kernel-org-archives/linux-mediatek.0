Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB275C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E02206D8
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YosWV7A/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zMRKSbKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E02206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ZKHiCHLUFcKSVvNCHS9si0q52x5AVVammse4WIbVCg=; b=YosWV7A/xkCGISa9WAqtPKf6D
	2fLRL7/vD6smXsMccGZIiWAyQs8k09xuQYFT++1T0KexgR+G4YGTehnOgTcJ7m2X+fzwHuO88dZXt
	oHh+s9pTreOBrOLqQ9SfRMQ83/OTAM0jkRTEM3WPLYv0neELiLN4dh7WVbdPdotoe6FAUcHj+KRSp
	OQ/D0UYpj6JY2auzxY825QrwGmGZFAyFOca17WByiWrmGkcEQ0Eh2b3g0xPxvsSWKiB4dX11ubJa9
	82BouKguyX+QXdBomFO+Lr9sQBySPg4eU9qLGZKoonN3uRJ99147jYy7MhUNTRK22NGj9v2rLaHyN
	mlhBwXyjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZFNe-00041m-KB; Sun, 01 Nov 2020 15:34:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZFNa-0003zx-2h; Sun, 01 Nov 2020 15:34:51 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C12E206D8;
 Sun,  1 Nov 2020 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604244889;
 bh=UQsIf8GFwl4kaVslPomFKf2DtFdFx3IH16pt4zhUhac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zMRKSbKUpkqBBgZVawdbTDRoeSpvmRXcBEj6F3vpER+NV2SIFjdhmcrm7tFjW54SJ
 hiX6v0zQ7UFfkN4ScSsfHz2h+ExlqB3F5QRAtqFBIIeObISAhiG4X4eoiUV//svDqn
 TM3blzDTiU1QFr1mq/oJp1U+LVvNpiRuE+hno1Oc=
Date: Sun, 1 Nov 2020 15:34:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: iio: adc: add bindings doc for
 MT6360 ADC
Message-ID: <20201101153443.3826103e@archlinux>
In-Reply-To: <1603181267-15610-2-git-send-email-gene.chen.richtek@gmail.com>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
 <1603181267-15610-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_103450_264056_46696772 
X-CRM114-Status: GOOD (  17.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 16:07:45 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> This change adds the binding doc for the MT6360 ADC.

One thing I'd previously missed below.

Jonathan

> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6360-adc.yaml      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> new file mode 100644
> index 0000000..a7350ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6360-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6360 and similar ADCs
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  Family of simple ADCs with i2c interface and internal references.

That seems unlikely...

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360-adc
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#io-channel-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    adc {
> +      compatible = "mediatek,mt6360-adc";
> +      #io-channel-cells = <1>;
> +    };
> +...


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
