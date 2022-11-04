Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B4C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 21:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=newmcT3dWVHHi0k2AzKHxIAzbgauqUYBBbVo3BlPTgk=; b=B0A84SlOzrssaORDLcne7NBfcR
	moy9PMDLp5FSOt8hGxBUlnZbwaWTTqM8yv6NhrBumBtK1s8tAzj65FLiHJJr/ssv0X/8EHE3vGafX
	v3NmdFDH6/lKvet0gcbR5eeM5LGKUkTv4QWa/XdPdTzETZSHMRgAJElGog6klv9q9cYv4GAVo7ySc
	kFEARPpaFkEuuE6R0Ji9oFK6PrI41JKc4aMIl4bLSuC40CymDwlDsP0TpsGe9LWM00h8VoDGy1RYI
	7FIkwmkq9CJ9ka4Ecv+OUA+z7pEzgzQvFGiDwJrw3E6ep3WMmpkZWCgZsHuxEx+s8RMg7zENUYy6L
	BC08ctxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4PK-005Eq9-IY; Fri, 04 Nov 2022 21:39:22 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4PH-005EoP-K9; Fri, 04 Nov 2022 21:39:21 +0000
Received: by mail-oi1-f170.google.com with SMTP id n186so6499596oih.7;
        Fri, 04 Nov 2022 14:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=newmcT3dWVHHi0k2AzKHxIAzbgauqUYBBbVo3BlPTgk=;
        b=I9uhBq4iZ+Fl2EJ8IaUAqLUj4nQW4MO5y+R7QTgpYV2E2ipxSoRgI0u/ODFmyaF2m7
         dcUbzo986n8yHBnZnxwFBTPx8+j+D2J8gkXEU03+BKiwHSfyiCv7jl0GRdpmSc1T4lbJ
         KOGceFLkpNV/9gzKIxPMxEQuwZX7bu56SZ/i44S/ksPrVFrXhTa7hgVvgRZU4/jZAS2w
         24NEKz9C4wB7eNVVgIzPFPvkqVietEjqe7NZ3NOZpNxZuOUZ/dEjdMVhXVpCeVGXCZRR
         YscpMXDJsFd9yAMqJaytbTmP54Nb6F9Bba7oMjQWqzVP36sY5OFHqyGYIMcH5EcUm7OQ
         Sjcg==
X-Gm-Message-State: ACrzQf2m4CoYsBumUXd/F/0adVSOVfVZL2K579TRGBHMEIIt8d1Jxv+q
	CZjTx7keqU4skRYdw3gmOg==
X-Google-Smtp-Source: AMsMyM6ECrXkT2/0pcWb+2yxaeQZEWevvl9EUUDRIk2D/iBgUdWBGzVwCL0SMNW/QXnmtgckjY5lqg==
X-Received: by 2002:a05:6808:3dc:b0:35a:c37:3309 with SMTP id o28-20020a05680803dc00b0035a0c373309mr15750204oie.199.1667597956330;
        Fri, 04 Nov 2022 14:39:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w2-20020a056808090200b0035763a9a36csm75651oih.44.2022.11.04.14.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:39:15 -0700 (PDT)
Received: (nullmailer pid 2876506 invoked by uid 1000);
	Fri, 04 Nov 2022 21:39:17 -0000
Date: Fri, 4 Nov 2022 16:39:17 -0500
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Matthias Brugger <matthias.bgg@gmail.com>, "chunxu . li" <chunxu.li@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <166759787920.2873722.6503685794432759025.robh@kernel.org>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
 <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_143919_677883_EABF0702 
X-CRM114-Status: GOOD (  13.04  )
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


On Wed, 02 Nov 2022 20:59:35 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


