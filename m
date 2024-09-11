Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE93EE57D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 22:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JogCjySRC80YF0ex1UaFJSS1dp4mLwXt45S42undRuo=; b=0v6lKVXjQNZSoDn7szbS/bJDQ9
	lRqJxkzdrQ/9vsPTXXasjTDKciQ3mpbaefv59a/104CsZY2osRDUdROdvmuQHJ5upiCCSf71/StPR
	Gs3kKhSMOSFBkVj2jBdxrNhXax7tStcaePk7Ld5eofE4E08/+itFgIL+21RggR+alJ/EU+l9vqRjC
	W3ltWNhx7mff55uv3CT1xhvzw1zGmjNs+LF2eRuxwr0kzCl/WRUGpy05vVk50l8SmwMXpg6lbbBBB
	lmiXKObPzR4KBf3rK2uXDROdynr9W27HQ5Jykgv12slIK7HdQVkauVhkXyrIXX4W0vH9GiNZbEV7u
	ZgdO8ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVcm-0000000B9pD-15Wf;
	Wed, 11 Sep 2024 22:15:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUdf-0000000B25u-2BiB;
	Wed, 11 Sep 2024 21:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D351AA40D70;
	Wed, 11 Sep 2024 21:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C7CC4CEC0;
	Wed, 11 Sep 2024 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726089154;
	bh=5a0w8ihru5qeC1bAlX8IIJJGmmGbilmT8scRcWg0ahA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WsFpgDS29CG1HpRsl8+NLTApWl4Sk5Z/UdIDjxFdJPrjYnA7mL4/Cgl1of/aGeLJg
	 0+HpcQ0YpWeT5UQQbj8qoFVi6G/aQtjztE+rGqMXZl2NDzCBeeP6mN/kLZSyMvMWEJ
	 Xabm1tkV1Lc1X9kUMUtiP3H38wvx2mBXjsvO+HqdDXYC9R9Uf/BfC1iCE09iSg0Tv1
	 jFiw7YzttU262N25tdo9BKYSIUY/QPMqXHlo9M48FrMjP2nK8g/isrVQ5UmDHaLJ0G
	 yoH+xzzMXtfXY/9ioTlhjq46IOH61Pu8wRsp+dGcVgUU3EXcM1Jj3OzQ1Ez3CvfSCZ
	 5B+Ys6fXPvFeA==
Date: Wed, 11 Sep 2024 16:12:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Sean Wang <sean.wang@kernel.org>, upstream@airoha.com, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 benjamin.larsson@genexis.eu
In-Reply-To: <20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org>
Message-Id: <172608915149.1388705.7137335166206916411.robh@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: airoha: Add the chip-scu node
 for EN7581 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_141235_647333_F35BDF71 
X-CRM114-Status: GOOD (  12.79  )
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


On Wed, 11 Sep 2024 21:50:01 +0200, Lorenzo Bianconi wrote:
> This patch adds the chip-scu document bindings for EN7581 SoC.
> The airoha chip-scu block provides a configuration interface for clock,
> io-muxing and other functionalities used by multiple controllers (e.g.
> clock, pinctrl, ecc.) on EN7581 SoC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


