Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2922C43602
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV5nLM46V6v/htc0lFctV0QauB6Y72+YuHxfHLCch3w=; b=qrTRXAdUkZ6TUU9UIfRIWH7QWY
	z+BGr0NG8rtXMDn9SI6zURALRTOMq4XxwtC7nDCjwf2oH4xB0MHnMZeJKEFKmpHyw4jtoua10f99d
	u88YukffuDUzMsZ0f6NOzavNGTAVAj2xY3Sz+VKH3ROxFa/KsX21FENc9TlJmB+Rosfo7D0OE4/FO
	uaCZvLScX3eA+DwsR6julZcBWJcpktgpQZyv2m9V/xl1pr5KGJ1RMxXs+B9kHItof17dgKmQGU1az
	u0yo5PS+3Hut0KzpxvQPAREn26tHrPqX5shkQ5eDXyyq3SZle0jgrWXw8fRnY0lSyhVF8GHdeqvCu
	WsOc/z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwTV-0000000DNH3-343C;
	Sun, 28 Jun 2026 20:51:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwTT-0000000DNGc-1NG5
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 20:51:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72A9560054;
	Sun, 28 Jun 2026 20:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13A1F00A3A;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679890;
	bh=cV5nLM46V6v/htc0lFctV0QauB6Y72+YuHxfHLCch3w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=H11eCqCwY1jc/+hlN4DaU9CVWUaM5QBNrKK6D7zyITL8TzgdMVTvM0Ta6kjU13c/Q
	 KRKDZe7OQZytTmS/I/KD7V+2XB4+E7+PIMzEtHhgQOqwMZ0HMWA60f8gJTHng+35Rh
	 aX/qNg9SuiN7MYnS+etDBgMXQ2UnxFiPNOQoxb8gd7Wrmxnf9seeiaHRvwCGkMOoiQ
	 yB0gVqIqI7vKsh8FKItB0VepxKqaM+BzKpWvmyQynuLdef30/6KnQKoT4SnC0eUjtJ
	 EdDIXkD/lgjHGy6hQ8OBBgsHeLlpzTbZI55P64RAFovUc1OzIKpEi1jkE3kGkQIC36
	 tEPq2zOItg+BA==
Date: Sun, 28 Jun 2026 15:51:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 devicetree@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988796.4168242.2437491560145176405.robh@kernel.org>
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC
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


On Sun, 28 Jun 2026 17:37:31 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha en7523 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 ++++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 1124 +++++++++++++++++
>  4 files changed, 1506 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


