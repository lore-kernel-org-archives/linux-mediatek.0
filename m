Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87073C3065A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdNMm9P0hulJ72BR3Z+Yw/nhilcfGjN3Yz6kQOBvxQw=; b=wvrjJBr7QNmUDIAo3VbIs0VH/L
	8FbKjDndhrUdrIu/A+MOdY1ecOjhpYqfhnAkxKrGmzEjUZtrq2Fq/5kk9oEtacK9Ovy3kIlk76Rbg
	zh7//jhT5mt++MBKXHCz5bGMZV3tHylWNzVnqBPNfuWePR6kf1aFk9dvDW/thk78wx/0gbXSYfGq/
	J0RXIjnPCtvFXPHbD3WAvpBMHtEd0lOOf+7cd+NCB5RN+QZ+wH0fyPujum6TL/JeSFktHuZU0vr+5
	nYV7+geZBueiV2UhQFf3JYbGtWG9F1Eveiy622zwF/sZAsvWpaN2f6oi4yFVvTuJBIPQlOLUpRHKS
	WIKsTdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLxi-00000004VJL-32xK;
	Mon, 01 Jul 2024 18:41:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLxX-00000004VGD-2BS7;
	Mon, 01 Jul 2024 18:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F8EE6175D;
	Mon,  1 Jul 2024 18:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD09FC116B1;
	Mon,  1 Jul 2024 18:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719859262;
	bh=b9t315kB2irXXTEOqh+BPq5CDd3WoseJBjsx1O8vZSo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fX88dpFKO878qmBPMIG3r5lwS2ifsBgzlaZduktbIrYVmU/6VJf1obFf44anDXWnj
	 bq0pX6Znv9d8lZ+NGsuUm5BcO84WNxJJcJ9bCoIn1Ff8k3OwVsKVH9l9rh0jZlaXSo
	 vQurBqp789lZAI3w2Prz3qDD+ugCN4NNqdadOYg56BrSmXNUM8obZxOPuCnFH8pFpq
	 WMzSrEvPR0mE+sikN668ATSUPsi1XKeRDgp098UAHSba52z7o0CxoDcwq8JtnG65pV
	 sXIR9fHY/CRLXtW5Q46XxpjDFu5SLP2RMYjdgCFRC0GnlSra41TnX3p67DVB9ycr+u
	 MwZYgw0UmUCOA==
Date: Mon, 1 Jul 2024 19:40:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com,
 kernel@collabora.com
Subject: Re: [PATCH v2 0/5] MediaTek MT6357/8/9 PMIC Auxiliary ADC support
Message-ID: <20240701194052.2702a3da@jic23-huawei>
In-Reply-To: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_114103_713457_BB3CC9C7 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue,  4 Jun 2024 14:30:03 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Changes in v2:
>  - Dropped 'mfd: mt6397-core: Add support for AUXADCs on MT6357/58/59 PMICs'
>    as Lee J already applied it;
>  - Added patch to describe the ADC subnode in the MT6357 MFD binding
>    and moved the example node from mediatek,mt6359-auxadc.yaml to
>    mediatek,mt6357.yaml
>  - Added 8-bits {s8,u8}_fract to math.h
>  - Addressed reviewer comments on mt6359-auxadc driver

Applied 1,3,4 to the IIO tree. I'm assuming the mfd dt binding update
will got via mfd and the dts via appropriate SoC tree.

Given time is tight I'll gamble a bit and push directly out as togreg
rather than normal exposure to 0-day first.

Thanks,

Jonathan

> 
> AngeloGioacchino Del Regno (5):
>   dt-bindings: iio: adc: Add MediaTek MT6359 PMIC AUXADC
>   dt-bindings: mfd: mediatek,mt6357: Describe Auxiliary ADC subdev
>   math.h: Add unsigned 8 bits fractional numbers type
>   iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC
>   arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs
> 
>  .../iio/adc/mediatek,mt6359-auxadc.yaml       |  33 +
>  .../bindings/mfd/mediatek,mt6357.yaml         |  10 +
>  arch/arm64/boot/dts/mediatek/mt6357.dtsi      |   5 +
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   5 +
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi      |   5 +
>  drivers/iio/adc/Kconfig                       |  12 +
>  drivers/iio/adc/Makefile                      |   1 +
>  drivers/iio/adc/mt6359-auxadc.c               | 606 ++++++++++++++++++
>  .../iio/adc/mediatek,mt6357-auxadc.h          |  21 +
>  .../iio/adc/mediatek,mt6358-auxadc.h          |  22 +
>  .../iio/adc/mediatek,mt6359-auxadc.h          |  22 +
>  include/linux/math.h                          |   2 +
>  12 files changed, 744 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>  create mode 100644 drivers/iio/adc/mt6359-auxadc.c
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> 


