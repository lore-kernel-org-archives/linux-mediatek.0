Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcwrs2sbEho37GmcM0p6X84lk8DyhYAAHF5XVg42thc=; b=NoLcgwlXRniwRK
	JRHMoX5BiAO7dwxIgzpFPVQZXpdqiYqoTUgo95wkl93fSeCdfd2gn2t/jMa9EaC6zQJv9WvZ/moxt
	FFfsa9e8PEO+0rcJ48O7AeUKwwqmVUEN15zM363gQxgl2RkUfb6K6U3m8p+1v0yab6Xa5mquYyOom
	rP787xnCOicQdIAE8fVt+mQdr0S+67GTcpnf/9Zc/kcKQKYrgmNeuEk2o9E9b0fTstz4Wf6MOe0tO
	415xEmz1dj7dRN8+iYrgBPKYmYVEGc0JvwERGxThlC+153RyjKtDzhOO8ZCLys2BBEbhVlSslnCfY
	ps+YXRP5ljOXXyJ41svQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLm9-00CcGw-VL; Wed, 04 May 2022 20:39:10 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLly-00CcBH-6W; Wed, 04 May 2022 20:38:59 +0000
Received: by mail-oi1-f171.google.com with SMTP id l203so2412651oif.0;
 Wed, 04 May 2022 13:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AcpEU69sAJkwiV3catvTf9Ba2Nirs+uxT6TgvfUDezQ=;
 b=yXHxV2oxpp1zNKlRUkWWV8rm6GxIMyPd8nTe8s+KDYEyaDPaSKhh7vVff7aTxqOCKh
 ZK6LRVuE4RXZm1HEkOpItcu/YZLtWuBIrXK4UlK7xcGh38XesVMlCiC0bTeoASWW3IT3
 XulYrynJNthWDtTDXNJkX5ZIfJj49g+7N2BbRWYEs22zsNgNFpgb5vcB1o4DX7zsPxUD
 7he5SkaPHQIXHGobmnwuhMDr5ZCmtn4XebW1w1WwcncxvDP8W1K1ffqPUoZQp135BADh
 hS+l/E8bGRKAdwEBptm9KN7lLXtXdm4Pl0/1SpCWqyRxXDXgHoYRPJ9t6M68SxiSq8fb
 folA==
X-Gm-Message-State: AOAM530PTjxPTDngrOqp1VNrG4ja0YP1uArBO74Tc6QoUTz/8h3ic6BX
 wLKFoOYyBqCtX1/CLq4eCA==
X-Google-Smtp-Source: ABdhPJxqGL2rYGTLd4lmJ9hpkXvtgU1omEZJ82uy+vc3bVbntykS23hu/PcAgWaMqP8CbQy4JAssJw==
X-Received: by 2002:aca:545:0:b0:325:6e7:992d with SMTP id
 66-20020aca0545000000b0032506e7992dmr673969oif.244.1651696737433; 
 Wed, 04 May 2022 13:38:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dv2-20020a056870d88200b000e93d386d97sm8387005oab.31.2022.05.04.13.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:38:57 -0700 (PDT)
Received: (nullmailer pid 2187220 invoked by uid 1000);
 Wed, 04 May 2022 20:38:56 -0000
Date: Wed, 4 May 2022 15:38:56 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <YnLkYKmJ0TJ8uyjC@robh.at.kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429203039.2207848-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133858_300431_DE876856 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 29, 2022 at 04:30:37PM -0400, N=EDcolas F. R. A. Prado wrote:
> The Mediatek AFE PCM controller for MT8192 allows sharing of an I2S bus
> between two busses. Add a pattern for these properties in the
> dt-binding.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> =

>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml =
b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..5b03c8dbf318 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -54,6 +54,11 @@ properties:
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
>  =

> +patternProperties:
> +  "^i2s[0-35-9]-share$":
> +    description: Name of the I2S bus that is shared with this bus
> +    pattern: "^I2S[0-35-9]$"

Why not a phandle to the the other bus? That would be the DT way to do =

it. But I'm not sure I really understand who is sharing what here.

> +
>  required:
>    - compatible
>    - interrupts
> -- =

> 2.36.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
