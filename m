Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216FFC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2PLHhwdaQbS2cYnTTtwyaA7Q4BGApIwwoUz5TUfv2I=; b=dcE0iZC/c3ImBq20auOHaDYrXr
	By+68RAOAq2X7KPc3GDs6l0gmUvTxrMqD2uODZpJoOeEBoxGZVN5Yde6096Wsy0batqMCEI1rTTZU
	gL6dog02PqR9NROn5Uq6wUDQ8xjW5nhQwjWGbzYAypzF9KUeN/a+QRS+u0Ej4GxY9tZPVbRH8ub68
	tun1BoBc1yQIwtedkZyQGurQzpR/NHfHWWRaqBovdOukUMWS2mmygY8tlGFFSVSUOB8qXnGHRm1fU
	jgGsDouqSsonCVPotkLNrN6YRl4zdu4yRvvWBBWuf7veAQ8uVasKoMQ6djy5FZLT16I27fqQyvZW6
	zJuCgxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWJo7-007Z7E-FI; Sun, 26 Feb 2023 16:23:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWJnw-007Z5f-JM; Sun, 26 Feb 2023 16:23:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id c18so2801971wmr.3;
        Sun, 26 Feb 2023 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2PLHhwdaQbS2cYnTTtwyaA7Q4BGApIwwoUz5TUfv2I=;
        b=kp2I+Ep8bT/N1ioJjCGtSrL/YKVRLtf4sTHYL4Gg2e8QTtXo3zu3EbR0zqipC5VoKV
         fSOeeYFlaAAyGYn4nsXjopQ4K61zr4BV5+CC/ucON7swIA1ZJbAb87rBt5vFg7SPBTKe
         V3m4mh6vLQW6VEjAMM6iowjk72+bV1hCNznaej7byur+UXpiouL8iobzvzc6h3vbTHCl
         5grb2L/ZNIKjn7YpNJVxd7fA11fy/B2yM3rUMVpZ5h3x1Xr7gAJC8wyNOx/XkuVesBn2
         pIwZ573N8a14qQeCJLypL/ADg9S5gBZ1d8qQhFQu5mAptQSgVTZm0soCum6eYrfdf87k
         mVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2PLHhwdaQbS2cYnTTtwyaA7Q4BGApIwwoUz5TUfv2I=;
        b=wLyP1uIzYC6E119sJeC7aXDv3DbZ5WEf6iJ/0VNn0HphuNkTnDmO0/2LTYLKJYYKjW
         pAb/HH5MoC/QAl2Lq6EpS2lbp4puEagfCkC9wlVMd2uJdDYrRs9cx2mdjA6oPB37V1ZC
         wXHNJk+UV8rC+GjFnDlsvSa1ez8hO4S9rEaZzLE4OyL1AwaXhOkSM9g7IkL1syKrJ0Rj
         mUetcvYJkVng23DUeAQAfxGBNwpf1wU0dyeZE9uDptXSkQurPoMY6gSbEcPzM4TtkyYh
         KX7B0TmBq1qH9a4Ko/Bt2uoZ4VlbWq92VumJUfZxkzCo45ytGRP+AWObGGX8RVTGH9m3
         hwkQ==
X-Gm-Message-State: AO0yUKU3EwHVsHsTZ8gFLTee5RSWmRtTuR7Z/+3B8rqEDo4ENxHLLIvQ
	tvXoUQ/ULciXjdNah4Zdhyk=
X-Google-Smtp-Source: AK7set+XH2HKW8gykxK8QLLfvaADjEB2az3jjR9ernI2o1HPKmxYMjHjNFATDIJv0x+BvhfHrefErQ==
X-Received: by 2002:a05:600c:810:b0:3db:2e06:4091 with SMTP id k16-20020a05600c081000b003db2e064091mr17369419wmp.37.1677428583449;
        Sun, 26 Feb 2023 08:23:03 -0800 (PST)
Received: from ?IPV6:2003:c5:8708:4321:dcf1:ac0e:cc8d:62ca? (p200300c587084321dcf1ac0ecc8d62ca.dip0.t-ipconnect.de. [2003:c5:8708:4321:dcf1:ac0e:cc8d:62ca])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d4565000000b002c3f81c51b6sm4710874wrc.90.2023.02.26.08.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 08:23:02 -0800 (PST)
Message-ID: <eda65f0b-bbd1-5e3d-5d85-a5686a06ba5a@gmail.com>
Date: Sun, 26 Feb 2023 17:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] scsi: ufs: core: Remove redundant check
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230223152757.13606-1-powen.kao@mediatek.com>
 <20230223152757.13606-5-powen.kao@mediatek.com>
From: Bean Huo <huobean@gmail.com>
In-Reply-To: <20230223152757.13606-5-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_082317_009727_85753F7A 
X-CRM114-Status: GOOD (  15.45  )
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

On 23.02.23 4:27 PM, Po-Wen Kao wrote:
> is_mcq_supported() already check on use_mcq_mode.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 81c9f07ebfc8..3357cfa23616 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8544,7 +8544,7 @@ static int ufshcd_device_init(struct ufs_hba *hba, bool init_dev_params)
>   			hba->scsi_host_added = true;
>   		}
>   		/* MCQ may be disabled if ufshcd_alloc_mcq() fails */
> -		if (is_mcq_supported(hba) && use_mcq_mode)

This has been removed/optimized  by commit:

https://patches.linaro.org/project/linux-scsi/patch/8840cea4a57b46dabce18acc39afc50ab826330f.1676567593.git.quic_asutoshd@quicinc.com/

so this patch is not necessary anymore???


> +		if (is_mcq_supported(hba))
>   			ufshcd_config_mcq(hba);
>   	}
>   

