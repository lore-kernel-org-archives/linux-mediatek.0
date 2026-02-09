Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B889E7E0CA
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pK5Jb5YU3/bUOSoHbUzBG2UQRqskDuKlCeBBelau2Hk=; b=DBkQok92QXyYjg+bfl8tN+t2UY
	TjYfRJUY6EvrHT7k4mVLYcxI9Fie2eJIOmntaiaaLTkaLr+ZbroYM7v3uHGzRXZZtd82a63GfwSSr
	SWU6W3V7vKr+oqETvsCW0POgaohNTFSRo6RhQYCLPoH6b7CrBbnhAfbOnMUjHwYa/BEBufWQ+RRrS
	cST0JzV3+C0KdtKL4v/wwPf5KF0zAmcAP/jFyo4sNW8byWwoEYneNIWjRkfHmokfMIAP/7bHO6/Ht
	27cSE9DqKgIm3IY966cIdNWCPY5I1QrLtgiDqOJLKWLnG5Phh+e1x4CATA3odI/CLwqT6lw1uKPoN
	SpOct5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPBs-0000000FHF5-1m1E;
	Mon, 09 Feb 2026 11:12:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPBn-0000000FHEO-290A;
	Mon, 09 Feb 2026 11:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770635539;
	bh=prs/+pekCsrcWWpQ9nWoZrcm7PMTmPz42teQbvfpKMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ePDf+wmsnkN4HZOJDSqmh1eJLQ8Lm2Iu64aayHftqUM9CoxSL+0X0aHGVsI0HQ1Lc
	 Fyz2Xes1Nq5C4lWyRTLw/I4I5uZgzj7l6Tfvz4iZfsQxnUY9pWQjRWgr3Iu8q3tJkd
	 hNrrqcf8a8+rLgl0TEIzHGV5iMb5brZVcKdW6XmqVVNrBYfwh9zeoiyVX2m8rJQn0h
	 w06QJA25Qd+bkmhKEPKZ4mtAXoJqkFNUVawxKzGHJUjz9hfhaznRR88zKsYsFdnvBL
	 XdsCAw8WiESwCozCG1oTozQgNkKlyIj1E12cwnXH1jbm/onR4YJN9+3xGW9OHkFMTe
	 5INIzqP7grJ2w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B7BC17E0699;
	Mon,  9 Feb 2026 12:12:19 +0100 (CET)
Message-ID: <e50c03af-309b-4a9e-99b9-048203e8acf8@collabora.com>
Date: Mon, 9 Feb 2026 12:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks
 lost during merge
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260206122623.670023-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260206122623.670023-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_031223_795388_499EB16B 
X-CRM114-Status: GOOD (  16.70  )
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

Il 06/02/26 13:26, Luca Leonardo Scorcia ha scritto:
> The original patch at
> https://lore.kernel.org/all/20201027160631.608503-2-fparent@baylibre.com/
> included the values for the route masks, but they got lost during merge.
> 
> Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Hello Luca,
thanks for this patch!

I agree that the masks should be corrected, and I think the code itself is all
good stuff. Great job!

However, the commit description needs to be fixed; please, don't add links, as
those are meaningful now, but may not work in some years from now.

Something like:
"The original patch that got sent to the mailing lists included the values for
the route masks, but they got lost during merge: add back the full register
masks where missing"

...the Fixes tag is good.

Cheers,
Angelo

> ---
>   drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
> index c468926561b4..eef14083c47b 100644
> --- a/drivers/soc/mediatek/mt8167-mmsys.h
> +++ b/drivers/soc/mediatek/mt8167-mmsys.h
> @@ -10,24 +10,29 @@
>   #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
>   
>   #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
> +#define MT8167_DITHER_MOUT_EN_MASK			0x7
> +
>   #define MT8167_RDMA0_SOUT_DSI0				0x2
> +#define MT8167_RDMA0_SOUT_MASK				0x3
> +
>   #define MT8167_DSI0_SEL_IN_RDMA0			0x1
> +#define MT8167_DSI0_SEL_IN_MASK				0x3
>   
>   static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
>   	MMSYS_ROUTE(OVL0, COLOR0,
>   		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
>   		    OVL0_MOUT_EN_COLOR0),
>   	MMSYS_ROUTE(DITHER0, RDMA0,
> -		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
>   		    MT8167_DITHER_MOUT_EN_RDMA0),
>   	MMSYS_ROUTE(OVL0, COLOR0,
>   		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
>   		    COLOR0_SEL_IN_OVL0),
>   	MMSYS_ROUTE(RDMA0, DSI0,
> -		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
> +		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
>   		    MT8167_DSI0_SEL_IN_RDMA0),
>   	MMSYS_ROUTE(RDMA0, DSI0,
> -		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
> +		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
>   		    MT8167_RDMA0_SOUT_DSI0),
>   };
>   


