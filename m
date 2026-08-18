Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282AAC5DF80
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrgvARoKV8z7DkbZjEX8WqBtlETa+fIdwLmTQO0OPq8=; b=nfRunJuEKqal/fYt4GnWYDFnR4
	l0jJ6/r4WafwGWNx1VUDHCNdhR0mQm+nV14mGGeRP7H5NPgraYl4WxASSmXrFUkzcoC5532mTt/lV
	xnEfOwOoc2xmsOfmakO6GkGrB7t8fiTT8W/cCMSRrINokkO3vYFXNy9SUj11c8kGvDBAp6sjxD750
	Nj6D6+Zv8hDh6G9pzJTTqn0gNW64yvUpFyT8a0NnrHBbps/70cLXPQQpcL4NEPAFmUPsD4Kyrj63M
	Kssr2QyM0YVI+Ejh4OrMjJ3FIVmf3MevI3qB5Dq8Ljwj0df7Wa89D58pYEz8XL/fl9XHDd3ynSMWV
	3FL8HJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFEA-00000007Wga-2O03;
	Tue, 18 Aug 2026 08:31:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFE9-00000007Wfo-142b;
	Tue, 18 Aug 2026 08:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08D6E40339;
	Tue, 18 Aug 2026 08:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C026E1F000E9;
	Tue, 18 Aug 2026 08:31:19 +0000 (UTC)
Date: Tue, 18 Aug 2026 10:31:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
Message-ID: <20260818-shrewd-falcon-of-focus-f4c2da@quoll>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
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

On Fri, Aug 14, 2026 at 04:13:52PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


