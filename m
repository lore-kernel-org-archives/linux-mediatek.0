Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC7C0018C
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biOdr//NNaFWYf7Eq0GEPRMRBbQ6wB/xHGVW+Fuxl50=; b=AlUkN7x75uohyqxEUKyk2hSKh5
	J5HdThyRR013qUkBcXC9mj+44lHgvmSHZ3Oou5BjRvvT+obIN3x7c8GDigW4P9QVvJ2gwMGdgSq6q
	HsW6UMIToEGiMHl4bpTKXqHfsUnGymH27QpVeg8nwqUxC4NWnvB2wh5OvHCwMQnljpWJFv0GMCsQf
	biwCel2ycOOFqd0hrJi5F7+ou0yC6WFtalRynEOrndoO20sT6MjQW5hrxL0ehJO5qk8shNxwQSnWY
	TB84NuuAkFWP3zJEcgw2t1k4pEJHYthVwN0Mm2v9EyLRUNxPchBjo82vXZTHqaYP8V/3rcM0jOKtt
	m544LRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUF-000p3l-11;
	Tue, 07 Nov 2023 08:31:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUD-000p2P-16
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:31:02 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 772F566074B9;
	Tue,  7 Nov 2023 08:30:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699345860;
	bh=yKQJD7ZBKcHGUWXd3GzZKFwSDEFqn99afjMFFcXUvPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H+0nBzSe19XoVpVr9bCgr39Iajf6iRKPqjdGq6A8H4pSYZqIpM+XWP3mAQgK/Zz4N
	 LGCTHH3czA+q6HGIyytlZt3SFEc2mQQ4AGpEib8j7oh9l+FW4kKv1HHDJVfxf41+BR
	 /TR0W80lq7GhqW81Nl/uRdvRjetw2oT9mNdbNT1Vdv8aPfKKhH3Y2HKGVEvPhYbubY
	 nze16TJlZyI0nwHXgxv5oLQR0hTIJLnFFzF2M671ejbIesIvbVgFPn7xeKlo616GLG
	 KV2POp7SS2UOONs6wzmCWqo1+fp+uREC8XmgN89y+cFWM6qaEPb67C5pPc7vJ5I+Mk
	 7IN6OqUK/8kmQ==
Message-ID: <9a30463b-3581-4738-9eea-b45e0c9a1d7a@collabora.com>
Date: Tue, 7 Nov 2023 09:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 3/3] ASoC: mediatek: mt8188-mt6359: add two amps support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_003101_503590_D12777F5 
X-CRM114-Status: GOOD (  14.81  )
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

Il 07/11/23 04:14, Rui Zhou ha scritto:
> Support codec rt5682 using two amps.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Can you please change the commit description so that it's clear that you're adding
the two amps support to the RT5682s variant? As it is right now, it reads like you
are adding that globally.

ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188_rt5682s

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index e994faa3556b..917640939621 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
>   
>   static struct mt8188_card_data mt8188_rt5682s_card = {
>   	.name = "mt8188_rt5682s",
> -	.quirk = RT5682S_HS_PRESENT,
> +	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
>   };
>   
>   static struct mt8188_card_data mt8188_es8326_card = {



