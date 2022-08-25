Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0400C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEih3CJpUsuGBVnUm+LssLfYV99RduebxdAn+oy7W9Q=; b=tCygAhDJW6q14NLoNjrgr00xZX
	joDfAEE0ct/xNdG1QjH0WXiN5V7R1FYt+JfvBtvUT30Bv//ughCqiOunIAyHzXkK4tL8jNtcOzNLx
	7yOQSYYBCtem/XwMMhCtQkAYj92kXBCJMS+P05/dgliLqUNcK6Rb1kqezPegqGHqh3bkSQ8UDziZx
	QEXOUOomHKrVfpZvQ+YTXatfG/jYiFfqYIg8kPDfK1fpjs3CHK4+sFeNn8I/Z98V19hVTN1TD9huE
	HSKExY1hPfyjOHCOu+J81QJACDYr0vo71WTeAXMkfE6LmL0rv1DkNW4qILmktu2ltrR12OElmvp6V
	5gqFWlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCw9-00Eobp-QP; Thu, 25 Aug 2022 13:30:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCue-00EneM-G0; Thu, 25 Aug 2022 13:28:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z16so5829777wrh.10;
        Thu, 25 Aug 2022 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=iEih3CJpUsuGBVnUm+LssLfYV99RduebxdAn+oy7W9Q=;
        b=iDKFvgFzoNX3VPEfVSzihuaD2IexrhHvq1o2cgGOVVY7mNnrUcm4trLKFlFMr1Hoqy
         7pB6istL7X3lUMZcLPyRvf5D2LDSZyKmVVibcnhxHpHjtteHuXi5AuOxCdSZVtnlZI37
         KeM5Et7vgCUg1ew+BNszhwKhMrhsVSCUIV8JnDCKLviBLQc7Dxwk8Td/JzgPB+MvN4qt
         XflnBnZFdYLmnH7GRgXOnVVw40L96hiPUgbsMiLSwlH0xyKmYcMW2oK9CjYntAPP7Y1k
         PNCoSDnpKWMDAcacnDCe8uq7WFeUEWMoqIbi0od+ySyLJn/r59tYNhA2Qc32TrpwrXht
         gb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iEih3CJpUsuGBVnUm+LssLfYV99RduebxdAn+oy7W9Q=;
        b=yHh1dizJ1Y4i9XpUHiVIED4Gppz4VnAzRusJNIZgkbzKsHp5pe0US+42t64dT78UAB
         aLmRb4zbb0u5nhTLkjGOtM8q3SXs88pquTaP6rCzlnJYIWn2NsbhJ0E9n2y7YX744AtF
         DCX+m0WaPLAMtLjo3Fs559Smqqy0lLUu7l+Sh3MyAgZSr0SjB3vEmBZoWCa9JYhicQNx
         IxXpIV0/b43cELlZeYoc/yxtjL0ZDPn4pYjEIfuhGBXJHqa3GKFYqK7L2DyrYUCqVKWA
         9amJ1hoglML+nvezEWpyCiXrlJr0SALUio6o8mu95ZpQXDHYRMvghCmLHVUf6YIvpZyP
         FZdg==
X-Gm-Message-State: ACgBeo3/zQ2IDIdsQ2Wzj5CsK93h02YKFhtW7BeOD2kjKINE+7fsQaEb
	jb31RPLDm6Z3BtwjszMWtYE=
X-Google-Smtp-Source: AA6agR4daUGe+73sMMfqktGypNv9NGm9SBqpzRBZ3ILjGMylRu+HjErcCxcmMcoUM+Y4m4D2Ml3iMw==
X-Received: by 2002:a5d:4a01:0:b0:21d:8ce1:8b6d with SMTP id m1-20020a5d4a01000000b0021d8ce18b6dmr2337050wrq.718.1661434127193;
        Thu, 25 Aug 2022 06:28:47 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z1-20020a05600c0a0100b003a2f2bb72d5sm7475472wmp.45.2022.08.25.06.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:28:46 -0700 (PDT)
Message-ID: <b9feaa81-0443-a466-486a-33c387ab26b5@gmail.com>
Date: Thu, 25 Aug 2022 15:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 5/6] soc: mediatek: mtk-svs: Use devm variant for
 dev_pm_opp_of_add_table()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726141653.177948-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062848_598905_539D5FB2 
X-CRM114-Status: GOOD (  15.90  )
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



On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
> In error cases, this driver never calls dev_pm_opp_of_remove_table():
> instead of doing that, simple switch to a devm variant, which will
> automagically do that for us.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 80d0bab1a045..25b49d8af59a 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1626,7 +1626,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
>   
>   		dev_set_drvdata(svsb->dev, svsp);
>   
> -		ret = dev_pm_opp_of_add_table(svsb->opp_dev);
> +		ret = devm_pm_opp_of_add_table(svsb->opp_dev);
>   		if (ret) {
>   			dev_err(svsb->dev, "add opp table fail: %d\n", ret);
>   			return ret;

