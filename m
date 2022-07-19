Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05317C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTkbwHV0mOtp0z/6cX28miDp8MHqUdj7J5ZyCOHAibQ=; b=KzEI1Lkf5iQodvvi+SBdfumweq
	WPAAtLqEYeheEYS9/lfzMxlChqjZ4XEHUJevDqNT5drpcXKGq2c50WP8YYCNjeia7wqrHFCNnyTqJ
	zc/eLZ1uOk/kYDLYgJ7qyZerMuM6/HLARP+wWdZ3btj7guVqyR36ZqVoe9631XoSQ6m3d94qYtz12
	FTwJFkmF25vYCVlOtXRN9QkXFkxAzNoecKhnz6vW2P9THIETmYL2KsV7zYHwmTAnKEVUrbf402i/S
	WCnLoPsh9BBGttgrdlKo2chIZZLGy2cALVka6CD0DVh7idxem/itGeBE3Z4DbCDRG8BHm7detgT2A
	pGC9n1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjVD-007LP6-Eq; Tue, 19 Jul 2022 09:26:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjV8-007LJ4-Fz
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 09:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658222805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTkbwHV0mOtp0z/6cX28miDp8MHqUdj7J5ZyCOHAibQ=;
	b=UcGr1+5g9UR+BiCKiKV9COaPR4MQFLFQJlp0TtPCItIaIi7fV5r29J+HxYKk25y2E32a+F
	B1DEiVAhyYi/hGRQArJ9xxyfex77PSjbNSe0lYqSHcZSXNZZeidiR+QKvKhwelgOjxkd9Z
	Cfqjir1PJHLAViQa68oqnD3OsXIwskA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-ysVHAHuDNMu_GIZlh3Zj6Q-1; Tue, 19 Jul 2022 05:26:41 -0400
X-MC-Unique: ysVHAHuDNMu_GIZlh3Zj6Q-1
Received: by mail-qv1-f70.google.com with SMTP id p11-20020a0cfd8b000000b0047318870bdfso7070794qvr.14
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 02:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eTkbwHV0mOtp0z/6cX28miDp8MHqUdj7J5ZyCOHAibQ=;
        b=m6kW26V4Qksn+n/hQmgpuFxUP0X2nm6mrWFWkQjLydj9H14KiFYI9U/tyvBldR6c2u
         aAIQZIBdgbM4jROSEzeCubpB8NQQoaKUSrqXpPmHcsZhMiQGrnRAJHD4zL2OYla2Hb3E
         F+Ul/jifVAoTmhaAoGDzYuJ131XvXsGFj8YHv1ybEBMtDhnbTiIVbN2hoJagYuQOl9MK
         pxr59mKAaXGaXd8rv97ebbtSh22YYrOj/LG7xh0r8ctBsb38ByOPXTApB0r2jzofTqlT
         jap8//74tKuNgxogoxtI/e0SWMrTT18R+swYCpde6/e+m4I+rvgwDIxsqHw48Se8uAEq
         kCCQ==
X-Gm-Message-State: AJIora8M8i7rKPLnG7lp3j0kYHn2adLRu9ZQMvuHa0YgnOb1ryT8JRlQ
	O1N0Thr+Z5basCeU2RiNs6QpjfwCtz80tnlKo3LOBWjDohgKV3MRHwUjkCx6R72SK6FcLOc4lgA
	0w7qahpYUPnsh6TW2m1nM9OqSPxbfecH1
X-Received: by 2002:ac8:5f88:0:b0:31e:f6dd:8f13 with SMTP id j8-20020ac85f88000000b0031ef6dd8f13mr3850073qta.186.1658222801452;
        Tue, 19 Jul 2022 02:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYwWkPsogu92WD69xPrFD8ieER9ewEMGjIxtpW12bu4A8xXH8X7r+dVbw98IyMHM+vkMD/6Q==
X-Received: by 2002:ac8:5f88:0:b0:31e:f6dd:8f13 with SMTP id j8-20020ac85f88000000b0031ef6dd8f13mr3850055qta.186.1658222801205;
        Tue, 19 Jul 2022 02:26:41 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-164.dyn.eolo.it. [146.241.104.164])
        by smtp.gmail.com with ESMTPSA id dm53-20020a05620a1d7500b006b4880b08a9sm14168481qkb.88.2022.07.19.02.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 02:26:40 -0700 (PDT)
Message-ID: <43ff0071f0ce4b958f27427acebcf2c6ace52ba0.camel@redhat.com>
Subject: Re: [PATCH v3 net-next 5/5] net: ethernet: mtk_eth_soc: add support
 for page_pool_get_stats
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,  ilias.apalodimas@linaro.org,
 lorenzo.bianconi@redhat.com, jbrouer@redhat.com
Date: Tue, 19 Jul 2022 11:26:36 +0200
In-Reply-To: <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
References: <cover.1657956652.git.lorenzo@kernel.org>
	 <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_022646_675973_DB8C4B11 
X-CRM114-Status: GOOD (  19.58  )
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

On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> Introduce support for the page_pool stats API into mtk_eth_soc driver.
> Report page_pool stats through ethtool.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/Kconfig       |  1 +
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 40 +++++++++++++++++++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
> index d2422c7b31b0..97374fb3ee79 100644
> --- a/drivers/net/ethernet/mediatek/Kconfig
> +++ b/drivers/net/ethernet/mediatek/Kconfig
> @@ -18,6 +18,7 @@ config NET_MEDIATEK_SOC
>  	select PHYLINK
>  	select DIMLIB
>  	select PAGE_POOL
> +	select PAGE_POOL_STATS
>  	help
>  	  This driver supports the gigabit ethernet MACs in the
>  	  MediaTek SoC family.
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index abb8bc281015..eba95a86086d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3517,11 +3517,19 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
>  	int i;
>  
>  	switch (stringset) {
> -	case ETH_SS_STATS:
> +	case ETH_SS_STATS: {
> +		struct mtk_mac *mac = netdev_priv(dev);
> +		struct mtk_eth *eth = mac->hw;
> +
>  		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
>  			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
>  			data += ETH_GSTRING_LEN;
>  		}
> +		if (!eth->hwlro)

I see the page_pool is enabled if and only if !hwlro, but I think it
would be more clear if you explicitly check for page_pool here (and in
a few other places below), so that if the condition to enable page_pool
someday will change, this code will still be fine.

Thanks!

Paolo


