Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47851C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 15:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B04A20801
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 15:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="edY1Ee/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B04A20801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EACTag0p9Rf6NnMc4RFmTzNXjX39cYNuD49Opz/MyBc=; b=edY1Ee/Da44dTb
	M+HyQ3lFEkZS92rRS+uemP8pNKVha7vMGU5c+58ndvJFUUUo7OjAxwojJsGAElz4zkq9vdKt+YZQk
	/ZvVKk9qstaUfQSkW3yHiQugzY4LiixaNlJq6g2cabksuw+DfWzJ+qfkfiG8kPGjJi09DFBOezmTx
	XK7GQPFbEBj9DTq8NvOg3ebjFIqrUmVFhJuC7+uyTcCixhLxmhw5gjUnpm98suuRIabue/fhNmePz
	EOCp6ibIEZ0w78vi/aVRoe7/LE2aZ0ilcIVKydPLbwuk1zWd5EltUhuz183AxIjDjTFaNxlvgyqYT
	+9hDjxq2Gt7ffdb7uNEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjldg-00012T-TE; Fri, 12 Jun 2020 15:30:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjldV-0000sf-8o; Fri, 12 Jun 2020 15:30:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 54BF72A5693
Subject: Re: [RESEND PATCH 0/3] Convert mtk-dpi to drm_bridge API
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
Message-ID: <d5f0fb47-f0cf-f3cb-485a-3bba97c736fc@collabora.com>
Date: Fri, 12 Jun 2020 17:30:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200518173909.2259259-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_083029_443199_85AD5C88 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 18/5/20 19:39, Enric Balletbo i Serra wrote:
> The reason for this resend is because I forget to add some bridge
> maintainers. So adding them and collect the actual tags.
> 
> The mtk-dpi driver still uses the drm_encoder API which is now somewhat
> deprecated. We started to move all the Mediatek drivers to the drm_bridge API,
> like we did for the mtk-dsi driver [1], this is another small step to be able to
> fully convert the DRM Mediatek drivers to the drm_bridge API. A dummy
> drm_encoder is maintained in the mtk-dpi driver but the end goal is move all the
> dummy drm_encoder (mtk-dsi, mtk-dpi, etc) to the main mtk_drm_drv driver.
> 
> [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=441559
> 
> 
> Enric Balletbo i Serra (3):
>   drm/mediatek: mtk_dpi: Rename bridge to next_bridge
>   drm/mediatek: mtk_dpi: Convert to bridge driver
>   drm/mediatek: mtk_dpi: Use simple encoder
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 84 ++++++++++++++----------------

A gentle ping, I think this patchset still is missing a reviewed tag from bridge
maintainers if is fine.

Thanks,
 Enric


>  1 file changed, 39 insertions(+), 45 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
