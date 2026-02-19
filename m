Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A163C531E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MnVb71Qb9H3/JE63IzOP2z58fMAXYFS1NGRVT8J6OU=; b=aLVt4OCMrcMH3yvNi+emkxAbx8
	FNwPusxMV4TB/24vyv66nwq2n3/hR6CkR7jcaRT+B05NeCxJXAijLjMCPBeVb9Gq6/RaOdrHPZmnl
	dZAYYKcY3tGPWk3kqKj7WMW4IWA/DNfwcMoGCSKXrhOJKkC4/z+UH0Lzespe0supxfWieXdotCepW
	pba4ZsrGQktaK9HGtJ04byD6rEN0Cml4V0psn3jXDMj4W5G122eZX0V3qVAPiYriHtAhIeTc3xFxg
	qW2S7NA8OtoUphsvNaqLVGn81iGR/8NQZTGfWLDc7kEicSZKfFCcIoPAi/lfmzSNqlE4nrN5lvaED
	8HoiHT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDS6-0000000CY0A-164l;
	Thu, 19 Feb 2026 23:28:58 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtDS2-0000000CXzg-0SOq
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 23:28:56 +0000
Received: from [192.168.0.192] (ip5f5af0dc.dynamic.kabel-deutschland.de [95.90.240.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5D5224C28871A0;
	Fri, 20 Feb 2026 00:28:35 +0100 (CET)
Message-ID: <0cb6c45b-a5a4-46bf-a73d-97c482da9339@molgen.mpg.de>
Date: Fri, 20 Feb 2026 00:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
To: Sean Wang <sean.wang@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, ulf.hansson@linaro.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
References: <20260219231624.8226-1-sean.wang@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_152854_304547_C073C76B 
X-CRM114-Status: GOOD (  10.31  )
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

Dear Sean,


Thank you for the patch.

Am 20.02.26 um 00:16 schrieb Sean Wang:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.

Tested how?

> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   include/linux/mmc/sdio_ids.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
> index 673cbdf43453..97cc834fb3d5 100644
> --- a/include/linux/mmc/sdio_ids.h
> +++ b/include/linux/mmc/sdio_ids.h
> @@ -112,6 +112,7 @@
>   #define SDIO_DEVICE_ID_MEDIATEK_MT7663		0x7663
>   #define SDIO_DEVICE_ID_MEDIATEK_MT7668		0x7668
>   #define SDIO_DEVICE_ID_MEDIATEK_MT7961		0x7961
> +#define SDIO_DEVICE_ID_MEDIATEK_MT7902		0x790a

Please sort it.

>   
>   #define SDIO_VENDOR_ID_MICROCHIP_WILC		0x0296
>   #define SDIO_DEVICE_ID_MICROCHIP_WILC1000	0x5347


Kind regards,

Paul

