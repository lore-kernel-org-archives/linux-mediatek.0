Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41501D0EE34
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4RHv9v6ZhC8cnkTz8y7JlOr/v6zNKbbWEOI5pht8Z0=; b=QIpMw+8KXW8cjMMTWqXZbwqgNT
	HYnsq7I26ah02OukTpoWCxtxvM55VPnpDv8chNGzEg6abeFS798cVpIVtcuaaRZCq2cw/3d9dGFtq
	8SWo3OaHAWD14/mxYYw5cc5zxDGHza8yazrGQJ61BdN2iqpe3P6zIXyCCz7+fqZ1iWo5d/0J+OuPS
	PBNmi4VtPFrn1htPwfX/ueIQEysGLTJswMkPwkJvDd3OSmlnF3S9at/oPVvvhx8zQs00mfVcDVfTM
	ypDyjhSb+px9/jJvnEoogG8MaMhWp1lXbkEvAfkBK3wNXsZpqiwwHiL6t9Si3iIuDCZkClYlkcTl7
	0xZCKDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szMF9-0000000HWi1-0WDj;
	Fri, 11 Oct 2024 20:28:11 +0000
Received: from mx12lb.world4you.com ([81.19.149.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szM5Y-0000000HVvE-1BV8;
	Fri, 11 Oct 2024 20:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U4RHv9v6ZhC8cnkTz8y7JlOr/v6zNKbbWEOI5pht8Z0=; b=LZ+tSF9WCSrPPw0HNke0G7Gr07
	NEzrFV5VUbOdNehlee5ZPfU/R3GT/m3SZbBtGUfBKd/NXSRcxAVbLXFec7xoFCWk3ci2nXMjRvFgc
	Vcg8OtSxmJpPwIS0cvscKoNsO7R4bkGwz4f2/DOmR0+Y0BXqmqETD7atP+mOYLLAuawo=;
Received: from [88.117.56.173] (helo=[10.0.0.160])
	by mx12lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1szM5K-000000003cY-0f2y;
	Fri, 11 Oct 2024 22:18:02 +0200
Message-ID: <769f3405-9905-4a26-ba8a-baf30e591f54@engleder-embedded.com>
Date: Fri, 11 Oct 2024 22:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: mtk_eth_soc: use ethtool_puts
Content-Language: en-US
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20241011200225.7403-1-rosenp@gmail.com>
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <20241011200225.7403-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_131816_358592_036D4D59 
X-CRM114-Status: GOOD (  11.79  )
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

On 11.10.24 22:02, Rosen Penev wrote:
> Allows simplifying get_strings and avoids manual pointer manipulation.
> 
> Tested on Belkin RT1800.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 9aaaaa2a27dc..6d93f64f8748 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -4328,10 +4328,8 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
>   	case ETH_SS_STATS: {
>   		struct mtk_mac *mac = netdev_priv(dev);
>   
> -		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
> -			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
> -			data += ETH_GSTRING_LEN;
> -		}
> +		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++)
> +			ethtool_puts(&data, mtk_ethtool_stats[i].str);

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

