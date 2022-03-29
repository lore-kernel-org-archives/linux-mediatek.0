Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2350C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQCI2aq0NR5twSoyECKV19UjgQNwStl4lnHW/2bhBbg=; b=AqjWLm79CV1pTQ
	RNLgYsQ/k9P5Dzx5ndh6NBeG+lF5gpVZf+GF9MxNRDqHX3lPKO/FyaNOZW2kIBu2ZOMvJ7y3dfcl5
	xsSsJuo8tCO0/KOX4F7oY/aDcyFAImFsBNGdmWW2Apm3ypNKR1Z5iOCxCACpqa1DQ5ej8EpsGgICX
	5ydNZ7uKCmg5DDxePWDTNFdiIwzSFVLEpyKs/jmJBzruP4qYQYfW++RKb2RkwR/JynpA8QqbjVLhr
	5Vd01fan+zk/wqaWx7sJm2giqK9DrLErwgEoeKBAtbD4l7uxCH6IzeF9wHTBWe4tSHg0d7nHlrtTt
	9IbkHCwhnqxasTHxbD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZLEN-00Djtt-63; Tue, 29 Mar 2022 23:26:31 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZLEK-00DjtQ-Ft; Tue, 29 Mar 2022 23:26:29 +0000
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-dacc470e03so20430132fac.5; 
 Tue, 29 Mar 2022 16:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9dQ+bezz/6dhDDZZP1dvguzSfUxAuO4wbhe6dLzF9cw=;
 b=r+qB0pu+K301FF/4YyHVTYNYUzIIzGNkamwqSv8lcjJHVP6u30hOfc4oUNLpLGNRrE
 gXvi+BGvMGxWW0urKaabPFV80nLyzp+lV5zQjQt9neZvXCwGNiMx8LycMwbbqOeobbiD
 MtEEt1IOhdYnY46EYRu3XwhuJvigydcw74ylzzlpIvbKl6ZsBUpdf2DOmW/zZnC3UKK4
 yDQHlZv1FnjbP9oMdX8L+5Bv7OfDhK19oaVAFXEpgQBN0+Ta6igzlGRPhQFUjAV5zUFr
 z8PV3siO4PnM0wzcOp6DqNRC9TM7YeaNThaA9GyY+LUxTvZ4i+fAMxQGdwWTOSixDq6s
 tUkg==
X-Gm-Message-State: AOAM532Ox1/ng/mg22MzmQn0+UZwnHePo6t/9HnmeTlOMULD0eyS3v8o
 kBzgj13Jl6hsaXtnOpFw3A==
X-Google-Smtp-Source: ABdhPJweG2i2gLummAi4XhOWKR3K5fxDVcfWf9ib6emSjAUJsc9ZLfSK4XVKqDUx/MKj6Sxdr8q6uQ==
X-Received: by 2002:a05:6870:128c:b0:ce:c0c9:5ba with SMTP id
 12-20020a056870128c00b000cec0c905bamr896932oal.12.1648596387515; 
 Tue, 29 Mar 2022 16:26:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm9784338oif.45.2022.03.29.16.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:26:26 -0700 (PDT)
Received: (nullmailer pid 1552557 invoked by uid 1000);
 Tue, 29 Mar 2022 23:26:25 -0000
Date: Tue, 29 Mar 2022 18:26:25 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 yc.hung@mediatek.com, tiwai@suse.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, aaronyu@google.com,
 alsa-devel@alsa-project.org, tzungbi@google.com, miles.chen@mediatek.com,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Message-ID: <YkOVocF+H1Up3usx@robh.at.kernel.org>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-4-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_162628_554688_BF09B2B3 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Mar 2022 13:38:48 +0800, Trevor Wu wrote:
> Because the same binding components can be shared by all codecs
> combinations, we only reserve one binding file for mt8195 machine driver
> and rename to a generic name.
> 
> We use compatible string to separate different codec combination instead
> of creating a new binding file for new codec combination.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-rt1011-rt5682.yaml    | 51 -------------------
>  ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |  8 +--
>  2 files changed, 5 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
>  rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (87%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
