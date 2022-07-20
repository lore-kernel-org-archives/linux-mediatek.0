Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF03C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZGVR1LPdhcF7N10kJ7EbkpxNgGbPbWiXCwyialE7gk=; b=hh1eMW2M09UjVIJMAhvmInFvdJ
	XppQRZWDYlfm9UBDPquJp/IC+fd8D3Y9nPecIwkQezieG3rZYf+kaLcIX+GsMtILDTMhIm2c9XqE6
	XLsUBlzpmbRx+VW+CNhlkFYpgindW5q8S9YoiY9tFeiI1hQ34+4DEq0W3+UvH3HfgztY0k6G/Cb1G
	9lMuYRigm7Pp6iqRb2Y+jembDeYcozA6kDQgYp3Jup8AWbJ9nXCcAAvUcp8UTEHpG3ChRHAv50dNF
	KGHbD1kKP+EgZ9PHl64r3Ny+UGde+6ZiG2glKgmR4Y3KWWQtR+OChb66xaIpaosMBz/SJQq8Of4kw
	Ph4442cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEHR4-00Bcz5-I9; Wed, 20 Jul 2022 21:40:50 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEHR1-00BcwJ-AZ
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 21:40:48 +0000
Received: by mail-pf1-f177.google.com with SMTP id 17so7282890pfy.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 14:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uZGVR1LPdhcF7N10kJ7EbkpxNgGbPbWiXCwyialE7gk=;
        b=UmFf+8+Ln67JoAHlm208D1fhADO3YgwM5g4yumosNdyuHBkzYvP9RwdgeRBmH80WY7
         JeXAhDudYFlWaYxc6aFjNUsvDG4T5YsUIm2cgh9F4RocIQw56j9jmj6RVqMnfFY44Tpv
         NVq52nUSOFmH/fMm95UduE33GuZdDuYT1VJ9MqRXqtX3LxYweLlQFD++VgjkTScVrojw
         jqWsYHymIM4Bn8U5UuN/BbYE3oW1ivU0pMWy/p/MMbaBZP6uLytjlNmTiFe9LiLtCbEm
         QM/r+tH61oGrf0DtTjcbNxr5CipfJeaywMNi0Fq7aQBX0Yxna5zgpu0UYXvM/fpzHPrm
         htmQ==
X-Gm-Message-State: AJIora8StHycv6miiYiuQi47v77P8jUzaPlwtCtm9OF9JvanhU8wFa7q
	XOTh6APtjJP6ZuvFh2DB0Bk=
X-Google-Smtp-Source: AGRyM1ttaQnkhF0Py+k74+2GSOUJ0rbxLNRDdmMF3y7oJQp5O5OnSxGDvTosBfjEabno80eSBCxS+w==
X-Received: by 2002:a63:c006:0:b0:411:c33f:b4bb with SMTP id h6-20020a63c006000000b00411c33fb4bbmr35483801pgg.433.1658353245244;
        Wed, 20 Jul 2022 14:40:45 -0700 (PDT)
Received: from ?IPV6:2620:0:1000:2514:3c34:9133:f304:9ee9? ([2620:0:1000:2514:3c34:9133:f304:9ee9])
        by smtp.gmail.com with ESMTPSA id b4-20020a62cf04000000b0052ab92772a0sm108276pfg.98.2022.07.20.14.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 14:40:44 -0700 (PDT)
Message-ID: <afb8d403-f8f5-5161-4680-ce2c3ae7787d@acm.org>
Date: Wed, 20 Jul 2022 14:40:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] scsi: ufs: correct ufshcd_shutdown flow
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220719130208.29032-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220719130208.29032-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_144047_413004_8DFFD199 
X-CRM114-Status: GOOD (  14.44  )
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

On 7/19/22 06:02, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> After ufshcd_wl_shutdown set device poweroff and link off,
> ufshcd_shutdown not turn off regulators/clocks.
> Correct the flow to wait ufshcd_wl_shutdown done and turn off
> regulators/clocks by polling ufs device/link state 500ms.
> Also remove pm_runtime_get_sync because it is unnecessary.

Please explain in the patch description why the pm_runtime_get_sync() 
call is not necessary.

> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index c7b337480e3e..1c11af48b584 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9461,10 +9461,14 @@ EXPORT_SYMBOL(ufshcd_runtime_resume);
>    */
>   int ufshcd_shutdown(struct ufs_hba *hba)
>   {
> -	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
> -		goto out;
> +	ktime_t timeout = ktime_add_ms(ktime_get(), 500);

Where does the 500 ms timeout come from?

Additionally, given the large timeout, please use jiffies instead of 
ktime_get().

> -	pm_runtime_get_sync(hba->dev);
> +	/* Wait ufshcd_wl_shutdown clear ufs state, timeout 500 ms */
> +	while (!ufshcd_is_ufs_dev_poweroff(hba) || !ufshcd_is_link_off(hba)) {
> +		if (ktime_after(ktime_get(), timeout))
> +			goto out;
> +		msleep(1);
> +	}

Please explain why this wait loop has been introduced.

Thanks,

Bart.

