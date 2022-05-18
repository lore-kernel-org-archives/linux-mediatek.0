Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D35C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RITadcaPMT7mS0vLDvA93KSp4bFBHYyKRrdXh8CHew=; b=wnB38vmh2q4zfX
	rzoDYWPEEsIS4iHegAaq70POK5KFlNbjI06PRE28g++TabW0Q6qJu43qZyDpKFmUO4xWD8a450jjp
	bjBVksSo/hPQQI79SRjJKjWQ87sSsw/36B94BZxRU33uT7Gtw6GtK1Qp7ZZvCvs33HIWOR/4DhJHE
	jkNiDkGdpHvYgMzFfroSEfw3sJywFEPHx00sAwsHtXnkU6QWxuaANcm6HUJ0gZn3hPRz1+kRqMJS1
	2V3LnIcDoaahlXyDDsbK6MWTxhgXTUt7tbP4Q45ixJMrmqR4u2cS42X9JwFNw+0nKF/O4PzXi/OA6
	4SyT33XCOkxeO823uKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOeD-003TcJ-8q; Wed, 18 May 2022 18:43:49 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOe7-003TYZ-Ry; Wed, 18 May 2022 18:43:47 +0000
Received: by mail-oi1-f171.google.com with SMTP id v65so3719412oig.10;
 Wed, 18 May 2022 11:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nSo8w7W+OSVBY2zTRn/yV76t4zc61Jk0JXEwQ0qGoEY=;
 b=aAqP4GGtaNcm9fHQTfXcDrdjL8HyjH9WqhTqfLsC5bHp3aXIX7Nlsexxh1Po5qXkbT
 G3cj8ghHCAvpoFkaRPAhbJdqlVhMIlbwX3UP0nLRrCHqA2MGzG2dQk0vM8wGFISt0Uaa
 Rn+bImVG52OUj/lrnn7iElPpk2fLgC0tDKoN0Y0r/oPJMfyREcfXaC4qxSMicIlOIEQu
 XtwN9TbvP4i8hf6sq986kbPmfCnCBh/PBxkeLI/Qk9RGDyCGGZEi9HB3zBb9zimBiy0s
 Dorf5O+w5IPkcvfUWR7MkhacYF1mAkndpSfRWWr7jSzcxzR0FN0dvjMvHC3Z1mWKtBhk
 JdSw==
X-Gm-Message-State: AOAM533tMoo/YRs0NKR/ucBgPfQdoqkhkTtlnU679UjMF/ifjWP8FbNX
 s2zWEIC+6PP4ZXzA9rgpTQ==
X-Google-Smtp-Source: ABdhPJxURTR1dLIW0z+AO7IFoBsGn5LcndospzqQor1Bg/tjfzW1ykX2baF3rSpYYdFTb74t+ZoaaA==
X-Received: by 2002:a05:6808:f8e:b0:328:a601:a425 with SMTP id
 o14-20020a0568080f8e00b00328a601a425mr590558oiw.253.1652899421160; 
 Wed, 18 May 2022 11:43:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q19-20020a4a8353000000b00333220959b9sm1265718oog.1.2022.05.18.11.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 11:43:40 -0700 (PDT)
Received: (nullmailer pid 3669786 invoked by uid 1000);
 Wed, 18 May 2022 18:43:39 -0000
Date: Wed, 18 May 2022 13:43:39 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] dt-bindings: iommu: mediatek: Require
 mediatek,infracfg for mt2712/8173
Message-ID: <20220518184339.GJ3302100-robh@kernel.org>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-8-angelogioacchino.delregno@collabora.com>
 <20220518014143.GA2024242-robh@kernel.org>
 <4ed63c3a-ec47-5801-ab89-b7d1a597c0da@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ed63c3a-ec47-5801-ab89-b7d1a597c0da@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_114343_956025_4B5EE739 
X-CRM114-Status: GOOD (  22.88  )
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

On Wed, May 18, 2022 at 10:14:43AM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/05/22 03:41, Rob Herring ha scritto:
> > On Tue, May 17, 2022 at 03:21:06PM +0200, AngeloGioacchino Del Regno wrote:
> > > Both MT2712 and MT8173 got a mediatek,infracfg phandle: add that to
> > > the required properties for these SoCs to deprecate the old way of
> > > looking for SoC-specific infracfg compatible in the entire devicetree.
> > 
> > Wait, what? If there's only one possible node that can match, I prefer
> > the 'old way'. Until we implemented a phandle cache, searching the
> > entire tree was how phandle lookups worked too, so not any better.
> > 
> > But if this makes things more consistent,
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> 
> Hello Rob,
> 
> This makes things definitely more consistent, as it's done like that on
> mtk-pm-domains and other mtk drivers as well.
> 
> The main reason why this phandle is useful, here and in other drivers, is
> that we're seeing a list of compatibles that is growing more and more, so
> you see stuff like (mockup names warning):
> 
> switch (some_model)
> case MT1000:
> 	p = "mediatek,mt1000-infracfg";
> 	break;
> case MT1001:
> 	p = "mediatek,mt1001-infracfg";
> 	break;
> case MT1002:
> 	p = "mediatek,mt1002-infracfg";
> 	break;
> .....add another 20 SoCs, replicate this switch for 4/5 drivers....

This type of property is used for poking random bits in another block 
(that's usually a collection of random bits). These interfaces don't 
tend to be that stable across many SoC generations. As there's no 
abstraction beyond perhaps what the offset is, the client side ends up 
needing to know the specifics of that block anyways. If the block is 
that stable, then perhaps it needs a common fallback compatible.

Sometimes these instances are also just places we haven't created a 
common subsystem for.

> and this is why I want the mtk_iommu driver to also get that phandle like
> some other drivers are already doing.

As I said, fine.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
