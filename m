Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CC1C55838
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmN6+jVaBWN+uFT4cw5mCwCOTi/lvtaZPxfj7h/ZTPQ=; b=Nhxnkhrf4/nrH10skEvJdchtUm
	fB5CeZxcCWlmZxlh5/iKUNfe6PZQEVYDJMkGzZTs2nNiU/h1NZYzdct7O99XFiC7QvvwzsqAkZ/U8
	YoT3AUF9XUBrcW1LgeSq5q2KeC8rPwwS0qb/IH7jPx9fWVfoM24125W79jqWn7mw6dOUBk0Ma2bDc
	WQnDa1XL6lkgmu9ywLQsarnxJX4ZnSs7rnlKNZK0UcSQT+WdGcZR5Ht4ngjWihEoaK47SXMbvVZGt
	9jKu4A0CRw+ZXxU0BQV603hrYX1LzdCmDQ3QeG2ovZ6vZTNC+/ZsEtzdLBq0G0gd6+gEtyYWt6Ybn
	/Tbtz2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsEf-0000000579Z-0YgG;
	Thu, 06 Aug 2026 07:09:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsEd-0000000579R-1Aju
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 07:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF3A741359;
	Thu,  6 Aug 2026 07:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D971F000E9;
	Thu,  6 Aug 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000186;
	bh=XmN6+jVaBWN+uFT4cw5mCwCOTi/lvtaZPxfj7h/ZTPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GR4f0eGyWYzjDa4N1wC85mZBPVzdXFzz0DMB7MXtgq81BPt8qLOQF4b604EiOJzmr
	 Ufn1oW/NPVMFRECtHV3XegO3pOXuB5S8S0ZjZ3cF0siv6Bd/PGNfw3cS4xxIPnSsfM
	 NnpuWsnFa7sYNQgVZALWdfftXJZ4nztckc1ohipulWR03pU9HdKaS/+rKZVeDGawNb
	 n2uOOF5tVUnXp3igW4D/8BWhgJTD7hzRDU/+fPNgEb0u03o95GmF+ctgLrtf5s0Tj6
	 frcApx34SXzqB4vomNU1fCSIC3zW4TdaUYZqsGfx/E4ehAEguhVWY3LPEJAqfBxjlH
	 Z3UuUmssdWaaA==
Date: Thu, 6 Aug 2026 09:09:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Subject: Re: [PATCH v10 09/36] dt-bindings: pinctrl: airoha: an7583: allow
 configuration of non-gpio default pins as gpio and pwm
Message-ID: <20260806-influential-foamy-lion-c1aadd@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-10-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-10-mikhail.kshevetskiy@iopsys.eu>
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

On Wed, Aug 05, 2026 at 03:33:41PM +0300, Mikhail Kshevetskiy wrote:
> Some AN7583 pins have non-gpio default settings. This patch provides a way
> to configure such pins as GPIO or PWM.
> 
> Please note that gpio52 pin can't be configured as PWM pin.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


