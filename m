Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87654C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 22:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gygYnA9u4Q/lF4b5hwfcpNoJaE1Lp4PhYJlG7RjOPSI=; b=4+VQk4CPRYWJICoXwunDp5Zi6K
	RDR2H+ivndfO8WZlVhc4whbUfcQqOaxshXKur/Mm1OxNiBDdMQsYInKGKyBBKjByGQ3fzdNGfKVLH
	dCDm2C+S+EKY9QFanJGKN5Gw6vB3BrQiM/VU1NiSWNg2n+CUp7A7E7UOy59uP5W1jZDbP7bza1nGD
	ewyDmsGBVMbsci07cd8iaSZ+tZU3iUFPyQgqjTEOJVYvLDIDo/cgPqmqFXgiAd1IBIIff4KUQXZON
	yjAijYh/ZidLu3gmNmVSTMEApdCeyUQqu6WCzweQatRwsaQOIrgtnkDARkoz9i7bCk4s8Qw/9vAQK
	1XEkg+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMxVA-0000000Bs0Q-2jlN;
	Thu, 27 Jun 2024 22:22:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMxV0-0000000Bryu-1sFw;
	Thu, 27 Jun 2024 22:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05D9661EF2;
	Thu, 27 Jun 2024 22:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F891C2BBFC;
	Thu, 27 Jun 2024 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719526906;
	bh=SmASSkNIQUG8VLWsW1zspcVeuBuoZnFMDAEdYCsTYBs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ASJTHe7vt4y9L8Iu4knPDGP7pRfaBnA5Z1mUInqj4snW5blWqtw3tlkAo7Io0Q2xP
	 a34gjjD75dqr1K+JD8W6ZL11+G5CaT1zbK03uZsLqGew1yjRTDC0eEFJ7nRCJcokOb
	 Ex+VFojXTf6vItVZzcuMZMj/Rstm4RSBodu/FATJKXOIIgp2L7uNPdw4fZX09OesSB
	 MpMlDGRLMlwmHjrIjb+WcxET1GIcGk2fWcTUwRka6D3ksrIxaluPs0isJNp/hM0lrF
	 Yn+MuDhesEHHDtD4nVSgc3uZa6TikiraaBwZ/JqqOZjPOZ7wuE1Sjvu3lTbUVbs59l
	 C8qtdeKu/FYrQ==
Date: Thu, 27 Jun 2024 16:21:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20240627205309.28742-2-ansuelsmth@gmail.com>
References: <20240627205309.28742-1-ansuelsmth@gmail.com>
 <20240627205309.28742-2-ansuelsmth@gmail.com>
Message-Id: <171952690505.706895.16327382675464090624.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: mediatek: add syscon
 compatible for mt7622 pciesys
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_152150_558762_B732ED0E 
X-CRM114-Status: GOOD (  11.12  )
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


On Thu, 27 Jun 2024 22:52:57 +0200, Christian Marangi wrote:
> Add required syscon compatible for mt7622 pciesys. This is required for
> SATA interface as the regs are shared.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7622-pciesys.yaml           | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.example.dtb: clock-controller@1a100800: compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7622-pciesys'] is too short
	'mediatek,mt7629-pciesys' was expected
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240627205309.28742-2-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


