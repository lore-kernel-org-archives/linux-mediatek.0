Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D376ACDD57A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qem8dpLlHZeTW6w8r4xUbKX8sQS48mZBpM8PfVcwDpI=; b=owkZ6n5vx9rRlVFgdAYUK+0JVX
	y8nSdYDvjIBwFpIcWsmCXDa3suXNMfTfIvBkNKPcbnOLcz+yys9YUnemP3cTQ6ZtlwsRkDrvYkFZF
	XC1I83gMBX4w21jZSblIMvRaH097XUj7zDntfHH2foD8OyVeyJL0Df5Voiy+fGovJjS8hMTEvk1ZB
	hw5nXQkk1DFAWZXK3DGgXBG5txl9fhpc4V2U4/Ht9wlEvJwOL2G8vIzj+AWOKAdr/IVZfFVGkDLA/
	xoLzKiQt2BuwKkWl+X/BAUeoBultTf/p55ErK838tRdggt0lt1YZh8TDih36egv2Z/Ore/3oYEkSn
	yoNLROww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srGyi-0000000AJj3-15VI;
	Thu, 19 Sep 2024 13:13:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srGxZ-0000000AJXn-2whx;
	Thu, 19 Sep 2024 13:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726751555;
	bh=mbKPeHX5dPDsgxkJ1kYk8sbygspVme8Eho7Kxjhv+gE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T74+YVZUmPw6cCqQlEIa43Em8BrGfi1YTE7GEDSgxOkWRHnWKKsm6PuemZ/v1gq52
	 X5ZGvb3IBCm3dSE+4ADp62mOBKgjDL9X8esS3O45+2ci7/eaL+kBP3f3H+lgpsExia
	 NnoAkuz35WnhQ052/t8gpCqaRiqxwXgtgqUfEiQ38tKG50zw8FQ1b92iguajWxENuH
	 zoRjcpzBpvy0uAigH03DnHc4n512HX2T80jGl0tmDhDq7Iuvd2kwS540eojo/2GCEg
	 5kHE+ppWrQX6hH/JaKLqNd8kfScBTdpPBU3wwlKrX4TqxS8mh87eq1zbwTN8eaCORz
	 BYDX4AW2s3xXg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91A6917E14F9;
	Thu, 19 Sep 2024 15:12:34 +0200 (CEST)
Message-ID: <ff80024a-90b2-4a19-b827-23be69352f78@collabora.com>
Date: Thu, 19 Sep 2024 15:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/mediatek: Adjustments for mtk_gem_prime_vmap()
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_061237_942194_02D12B50 
X-CRM114-Status: GOOD (  11.26  )
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

Il 17/09/24 19:34, Markus Elfring ha scritto:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 17 Sep 2024 19:16:45 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.

Hello Markus,

In my opinion, the suggested changes aren't bringing any improvement, not
in readability nor performance ... nor anything else, really.

For how I see it, the code is fine as it is, but then, that all boils down
to code style preferences and nothing else.

Cheers,
angelo

> 
> Markus Elfring (2):
>    Avoid duplicate sg_free_table(sgt) call
>    Use common error handling code
> 
>   drivers/gpu/drm/mediatek/mtk_gem.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> --
> 2.46.0
> 



