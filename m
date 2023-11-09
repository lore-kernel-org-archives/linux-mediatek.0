Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDCFC4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezkTnwI47dmCbSB4doHub/GhXLksmqVwuhyAF33RTtI=; b=T/l6XQ0QZlLiwvxCDYcGFM66mN
	0myB/kLNK1JZxDVzRNtSJHlEx2tkO4K4Og42FfUsPBEQss3lrcP39M+3TX1bIvBQus1IOajxX8h1l
	UCbR6doqvIJkHVQOA+qv3/SODHxNOB4hy4BDbj3qUKt82CY2R7Qd8S6PBSzOP5sVpw1zSnikItZa5
	o6QRrEWnTsrSgievbHq5zHYsvHildrZHSemWLvYC9azKzzjOlVs4QVuH1DJf41brvdB9HUnISJ0xu
	H28VHOIAbPL4Oim03C8RabRYYJj3MHimfk/wkGJLZkWMuemYldSOx0Ocd5F9UAfhHOwoK7Jcv0oTK
	UHvdQXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11t1-005r3J-1x;
	Thu, 09 Nov 2023 10:03:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11sy-005r2J-1s;
	Thu, 09 Nov 2023 10:03:41 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 656A56607435;
	Thu,  9 Nov 2023 10:03:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524219;
	bh=pwEpx+MGypxzSwA28V6syRhlcHgpJof7RIF00c+aBRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aJ/8xGCiHJjm+CzwAabNyyU/GTAjIxeHX99hblXV4BHBd4DHnYLUXAHjuLAR6v0i7
	 QL7RBgs8tyojA/aKIufbltXnwa7w59cKRCLfV/QgUlRA+wXk5HUUfepBmry8bswQYO
	 bjo4LBDFceemSp6R8A7bvU2n+7Ed3HM1h523gk4NH3YhQAYFJg3lWse9xPpZg1xTYT
	 1aQ08/atj10VsG8cKnvSWSzWwEe9C/ctDajHI3q3u6dfKbERJYbTZKip/ZUC+5Mmjp
	 A+IY/TDJyhvEW1/Rslkz2tnF2aC7YSgYlCvEIULsIpTmqXw/gSFbiw57kj6cEy9yhv
	 iRGES/Swt2qEQ==
Message-ID: <11b22d60-3a83-4385-ab1a-d8c2e672e24a@collabora.com>
Date: Thu, 9 Nov 2023 11:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/56] media: pci: dt3155: Remove useless check
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-22-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-22-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020340_752622_AF91DF37 
X-CRM114-Status: GOOD (  11.43  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> min_buffers_needed is already set to 2 so remove this useless
> check.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/pci/dt3155/dt3155.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
> index 548156b199cc..d09cde2f6ee4 100644
> --- a/drivers/media/pci/dt3155/dt3155.c
> +++ b/drivers/media/pci/dt3155/dt3155.c
> @@ -128,8 +128,6 @@ dt3155_queue_setup(struct vb2_queue *vq,
>   	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
>   	unsigned size = pd->width * pd->height;
>   
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
>   	if (*num_planes)
>   		return sizes[0] < size ? -EINVAL : 0;
>   	*num_planes = 1;


