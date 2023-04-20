Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0989AC7618E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdeZ8xzgVHosFDJ9K3Fl96nM7x/G+I3DI1EVKMB5/cI=; b=q297RqK+9F4hF6Xu+ijVzV3tgv
	P3ZziSodj80XNxoEeqi4dlkvZWHf2O6thf/PQ7bV92kBa4STb4p0UAF37vITtMHPzdX6iR1JDRab5
	A4LJoISngl8Nqk/RhBpcyxXOOliIX1SqLRFMz1jNWG8U9SflKWC0HLWNd74dn37teZTohc3CVGkjY
	rqbseyUgA+RDxsp496gsB7VAGpvuc2THJwukYbHraDv/tpXOLOvHvcrEQTv3PufB6S++/a/7/UIYk
	3Xals2PrcamlvOB3YVCxQUloiNwnigr/hMMzr0xvQU9BQjCBnZhHE4KjQYvRVIniY+9FhdSXUgy16
	coC1ahfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppb8f-008yOy-1c;
	Thu, 20 Apr 2023 20:44:21 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppb8a-008yO1-2K;
	Thu, 20 Apr 2023 20:44:18 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-187df75c901so475861fac.1;
        Thu, 20 Apr 2023 13:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682023455; x=1684615455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdeZ8xzgVHosFDJ9K3Fl96nM7x/G+I3DI1EVKMB5/cI=;
        b=cVhqG6n1ZblzS+2z7N9AHcsyrn5IgfPaMxfZnQl6zSOHBqDuNzQPu6vb2OPgYx7dQf
         A7I+7bWGfKkHMntnBvqvh7AZMVzTyBvz/NwXg2ffmdrRDaXfJH9twVFkYMli2FHvEdoU
         IBjAG2oQAOxGle3qZQJz79ivgUbCTzN5LDaGc63LrsP7naONdlUMV9fvGSkPM2jIhHOB
         f+AYz7xS7CD7XfgYtreXzyyDpIlpm92kif8OKVtt+vyDK9hcce6+de5rRap1KxynaSAR
         LwCpBUhgFyCtRo2kD4qyS2TqpRE8CSToBRDL1yuXmhTQu13pp7MY79lx6Dk46XUawEOO
         V1cg==
X-Gm-Message-State: AAQBX9dSvdQR+yLOFRAugr9zJYj0uvZVCvcjq6o9gN0Dmj09iTVzurVT
	Eldr3gYuqsXJKkkKjcNiyUtPcYXncA==
X-Google-Smtp-Source: AKy350aEuuhzmBltlqVshkcKGlza/qYtsoMU4SNFpJGHeliRLT5wVxIePHagH1cABEcZFMnqjpbW7A==
X-Received: by 2002:a05:6870:e749:b0:17a:aeff:5228 with SMTP id t9-20020a056870e74900b0017aaeff5228mr2130851oak.47.1682023454819;
        Thu, 20 Apr 2023 13:44:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g11-20020a9d618b000000b006a3f4c6f138sm1091275otk.36.2023.04.20.13.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 13:44:14 -0700 (PDT)
Received: (nullmailer pid 3467149 invoked by uid 1000);
	Thu, 20 Apr 2023 20:44:13 -0000
Date: Thu, 20 Apr 2023 15:44:13 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm/soc: mediatek: Drop unneeded quotes
Message-ID: <168202340162.3466084.977084044786860402.robh@kernel.org>
References: <20230322173501.3970991-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322173501.3970991-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_134416_781106_DC71C848 
X-CRM114-Status: GOOD (  10.20  )
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


On Wed, 22 Mar 2023 12:34:59 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml   | 4 ++--
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml    | 4 ++--
>  .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml       | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8186-clock.yaml          | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml      | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml          | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml      | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8195-clock.yaml          | 4 ++--
>  .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml      | 4 ++--
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml    | 4 ++--
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml    | 4 ++--
>  13 files changed, 26 insertions(+), 26 deletions(-)
> 

Applied, thanks!


