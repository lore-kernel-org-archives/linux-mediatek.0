Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69579C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar/qLjqxZ3e9vJvZ6KFe7y1XnNFHQ3iZOsQlUHemt2w=; b=Z0xSAkIvFk0YmMSNssistw/aEO
	+excOSfENxmkYHiV2rMx1cl7ov9hXm/XbTzSru7RHhpCrpXYO+IO0PMmy6JveyWp0hh063MTFw2kB
	rsCJQgzMBQ34OqfBiX00BXX38twOEjhfoD480nYm4fTY8g73DidCiwtB3JvFMGJGYaUTD0tfLRTRC
	rg/LUuNhaO8rsZZp5eEVraJtbLV30I5mvyiuZ4aT+heuwPFC3tJ3oTHSsamxT1I1bpmywOMx9UPqW
	nBpj3kDrF1VgQLZtGzXjnpWwvbktyVp0KxFbz/EqhfpCyPw7ygIpe5O+5gjgkEWfiv9TqDaNr5wUG
	b6PLSBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6rh-001exV-0F; Thu, 09 Feb 2023 13:21:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6rW-001ev8-Ne; Thu, 09 Feb 2023 13:21:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9573E66020C1;
	Thu,  9 Feb 2023 13:21:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675948877;
	bh=5Zwggcv6csLJeI2CM8HO2R5FA3YxEaWsL1q4vCEhuE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hYhiRmHYAPd4d++aa+z/MEHxnotplT6a/+agw00/QYjepIBe6j5kw6oAh2pPo0bym
	 jLJw4RkfPzQYgH97L6EXpWlOevTIZfCZEBFjij+/p3Ev9Dr66zzK3GFJDil3A7R4gi
	 yv7vcLhkZi+a7nRYKzSfiL+7kfQPdwLjPH3s/FJC38QhvkGGdbrOCmF7J17GeZwsjU
	 QTtX+Y9u0POfvOJA9cTiPuwJdnr4qV21XRtPZG4+X9Xsir+DuyzK9OIDD/Xy3Whxm5
	 eAF/BAcPY9rXuR4cCBTT1gt2+XAWp2rgETMK/JTA/iLiAWwQnrOCZnoTBC4wfyvoj4
	 Ho/Z7ZroHXuXg==
Message-ID: <14602081-c361-70e2-afd1-4f5dad8e2869@collabora.com>
Date: Thu, 9 Feb 2023 14:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] media: platform: mtk-mdp3: Add missing check and free
 for ida_alloc
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mchehab@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com, daoyuan.huang@mediatek.com,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230209092502.34300-1-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209092502.34300-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_052118_932645_91258D95 
X-CRM114-Status: GOOD (  16.49  )
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

Il 09/02/23 10:25, Jiasheng Jiang ha scritto:
> Add the check for the return value of the ida_alloc in order to avoid
> NULL pointer dereference.
> Moreover, free allocated "ctx->id" if mdp_m2m_open fails later in order
> to avoid memory leak.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v2 -> v3:
> 
> 1. Fix the goto label.
> 
> v1 -> v2:
> 
> 1. Fix the check for the ida_alloc.
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> index 5f74ea3b7a52..a2d204e90aa4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -567,6 +567,11 @@ static int mdp_m2m_open(struct file *file)
>   	}
>   
>   	ctx->id = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
> +	if (ctx->id < 0) {

There's one main not-so-minor issue here: ctx->id is u32.
Unsigned types cannot evaluate less than zero: they're .. unsigned!

There's your fix:
	ret = ida_alloc ...
	if (ret)
		....
	ctx->id = ret;


Enjoy.

Regards,
Angelo


