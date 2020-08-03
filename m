Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B75C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F0C206DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRwkki/J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F0C206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VP30jUUPm/amOOdZM4kbAzPZh1tM6R5S7UB9BYuYuQs=; b=fRwkki/JHW2mxnFs4KoNDVYjd
	Jmc17fiHft2SKoN+QsTSaO6Ver3INSmlz97tpIZDhGYuQPRHFS+pYaS06eSZDVa+00bVBktWOlZ6G
	4XkmuD06qE2vEB6NDRUFYdZJQEkeCbJFbkCwuS4IhBdVu7HVHXjCW3KyfpJE+3Fesa5Ei9Vwu3IOR
	tW+riWaxhqoLgOwGEakyj2LUW+S227OqekfKaGyHRSyMnJFYwchNsr8Ctu+E+I65mBNhclPKD86+i
	md8cS6qf38ZzpIHKig2Eof38Pv5fzdJXbuCU72LWWO4xcUbdu3rAJpc6xVIWrvG5LVMl+2HGEtg6F
	EsNGEWrRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cxE-0006i5-JQ; Mon, 03 Aug 2020 16:04:48 +0000
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cxB-0006ga-1x; Mon, 03 Aug 2020 16:04:45 +0000
Received: by mail-pl1-f195.google.com with SMTP id t11so1082802plr.5;
 Mon, 03 Aug 2020 09:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H1YW1bFaxTsvimMCdoWORQnWb2oEU7L5SFl1KFK09R4=;
 b=MkFR8119IeGNiECDFzEBbISb+LXRCWaP5hNLJIMj4U7i8cqQtPq7pJv2C0UbeIw5IX
 Rwf1/DJ6J8xKBFuYBlc5VJsAu50o8V7XXsx/OREVysYtEKYFTVn7Jxj2JB3KN6XCLr9p
 fYa0xmw+MTwmi1kzovPokgyU2mqxTtA8nfDX7Ii0+xyUNdx9XqIVFv2eItEsaGn7diIT
 4E0oW+ujYY5U/qD2WzKCk3nvPv9NmvjaPGxfOPjPrEmHUs8YjBeE9nwrDM9Wv/CPqldy
 iZy7LDoNpDPkm7TnEijejd0qmacC014zd8XWf9GvJQCr3wY8+wQQf8IVQmZjCxYCd00T
 IhRA==
X-Gm-Message-State: AOAM531qrM1Eps6Koeouh1YB8C+pMSmg3qdz9ebOzozCVxodWHEKqFSO
 DkDE7tMibCzA6yLG5YKGWcc=
X-Google-Smtp-Source: ABdhPJzNC/sIb2a14UI0XrWYZ2NNr83AY7ba7bF1bas+yDa4E9/G/g/sXR+dx10npFu8dhEOa2deRg==
X-Received: by 2002:a17:90a:4701:: with SMTP id h1mr9454pjg.93.1596470683769; 
 Mon, 03 Aug 2020 09:04:43 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id e28sm11680499pfl.124.2020.08.03.09.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 09:04:42 -0700 (PDT)
Subject: Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before shutdown
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, cang@codeaurora.org
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
Date: Mon, 3 Aug 2020 09:04:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803100448.2738-1-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_120445_112175_D48EF4A7 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-03 03:04, Stanley Chu wrote:
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 307622284239..7cb220b3fde0 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8640,6 +8640,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
>  int ufshcd_shutdown(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> +	struct scsi_target *starget;
>  
>  	if (!hba->is_powered)
>  		goto out;
> @@ -8647,11 +8648,27 @@ int ufshcd_shutdown(struct ufs_hba *hba)
>  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
>  		goto out;
>  
> -	if (pm_runtime_suspended(hba->dev)) {
> -		ret = ufshcd_runtime_resume(hba);
> -		if (ret)
> -			goto out;
> -	}
> +	/*
> +	 * Let runtime PM framework manage and prevent concurrent runtime
> +	 * operations with shutdown flow.
> +	 */
> +	pm_runtime_get_sync(hba->dev);
> +
> +	/*
> +	 * Quiesce all SCSI devices to prevent any non-PM requests sending
> +	 * from block layer during and after shutdown.
> +	 *
> +	 * Here we can not use blk_cleanup_queue() since PM requests
> +	 * (with BLK_MQ_REQ_PREEMPT flag) are still required to be sent
> +	 * through block layer. Therefore SCSI command queued after the
> +	 * scsi_target_quiesce() call returned will block until
> +	 * blk_cleanup_queue() is called.
> +	 *
> +	 * Besides, scsi_target_"un"quiesce (e.g., scsi_target_resume) can
> +	 * be ignored since shutdown is one-way flow.
> +	 */
> +	list_for_each_entry(starget, &hba->host->__targets, siblings)
> +		scsi_target_quiesce(starget);
>  
>  	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
>  out:

This seems wrong to me. Since ufshcd_shutdown() shuts down the link I think
it should call scsi_remove_device() instead of scsi_target_quiesce().

Thanks,

Bart.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
