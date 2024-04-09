Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2F4C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyjjnM2IGz5DaOmkGdNiPWRrULNvhgtZsdttg/HjAJk=; b=jmgnwFsr4N8oXq/P1zBA1YCdRA
	XTqPt4s9san2DDIZKt67DlDdqQTXHBcxYSshFVw1caUic4PQvxUs80FSE+SB5tZyPmoCwJZN1/C3U
	/E68eMIHjJ8SAOsiHW7x1HCQmgS2Jab7vbM1nlxJvQ3On5Hb/9q0apf3hrimuXx2fYlZwJciWLZQD
	bNcU6ODvleAKInf8gACGco4USVVuxhhJftWbhviC+SNWNTzXpxYStEoaif+pI3NBTt6Y8hxXjGloW
	/DUsNGC+kWfPbtua6B87LKjlLUl1mO4grDhHhBPhGyX59gpuDKhU/pO6fpceq/ICfb1BwhRMPUf+L
	iplSzAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAJW-00000001rtr-0PZE;
	Tue, 09 Apr 2024 12:10:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAJN-00000001rpE-2K00;
	Tue, 09 Apr 2024 12:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEBDE616E0;
	Tue,  9 Apr 2024 12:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACE4C43399;
	Tue,  9 Apr 2024 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712664648;
	bh=qPcpjQQA+x/Lp3zoDAguMcAnH3yp4AUeYMdHe1M4OcE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Lr6otbaZHkCwc8rTE3hO5aEBmzcZW1GmC9RB07B4BUlkpRRo/Dj2uW7ymS7cIqQtf
	 TI2U0yDOEl9WMMGHLaetqQHVpaud3bzGlHx/8A3G2rWc1KZvLSMiSxIrR2NQODkaNx
	 S3F/X6kQBtaW8yaX0qCwVBdU791lVnJAxFWyXEvnjr8FcFPkrdf6HjM6YoWDjtL1sA
	 /JSfcsu/7hCuCFyx4sBOlIDjyxfSf8VJqnSUS3MRT6HWxVpvdE9IcXtO1vs0ACEucf
	 io9RlHyjH0Z/JkbCJmtALKfb5HFty6qkFWsqmjkNQmx0Vd9rkRpc5aK3MNjNdTsR3u
	 Q7nZ6uDer/jzA==
Date: Tue, 09 Apr 2024 07:10:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Flora Fu <flora.fu@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Takashi Iwai <tiwai@suse.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
 <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
Message-Id: <171266464354.692403.15935267584546388532.robh@kernel.org>
Subject: Re: [PATCH v2 04/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_051049_661683_C94AE1A7 
X-CRM114-Status: GOOD (  13.12  )
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


On Tue, 09 Apr 2024 12:13:25 +0200, Alexandre Mergnat wrote:
> Add MT8365 audio codec bindings to set required
> and optional voltage properties between the codec and the board.
> The properties are:
> - phandle of the requiered power supply.
> - Setup of microphone bias voltage.
> - Setup of the speaker pin pull-down.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt6357.yaml: properties:vaud28-supply: '$ref' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240226-audio-i350-v2-4-3043d483de0d@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


