Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CE3CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKci1P0Snfr9luwNpbOBGqnTsM0ycPRFM93VesYrhxE=; b=vUObeA1xQbhL2TaIfZqkkoTZfU
	frncHzNRcKejqdrBhj7S1n9feXnc55eNkisdAfPV/LChyxtl9utemoB645o6YBQjns0nvX3qSGkT1
	NRJRU9ft/smLhnL+sJ5OiJNpcq6P8xmJvC0NoO9cBkJRrly6JPX1DrfyxI8Hek8cCYJLMDbV8Z+if
	84r2aRT0c0/zN3zPP04DyGm4iNXlD4AhkloxxVfs552Z6gIC3N3hEaXiDa/2cJoUBEmRE3pliEP/t
	A1iaISSmie7gCknm0WNQJdCwjLY5117ypd2oIRpTxZNktHTqnIi3+ZnxDqscXEQ0VlEArBWQ8HrfY
	DAf5aPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0md-00000006Erk-25Wr;
	Fri, 30 Aug 2024 12:31:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0kq-00000006EK0-1iYY;
	Fri, 30 Aug 2024 12:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41484AE3F7C;
	Fri, 30 Aug 2024 12:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FC3C4CEC2;
	Fri, 30 Aug 2024 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020966;
	bh=dWcO4HpmxD2VUhZ0j6XxpQ5q7RtFhg5rZL51PUt1w2I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=i7r9MGDWKFdIUkU0YekBibM1WFwxMlYCk5qxWxdeCbp4l4DrC/Q+s5zC1z8vrYGSy
	 vL8fOqwV/DL2Hti30wTdcn2nvdEoLPT5Yw92x/H1R7eqrGwNqvfx0/U3WJJtqUFZYR
	 68/wATucLIxOONL/A28TQOMK+T0AIdNvamp3dLqHzbj2TSd07iaKLvqFXu5xZfiqgE
	 btVgyGLHYqWYXEllwk1polYJTO84ctWiw5xuj0yLS83WpN3k9MpDvicJud8EJUGWEZ
	 9pUEIUAlhyb9p7Jrnz7MI9+KAJVnd/XEgOVVqDZVbe5pDR03k9eNT30L330htOnqHd
	 eFFifg3u1sTEw==
Date: Fri, 30 Aug 2024 07:29:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Sen Chu <sen.chu@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul@gmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Bear Wang <bear.wang@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, 
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, linux-rtc@vger.kernel.org
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
Message-Id: <172502096265.3785833.16915280284565594254.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: mt6323: Convert to DT
 schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_052928_749077_997DB81E 
X-CRM114-Status: GOOD (  18.59  )
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


On Fri, 30 Aug 2024 19:07:26 +0800, Macpaul Lin wrote:
> Convert this from the old style text based binding to the new DT schema
> style.
> 
> The examples have been trimmed down and move to parent schema
> mfd/mediatek,mt6397.yaml.
> 
> Add new maintainers and submitter from MediaTek.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../regulator/mediatek,mt6323-regulator.yaml  |  84 +++++++
>  .../bindings/regulator/mt6323-regulator.txt   | 237 ------------------
>  2 files changed, 84 insertions(+), 237 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6323-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> 
> Changes for v1 and v2:
>  - This is the first version of converting mt6323-regulator.
>    This is because converting mt6323-regulator together
>    with mfd/mediatek,mt6397.yaml, so we've create a patch set
>    instead of single patch for each skydives.
>  - This patch has been made base on linux-next/master git repo.
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml references a file that doesn't exist: Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml: Documentation/devicetree/bindings/regulator/mt6323-regulator.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240830110732.30080-1-macpaul.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


