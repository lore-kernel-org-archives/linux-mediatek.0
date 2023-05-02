Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3AC77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMr9gvF8Pl9mIUWgrETUJDIt0vnyiOv1BE24SgG6Lto=; b=hg7Myo0KxTsvcx8TbYrptxUYRr
	VM7eM020hNcN2GnqUd+7CYo+m+fP8ond9kwOa8ag4xnjAWFe6ePVJKoxt/NY2uNUxm5FrEk7wFwUs
	MKup2/NBUIU+6r1AEPDnoaIMdJCSGJsUBw1xjzIDsSldS57/nHeZyYQysc9L1ET7c7N7+lcWjNUmt
	ZyUWI3rhJ6lDcXDNyCWgs9oiyqwZJG5J7rmBNDPN7MyDK0NyyIToZNqKxgjAaJF75pxmDAWremM+A
	m3p3wS4Gdr9U9XCxdVefQofFi46lcLEKipp4LDuQ/hQ7HXaMhhIL2fVAHLsYtKj+MAAx/1b2VLAYC
	JpE7tFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmo0-000r0p-2R;
	Tue, 02 May 2023 10:00:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptmnx-000qyt-2I;
	Tue, 02 May 2023 10:00:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3063433fa66so681122f8f.3;
        Tue, 02 May 2023 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683021614; x=1685613614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMr9gvF8Pl9mIUWgrETUJDIt0vnyiOv1BE24SgG6Lto=;
        b=WmA9DGCkjPvr6YFIxM5TUvWVN9FipEkQlHdb5kpX4aVH4FkFW7QTYZ39MqtjtBmfG2
         +2dM7q8RVXvK7XC+TDSTqEBr+Ud9C5b7EakwQrExotdSZC93eWfv4Y/78ui5QG63BCbP
         vNCt8OjkdNfvDrwsDM3R8HPiZWh+gWAw5DBR1eJO0BxiW69xF4bwbFqkWyWRExLeBfEG
         GgCAYrm09/Wq8gus+GTJVU63oeXsiuX1KXF6acCdxWw/wFZHhkloAfg45A70JHE954Ua
         Erb38k+WOrmrQvpt+8tdaZtHCeOsoEeGmc51OWO9nXiiW+Iokuq+8oV06/XNtWb8OHsi
         ATbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683021614; x=1685613614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMr9gvF8Pl9mIUWgrETUJDIt0vnyiOv1BE24SgG6Lto=;
        b=P29W6lZUCnjbVsHO+dyRldR44VBOKTP4IUWM32Hoh+dXA9mTm9CL7MAa5D828mlyvJ
         TIq2330jp+ne0WVPWg1fYSaQMR9O4wsD6zKRA38jKSGv4hJ9WQKT1QE8IrC9HvhTo+lG
         EfSlxD3Bx9ZNdIdVhG8hvqFwHMsmaVRGSqo+GZeTJHnAmgdwwSSmVbLNlOvbnwqDorph
         u/KXdSAJVmwumn/o7BSTBxGDeApjo2gVCmKAINGahb/3E8s2ukKgHKOXGgsjjkMlQZdb
         6YPwxPxtkDj3kQzHLV9iaVY6NdBGv0Ctv4Ss4VRJZEw0OZU7HOu9Zb7uYlNnjwIO+E3h
         UHLA==
X-Gm-Message-State: AC+VfDxnhK63tfpxeR4cAr9ufL5Wu2tlPNnzmXtlQXJ3kXH8e3zEM0TO
	+GP39zWLE3xdsnl7zBk/shY=
X-Google-Smtp-Source: ACHHUZ5nXwHh+CHAxSN7hBDo8xJZZF/pzllxqaFgnSIb6mXPfrPJBzKX0RwxiNFr6M626CDjvd3NDw==
X-Received: by 2002:a5d:4fcc:0:b0:306:32c4:7e7b with SMTP id h12-20020a5d4fcc000000b0030632c47e7bmr2951475wrw.41.1683021614402;
        Tue, 02 May 2023 03:00:14 -0700 (PDT)
Received: from [192.168.0.91] ([84.76.164.7])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe10f000000b00304832cd960sm20629439wrz.10.2023.05.02.03.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:00:12 -0700 (PDT)
Message-ID: <c1986b45-b8cd-6c1c-7758-086dc943c7e0@gmail.com>
Date: Tue, 2 May 2023 12:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] thermal/drivers/mediatek/lvts_thermal: Handle IRQ on
 all controllers
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230428195347.3832687-2-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230428195347.3832687-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_030017_755776_51C57430 
X-CRM114-Status: GOOD (  20.19  )
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



On 28/04/2023 21:53, Nícolas F. R. A. Prado wrote:
> There is a single IRQ handler for each LVTS thermal domain, and it is
> supposed to check each of its underlying controllers for the origin of
> the interrupt and clear its status. However due to a typo, only the
> first controller was ever being handled, which resulted in the interrupt
> never being cleared when it happened on the other controllers. Add the
> missing index so interrupts are handled for all controllers.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   drivers/thermal/mediatek/lvts_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index d0a3f95b7884..56b24c5b645f 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -449,7 +449,7 @@ static irqreturn_t lvts_irq_handler(int irq, void *data)
>   
>   	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
>   
> -		aux = lvts_ctrl_irq_handler(lvts_td->lvts_ctrl);
> +		aux = lvts_ctrl_irq_handler(&lvts_td->lvts_ctrl[i]);
>   		if (aux != IRQ_HANDLED)
>   			continue;
>   

