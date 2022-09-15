Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF87ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkWw9n+aMq0f5YReQ23BAqGMvneTFmQvSNVX+N5RGYU=; b=Vg1bFskj7g9rDF4NSux53iV1MG
	652h7zhkw4iGHYdVFNeWbPIQpJ9YaJKOnugHNdCi8a4V2WqGGdOBbkHeLMFhJ03Kw67uGjX+oJq1S
	o6jEr/9DuENZ/Bwrrb+OktA64FQBU3h06QOIZ6Z4sMAtzymKJFmyomLpi0ERwqdyl6heZqiyUP1Aq
	fZ3Lh04QxHd3PV5E8Kpw+OfbGReh7CMpGn545oLV5SOw9Is2X+Lkw65x6plfk/q+C2beI5YEQ2GFF
	51T3suiE3ARCgxbBhDY+xVXGTKk1/PLh8TANqXjA0kmTd0hZm2e4cugetnCYEMSJv0nyStKrn0bgC
	rM6UYy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkmz-004bJy-Uf; Thu, 15 Sep 2022 09:04:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkmx-004bBb-Fx
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 09:04:05 +0000
Received: from [192.168.2.145] (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A095A6601DA4;
	Thu, 15 Sep 2022 10:03:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663232640;
	bh=S1YLvSizmUIQcrD2uYb2yCCIIfInNdi/mmbDQPuBE7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ug7NuurWv5VYl66s3rVq9CSL/vNzMEOfhHT2ruSW68q9xGzLhp6Qkfn8ZfScefyLt
	 PRLwH8VtPDW2cDmQqSUMkaAc1TfscCL/9Wh7h0Pyju5MdmhWswtgWgg+yyBa6nQzAg
	 usXsLgIXDU2UsR6TthrLvKzeUbwwJbUHWV57B6PoUXzTS8sUlkRcrtefimM00NfsTc
	 Qngewm65dKVK5Ll1gY84IDo1VvWmlH+haIH8XCXbfuvo/le+esG+93p5IW+YVzR0G/
	 4acjmReIpANfUOfkSEuweeD8PR7g8aaRPVrgl1iXi9jY4BeiVU+rQZDjqS0jTVcdAi
	 qKN2B3rUDGZJQ==
Message-ID: <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
Date: Thu, 15 Sep 2022 12:03:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, msp@baylibre.com
References: <20220913134929.1970187-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220913134929.1970187-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_020403_718576_2984D84F 
X-CRM114-Status: GOOD (  15.71  )
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

On 9/13/22 16:49, Yang Yingliang wrote:
> mtk_dp_driver is only used in mtk_dp.c now, change it
> to static.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index dfa942ca62da..6a8c0f4c5c09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2642,7 +2642,7 @@ static const struct of_device_id mtk_dp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
>  
> -struct platform_driver mtk_dp_driver = {
> +static struct platform_driver mtk_dp_driver = {
>  	.probe = mtk_dp_probe,
>  	.remove = mtk_dp_remove,
>  	.driver = {

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


