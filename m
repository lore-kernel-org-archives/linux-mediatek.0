Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F82C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPaJ5QKuqa6JT5D+gY9tfaRaUFIibFo858rAr7vgvks=; b=e1YnuKI1Ic0jdSNJWIq6gMkwsY
	ajaA64r2MNabiPup6p7N0yl9ZHQYjXjGQdgYZsF0l5enVuCGMipOOk1vRcm9YtLJ/7RPoM4dKkGJz
	agdBiP7BVHzk8cpGLRLB08w2qMfC/TuDdX7PdIo1fsSMiCdkq3v99zVsYQxEunAPEg0BNMLQ4l9aU
	eypr14VSJS+ubW8i7dJgNsm3u/E57yePEg/zC/zEPd5f7CfLyT5hq0tdhB/hpvKXmQ0EwSg7BRpnu
	a+So62hTykzx5bzhOwW+xOYIO06QH0FqbvFla058vL2dhr+vI3Ge7+yoC7qHBn3d+FmFyixsgJJQF
	sYmDjkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ox6-00HOEB-PA; Wed, 30 Nov 2022 15:24:48 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ov5-00HN6U-W8; Wed, 30 Nov 2022 15:22:46 +0000
Received: by mail-ot1-f49.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so11399336otg.6;
        Wed, 30 Nov 2022 07:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPaJ5QKuqa6JT5D+gY9tfaRaUFIibFo858rAr7vgvks=;
        b=bko/M2Qr84dIPG9Zd747XoYCGaYbxyg54+ccN++qf1sZ7WZXBnxm51p80lZ4Y81Wjn
         pShKV6eyL/nD8qZIOtAV+7uipTIBrRkZBBeF1A82C83hZQo76+CbaxQxRQPaXoumi/oF
         aZ1Uy7hh/1NDAAnVz3AqFXYrJLWa1VgjEWj/sN2jYqwr6NygcKxFcX7twU87NR+kUiUX
         o5cYvQKpHvKiWrUyKgAUSLpsRhuKYRbBlNjZ4jpfDs7UBZdkaOqYcAa7MJjRv9Rz9x0s
         B2AqoDq64yK6LLH3wi+X5epLLalU6blWD4mjSr4nFMQljn6Yjq8bQzbALLWjfdmUTubV
         An/Q==
X-Gm-Message-State: ANoB5pn/r9e+Gh1oHnq9KuDse7RVCKNaO//ojAP1bNuHP2Cto9IWa/rv
	mFrgEiv9v68xM0OlS+I57g==
X-Google-Smtp-Source: AA0mqf7dVbk+/jtsj/44vjUhHrvULs52JnWmrmOJCkOc/Gmn2xkA8Fwx/65Db1wL3k47Y4ManV1BRA==
X-Received: by 2002:a05:6830:1c7:b0:663:d3ce:ca26 with SMTP id r7-20020a05683001c700b00663d3ceca26mr21656129ota.67.1669821761469;
        Wed, 30 Nov 2022 07:22:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p186-20020aca5bc3000000b00359a9663053sm748103oib.4.2022.11.30.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:22:41 -0800 (PST)
Received: (nullmailer pid 2190680 invoked by uid 1000);
	Wed, 30 Nov 2022 15:22:40 -0000
Date: Wed, 30 Nov 2022 09:22:40 -0600
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andy Teng <andy.teng@mediatek.com>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Message-ID: <166982175979.2190622.1334007053392502335.robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-4-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118113028.145348-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072244_094648_7311CB05 
X-CRM114-Status: GOOD (  13.91  )
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


On Fri, 18 Nov 2022 14:30:24 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  78 +++++-
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 227 ------------------
>  2 files changed, 73 insertions(+), 232 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

