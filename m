Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44477C282D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd8bbRU/HaxLYa2KQ9Y9JZIfvG97EZlUK3qR7/C2fe8=; b=jk1JAWs4kclpLBDWaqk+Q8tL94
	8a0d3P7RECxZ8og49f0O1Ma0n2aEEIhsEaW4ScShNwGfy3CXS83Y27VPGLbDqKybHNGFMYC2ePstI
	Eom3zg35+WfwzSVoWTtsuOU+wiXIESxj5JYjVAOvJdgYYtoPxyVaeBQcT6SBZ8GjZ9coLLKi8P1ek
	3O9sL1lGErZNyeXTsZy6SWFGlJGbXwZhaGxpTAIjqxQ3LnRDvogyrAPORnBHbtN0OZ+Hnjvg4C9+6
	uWC36TvmY/S33o6OHxehv0DlnFfXQ6QU4IKO6MjPRKaZP2Pv6+mlW4qDktX9WTi03x7wPhNkgQAxO
	rs03opmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq68O-0000000AGoK-0ltY;
	Thu, 06 Mar 2025 07:59:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq66l-0000000AGgu-3xKD;
	Thu, 06 Mar 2025 07:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 628D95C5485;
	Thu,  6 Mar 2025 07:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25FEC4CEE8;
	Thu,  6 Mar 2025 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741247850;
	bh=pH/NwpaMg9Ocf6/GG426eX1DXAWQDLNc+lU1WIH8/QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWi8fvt71RfuEChdxeFW1z5xzOV52XkMxEFre9acnh9RpzpbHDygtR55Xq9OnDKTw
	 yBakukkMrljf/7vLgd7Fd8FY7J9EkTMeDxHCw4CPnqlo62IqBwNZdGRL+jTP00WfHH
	 hfOHqjHu95VgIIVZtXkaPyiTI5+Z4wNDsQnvTKBrCoc2c646KbXq/ZjXnuF3Loqgkk
	 waPgyV0wIZ7PpHAqpd7iPcKVHVo+TeEfvYKLt6cQbcbOf0iebhvfb7fDGquXQ4JarN
	 G/JkFFk1ICN0jZ2eYvkCVNK4jviTojvPs8rAjIdaZRkhzBIeK5ufO67oLokGe6x5V3
	 sjWY1vIj0RzZg==
Date: Thu, 6 Mar 2025 08:57:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
Message-ID: <20250306-certain-jasmine-mastiff-fd67ba@krzk-bin>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
 <20250305-mt6359-accdet-dts-v4-1-e5ffa5ee9991@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250305-mt6359-accdet-dts-v4-1-e5ffa5ee9991@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_235732_038926_1273A1D8 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Mar 05, 2025 at 03:58:16PM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> Describe the accessory detection (accdet) module as a possible subnode
> of the MT6359 PMIC.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..51012b8bbfaef3df7bdb619a4=
f8d828d6f9cc15a 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -24,6 +24,7 @@ description: |
>    - LED
>    - Keys
>    - Power controller
> +  - Accessory Detection
> =20
>    It is interfaced to host controller using SPI interface by a proprieta=
ry hardware
>    called PMIC wrapper or pwrap. MT6397/MT6323 PMIC is a child device of =
pwrap.
> @@ -224,6 +225,30 @@ properties:
>      description:
>        Pin controller
> =20
> +  accdet:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      The Accessory Detection module found on the PMIC allows detecting =
audio
> +      jack insertion and removal, as well as identifying the type of eve=
nts
> +      connected to the jack.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6359-accdet

You just removed the other file, no folding happened here. Drop the
accdet node and fold this into parent.

Best regards,
Krzysztof


