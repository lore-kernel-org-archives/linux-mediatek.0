Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05466C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxqT2eMiEuxRnBsmwUs2D0qkIojDueG3BR3ri/bN6+s=; b=m1gN/BkfUejS7dYrjjwzkRQriY
	jp3sWa76lSvqhYIN3rvpHut7c2tlz5JwgDvjXMqoOiVkx6mx0xuKmAhhXc5wW14LU795oNNhwcivJ
	CFNeH/axnu/RT414XskcG6Yos3EAZbpsS34ysB2MrEFoyDcaROok/l4RB+BTRi5REyF4nA0B3PzaA
	5Ci0kYqMxtiw+oLWdNV4RPTSZ7tyHXTIDNFLGoaIB+0USsIdrkUsjZnnbCtKAeVh+okYgJn3+PLKN
	SWvEvdBh5Cu46wrJUqxaz0D1NoVJSL6d+PiGbZOHEsTY0z8YZeWsr5eWiAgzNjur3Tkbvkj1sbrm3
	Ue6TAmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqbp-0084SI-Ua; Tue, 31 Jan 2023 13:23:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqbX-0084Jn-AX; Tue, 31 Jan 2023 13:23:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10585802wms.2;
        Tue, 31 Jan 2023 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxqT2eMiEuxRnBsmwUs2D0qkIojDueG3BR3ri/bN6+s=;
        b=T0r+CaGMfGweUThdfbzF9UjIdg+qzhzE/zYh6nJZNGdLSuF7rhGCe/sqWeFbbj9UXJ
         6HZCUh2n4YYwdT8UM2o1P0Xa+C6cjlVSkEWjmbItKQkjkAbVI7aO8qMQAbA24Wu2CB1s
         uhTKIHauaE3ecoVYwDuXKqEOWTObc1/frP630Iy7a7XDeOeXwh3yH/kXn5SYKkNZNk4C
         SjxSpXbHuukH2d2s3HPUajJMdrOYIBeBxD1UjvcpCW56iMlg7wBWWJEwTIAvYdbiCAQd
         0XAQ23FH7De3Nfuj4ocYEC64wfhy/hSD5neChPhTISOjBnYKplKF3A2Q7LeJBaK03wFV
         KZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxqT2eMiEuxRnBsmwUs2D0qkIojDueG3BR3ri/bN6+s=;
        b=8OL6xY5NXlr9xcMX6Xyc4dSnoTEQvur/JdYn0FdHzoiSeSmkiu+CtlcoNx4T3h0fQk
         ekep3YxYnswMetEjWcN2G/xcycdCt9s6FRFghJpObK4VoWKzAht6zRAZAfwHcL9fGH7j
         00AvsM84hRc3uklakOtIQe7a+YCYVkhPtb7oGilO7/gbDQKMPjzLkMLvv1OjxQBKY1NV
         3OTDdJ+UicXV2p9BXrS4zg9L5a3TBgxfQL7Efpmz23SfnY39gD95vLoc6c4JfmvSkXLx
         QZrBwy2EtoCjGU2gT0+UNKHc44xqZX7+Q1Zh0QE/mGT3UZJhd+cdbuEElZeyGwmLfza3
         Cgcw==
X-Gm-Message-State: AFqh2kqhkC6L2SDWHhnPBTFg2v0zZcH/DWNWF9Ljtf66YsnMMghsGJY5
	EPkPH0yVKVjF4keqwPkCqB0=
X-Google-Smtp-Source: AMrXdXs90s3eq6X/sKbtmQ3mlK2owSJhgh00MP0sAFb6WKMS4+U9xyLsJ07GGTZiYY1iXwIChdaY+g==
X-Received: by 2002:a1c:ed0a:0:b0:3d3:4a47:52e9 with SMTP id l10-20020a1ced0a000000b003d34a4752e9mr54149073wmh.15.1675171397941;
        Tue, 31 Jan 2023 05:23:17 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003d9fba3c7a4sm21354223wmq.16.2023.01.31.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:23:17 -0800 (PST)
Message-ID: <ad5e0eff-e043-2e27-d152-54f3047da0a3@gmail.com>
Date: Tue, 31 Jan 2023 14:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 04/14] soc: mediatek: mtk-svs: Use
 pm_runtime_resume_and_get() in svs_init01()
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shang XiaoJing <shangxiaojing@huawei.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-5-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-5-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052319_401916_913461D3 
X-CRM114-Status: GOOD (  16.15  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> From: Shang XiaoJing <shangxiaojing@huawei.com>
> 
> svs_init01() calls pm_runtime_get_sync() and added fail path as
> svs_init01_finish to put usage_counter. However, pm_runtime_get_sync()
> will increment usage_counter even it failed. Fix it by replacing it with
> pm_runtime_resume_and_get() to keep usage counter balanced.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 64d4d03ab71c..9575aa645643 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1324,7 +1324,7 @@ static int svs_init01(struct svs_platform *svsp)
>   				svsb->pm_runtime_enabled_count++;
>   			}
>   
> -			ret = pm_runtime_get_sync(svsb->opp_dev);
> +			ret = pm_runtime_resume_and_get(svsb->opp_dev);
>   			if (ret < 0) {
>   				dev_err(svsb->dev, "mtcmos on fail: %d\n", ret);
>   				goto svs_init01_resume_cpuidle;

