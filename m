Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F224C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYLwATUgXkSjEpYITC3xrrUBVVSKhXYf3klEB5MK1WI=; b=08qXIZWr3jj1wkPRkTu8/8N/4/
	Tsu70YNm9ckUIsU63BZ064gcgb3iZ5rczRmjg4iqhJLLdkxZPLQ779Gb1hEEW5UcfkHjuyapy4x7u
	pB3lAR08q+0YoMkrFbcAJCghOCGtfLHZg2uCD1z+YI4j+6LSeYBAecj3P+pc80w/GivehYtrU9QH6
	TVX48KsSQvTTlyQ12oGyUA9Bknd+mGJHI3KPUiLGnx4BxL1gnRqgc/rLYdKJ26tkoSMfLR20N/NrH
	UFJcRyIcz0EMh9sXZmoz6iJBC8YlsPTYtOl1l1xc/PogjDB1NxPLJUx5u5NmOofHVMVvwIan9Ggec
	X8dJwScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAqj-001jqO-E3; Wed, 18 Jan 2023 15:59:41 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAqg-001jpA-Id; Wed, 18 Jan 2023 15:59:39 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15f83e0fc63so2460548fac.11;
        Wed, 18 Jan 2023 07:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYLwATUgXkSjEpYITC3xrrUBVVSKhXYf3klEB5MK1WI=;
        b=M49cX0CFvsa8Bz3xgng4ls7JczTqM3/HontI82t7EYsxBBJEEcYAuVjwtgggNxFWy2
         PE16IQqTAPFLRut8QuptQi/UvjcuHBlEtoyc9DRzIqNb23LrlaSxKdfBh4N3whspzU2m
         Qq8Ctm+bwfKZvb5Jo6yY4mBiQw+Dz/KQKhJuGK0neyb1ENCMZK9cIUpBZYBJI05v+Jg2
         NwfF0LMBphSFJPWpF30cxPQ+kAojAoaeXXtPk0Wy6MQxs+MuLJSXqvI5ZOmSAtv6gaoH
         Udne73zsUoJb4Dhj+COGQqtXuhoLvH5VKGrPhkvvIyj/SuqYgm55q0dAgu1D3J9Ux6bV
         NdPQ==
X-Gm-Message-State: AFqh2ko0I8DnH3ls+2pzryl9eqJcnnG+OsdhfL/4+0JG5bPwb3ZRjjLe
	ump/69dsX+eoRkK9yO4F7g==
X-Google-Smtp-Source: AMrXdXtNXcgtaf4kqxp3LkeZgl009U5TgsdRR7APA5uSgwVb7Iat9myzCJOSH4NszFG9TWuteb8Vig==
X-Received: by 2002:a05:6870:4b9b:b0:15f:29ff:b84b with SMTP id lx27-20020a0568704b9b00b0015f29ffb84bmr4426352oab.53.1674057577328;
        Wed, 18 Jan 2023 07:59:37 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id e23-20020aca1317000000b0035028730c90sm1293795oii.1.2023.01.18.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:59:37 -0800 (PST)
Received: (nullmailer pid 80474 invoked by uid 1000);
	Wed, 18 Jan 2023 15:59:36 -0000
Date: Wed, 18 Jan 2023 09:59:36 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: arm: mediatek: mmsys: Add support
 for MT8195 VPPSYS
Message-ID: <167405753490.79458.14830841571648305293.robh@kernel.org>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-3-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118031509.29834-3-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_075938_639749_78380830 
X-CRM114-Status: GOOD (  13.86  )
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


On Wed, 18 Jan 2023 11:15:07 +0800, Moudy Ho wrote:
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



