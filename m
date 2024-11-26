Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF75D5A6EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx5KtfJjHi8LwfpS9BbKbas/r4F/11KM1vqp23+f41U=; b=lFjOI1nubkj4SbRSQknDswIliz
	ghqyXPHxd+MxMynNsQ7jG7dLE0biB9vOHEqTDSbXlB70qfZUC86ApICrGNkfZ7b43W/iiQTMjLPo4
	C28HTIpmAT6+tKrz27oIhkEh2iYgK3BF/c/qxU+bdYmj9tSIPdC+WS56Vrs/hcVgGe0OzaedyOQIT
	QtUTYlvNNwNWkyi4kNZHDUigKO6iD+ZmWNv2GM5a0S8p+Jb8SEoTCxoB1k62gqfHyv5ZEK6WnHAku
	uLB2dP0xfTwuSLU2YrNW4OFYz4gu85IQgP1LaOsseHz4N2SzwcSwmG7Sab6lNZC7OuG15T7nze4QD
	szilRfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqAh-00000009rcQ-03bw;
	Tue, 26 Nov 2024 07:39:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFq9e-00000009rRB-2o0H;
	Tue, 26 Nov 2024 07:38:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC32AA41AF7;
	Tue, 26 Nov 2024 07:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B314BC4CECF;
	Tue, 26 Nov 2024 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732606717;
	bh=xDX7Py7JrUY2WP5pzg+vtaFdg33ZJL+szak3uKude4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lITtXb/95txvqxJqpVYepz23JkdUSnFZjSA0VCTHfuxQomF9GwPp6TuQeDtqsTMnM
	 bQv/UEIURBN4QNiyYZgRzqke0vWnox0lz9KEFcxE6r0tMq4vqS0AWu5CZ5I7SpGqgT
	 JgMd5ftXlUJq42hVxCDoeXcF47Y5TkrqSM1yOWl8UBIkAKRKoJ/9P/G3i/DSPnqzoM
	 WiwJ7YXhK+r4e7SBgC22Rzk/Nl+epwwSajHi4+7OvxoySrrRxgn0B8fsDvaEh9wt3b
	 MEgINWkvNzsWqQJyVPNQVxvQsF/CIaKJWMqnWMIpMf/YbybiUxt9c4tk4nP2C2AeFr
	 8BY+CwiGHBgDQ==
Date: Tue, 26 Nov 2024 08:38:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to
 set disconnect threshold
Message-ID: <42p2d3zi6q2ohod6wqfhhp2g56hffftw2asuavtttzrtaa6x4a@qvc4zwkef5hq>
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_233838_768632_F20CAE74 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, Nov 26, 2024 at 10:58:58AM +0800, Chunfeng Yun wrote:
> Add a property to tune usb2 phy's disconnect threshold.
> And add a compatible for mt8196.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index a9e3139fd421..2e012d5e1da1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -49,6 +49,7 @@ properties:
>        - enum:
>            - mediatek,mt3611-xsphy
>            - mediatek,mt3612-xsphy
> +          - mediatek,mt8196-xsphy

Keep order.

>        - const: mediatek,xsphy
>  
>    reg:
> @@ -129,6 +130,13 @@ patternProperties:
>          minimum: 1
>          maximum: 7
>  
> +      mediatek,discth:
> +        description:
> +          The selection of disconnect threshold (U2 phy)

Threshold in what units?

Best regards,
Krzysztof


