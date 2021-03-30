Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80C5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:53:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F52661994
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F52661994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ySXkF1I9r4dQyhfc9Dc8UwdeULG5YF0T4EKd8EDH5+s=; b=j5lD4r7XZBNeguNayzWFUXpJQ
	rXUTZuF7UFM6d6QFjoplZLgGO7GqXRIUhbM5hxkvrMIvz9LRYBhJFPwiMji1drxY/CJ6BbR7jbggQ
	RE/t4zWGENEvNZ+hdRwp1gAezoxHqE7p/qjLyJu4pkFL7QGbHXOT5qZLbRKjfvjJdZLZEwm/NgH8K
	qUQsIFsCptSQHC3O6qtTrybZ2/bmq0Dl4X4pNdwmko8/0GXzhEigX0bf126i/UWvYaAzjyHHoMQBO
	fs2w3eIge5xtX9XKUHQEqxlX1bq4Q8XISVib5YFokGGba/5uutB+TYYWH8kBQZppRuDfk9ioai/pY
	gkipJlVHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRB3j-003J5p-HP; Tue, 30 Mar 2021 09:53:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRB3e-003J4f-3V; Tue, 30 Mar 2021 09:53:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id k8so15605549wrc.3;
 Tue, 30 Mar 2021 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0VQQ0CcevqZjEsDG9+Tim60Cck7tjX6oWI7ImfoA6t0=;
 b=qwn8N3Ar5+8PHU0n803uS//yCpcQCSdmdzY2yxq9thhtul63jHSeuuh61reKtas1Vi
 ao7BoC5lGCadw6mEOYwPQURq6SZQU4DJReN3k0CTrNZpC8ZEGOtTTCHKaLf4bQoMZ1zI
 vLj0n23TkDiGqZ9VrzHCEGJ5mS3MrNzpI1Ndumao0B1t+VpzA/MI48IZhUyfYzkkeBSe
 WF2S5/pfNgSKjj0Rx5kx5JDv3vwIxA7efvgTkkmkcJFU9+6FWeB2yY2Xdm+gwX20CYAN
 2vBA5t7I2H5sdXxcaLebbW2tEr83EZCWYOs8KfhiXgy+D8TPUMyfQ6d+fmSMXrgCWK2T
 jtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0VQQ0CcevqZjEsDG9+Tim60Cck7tjX6oWI7ImfoA6t0=;
 b=krLQTGvfKLHUrwdx005VyBpNfZMY/miz21/RLOB9OLcqrpxj8XHComjzVa1EANnyyd
 iNGpyHO3jk9XBL9nRBOxlHB5CX5q702VaT1fHiMjXI2lGY5tcXfwFD8/q65zSDpUiErZ
 mbHfS/GqVP+xnj/X48Ukoa1ps6wNTMN46ekDMulSfYkSw/6AGmMv0plVSShRYQn3EsYa
 R3za/RZJGMnAsm13pi80DRhAa06kutMiNv/oH3vgvXu0TuzUxH3FMOm+Ohcdg98D3vRr
 t1FumaGYP9mrgxaXDf98PTRKFxe/WZLVKk4Rmg23yUzxSEC19418a6XoiAaINiMgF8/F
 uhDA==
X-Gm-Message-State: AOAM5307yIxcjSvU0ozHjGRKTHbEdmjw5SHNhXwilvD8XgRm+11cm5Se
 7xHeUBvmNd2liOkphzUSkZFLaqkCXKyAmhnN
X-Google-Smtp-Source: ABdhPJzY5PnSfJikeiaQFITOB9nETnRYxl3Qzti5OItClmgYl/Omxx2o7ZA2HweHapoqD5kah5SD6Q==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr25344196wru.349.1617097989511; 
 Tue, 30 Mar 2021 02:53:09 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id r14sm34114892wrw.91.2021.03.30.02.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:53:09 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: pm-domains: Fix missing error code in
 scpsys_add_subdomain()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: drinkcat@chromium.org, hsinyi@chromium.org, weiyi.lu@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>, kernel test robot
 <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210303091054.796975-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7568cab4-11ad-24df-3d45-cafdbbb3d94d@gmail.com>
Date: Tue, 30 Mar 2021 11:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210303091054.796975-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_105310_287895_7F5F74A0 
X-CRM114-Status: GOOD (  16.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/03/2021 10:10, Enric Balletbo i Serra wrote:
> Adding one power domain in scpsys_add_subdomain is missing to assign an
> error code when it fails. Fix that assigning an error code to 'ret',
> this also fixes the follwowing smatch warning.
> 
>   drivers/soc/mediatek/mtk-pm-domains.c:492 scpsys_add_subdomain() warn: missing error code 'ret'
> 
> Fixes: dd65030295e2 ("soc: mediatek: pm-domains: Don't print an error if child domain is deferred")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.12-next/soc
Thanks!

> ---
> 
>  drivers/soc/mediatek/mtk-pm-domains.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 694d6ea6de1d..0af00efa0ef8 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -491,8 +491,9 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>  
>  		child_pd = scpsys_add_one_domain(scpsys, child);
>  		if (IS_ERR(child_pd)) {
> -			dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
> -				      "%pOF: failed to get child domain id\n", child);
> +			ret = PTR_ERR(child_pd);
> +			dev_err_probe(scpsys->dev, ret, "%pOF: failed to get child domain id\n",
> +				      child);
>  			goto err_put_node;
>  		}
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
