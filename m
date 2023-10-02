Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2362E77364
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMfGkv9CjI5rMCQI5zkgH1Bd16hzm6BwL5ZRgN43i6k=; b=Xs3LxZbLw6sNsnMjG5kHM8ZomM
	eRDkSbEsukow47QEy0SuTNkoote1bsnoHF3HwIi2WAgdXIZ8QqsOyqQ1SveB0Or1bL1M+agPSJQoX
	8aFwN2JyFBqYNFDxWBgWRLiyt/a5L3XxBB+oxQfW1FYENrIRrZb4iNUoZVGKCLxgh1XJqKqON6gne
	Cbrwqc2bWpR3y7IAtDJ0r+oLlKhBqfDZDRYZUd6/Q29KN5vCLeNdKemob5ir1XA9fFn6Ep7/FsM+J
	1EyeOoRGOQoaiPIAqLiFAx0qCWxnvobe9o4wG2+jiKJ3JHvDwlFkkEzieuPDJln807+NC4LMsrdYi
	aGBamaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnPbj-00DLVq-15;
	Mon, 02 Oct 2023 20:33:35 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnPbf-00DLVF-1S
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 20:33:34 +0000
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso95983a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 13:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696278810; x=1696883610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMfGkv9CjI5rMCQI5zkgH1Bd16hzm6BwL5ZRgN43i6k=;
        b=QMUErB07ug6ybbZTh67XzCUOcN2jaWrfmWTUbo/gDPtNGw2iHzBReXdpV4OP94N3DW
         0icwei8PHm2BxT2U90ot/7yKV1ewbcXrIVh5imLHMr2T40EPYgwkzY1hthCzx+1SgQ8U
         EB4H21OKy/O0zz4o8rtcF91Kccu4KoQdjGO26Sbqv8k1WkQVfawRptH8Hwj1yRKtcZXc
         1gJMgsxBGoeLtkUS+lsx5wPs+du9tS/B5Juf1saXIXVF8HNck2lAfjuf+Uf/Chd/GbVU
         rGyBtOV0BYg+0N+tRnQ/caWAdaHs9xCwJY7DG7dHdD2KgNndPHQr7Vg+cXue6YVXJTyo
         Tcow==
X-Gm-Message-State: AOJu0Yz9BUBQRA+U0NdzlZ2yZDQVlJVI2YX20BTHUKvtxPtN8R8VH8BM
	JFoUL7Y/XPoPk0y+MqT/xaY=
X-Google-Smtp-Source: AGHT+IHLjYXAOwwyx9EqJnGbuMB0IoQ3i/DXcFLttPKlL+C/RtnwV6RDd+dCN7eTQH4Fe0qy38Uq7Q==
X-Received: by 2002:a05:6a20:5658:b0:161:22c0:541 with SMTP id is24-20020a056a20565800b0016122c00541mr12018174pzc.25.1696278809764;
        Mon, 02 Oct 2023 13:33:29 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:6ad7:f663:5f97:db57? ([2620:15c:211:201:6ad7:f663:5f97:db57])
        by smtp.gmail.com with ESMTPSA id 14-20020aa7914e000000b00690bd3c0723sm20415587pfi.99.2023.10.02.13.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 13:33:28 -0700 (PDT)
Message-ID: <13bb26ca-fb67-4f20-a05b-362d6829a3e5@acm.org>
Date: Mon, 2 Oct 2023 13:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: correct clear tm error log
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20231002125551.15111-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231002125551.15111-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_133331_509145_0E17D6E6 
X-CRM114-Status: GOOD (  13.00  )
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

On 10/2/23 05:55, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> The clear tm function error log is inverted.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index c2df07545f96..4095d88eee44 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6895,7 +6895,7 @@ static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
>   			mask, 0, 1000, 1000);
>   
>   	dev_err(hba->dev, "Clearing task management function with tag %d %s\n",
> -		tag, err ? "succeeded" : "failed");
> +		tag, err ? "failed" : "succeeded");
>   
>   out:
>   	return err;

Please consider changing "err ?" into "err < 0 ?" to make it more clear
that negative return values represent an error. Additionally, please
consider adding the following:

Fixes: 4693fad7d6d4 ("scsi: ufs: core: Log error handler activity")

Thanks,

Bart.

