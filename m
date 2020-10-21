Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A92C55178
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 14:56:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1B42224E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 14:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqsOWuo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1B42224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=br6Iib76kTW5WR0tule/OV46o98TlqiejnMBlrvuOJ4=; b=tqsOWuo+RlMONbrTPwfnRQEc8
	EBPXHVrXjik88PuaNxe5M77cbQR7hoACc8pPhUXzYpOtSoORt4RsaPmVouQhhGL5R9qRiivNUveze
	yFP8GK/ZstBoa/rz/Y4exc9iYeLzOgI+teKWc6t6XlK3Bpge979zFZ/RBYFj5eRvqX6IKw8DGN8LF
	fYFNwJXNLt/nmDozpSRDi6saOGIu2CGKUqRQE8dpSgbShldfo0gDoyztOqLiT2/o7GrdnIIfBVdEp
	hGng5XM+zDik07EBMpMvCvwbyRCce+vd3WsHJwi93GjTXozhClNCG3Wcwn08RChM5xKlxi4VbGUFO
	XKF2NcTkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVFXA-0001HN-06; Wed, 21 Oct 2020 14:56:12 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVFX5-0001GT-Ou; Wed, 21 Oct 2020 14:56:08 +0000
Received: by mail-oi1-f196.google.com with SMTP id l85so2344843oih.10;
 Wed, 21 Oct 2020 07:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yLalAKEkjInUHTIemfTKDQJ49Jz0VY8t66NsoFtgLU4=;
 b=A1gfl5Pg9YcR7IRgcqQ/w6MUNA4mmNqUonfAvcfxaxdJ3f1XlrsmakzdK5l5FdJV44
 iMRWKnEgdKDu99NhfdqbE+ggdfxRDa79/bhA2Sujql6B8iQZoBjfMtE5CSyZIXd1Aigm
 E0RjtpRIit4Om0YoDjXpucmtvdFPoqV3IZwO/Bi5iX6PsqvHMPVqONZohGAgmbtifOvA
 FP4fhFRyWFQFw4Rs6plot4EK3z6ZxU6AWVn6FXzMY/ImlIbucRUbt0y9FzzR7KCBAUua
 uoGkhcjqizHcGliOi5oYkM3pdhGlnNr8aa8M27a/TImVSph4qjQsqydtiHKT0PI0KFPU
 bTdQ==
X-Gm-Message-State: AOAM530FCVtqxfuHmNxlJzXjo6rJV7hZYFfFzrVDp1cAUSNCXEtF/YTf
 iKf56XA0OQL+AuH/5xsWCg==
X-Google-Smtp-Source: ABdhPJxy+68+KRz7O/jGvNfY0VnQsZU3nhhXkp7D0LUaX21+plv24AmcZ/0B8hoS/q6je6Yxg1/fIw==
X-Received: by 2002:aca:170a:: with SMTP id j10mr2651581oii.82.1603292166586; 
 Wed, 21 Oct 2020 07:56:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v123sm733083oif.29.2020.10.21.07.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 07:56:05 -0700 (PDT)
Received: (nullmailer pid 2780046 invoked by uid 1000);
 Wed, 21 Oct 2020 14:56:05 -0000
Date: Wed, 21 Oct 2020 09:56:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Message-ID: <20201021145605.GA2775711@bogus>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_105607_841879_67DD5E18 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 21, 2020 at 04:53:55PM +0800, Jiaxin Yu wrote:
> This patch adds document for the machine board with mt6358, rt1015
> and rt5682.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> new file mode 100644
> index 0000000000000..4c39e88906fc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

GPL-2.0-only

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
> +
> +maintainers:
> +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +   - Shane Chien <shane.chien@mediatek.com>
> +
> +description:
> +  This binding describes the MT8192 sound card.
> +
> +properties:
> +  compatible:
> +      const: mediatek,mt8192_mt6359_rt1015_rt5682

I still don't think this is the right way to do this.

> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8192 ASoC platform.

I still don't understand what this is.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +
> +    sound: mt8192-sound {
> +        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "aud_clk_mosi_off",
> +                        "aud_clk_mosi_on";
> +        pinctrl-0 = <&aud_clk_mosi_off>;
> +        pinctrl-1 = <&aud_clk_mosi_on>;
> +    };
> +
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
