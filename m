Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748EFC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iWa0jM1thFE79YYtWc9/4bTh879bQM9UWNB7ryvFuE=; b=TuI/vfKx/EtXWV9A3SARz+72OM
	KOKGvyqyL3MnE7lhOljrJHoONu/sGbXztSA2Uj8qSoCYK0YUQ63sB1IlN+r7gw5nhPOgyn570oyk9
	ACVZ0vlUzx2QsZ0nAI44ichCahAbtb+uD3ruEldGZrptxqGqHv/SzQ9au8TXD91Pqf6OANE3SiMBD
	7fDxTYy1kCTjw87kHfRpdIuKxUFaSOpBqCrpgwNm1CpX9HgQ1Cde0NeDGadKesgjNE9GrhxO8hJhc
	ETJ8jekoQgpHMYlKj+B32V84sQnILPtYAaFSx7Cj+kC6z7x66uojsu/Z8NLxTRx6BIVZ9q+nvnCWz
	bqk5lqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRk2-00000003of2-1D4j;
	Mon, 27 Jul 2026 20:16:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRk0-00000003oeo-2dXx
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB38043C84;
	Mon, 27 Jul 2026 20:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9821F000E9;
	Mon, 27 Jul 2026 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183359;
	bh=+iWa0jM1thFE79YYtWc9/4bTh879bQM9UWNB7ryvFuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9jkYlexzlpVhamy6AuvCd51nDszhZ5Wle27n2ix1kbiK+6l2qFdaDGfe0c/6kaFH
	 +Ny00CYQxjrIicMi/AClpWItr9gv04z3FB6JnRRS9EN7N8MBLTdhpzyAZX5xNi8QFM
	 gFaMSZZ/+z4zkI76WhpAu4ltbZsRLnpgutWR7Vqe29TT2DuPMQ5WIadAryveXoQGeF
	 V4z7SXW3cWI/tbg+xtxW8sT4y1fiZrnh6wtMsjo6Fb4iKyT1SDR/8H94VGwp5iRHTA
	 VFRjCikSMi+HG14Bwxw3E0UqwpIqiZsx8438CX+9Mq8Xyz+GxZbeu1Y/o3djo/YMyA
	 H0cvpjqnwHt5Q==
Date: Mon, 27 Jul 2026 22:15:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 30/35] dt-bindings: pinctrl: airoha: an7583: add olt
 function/group
Message-ID: <20260727-chivalrous-legendary-goat-b9ab93@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
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

On Mon, Jul 27, 2026 at 08:41:36PM +0300, Mikhail Kshevetskiy wrote:
> Add support for olt pin function for olt pin group.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> index 7deb48db52c3a..f016e0da65a57 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
> +            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,

You just changed this line in previous patch, no?

Why binding patches are spread all over instead of properly grouped?
This makes it difficult to review. Please read submitting patches (both documents).

Best regards,
Krzysztof


