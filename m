Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1794CD1296
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2zGX0Nb7XGXVaIZzphruqHiMnBkqgX68Z3rMQ8nP3M=; b=gT2on6mvUqykFrKrTN1XF07M/E
	zZW+wGgXC4SrDBIBq1rxoHGCTKeUwcxZRnYQqeL2a5fjs6PFECWkKE5+RJVx5BxJwLXnWaEeyFgpl
	LXaCUczb103HTxXtJ+AMi5wgSDPB0beUIxAoyhIlso53htVp1ywrbMLe21FZ2grhaXa2wQ5aBZ/R0
	d3i0AUSi1GR4ZFEdFPWjmpaLkNaHH9+X67102zi4mV/XcPMMWu/tJ8GBcuTgU28EIci4r4/zy79TO
	kwXCEUBMRZK+PRtS1MKPHdrlAZB5BYHbVo4pToS789sI6rZbKNskb3IyUQjchgmCUXu9H2qVnc18G
	ZbHLoS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAJP-00000001rpw-1bz6;
	Tue, 09 Apr 2024 12:10:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAJL-00000001rof-0X58;
	Tue, 09 Apr 2024 12:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 676C5616D4;
	Tue,  9 Apr 2024 12:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED3EC433C7;
	Tue,  9 Apr 2024 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712664646;
	bh=Kqt0iwwTPC3AOYTlEZgew0NErAZ3Ys/2OHVWI4y3Xd4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eF1TAvKhRb0ECUTHSgTfdE50JOT/NZ1JcNC1PvF4Q/IQymUhXQ0OKu7tcU6E2gt1Y
	 JBfBEJEiL7kboOpY9vf5D5sQyRNv7jVstOpNjWGTKb74Fso+biJHlXXyQxcD8DniMX
	 3sMQRksrPADdIEwwz1rRpULXWQCBv4tdIQQZYvmGTFVchOQRU4lvxn6U99BgjSBtbr
	 //vjZWzhQcwOwONnIzsnnTm2lZnwb/OlSXc4z9NsZCQAr2wMelgrNtbuN6S5van+GB
	 MZg7hF5JXU7tJreJXYtnvzCOeAympCSPPG7cBsJSor/mL82KsJPKkvTCCqUsVhkWtC
	 IlagK8/TsStug==
Date: Tue, 09 Apr 2024 07:10:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-media@vger.kernel.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Flora Fu <flora.fu@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Will Deacon <will@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
 <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
Message-Id: <171266464251.692374.12025555863069807976.robh@kernel.org>
Subject: Re: [PATCH v2 03/18] dt-bindings: mfd: mediatek: Add codec
 property for MT6357 PMIC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_051047_248109_96A30B33 
X-CRM114-Status: GOOD (  13.49  )
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


On Tue, 09 Apr 2024 12:13:24 +0200, Alexandre Mergnat wrote:
> Add the audio codec sub-device. This sub-device is used to set required
> and optional voltage properties between the codec and the board.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/mt6357.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240226-audio-i350-v2-3-3043d483de0d@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


