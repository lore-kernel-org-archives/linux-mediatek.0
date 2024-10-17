Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF027D37491
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjpUCwavp35Zp553KXEWmsXFLXMH7US+2t8s3b0bC1U=; b=FiILD8AvTVEEhYxDwx/RZcMihW
	OrsQ3FHsSv4V3vpqOXR10tXhET5oYOp1zsBItvNHSKFWV1KngsgiqB0N5Hon5RN7UxSXYnakn3zDS
	lg50TZY9C/VuBTrsu5dAuGJUSG0JSx/IRl7BEqNSlX8npjAWjMzD3kQQVQTYKzgrUmjIXv2d6QAlh
	xHCaGnGQ0wLEog8Ya2igUubC2i0G9pv28p/X0je41bpmm9wlvXdOpTka2ZK7Gxa2ndXbRg3TXU5eu
	WSNGBShu9FvQSUk0/85HCZ2LpZH8Mj48RlpDw/QwPnHnUbv/WOwCVkxYzSQguGGCGXWINnnFwDBFR
	kxMhHLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Qvx-0000000F0iF-36WN;
	Thu, 17 Oct 2024 13:52:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Qif-0000000Exq0-1cr6;
	Thu, 17 Oct 2024 13:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729172351;
	bh=RaKhN2VDuQLWNQ2Oq2Tvf0ihMcrAd4aJ/LDWckcjBOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPQutJ3lknDz4wr024BhyOyWthJhP0eYzroDjQrWaiGu9ZW6dWqBiVXCkGFrmoaoq
	 CIupIouccGH2bHQNJ788l4L/IlVlnhS/RoGNWqzo7+SV+yrW32/ZHWWYmam13g7poL
	 cDRHA5axOTFR4TrgiYg1Jk3MDbBBN40VSRlzMF0/mL1wRvSomSEiAnVHukOoDJ89BC
	 aM7jHiU5mZkp66CMHfjwx/SdcO7GKPX1vI+ZtUf6xhYgJXIi5Wb0qHER2SxTfTC4by
	 edSp3fHgV6gvW7NGWf65+643d9uVofCg9ZHdE4Ju4YLdmgET3ZtnN5f3EA7qj3ZfcF
	 6+SPMIiuXUZLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3E2517E360A;
	Thu, 17 Oct 2024 15:39:10 +0200 (CEST)
Message-ID: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
Date: Thu, 17 Oct 2024 15:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in
 mdp-cmdp-prepare()
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ricardo Ribalda <ribalda@chromium.org>
References: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_063913_636989_F52432B8 
X-CRM114-Status: GOOD (  13.96  )
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

Il 16/10/24 13:38, Mohammed Anees ha scritto:
> Since platform compatibility is already verified, the
> additional else branch is unnecessary and will never
> be executed. To fix, remove this else condition.

Well, actually, even the one before the allocation of cmd can be removed,
because compatibility is already checked by __get_config_offset().

Besides, __get_config_offset() has another occurrence of an unneeded
else branch, as it's checking platform twice.... so you can clean up
that one as well.

P.S.: "media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks"

Cheers,
Angelo

> 
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index ea2ea119dd2a..168beed4155a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -624,14 +624,11 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   	if (ret)
>   		goto err_free_cmd;
>   
> -	if (CFG_CHECK(MT8183, p_id)) {
> +	if (CFG_CHECK(MT8183, p_id))
>   		num_comp = CFG_GET(MT8183, param->config, num_components);
> -	} else if (CFG_CHECK(MT8195, p_id)) {
> +	else if (CFG_CHECK(MT8195, p_id))
>   		num_comp = CFG_GET(MT8195, param->config, num_components);
> -	} else {
> -		ret = -EINVAL;
> -		goto err_destroy_pkt;
> -	}
> +
>   	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
>   	if (!comps) {
>   		ret = -ENOMEM;



