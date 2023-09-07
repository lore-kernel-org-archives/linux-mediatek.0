Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D056CEE14DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDSPxaEhken5fg7LKbFevEz8A6UJvXXgUCQld/d7ev0=; b=g+cgoLueNWxHHeCQdN5yF/t8CF
	PNeYQU23JwKd933xhtVuLFGUEs9Mlf5puAvATx+DmIq1JSuQRhyFK8i6OIvT4eypZyibfF5wsUFZ7
	ja1nruvcdW3M/3TE3MR+hdEydzUq8KYAggGwmY3UFhqnmWqC+tvJiqxe0bpCMw+OmLsWd+tYGQXkn
	OnRTAmXb7zs+Q+/ybSXSq+awZLTvbbFN6xIi1LOdzHAdlUCg5ecWYTGf+B7zOMr4ZRSIG6GMJLLTg
	VE17BoUqUfLFKmWUuGKUhSfz08BYeMJVMFbo7sfwbWz9gE9EEoXnqrccFbjuWWq9HU+Lnb7mrY+B7
	rqxynyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCTs-00BnoE-2P;
	Thu, 07 Sep 2023 10:43:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCTp-00Bnl2-1Z;
	Thu, 07 Sep 2023 10:43:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B2EEE66072BA;
	Thu,  7 Sep 2023 11:43:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694083395;
	bh=AtNfCg0ORcDFoK5Walc1Hu3UGCme85N5dgstHaeabAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NejBNi91GDBi0Au8P24t4H4LZjQGG9Ryf1BpDJdsXgET3EkPKMCZFUG7BCYuxsp0A
	 L5J666GBfK2HyOu6yTaz/Zdt9srJi+5RKfsPZV35jTt1DuIjOV5nERNjqPd61FOF9M
	 1HiviQkDD472ch4zIdW+FtQekf0Fqf3SaP8d0MbPWgZ0QpNRuBKobGhS7xydNgFhgX
	 uUE0F5MmxWTv8He1c0FXyZ6t8nMYMInIUVo0N72Mqo1KXMOA4MxZJJvh5lfKIFp7+p
	 X7z5G8hFmmvlxMnVt4LcbxoOqjM8OW9eDq+vbWzlIYRdMbQnJ7STxw4HIqlaHsKBtK
	 d2YAIXSKPE/tQ==
Message-ID: <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
Date: Thu, 7 Sep 2023 12:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_034321_677672_4A609B7C 
X-CRM114-Status: GOOD (  19.71  )
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

Il 06/09/23 10:48, Harshit Mogalapalli ha scritto:
> When mt6370_chg_field_get() suceeds, ret is set to zero and returning
> zero when flash led is still in strobe mode looks incorrect.
> 
> Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>   drivers/power/supply/mt6370-charger.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> index f27dae5043f5..a9641bd3d8cf 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
>   
>   	if (fl_strobe) {
>   		dev_err(priv->dev, "Flash led is still in strobe mode\n");
> -		return ret;
> +		return -EINVAL;

I think that returning 0 here was intentional, but I agree on a return ret
here being both confusing and wrong.

That's how I get this logic:

The function is enabling strobe mode, but if the flash led is *already* in
strobe mode, the function exits cleanly because there's nothing to do, as
the enablement is already done.

Hence.... I believe that the right fix is not to return -EINVAL, but rather
to change that to `return 0` instead.

ChiaEn, can you please confirm, or deny my statement?

Regards,
Angelo

>   	}
>   
>   	/* cfo off */



