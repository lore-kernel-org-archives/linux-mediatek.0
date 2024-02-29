Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA701C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL4qhpa34dKKFK7vGsY+DXYatKx1Zwm0pH68CEYVls4=; b=gjlMjlIfhnGkSUfFLsgNI2rUSY
	9/hAfiNpiBthzTHF/nc6ukseirMRPB7HjfIkeGActiunMJC/dYQZpMII0XlG6wJH1pLcDptlYkupq
	yS7biCW1PImHHc+ONmXSvWpji0CXtOK5G8pm1Der764yN1tZ3VgFDpAkTQAhdw8Smf7fZQEbSntom
	fWkUe+ebGSM+p/ix0NowWN9tLtXZCpeu0N+jJ5/ysvm6dKzHw17WxsIjtTHecmfnERATTP6BNF0Ci
	pCHN4A5DGa+F+0dMpHQcZIAkZ9Fv4igeJ7uCV1x6AepYm83GG9WwwaeuBrEYns2JRUVzw95lWZ8US
	NAV/rGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfkIf-0000000EVT0-1V7C;
	Thu, 29 Feb 2024 17:34:29 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfkIc-0000000EVS1-12ND
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 17:34:27 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d95d67ff45so10392995ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Feb 2024 09:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709228064; x=1709832864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UL4qhpa34dKKFK7vGsY+DXYatKx1Zwm0pH68CEYVls4=;
        b=VOtDMdmhgqIqmM6wtMHigb+h15lEW1nuC7fsalD7K4lbbaMiJL5Mw8TJ+ExmPvw2ct
         WScFm0KsWPhIbfaADF5PDQDmEGiURm8L8VeLoDNfyBwa32Nx9IlUfBe7UQy7t0pL8Qxi
         2T+YZixct0w2g7pc7LPvO6Xfll5iWxatlw3VXL5Vb/q/RfgmN36teZa/TyiG4jGBdliO
         nTNoqHU06gPXfACk9ZqKDCjZdZeMFjANiPvvSqTw/L2txDLr/Uhn09M6ZObfOVM0nsfN
         fyViuF1zV25tCvjpLGRaWlWEk7/Cjrk+EyXHXRiqgKKH/ztUdrQbRLBA1q0cldrkxJiS
         QU/w==
X-Forwarded-Encrypted: i=1; AJvYcCWHRPeqN2iROC4fROtBjGmcKPFMQGOHRCm1p/BM4436zfgA7TxdwW8BYngmDgN2mB0NSOECMsijswWxjY9M1D/j1DVACQab6zIiEn2zd6GEw1G/
X-Gm-Message-State: AOJu0YxEW4gBRtfxJOH5DQSqxdzQDwK0tWbTVzJNDqpdAxDkzkVeTu8d
	78SmWxSnIDt9BqqmOl30jSjZ99wrd4nReSo7x4F3Sk6BRe8cfV8c
X-Google-Smtp-Source: AGHT+IFUpG8cCKn+DDgjM2fikgIdNmwvI4jMpFpIkLCCQ77nMbqQOKfRg4eReqr5IcYXgSrGr2dbMg==
X-Received: by 2002:a17:902:c40c:b0:1dc:177b:1d85 with SMTP id k12-20020a170902c40c00b001dc177b1d85mr3592151plk.27.1709228064254;
        Thu, 29 Feb 2024 09:34:24 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:3174:8fc0:11f9:afc8? ([2620:0:1000:8411:3174:8fc0:11f9:afc8])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902dcc500b001d949393c50sm1762291pll.187.2024.02.29.09.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 09:34:23 -0800 (PST)
Message-ID: <140b6a69-eb38-4ce1-b8bd-0dd404800f65@acm.org>
Date: Thu, 29 Feb 2024 09:34:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: add config_scsi_dev vops comment
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240229080435.6563-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240229080435.6563-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_093426_387538_CB330B08 
X-CRM114-Status: GOOD (  11.32  )
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

On 2/29/24 00:04, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Add config_scis_dev vops comment.
              ^^^^
              scsi

> ---
>   include/ufs/ufshcd.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 7f0b2c5599cd..a19d87e7980f 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -327,6 +327,7 @@ struct ufs_pwr_mode_info {
>    * @op_runtime_config: called to config Operation and runtime regs Pointers
>    * @get_outstanding_cqs: called to get outstanding completion queues
>    * @config_esi: called to config Event Specific Interrupt
> + * @config_scsi_dev: called to configure scsi device parameters
>    */
>   struct ufs_hba_variant_ops {
>   	const char *name;

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

