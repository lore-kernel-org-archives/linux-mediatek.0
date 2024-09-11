Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9905CEE57DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvPTu3eBRwDFUXWZs6EvB2xyqAAuRcdP/94XD1fzpXM=; b=CEhWpOIXgjLMTGoN4MIrcMGd3C
	GgPaZErz38Da3LJGcsgWliMSlYIK1kFeGiYH39p4g95VMyUGWUCvoMU0+MEPm4vF2jAz/SfbnneV4
	QhuBdCSLWGTKG7WO9BvWQsqzL6E/RWe4uT1+wMdP9BOEzP2HJNKT8JAABS9BVlT51nnufB98pYZmH
	zXaUjUL461A8r4z2SpwLgGn5/iScTU8Ugw4+aI39LUjY/YpjD9LAu0L6f+DLhsA34KO9C8N7GY7F5
	k1GJwdR0YewunmUhzZwnkyI+7Acx1FVQIQo9MJEa2P1RFkeUkngKs8DfhSE7Mv5MixlqfFzdj9HNA
	5axC6KdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUfk-0000000B2GT-0KPv;
	Wed, 11 Sep 2024 21:14:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUdg-0000000B269-306x;
	Wed, 11 Sep 2024 21:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32F3B5C06FF;
	Wed, 11 Sep 2024 21:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44014C4CEC6;
	Wed, 11 Sep 2024 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726089155;
	bh=wOVduJbjzj6PScPe3zlHFXdKTREvpbAlj2t1B+3xlWk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=OV3oa76qOPG4Eun3JZVeDRaD4vdDNEWIcd4JOJdgYfNycJEdgGT71urNht/nt7vZ2
	 E+p2XnOLvnJ17hwlpRP+MMMmlg176R9ARJ0w3+0kdKn7NvC+tGbyhon6Of2z8x58tu
	 Hi4JLLEaYUpL1zKHbSxJn7w98ICSoNja3ygzzGfyb20PkP7i/E9UcUqWddSDuVu5qM
	 Ygm3QyGNsBzR0eS+JYgMIg2Tu9d9OF1sDzjWLakYIv6c4ZSz4nwey0dy/8+t+Xc6QI
	 v2emNEYMIFcCnmP0yGyXRzhnyNSjHhYrmxFQnn9hKu7P4sxVZ41EDDTGERoq2ux4GG
	 IJ8+IqaQooGVg==
Date: Wed, 11 Sep 2024 16:12:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-mediatek@lists.infradead.org, benjamin.larsson@genexis.eu, 
 upstream@airoha.com, ansuelsmth@gmail.com, Sean Wang <sean.wang@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20240911-en7581-pinctrl-v4-2-60ac93d760bb@kernel.org>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-2-60ac93d760bb@kernel.org>
Message-Id: <172608915288.1388772.4934918553914498433.robh@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_141236_841595_89EB5837 
X-CRM114-Status: GOOD (  12.95  )
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


On Wed, 11 Sep 2024 21:50:02 +0200, Lorenzo Bianconi wrote:
> From: Christian Marangi <ansuelsmth@gmail.com>
> 
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC.
> 
> Schema define cells for both gpio/interrupt controller and PWM.
> Moreover it provides a dedicated pinctrl node for pins and config
> definitions.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
>  1 file changed, 433 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240911-en7581-pinctrl-v4-2-60ac93d760bb@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


