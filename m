Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD6C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Me34yvIstfXDoxEYpqphpwJSCUjiB81sUyT7gEmrSZI=; b=dYIk7pKKUZrcXCDfGZt3RfXlmf
	WERBya6i30P1qQ2kGRmVpHcYBnOImF+jXIFktjbN30UIreAHlvUsve4ZmN6UUM7eBcjuG+rKtpCaK
	tqCTdReQSw8rGjl2MPTnVcOPLI1rNl6HuBcuGi/zuHUV4Dx06mQRO5tI3VwS2HGRAWLCvGaBnmz5k
	DyJpHcvV3fdsaV48YO98vAyLfI2XAbBobpks/gpNCirI0qHRHNEC+9+FfZAwDc1Mo3smqx8+OKeEf
	aRbt50AeC66O1bbX3qYY+70vr1PWD6DVRCbHq7jfhykkyq0KvAo4emUoso/kl+aP0HKBuDNUvJKSI
	C3jjxNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gx3-00Ga47-0T;
	Wed, 31 May 2023 08:13:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gx0-00Ga2p-02;
	Wed, 31 May 2023 08:12:59 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4207A6605840;
	Wed, 31 May 2023 09:12:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685520776;
	bh=3jHnkXoSBbZgKG/dl29z1pDf2aC+nSfccT04ENZNaf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MuQDt+h+ax9A6pcSl/ydOzBb+HXKYiPc/OXQ1KeN2dXObfUeQUlm9nm3ALwdfE3AA
	 Yt5CdxHwF3NbhFRIo7bHVV6zpc3tGwdzm7GestajpZ2LhYhuda1Jwp+sI+lFzij1GV
	 v81O0/FeHE+YiNcWIb5/3Qf/82ls2dCvJ8EaDKSzqDxNKWoG5EbTXcVyEPWYXhmT5a
	 7CIop/PknOrP+9eT1WVVphEYKKdk+ozgXBByitLdteWWVIV43EHI91OzHn5upZpHrZ
	 VOGXS+Sq/oQ3Zr5oCXmBxbw7L3kVtwM6xCRM3S9CKbfWjk3epXo/gOp4Ba+qy6M18Q
	 6vnvI/z1b5P2w==
Message-ID: <8cd77fb6-ed45-8f7a-93f4-e795c898168d@collabora.com>
Date: Wed, 31 May 2023 10:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] soc: mediatek: SVS: Fix MT8192 GPU node name
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230531063532.2240038-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230531063532.2240038-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_011258_194126_2A8735C4 
X-CRM114-Status: GOOD (  15.43  )
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

Il 31/05/23 08:35, Chen-Yu Tsai ha scritto:
> Device tree node names should be generic. The planned device node name
> for the GPU, according to the bindings and posted DT changes, is "gpu",
> not "mali".
> 
> Fix the GPU node name in the SVS driver to follow.
> 
> Fixes: 0bbb09b2af9d ("soc: mediatek: SVS: add mt8192 SVS GPU driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Hahaha, I was about to send the same patch! :D

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-svs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 81585733c8a9..3a2f97cd5272 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2061,9 +2061,9 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
>   		svsb = &svsp->banks[idx];
>   
>   		if (svsb->type == SVSB_HIGH)
> -			svsb->opp_dev = svs_add_device_link(svsp, "mali");
> +			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
>   		else if (svsb->type == SVSB_LOW)
> -			svsb->opp_dev = svs_get_subsys_device(svsp, "mali");
> +			svsb->opp_dev = svs_get_subsys_device(svsp, "gpu");
>   
>   		if (IS_ERR(svsb->opp_dev))
>   			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),


