Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97394C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk66Iju/xngc/XEIZLJNJZ9vlcxm48cJDJ/MVo2am+4=; b=R/N/9Csft/xRJgBEOpF67QMS1A
	cseE/7qs1G/WEtBHrDbMs2WYNir0IAJ+d1MCtppy5JShavihH+FQaLye55EkbnzUqfSNNcsKe1CWW
	uMpbWaaI+9Zm07BUnin4EIieHWCc3/YyFEmfGvbUW2UGt1XEq+FM9y1K55xHhsomp5H5kDkiBYS2F
	cQiInzWe7JGUCDgwDc12M094jgDUuOajPU9TaKojnkfyVr4trpFEg8YNO2P7WSdOU6VKO0MLRIDBG
	6QssxZLGWeNTzL/hBJVkaLQnDaniSfK/AYdxJr0geWCTbKF9Jl6C2fkCGULKsqOb3v/rQh5iE+Dyj
	D/yip2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF0Qw-00000007tEi-2ca1;
	Wed, 05 Jun 2024 23:52:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF0Qs-00000007tDn-3kLp;
	Wed, 05 Jun 2024 23:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3981960695;
	Wed,  5 Jun 2024 23:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859B8C2BD11;
	Wed,  5 Jun 2024 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717631561;
	bh=D40azPYuyjyFS271o7gUSoGXiWfbnmEKNZnN0GolfHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BINy/SMUuVd1h84CY5U+AbCTUyILx9goti7b30aQo5Q5BvQcS4JYjAU4IHTcR4dCF
	 9lKVnAAOyf6xsHTs0DSBK8hcRxMSq8BENGCOkHcq8RyhRlsvFz1RJvyV7/Dztsc/BW
	 pJEcxTv5J1Nj4MjJqezZX2U52uB10zHESfmFTS8vNbeZ1BvGywkmQsnr6lFz5vdyRn
	 DPgTuXCU9bhQfOihQ+eeT/rhVM5CK3fLP91daf5q2qdUutBaoMt4p5yimflWAWAGvx
	 cYlpHnW8FEk1LbsUOnrOmLFheGUobQISH6CuLY71M0A+RAVIgGC7DCaVe31MWJO+nz
	 7w2RT3bfPB9BA==
Date: Wed, 5 Jun 2024 17:52:39 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
	andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
	dlechner@baylibre.com, marius.cristea@microchip.com,
	marcelo.schmitt@analog.com, fr0st61te@gmail.com,
	mitrutzceclan@gmail.com, mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: Re: [PATCH v2 1/5] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC
 AUXADC
Message-ID: <20240605235239.GA3455504-robh@kernel.org>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604123008.327424-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_165243_208682_4D8CF489 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Jun 04, 2024 at 02:30:04PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
> providing various ADC channels for both internal temperatures and
> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
> usually on a 3.5mm jack) other than some basic battery statistics
> on boards where the battery is managed by this PMIC.
> 
> Also add the necessary dt-binding headers for devicetree consumers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../iio/adc/mediatek,mt6359-auxadc.yaml       | 33 +++++++++++++++++++
>  .../iio/adc/mediatek,mt6357-auxadc.h          | 21 ++++++++++++
>  .../iio/adc/mediatek,mt6358-auxadc.h          | 22 +++++++++++++
>  .../iio/adc/mediatek,mt6359-auxadc.h          | 22 +++++++++++++
>  4 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> new file mode 100644
> index 000000000000..6497c416094d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6350 series PMIC AUXADC
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> +  in some MediaTek PMICs, performing various PMIC related measurements
> +  such as battery and PMIC internal voltage regulators temperatures,
> +  accessory detection resistance (usually, for a 3.5mm audio jack)
> +  other than voltages for various PMIC internal components.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6357-auxadc
> +      - mediatek,mt6358-auxadc
> +      - mediatek,mt6359-auxadc
> +
> +  "#io-channel-cells":
> +    const: 1

Why do you need a node here? Just add #io-channel-cells to the parent 
node.

> +
> +required:
> +  - compatible
> +  - "#io-channel-cells"
> +
> +additionalProperties: false

