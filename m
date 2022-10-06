Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uOkqH8wHIIwG3lpTmOvwfF29077xeAWMGdj9Sqlpxw=; b=X90hqKSb/7EoMTWm4I/dyzDh2H
	nCLkLo6gCCIyLHLVuVWG5BFkx2L2Eo5O4h86acy7GTw7p2x34eqftWpP9FwoAbruDheVVhHMf6dK1
	Ut1OWB51AGoWuUiLv8n4w7RqS3YOczYuE7BCPC1cA/5g1mrqqic8MPs8VL+CnxqRb32W5ykA5uzZn
	k5upqzO83nHodoZZ9GFx74PDI98YRWjtPwZWM3E2aAEMQ6k73H1YsqIMQxyM6MRU1IuxLdHm7psya
	l9qSeXraL8nLQeISUSWa/bBJENwVHwvw0RiLX3CcLArcugNwIOVJGluhz7HljpqkjaEbGEAH7xYRS
	inUwKegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWK0-004fSW-He; Thu, 06 Oct 2022 19:14:16 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWJy-004fQX-GF; Thu, 06 Oct 2022 19:14:15 +0000
Received: by mail-oo1-f54.google.com with SMTP id g2-20020a4ac4c2000000b0047f703cbe86so2058698ooq.11;
        Thu, 06 Oct 2022 12:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uOkqH8wHIIwG3lpTmOvwfF29077xeAWMGdj9Sqlpxw=;
        b=T/COY8Jndhs4/haTdzwzfKh1qp0vvutcm00jNNEGjGL6/9SQbgg+CSy/P41ff0WhVU
         L0A+pbs0D+unDi0Cyxe1LaXdurgI9z4NUzlYuNwNwinNCjr+MVS7UZEFO/iyLwXwQZ9h
         C2mcrE9MtrLmZDB6rQO8cjXFzYu0LZBy9zbJ+VA8aqyVXNGvH8IC/EV05JA05RwMplep
         d48wKi04c+W1hvwyDssPiVkn7vDeSf66BON5ucH1CZ4aQSuq/ii1Ktj9kMoUKy5CIdNi
         uBwwKM5971O/wIqCaJGBmEPjGOXxSQj6M6hC4Um3boYvH3rk7csehKtI9Q3sgLp6uemc
         zeTA==
X-Gm-Message-State: ACrzQf0v0sA2fJdU1A+3t9KUrfRbK9wry9ng3ZQmkgs+Owsnbe+KykxO
	uSdSMMy9r2vtpX8DaiwP3A==
X-Google-Smtp-Source: AMsMyM71fwoUSf9tYFfjBz2mhmMUwcP7xYkN22Uv0oapeMLU2C9RJk3TElcPHKa3Anb+dB7iYTEPuA==
X-Received: by 2002:a9d:30d1:0:b0:654:1288:7cb2 with SMTP id r17-20020a9d30d1000000b0065412887cb2mr605971otg.43.1665083652496;
        Thu, 06 Oct 2022 12:14:12 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id f13-20020a056830204d00b006594674d4ddsm195126otp.44.2022.10.06.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:14:11 -0700 (PDT)
Received: (nullmailer pid 45552 invoked by uid 1000);
	Thu, 06 Oct 2022 19:14:08 -0000
Date: Thu, 6 Oct 2022 14:14:08 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve description
Message-ID: <166508364780.45491.15443497028230774224.robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_121414_561175_B26507E8 
X-CRM114-Status: GOOD (  13.46  )
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

On Wed, 05 Oct 2022 20:43:35 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The current description mentions having to put the pin controller
> node under a syscon node, but this is not the case in the current
> MT6779 device tree. It seems that this is not actually needed, so
> replace the current description with something more generic that
> describes the use of the hardware block.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml          | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

