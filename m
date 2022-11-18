Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F4DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FE6/oTXN2ta3Lwtigwi9CDndY4Q5JNcj6qFjAD85F4M=; b=U5CxE25XJebzt4xEsqRTSuh8sx
	Y9pGodzoBqRoO2WN8r9fBL1lFVZtOiZC0cCVpv1FEulm/QN29mm2n2kar7foBE1/dl54t3K9MGnFA
	ycal59uOXjQ1m6k+UmHelWgpuNOo+n9URIbAN3xTMFGvCDaXE/MeNJ1TFRabrsJ3YVLSpCzxaD/Yi
	BDLRI5geT86Llm5ntSUztSL+PoXIsyqC/G5cCgEWbDJW9/0kQ8SNH+N6FMT6N35wGAnp3M81T962d
	Y7RpySkunA+BjNHBA03BHCbRbjU0XrtQ5glOTu/fVqd4oHpgk+KtUssT8hWxAhr29sWyQ7QGUPv/2
	znMiYGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5Bt-005pRg-J7; Fri, 18 Nov 2022 17:30:13 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5Bq-005pPx-VE
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 17:30:12 +0000
Received: by mail-pj1-f42.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso5374828pjt.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 09:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FE6/oTXN2ta3Lwtigwi9CDndY4Q5JNcj6qFjAD85F4M=;
        b=XxMTiXsWGCYvGFkDYBZ1k47EeJ6Tmi0x5BR6NRRBcsokz+mDjvt+5c/xGtmoYydbXY
         5kZt+m+KE5wZijpuz2SGrmuNwhB7ZmJ4QWw03NfwR0X81lGzud6WdaJtPGen7z/9C5Is
         Y/mIW6Jb8ZlLwgBaD90tdfYK6zfD6rM3j7dHGMjHKr4Oya/CZfh/biFilWBH+VCLfMef
         MavyxL/722mrXhupMt2wK2wNJyLyk933q2NeY0ZStmRrJNcLnOWMyU0qOQOBHsjyH47L
         sBntmd+JWrdsAwDgudlqNz8nnLwSeCS8XT75qzyJmyC0dVyUpmBrSRHGuUirIEgJabGS
         fnrA==
X-Gm-Message-State: ANoB5pmGQzioZtAwOEcfRzd7+APYTAUK6k6Y5MWYJG2J0cCcHx2jaGsh
	DwmQEODwcGMDD3s0Pr8ph78UUEiLOEs=
X-Google-Smtp-Source: AA0mqf6tARTG+FlbQARPkZSnLhlXZplxfkj67QxmEyJxkRZwGsvM38JVTEClvYabBVzUBj0md6Pgcw==
X-Received: by 2002:a17:902:f651:b0:188:50c2:89fb with SMTP id m17-20020a170902f65100b0018850c289fbmr399775plg.130.1668792607648;
        Fri, 18 Nov 2022 09:30:07 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:5392:f94c:13ff:af1a? ([2620:15c:211:201:5392:f94c:13ff:af1a])
        by smtp.gmail.com with ESMTPSA id q13-20020aa7960d000000b0054ee4b632dasm3380040pfg.169.2022.11.18.09.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 09:30:06 -0800 (PST)
Message-ID: <db25901b-8537-ca16-aaac-0daaa636d84d@acm.org>
Date: Fri, 18 Nov 2022 09:30:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
Content-Language: en-US
To: Chanwoo Lee <cw9316.lee@samsung.com>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com>
 <20221118045242.2770-1-cw9316.lee@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221118045242.2770-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_093011_037078_C184FD96 
X-CRM114-Status: GOOD (  17.34  )
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

On 11/17/22 20:52, Chanwoo Lee wrote:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Change the same as the other code to return bool type.
>    91: 	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
>    98: 	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
>    105:	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
> 
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
> ---
>   drivers/ufs/host/ufs-mediatek.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index 7d13878dff47..ef5816d82326 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -109,7 +109,7 @@ static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
>   {
>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>   
> -	return (host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
> +	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
>   }

Hi ChanWoo,

Please drop this patch and instead remove the !! from the other functions
that have return type 'bool'. There is more Linux kernel code that relies on
the implicit conversion from type 'int' to 'bool' than code that converts
explicitly from 'int' to 'bool'.

Thanks,

Bart.


