Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D623C49EA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgnaznxSgTsw+Hz4vpcHiCw+uJmtLhH2qxl57lz7xEM=; b=nYRbzrpI9sfv8KZ+LMBSNjBnK3
	eU4IXsgOlzjKfTk8+ZQjb1DVroF8zZfpZtRm7FYiczoqjZxwZuzc0ff3P/z66lL6amHcgHH0LG3IW
	fY9atFD/0ncFG5efos9Nn4yrC8e2HfdjKiYuEGTPJABS9se07u/s5ThIifgbG0Ie17xBzy4/zLZMv
	YmD1qvJBHnYbO2W//RI0PZZisXjzZzI8SLcjt0ljMHv9PxnT0uvGt17YCn7c48mifrWs6WXEmOJ2n
	tYcr/IddJ61DRnj2UbgqpmbIHrT4czRlgaiyB7Lz+guez7DHbJhi0uhthttteAgwOfTKUMVU9LMVp
	Ss+2HudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKa2-00000001r9p-2G4i;
	Tue, 06 Aug 2024 13:50:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKZT-00000001qzF-2dWl;
	Tue, 06 Aug 2024 13:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FEB460FB0;
	Tue,  6 Aug 2024 13:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB49C4AF0C;
	Tue,  6 Aug 2024 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722952190;
	bh=7Fj6iXQavHEBQ/OXyI4nQyRBkFHbAOtHSNw+coO/Jmc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=C6IosOejvTp6hc/OZrROGAQTp+jAdCdCIsw30gY+ymjD+PCt8DbtESVODhAh4GBcH
	 OAhQsVd6fRSqlAUMwsLqOXa5I4H1W+qGP7BzkAD+cWFmTcoAaMo5pw2ut+HG55keoY
	 IiP7rmR6d2nrjZyRT8jJ2mbZlI8benIjuzAuZYo0oMH81P3wGyyk+g4JwfkDRYSyRZ
	 e8G0mYjXzpklmdieIdclzpZLNmwEqZwz5aNUJdoF8FmcQy3AIwcRmPIEVLXpxV/eUW
	 z6hBipsMB4w0DkmRRtcMET6DMBC7I9JzDhiO+gb4OOD1HSkm54akN6FOktGToXeEE8
	 X4Z9odB1Rj+MA==
Date: Tue, 06 Aug 2024 07:49:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Macpaul Lin <macpaul@gmail.com>, linux-mediatek@lists.infradead.org, 
 Sen Chu <sen.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Bear Wang <bear.wang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <20240806122507.2766-1-macpaul.lin@mediatek.com>
References: <20240806122507.2766-1-macpaul.lin@mediatek.com>
Message-Id: <172295218959.1231449.7916299490960765265.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_064951_740345_7A6BD038 
X-CRM114-Status: GOOD (  11.08  )
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


On Tue, 06 Aug 2024 20:25:07 +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../regulator/mediatek,mt6397-regulator.yaml  | 275 ++++++++++++++++++
>  .../bindings/regulator/mt6397-regulator.txt   | 220 --------------
>  2 files changed, 275 insertions(+), 220 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.example.dtb: /example-0/pwrap/pmic: failed to match any schema with compatible: ['mediatek,mt6397']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240806122507.2766-1-macpaul.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


