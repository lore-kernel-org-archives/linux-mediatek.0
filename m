Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03FC83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg5X3/u/3xESAJn8EkLN7/Uu53H2nHaIISnhIL/cHmg=; b=OR2e+Va+U7j6p57fLB2cbkHcRO
	I7dx1TCA5pvH5pi4mZcU5Gp5e4P0/nmwhGnZ4iTYD8Rtq6RVYbYKzomJRnw/tm5B7+E1dbPzTciZc
	whMYishPrnAJ3QUeSeBmeaKIqnT82fKVbl5+Pxg1awmRL/x8w82gtDk2g08QBzYeHuJnadLY2sDeM
	L3oGQvYQFkFjjr98DgMAOX+GXFH9rkypj+cVqfR5xneF3hbwAp4VRvpWis9ksAWZ5JrJfK8EKeN9J
	L96N6kYIavcVLGh+nyh0NQ/9frmIBYD+73sJeeAoMkw7mYbbO2pm+PzL80eWA+ys3PNh07kVYVXw6
	xsoiEn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOE-00000007bIb-2nyY;
	Thu, 24 Jul 2025 13:53:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetz4-00000007K9F-0O5S;
	Thu, 24 Jul 2025 11:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC7E44662F;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E977C4CEF6;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355973;
	bh=5cTdoI2rOUe6G6HT5nFkVFTBctNxOCQYi0uviPnvs+g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KANGt0ebto1MONaBI3ARQ7iBvAyPQDgayh99q1orDfo5Er0bg7f5vzXeCc2U1ZKU9
	 7AIietCqp0u2n/uzXq2vyZXtIUALbpWNrw68ovOF7GDqPSQHH6aoG+Vcp2I5P4CuLc
	 WDpVL+fFrBAsHRjDnxbIvYeONye17mTyba5lQKQ5X+aqK36r0WZGhGI89WPQibT0mJ
	 ww9QIa3f7q2k7n213+Sfl8DZDJV3ErIdW5dEejEW6SvtxobVppRrm54brUQktp6fp7
	 P5KrvWdRk9ylcHJld7sId3USeqBmub4mDblrJjjpqLvTCWCXGiXyWRzx5OcPxXR9qQ
	 IY5rKBj8p/g8A==
Date: Thu, 24 Jul 2025 06:19:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597003.1587784.8284498888882102911.robh@kernel.org>
Subject: Re: [PATCH 09/38] dt-bindings: pinctrl: mt6779: Allow common
 MediaTek pinctrl node names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041934_167705_1A5F0B4B 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: jassisinghbrar@gmail.com, daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, herbert@gondor.apana.org.au, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, chunfeng.yun@mediatek.com, andy.teng@mediatek.com, ck.hu@mediatek.com, linux-media@vger.kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, sam.shih@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, mripard@kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, vkoul@kernel.org, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, eugen.hristev@linaro.org, krzk+dt@kernel.org, jieyy.yang@mediatek.com, atenart@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:45 +0200, AngeloGioacchino Del Regno wrote:
> Allow node names like "uart0-pins" for the main nodes and "pins-bus"
> for the children to make this binding consistent with the majority
> of the other MediaTek pinctrl bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dtb: pinctrl@10005000 (mediatek,mt6779-pinctrl): mmc0-0: 'clk-pins', 'cmd-dat-pins', 'rst-pins' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-10-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


