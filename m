Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDADC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBi2xYLKBmFsMRr5bdml5VEOoF1d5jHivkd685sMTGo=; b=YaAhKjXBIcUt949Q2fR4BC10oa
	3uoZy5zxkYbb9lv4Q27yr7r3v2NJW8v4IrdG6B+3CTuY56MFOUmDGwaKikbm+Qjftb81fuAuLgpjC
	H+RXEInaZO4MaxMemqJEjbjtMlQuPbfzIWD3xgo4xCiB7uqVIucZjtAsZ1J8UMoHfgYatmRqkNSdh
	1x31gMdbVcw9w5CcQmYMGeAozH1NxICqisQdw4GFRufLmIcbpi57PpzmrmiuqMewPCfrUK2ls73hh
	IcWdStX+bjY9Ukozhxuxp3PLZpE38Acp3HXaNnv09hKU+ZroCGn9wvojr+1NwbEa2RmN78EqoA0j3
	xuJmiAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4au-00FzHT-D6; Mon, 07 Nov 2022 16:03:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4ar-00FzGK-T7
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 16:03:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so7462037wmb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBi2xYLKBmFsMRr5bdml5VEOoF1d5jHivkd685sMTGo=;
        b=W5O1xeP6CggkYXCMSVUXUHUGa8pIRVHaEOuxx5qKiAeVK7hTmTRU0qoqt/tHxEDDvD
         fxtExCrwL8gz7QJ3e/zRGbK6eJ5YMpCVgU7e+ODdAEum7tnlWa13WXFk1GmcDw05YIoG
         rUybgWvfOcyf2kQmEL4knzuTpmiA4hHnF91jSde4xIBYOJ7oYe33Xiyvsflwmf/PM8hh
         2JXyriGVOpJc8qQ0mepKBy9NxT14g+wjzaLnyrYGwGxtIyWrkMQyq0sjv7uLm9sqmwMc
         kXIvN8XHpD4Q+U3MNjaFAA/ibNIe/NJdcIKiQxjVYfUGIYMUywDctkOfef2AuHQODyn2
         zolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBi2xYLKBmFsMRr5bdml5VEOoF1d5jHivkd685sMTGo=;
        b=WvbSJyHVDpSpc3gj48cCNcUTvH4un31ir8pfVH3vGj4ByHsCwdKxBsEfmfqbOJvv7k
         9lob7nUX0gSJd6n33vO+1RCggRXDrVzSArvM85upmguLFweCEfrJeObzQTFd66AeHyEv
         jjhq7Z80vYkypkaf54SworV9x32bb9xjt92mlQkVlLAftdEa5AJO0pm3LwvJpRkUgqoU
         Z52eirq71rG6oYAPDGus6NE6cxwHyFuGlgRraJgJkTu/cW5CO5fnuHNiuIIkh/M/213R
         XNe+JKmQ/ryTlNzBmIAqnJ+0ahjqafUxtAFrKLgVyYvGnKLkQzxhc+BW0t1Wo+xFBnzi
         hDgg==
X-Gm-Message-State: ACrzQf2bcoh/yQxUU2/lSfV4Gsw11uciGTce2QnMP//WpSapyrMRLIOX
	+hPMpxqSksM17IEN9cUsaUI=
X-Google-Smtp-Source: AMsMyM57k0P7AioLzV3L4ioDwDmE9D8OlLmjGSrpQf19iXUZ0eudVbqq4tqQSdeD4Wugx2jd3e3kCA==
X-Received: by 2002:a7b:c40e:0:b0:3cf:497c:c515 with SMTP id k14-20020a7bc40e000000b003cf497cc515mr33770990wmi.41.1667837002700;
        Mon, 07 Nov 2022 08:03:22 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k4-20020adfe3c4000000b0022ccae2fa62sm7814697wrm.22.2022.11.07.08.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:03:21 -0800 (PST)
Message-ID: <d9498f83-14db-79b6-eacb-f7530af02466@gmail.com>
Date: Mon, 7 Nov 2022 17:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] iommu/mediatek: check return value after calling
 platform_get_resource()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com
References: <20221029103550.3774365-1-yangyingliang@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221029103550.3774365-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080325_972477_6EBE35A8 
X-CRM114-Status: GOOD (  15.82  )
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



On 29/10/2022 12:35, Yang Yingliang wrote:
> platform_get_resource() may return NULL pointer, we need check its
> return value to avoid null-ptr-deref in resource_size().
> 
> Fixes: 42d57fc58aeb ("iommu/mediatek: Initialise/Remove for multi bank dev")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/iommu/mtk_iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 2ab2ecfe01f8..2d14dc846b83 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1173,6 +1173,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   
>   	banks_num = data->plat_data->banks_num;
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;

That would be the case if the DT passed to the kernel isn't correct, but anyway:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   	if (resource_size(res) < banks_num * MTK_IOMMU_BANK_SZ) {
>   		dev_err(dev, "banknr %d. res %pR is not enough.\n", banks_num, res);
>   		return -EINVAL;

