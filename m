Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455BC55ABF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpVM/b9ChkcZhLidnj7GV/0zthZKodJLUBqWI25jIh8=; b=mhDodqI+lOnpS9ab7+S1400+Fm
	nbdk8krC9UiRsfXcbMXwxk/nduFkB41IzDPv6k2/UQDIHZLHrQzulYwPTy1shCU6W7nFtr488Cqk+
	einsPg4071oitr2Dz1IJ+5n4Y9PBR5/qDazC74J68xjS5ShziFBDg2rtUJJBQMysDOwWiEhExIeEI
	fNUFcpMqD9v2BeqhGhAHD1G0n+ZVNemiWnZGRm9ztZFGvdeN1HM2BG6upn4f4ky6fanLjOSxCPEhx
	43JjUHIhvPpH4nipUZyR6gL2cPnNS47MERwTfZm+UNueiAJrgwMa0TPTDQXeBGPfZaIM3k9ybGq2y
	HTXGnfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsH2-000000057Mz-2V5I;
	Thu, 06 Aug 2026 07:12:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsH0-000000057Mp-2X6o
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 07:12:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED644023F;
	Thu,  6 Aug 2026 07:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B291F00A3A;
	Thu,  6 Aug 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000334;
	bh=WpVM/b9ChkcZhLidnj7GV/0zthZKodJLUBqWI25jIh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0pEO5JI5OXPlf8SpauwiywtF3V6Ud1rGIiGNEvEthQBJmiMy1OXGDyMy0+FI8ZPb
	 l2Rr8lW0q8eKXzez9lhZS5tfZdv5sDyg7W7f5Hy+7Jny/yxmrOFAtOzGOT/a158gyP
	 LLLGV8u3wjmppsdYjJMwWledPpnyIsC9fTUFI2dSnTDHpd8BbugEHK/TUw5Az0+ya+
	 Lf9qZbbJB6/KMtzP6XlaYwxNfDMcHfQw8j0x3eiLiG1uX4HCR8qrq4fqqN09Pcx/hv
	 bkTLHlMdHTwRCa9Y4otp6WblfqQYEBNNTPqy0SwCru7vFi9edoVpiW1ZkuyxDpvTop
	 E2LwFl7ooq8dA==
Date: Thu, 6 Aug 2026 09:12:09 +0200
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
Subject: Re: [PATCH v10 31/36] dt-bindings: pinctrl: airoha: an7583: add
 missed features
Message-ID: <20260806-muscular-tench-of-elegance-8ec390@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-32-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-32-mikhail.kshevetskiy@iopsys.eu>
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

On Wed, Aug 05, 2026 at 03:34:03PM +0300, Mikhail Kshevetskiy wrote:
> Changes:
> * add i2c0 pin-group support for i2c pin-function
> * add npu_uart pin-group support for uart pin-function
> * add pon_alt pin-group support for pon pin-function
> * add support for olt pin group/function
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

This is still incorrectly organized.

Please organize the patch documenting the bindings
before the patch using them.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

With this fixed:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


