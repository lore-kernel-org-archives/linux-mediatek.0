Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ECDC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC29251C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKtZnHIt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVf5bQXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC29251C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3F4k/ffU8Yhd0H7wD24klW9HoKt3ExduY/k2QlD6TU=; b=aKtZnHItYDZiyJC2I7iUoLetf
	aJLjSs5aMQTjwLGVJC+fojQuR9Rn8mni74BGCzB8aPSMs7Ofeevg44Acm9lltdvjRGbg6WvpkjQj9
	kSfgVNY1Sgx1V0NVmdNmim5xUniuuOjYmz/Smss4Sw3Dw/AsONXqKmPtL4Ghhq96EdYZQ1uuV6YJn
	1CkfT3iP/dAS0Y9SITKhF28KBEKy8old3G4rNvYJb5yk9Vq3UqB9jWI+19m1iF+ESOGOuGIF/swOA
	fx3aOiPCABJIpsGBAbQWFWMueTGg+8fXcGrDA/jxIElsQAidxYh0nqg2j93vpV3W7Np9wSEKgAtOu
	fWTulebWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSMMZ-0004Vz-Ce; Tue, 13 Oct 2020 15:37:19 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSMMU-0004V5-RF; Tue, 13 Oct 2020 15:37:15 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so15996341wrl.3;
 Tue, 13 Oct 2020 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NqpGyIxGkzBe54LbECwQ4ti1dUnwF1pNvzMYS8Ni1qk=;
 b=XVf5bQXdPjnn21q9qd8ieph25Fus4NCdbVyi2mOTg7yq1Zny8DykvIgzN+HC1fete7
 f9vZj3i2oo5QzSR9cR7TBYe9zVSq5eUSqBVw9N3UhCNqAeMRVEsaDBlE1J9bS/HZSOEA
 X5luf2yF6oEX+l4w4nlBDb0xq+INIf0oxr9Ujt2AKtK5CxDXedRK3/rjow/B6dg1DJJA
 UxKmuMAMkkENLUPzht83TDPSTxMHEhPkGjDaipUMLRsiaiS86n0nOL/RdKPryYntQW+0
 ns9bVSv3UwLJKM4j46A2GLAOa0db3yF1roJEqon0ENoym1IRmkGqx2Icqc1J3ZSi1gA2
 JXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqpGyIxGkzBe54LbECwQ4ti1dUnwF1pNvzMYS8Ni1qk=;
 b=l1CTgsaED65o2+9gY+A/eM9eHwDIXQajx0cTK7iYv/ozTdpRPIYIRXlxV7Aldg6QAj
 UEKi+65mNzpeQp0zDnDiUIB8XOenhZkgb18lu3Rd0d4frgUurB9hrtROvI9n8va5PJMS
 qnK5cduY/cZ6Zjq80i5ivSHuRBixJL0YTBlTWxfK6nKZjjNjeJGiVUPU6mDo1YUkQO6z
 xGkMSDf3EhW9rZ10dI9kNgTvXrV9+efTrB6BnVlMYLAOdP2jFCkdbutn0TlLHVZvTjPt
 zbg+VYgPoZbXpdpeoOE1gnFjBeWWdEpbyTbbUs+yi++l/Djm6ckFBKJ9biP+qExxuAsU
 yhKw==
X-Gm-Message-State: AOAM5314BDHk6J7C1u3Q/NX/8jq1bI6Ffag3wyda9H33Q7n4Tfd4DX7/
 Of60xWLRAgQ6CsZPB/vrEcA=
X-Google-Smtp-Source: ABdhPJyMK9WV8/XRKrMpteIuKNBL7WJ6l3g7AMZE/IEw4NZFMHr+Ee9oXn0dFKc1icYcWo3QSjPXbw==
X-Received: by 2002:adf:ba85:: with SMTP id p5mr316139wrg.64.1602603433846;
 Tue, 13 Oct 2020 08:37:13 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id f14sm30459748wrt.53.2020.10.13.08.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 08:37:13 -0700 (PDT)
Subject: Re: [PATCH] iio: adc: mediatek: fix unset field
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20201012194618.2170970-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <61fe6278-a628-820c-6bbd-eeac51b1e7c3@gmail.com>
Date: Tue, 13 Oct 2020 17:37:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012194618.2170970-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_113714_890466_D6D41741 
X-CRM114-Status: GOOD (  19.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: lars@metafoo.de, chun-hung.wu@mediatek.com, pmeerw@pmeerw.net,
 knaack.h@gmx.de, alexandru.ardelean@analog.com, jic23@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2020 21:46, Fabien Parent wrote:
> dev_comp field is used in a couple of places but it is never set. This
> results in kernel oops when dereferencing a NULL pointer. Set the
> `dev_comp` field correctly in the probe function.
> 
> Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Ouch.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iio/adc/mt6577_auxadc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index ac415cb089cd..7bd48377cd79 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>   		goto err_disable_clk;
>   	}
>   
> +	adc_dev->dev_comp = of_device_get_match_data(&pdev->dev);
> +
>   	mutex_init(&adc_dev->lock);
>   
>   	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
