Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DA8C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNWxjuVePoXX8k0s2kNFhsCNiPWcIE5b9p+0qWxfDjc=; b=Tfso+jQP5dQ7BLVx2XgefmoUkm
	p3Cwk1f17yWL98+Zx4HpY3M3LIQqrxPw/qeldyLYE+VVijZgqJEKXh/QZOrIdfpGVQK+GoLLbGTcj
	vXxU9ikQNxWjW3aCQ0NrWTJKVY9Px827/dJW8kVWTxoYN3RzzbWbT/kbh2S8o5Rd7Vc0nxpUYDVgX
	urehLXWwBN+Wav4GgdwT0UjdtsTWid4jad1mW0GurAN6OGwhryYbjln2WC9KgZFs5qLHPMXZs1MN4
	056XwJKjSXNL/1PlPAjdtTNfOTxOy6eJdAcNZEMbNKnyEOxTmX/2uTwghoUanj0OVl37NLKJu8wRL
	tO8W+JNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryznb-0000000EtH4-3k5K;
	Mon, 22 Apr 2024 19:57:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryznZ-0000000EtGf-37r8
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Apr 2024 19:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EBC7610A0;
	Mon, 22 Apr 2024 19:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEFFC113CC;
	Mon, 22 Apr 2024 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713815876;
	bh=BqexFMnj6FKBjoiD6ebLJAr7HwI2T8jGP8Fq/J0QtZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ce1AW8pypiK3pIaFn7SUT8wJ6RCXQwE6G+XTSKxu/aTq5K16IOSSm2bomH/rmE3jQ
	 QMOpLRIv52oQn1vZu3IDM+PVjX7kkPBxjuWrzakOoXSmzj9vOEkWs7qJ2VrTKnWvGY
	 LqccbCzSd6rB1ccTp/ifLSYMJibLh8sJcPoyIc2tnQmvGIPSwF/0vUMIq1vvnOiSnu
	 j+wnBhLtT3HBw7ZLN2uvXR03OVg8e18k57m76LH1K6Q6aMEoBHAwynm9EUSbIHdp0M
	 0DvXRuoxARuYtHXLQfXlNVDEH0IN+M+YtUhfUnRC1HLgG08N3fwP8T+7lbaW0rB5fn
	 IRtwThwzUJ6uQ==
Date: Mon, 22 Apr 2024 14:57:53 -0500
From: Rob Herring <robh@kernel.org>
To: Kartik Agarwala <agarwala.kartik@gmail.com>
Cc: linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-mediatek@lists.infradead.org, broonie@kernel.org,
	linux-sound@vger.kernel.org, conor+dt@kernel.org,
	lgirdwood@gmail.com
Subject: Re: [PATCH v2] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Message-ID: <171379813505.1260837.7563285425147959657.robh@kernel.org>
References: <20240421033129.13076-1-agarwala.kartik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421033129.13076-1-agarwala.kartik@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_125757_860508_320E2C39 
X-CRM114-Status: UNSURE (   9.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sun, 21 Apr 2024 09:01:31 +0530, Kartik Agarwala wrote:
> Convert mt2701-wm890 bindings from text to dtschema. This is used by
> MediaTek mt7623a/n SoC.
> 
> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
> ---
> Changes for v2:
> - Do not define pinctrl properties as they are implicitly supported.
> 
> Previous versions:
> v1: https://lore.kernel.org/all/20240401043505.40972-1-agarwala.kartik@gmail.com/
> ---
>  .../sound/mediatek,mt2701-wm8960.yaml         | 54 +++++++++++++++++++
>  .../bindings/sound/mt2701-wm8960.txt          | 24 ---------
>  2 files changed, 54 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


