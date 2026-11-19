Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214460A2603
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KydMlTOK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIfBByFu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mIN+GuJ0CxxJX4/Fg/QOh4vbPOUP2Q53nLlfewKTqpg=; b=KydMlTOK5EkCDNS6h7/PgocTgH
	SVeJdhleT+WeTgJYKcavZQfvOnCdIKKXfC1zoftNAIbEVfZTzghXt6+qBxbWDj3pnmmUWW/mShhSE
	HFXdgK4cRD7vjSaKBHttZ6uAc0d0d83+5PljuGYebGeCCaxg48t43zvWwjHrUeNYuU1pWXWbP4Iz/
	YwvDa3k7qfwEAClGEYH6lo5svRTPFxpfQYExVGl9nv4CUCxz33GQHM1WxkkLAWuhOUxrD9uDXk8k1
	NXGjlqYy2TquFaxjoJSFfAZUsTybzkIcAwO3DyGBq/UVd7nRo6590GoqpC9M2jkFgVVA3LlkuapO7
	yQbovbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBNU-0000000Ddto-2el5;
	Thu, 19 Nov 2026 23:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBNS-0000000DdtU-2Pzz;
	Thu, 19 Nov 2026 23:17:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3A0941392;
	Thu, 19 Nov 2026 23:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D741F000C4;
	Thu, 19 Nov 2026 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130233;
	bh=mIN+GuJ0CxxJX4/Fg/QOh4vbPOUP2Q53nLlfewKTqpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mIfBByFuXWlED77Mm3yjoekoO+LkGlK37Y+fsiY1HOhGXSlToyJHTGKwUkspI3SaK
	 MCqel5P+lXEaPECa3D6vyyQITVsY6sh/7hSL6hoZpF0VS3uNvjNb3Xo++8gtVV3q5s
	 vcgONmzPXPTklNMGGsK93cvH2n+GcWKCxMcIxZvIbIeG8zNHihPlooNpCgzPck0aZk
	 IvjantNbzS+MZyDotZrAYWLKiT3CQcjL+K9zLPCNxVgS5+JKITI2ZYqRcm2eALllsF
	 JXf/3NjTb9QeONkKHZi2xqEu4fD5zNdEqkyL92VJOof0bxNTrYFOXZgvwtnJyvoq7l
	 UlOE2h85DU5WA==
Date: Thu, 19 Nov 2026 17:17:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mediatek,mtk-wdt: fix mt6797
 compatible
Message-ID: <179513023005.1277256.7531724126207363611.robh@kernel.org>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
 <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-6797-wdt-v1-1-7f07755b6074@protonmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 10 Nov 2026 21:22:21 +0200, Roman Vivchar wrote:
> The TOPRGU reset bits on the mt6797 SoC do not match that of mt6589,
> therefore they are not compatible [1].
> 
> Deprecate the mt6589 fallback for mt6797 and add its own compatible
> string. Also add a new binding header for the actual watchdog resets on
> the SoC.
> 
> Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |  6 +++++-
>  include/dt-bindings/reset/mediatek,mt6797-wdt.h    | 25 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


