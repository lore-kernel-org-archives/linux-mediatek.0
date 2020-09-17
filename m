Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B7CC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 17:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52F420725
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 17:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swgATBvc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQwRuDux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52F420725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=00iL1EbJGJOLRVIoorBlPZHvEdoupttfJEM0+yJYThQ=; b=swgATBvcXoZwv88cfiTfoYa8b
	09iVJWBMe4vdTriMPaV6QUYU0m5uMvKrWHaVr86BV+pPY7z+xm1gUukyhfCcp0Xi6q6e7waybbqnM
	XpomEYS3zCnAc61MiWSeXkZKd9jNyhtmbJ2/dAiPZnsGMdlH0t5ECH/bzKuI3hs29oSPVYD1cbIrm
	redrzF1/cFjgTpkLFqGFLaxKKI7CrbRmICPAQJilKmOhU8r79ZiQmr6mfhX3kamS2VHfqgzH4Aa1t
	00lxDfEAFaAp5ZI5vDm652fBlNE5rBOIbvv6TWC5LsrWwKxGg50Kor9GHlqmUhnOijrZzsuC9/SMA
	6CIhGs3kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxmm-0006pw-VP; Thu, 17 Sep 2020 17:33:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxmj-0006p2-2L; Thu, 17 Sep 2020 17:33:29 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52F6020725;
 Thu, 17 Sep 2020 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600364008;
 bh=wNoTCGcfcB/3veX9mEs1zGpPBnfxajFdOgvN0afMW7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQwRuDux4teckfNDKQ3XeTDN+ueiBL9tB+it3+a1Qg22UTK6i5b/CCinsmV4ZL/Bl
 TkpcMJnMm40OKktvu/LZSVx9xyxhyNdN1K4dNoS9qO7g19sG9BWch8y8DaJwxS8BFm
 QA/X58JzpxNkXVYNohgO3bAyf1vnxnH/P07dLSKI=
Date: Thu, 17 Sep 2020 18:33:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: add bindings doc for
 MT6360 ADC
Message-ID: <20200917183322.25fa2aea@archlinux>
In-Reply-To: <1600191369-28040-2-git-send-email-gene.chen.richtek@gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600191369-28040-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_133329_174614_A04E6354 
X-CRM114-Status: GOOD (  19.92  )
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
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Sep 2020 01:36:07 +0800
Gene Chen <gene.chen.richtek@gmail.com> wrote:

> From: Gene Chen <gene_chen@richtek.com>
> 
> This change adds the binding doc for the MT6360 ADC.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
Hi Gene

A few things inline I missed before.  Ideally this wants
a device-tree ack which it isn't likely to get without
cc'ing the binding Maintainers. I've added Rob and the list.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/mediatek,mt6360.yaml          | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml
> new file mode 100644
> index 0000000..2fa2fe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6360.yaml#

I think this should probably match the compatible as should the file name.
(sorry missed this on previous review!)

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6360 and similar ADCs
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  Family of simple ADCs with i2c interface and internal references.
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
As it's fresh in my mind from forgetting it myself, can we
add

additionalProperties: false

?


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
