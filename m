Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAR9qxpkfOXQq5b0OIZvAs6u5BdD4prv/8khtUUpUVE=; b=z1ONsALwuBZ2AD
	Uln+shP3VjS21iklsp78lVbDTmT5ufn5jmL0f8Zq9VAxyG168OYSITwIF9B8+IHJ1EUJnYbIzk50J
	PRpG0ONlKSBEYa5lLFoy+0gQL+bhlxBaVZ8oefIeLrdh+7nuIv/xIIKeXzdNWpNYKgeHqjyES+UpS
	WM+QLXBO7t+JpH7LpNvU01ieuicsG1GIiNfTdI72c4p8jfNhkC8yJts/7FOvtEIyPTvo7a7YQZBs1
	nv/6EdrqIFwloDqJQ/V3BoWM3FjY+jXsuMdC6R2AKJmz1IujRvb+ad5BmdVKR6DVwJhI/HO/qo2bQ
	vM+AVoo1rHYhATPjic2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEsH-000Xmn-GJ; Wed, 18 May 2022 08:17:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEpU-000UmJ-SK; Wed, 18 May 2022 08:14:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AA4611F4204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652861687;
 bh=bxhlZVwcajiZSFDXfD98BHfzwz+so3WTdIJAkwePssc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y9QnZsP/QoDnDEAOgvnBEzK6pLWaWobcj5rdgAxSDyduLrL0YZoWRhH/ffHzUtX8t
 LKEVbo6qtwxlfD+RUKGOK4r8UMyCnWtEdty3bPBbRDnFJk3snUJGFCyXC3+B4DLpLE
 Wor+uQgSmtlbNhFMP+TWFNF7iadBw24C9KVgNNoULgFR7hjXOuV6xQtdgyYvvEGLa6
 g8Ie3wFKfCq///es3Zu0XxdI7mbX3v3NcmL9qL/gY+piOIlhXb367bDJJrD198KQ5b
 3OvdJJtv94RG1i5xNZLLg5qbqFP28kKJaZ8xZ6s63MLkXA6Aer8qA9ah7Grc0PRLaW
 9qY9EgwPrPiBA==
Message-ID: <4ed63c3a-ec47-5801-ab89-b7d1a597c0da@collabora.com>
Date: Wed, 18 May 2022 10:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 7/8] dt-bindings: iommu: mediatek: Require
 mediatek,infracfg for mt2712/8173
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-8-angelogioacchino.delregno@collabora.com>
 <20220518014143.GA2024242-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220518014143.GA2024242-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_011449_119000_88EB8376 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/05/22 03:41, Rob Herring ha scritto:
> On Tue, May 17, 2022 at 03:21:06PM +0200, AngeloGioacchino Del Regno wrote:
>> Both MT2712 and MT8173 got a mediatek,infracfg phandle: add that to
>> the required properties for these SoCs to deprecate the old way of
>> looking for SoC-specific infracfg compatible in the entire devicetree.
> 
> Wait, what? If there's only one possible node that can match, I prefer
> the 'old way'. Until we implemented a phandle cache, searching the
> entire tree was how phandle lookups worked too, so not any better.
> 
> But if this makes things more consistent,
> 
> Acked-by: Rob Herring <robh@kernel.org>


Hello Rob,

This makes things definitely more consistent, as it's done like that on
mtk-pm-domains and other mtk drivers as well.

The main reason why this phandle is useful, here and in other drivers, is
that we're seeing a list of compatibles that is growing more and more, so
you see stuff like (mockup names warning):

switch (some_model)
case MT1000:
	p = "mediatek,mt1000-infracfg";
	break;
case MT1001:
	p = "mediatek,mt1001-infracfg";
	break;
case MT1002:
	p = "mediatek,mt1002-infracfg";
	break;
.....add another 20 SoCs, replicate this switch for 4/5 drivers....

and this is why I want the mtk_iommu driver to also get that phandle like
some other drivers are already doing.

By the way, thanks for the ack!

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
