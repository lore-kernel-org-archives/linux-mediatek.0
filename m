Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E50F513ED
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Mar 2026 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0eGGH61Qj3T2GSQpOW/ULMbnCi89ZF628MaXNbZNSM=; b=o2EP/gir9vN/Uaf62ZEDTx2aWi
	yD1gTmjc/hdXMQ6sYYDQimq5h7SEyyaQ7oGNN4LYJ/rSBkPWvNfdzhS9+HJeAWnl27iNa7gmT2GUM
	tnc6whaQxCxVrc33F/1pB6GYuRYCH+OspKwYQa+rk867VGpIYLARnuoJ2T9wNvG4TL9zYm++x7IQQ
	1PwBqj6jhECxPUbZdweqENhnWEqALFFeBUbTPNdvr603rA8SkeIFHi568cvCj9q5LKCV9a6xNoqkQ
	bz3MtCZ49ONJWy4bDTKwiaG3lt+QB0W8nAUwDhIBJKSSwpBsj4GljQeaUd9mU9dGKnNHECs2AViKx
	vVxDct/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytAm-00000005HKk-36rH;
	Sat, 07 Mar 2026 15:02:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytAl-00000005HKX-03S1;
	Sat, 07 Mar 2026 15:02:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F06E060145;
	Sat,  7 Mar 2026 15:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215C2C19422;
	Sat,  7 Mar 2026 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772895749;
	bh=N9zwgBF8iPgt8yqTJ2wZaHrPhuH/H9yN1zkdEbPtRns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHuXF+lX/w3NR/FKeipqwmjTxQqtKYOkhCR+t+8Ltqk0LeMbq+R769ceF+FTRDIyF
	 eUsldXhJ+LbBlH1RW3C8ywY4YZp+vZv/HzBvHLviiU+A37iqAQY0NfRmy9il1Grse8
	 5tY+GqfWVlQYwWSBJyaJ1a1/b5pZX+XF+DO6gbbcIbBqQhLk7vj7wkpwnf/RyidjLT
	 jzv89oOYiGVzhrFKTDK+hCvAI25Tgsqjrjz1e17GwSp/b3vmB9tAJOhlPEQ0F1I0NW
	 e1sKTlia0VQ/Onr+S3/tCeMECtbRKPcMxEMkeMcZQAeE80nrd7PMMMED8JhNM2+XGM
	 2j35jxF7k46vg==
Date: Sat, 7 Mar 2026 16:02:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
Message-ID: <20260307-serious-jolly-tuna-b072a8@quoll>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
 <20260306120521.163654-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306120521.163654-2-l.scorcia@gmail.com>
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

On Fri, Mar 06, 2026 at 12:03:05PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10f..c358b2f8059c 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6358
>            - mediatek,mt6359
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:
>            - enum:
>                - mediatek,mt6366
> @@ -72,6 +76,10 @@ properties:
>                - enum:
>                    - mediatek,mt6366-rtc
>                - const: mediatek,mt6358-rtc
> +          - items:
> +              - enum:
> +                  - mediatek,mt6392-rtc
> +              - const: mediatek,mt6397-rtc

Why not mt6323-rtc?

Mixing different fallbacks should be briefly explained in the commit
msg.

Best regards,
Krzysztof


