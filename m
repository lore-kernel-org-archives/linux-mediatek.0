Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A7AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:28:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B396E610A5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B396E610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lz14GtIyrYMapGbU/cXUGmIR0HvvUmmDzRJs8dfcVoA=; b=nuft94R4pHjM+o6ZZhqLjJnn/
	f0D7ubgNvH6KCck58A+G1sE9RPOPF30x4IQ57zu/vfAmtpk+/kqQ7z24XSS9icxMgHB2yH0YVE7mj
	8MuZrQOP9Ne7x8UWChkF08Qhv/nww5WKALiESwraGxAjBxa5CMy1LrlQFGD9oG1h/oMxQK8y6tzJx
	4o0f5v5LtPslSK36pQ0IXklF4b0Vrwx01a6f4/Gz6F4mBr3oNNtyTA8kTpm3rCE45Bk/AXkGpdzYC
	8YQx0LxkC6gi1uc6G2oxx28O0o6NXHcAOaat4LkTjkZ2euYrqdjSkd86BR4GFwAVoZR7t2yTXVUH2
	xhOYQ0vmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRtd1-00938r-O5; Thu, 01 Apr 2021 09:28:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtcw-00937y-Nh; Thu, 01 Apr 2021 09:28:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2479812wmy.5; 
 Thu, 01 Apr 2021 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2rkOw5Dx1TINvXjRB+SiB7YZDBdwJ+e4cTjDJv7XxLk=;
 b=Kkl/wVVY/CWcsAXD8YzUvZ68ov4zSNmqyjBFYGm67pyuuH9d4pT0MdHIOSQXv0pHOO
 ZRjZSOfiv73ln2HcUdwL39tBVytU/0N5KciME3fJJM3bC5ltdbjVPA8F+Bem8c01jOvd
 u94DIHU4ghDz9rEibwoTCPdGJYGxmNwjGkN2LJPeh+u8+wjhUO33ZQKhtqAkpINDJu6r
 uPdMbRj4AEjNaRTMpGWT1eCrnHaV94TiAJK2NORYOg7LoFgLNY5VBvMbsKyP0g7JFYAB
 LmgfQEFlHVEJNw7aYhyQndV9U4KCa7B8PZCspL7QKmjyYCTfggiJ4+vHv9pY5/rBdCMJ
 ADHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rkOw5Dx1TINvXjRB+SiB7YZDBdwJ+e4cTjDJv7XxLk=;
 b=tbDTH18ufXBB0T+ACW/cEl5JuLARjsUiz5H0kB3KktDJL6vF1wDVmdBIAGFfQVzLru
 qNssNifSo+ifioEgnvM7gFMdLjVIs6pgJIV9ffK6a46wHeJkVaRQQIHO5mi9WVTXQWen
 EwdUFFODmI/cIA6PrIj7dHlGOyfihv5TDlfD7OyE6qIXG+0k5uYFOz+BLn6Gby1eA8J+
 GHAH4PNdfkQtE4O0gHfIu0Cke0+B4oGUlHus7hBQTE7kkCTq9qk5JCCoLCaSg/83TFIs
 w+OT1t+yFBSGnG0rYzgY9FrRMOxj0hSQoUhh2vyRLEX8YfLciBBwv2C4PE/ZoCGGMidD
 v77A==
X-Gm-Message-State: AOAM531TLAUpUt3dJCJlY14TZxhoXNHEmITLOLx+SYEzN2VmKj2AgaGj
 S59993ILHpwPfjXXNiuMEeoQtPhmw61X+A==
X-Google-Smtp-Source: ABdhPJzPCsFAwf7ujt/gAxK0yWMBleixfbHx3YsvhYfgFARTDwByt+1NnYOjdpBffXveTask0jwj9w==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr7003419wmk.102.1617269314149; 
 Thu, 01 Apr 2021 02:28:34 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id p6sm8831324wru.2.2021.04.01.02.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:28:33 -0700 (PDT)
Subject: Re: [PATCH -next] soc: mediatek: Make symbol 'mtk_mutex_driver' static
To: Wei Yongjun <weiyongjun1@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <20210210075656.1096251-1-weiyongjun1@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c22c6ae9-9bfc-570b-7b02-ec9c24963b89@gmail.com>
Date: Thu, 1 Apr 2021 11:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210210075656.1096251-1-weiyongjun1@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_102834_871425_117534AB 
X-CRM114-Status: GOOD (  19.75  )
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



On 10/02/2021 08:56, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/soc/mediatek/mtk-mutex.c:464:24: warning:
>  symbol 'mtk_mutex_driver' was not declared. Should it be static?
> 
> This symbol is not used outside of mtk-mutex.c, so this
> commit marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to v5.12-next/soc

Thanks!

> ---
>  drivers/soc/mediatek/mtk-mutex.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index f531b119da7a..3a315a62e783 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -461,7 +461,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
>  
> -struct platform_driver mtk_mutex_driver = {
> +static struct platform_driver mtk_mutex_driver = {
>  	.probe		= mtk_mutex_probe,
>  	.remove		= mtk_mutex_remove,
>  	.driver		= {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
