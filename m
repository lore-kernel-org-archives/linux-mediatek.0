Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B403C2D0CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 15:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E83B20643
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 15:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7I8ImKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E83B20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOuh31G5M5hNfI6Pdricdz96WvCIEzm5fSMPSDqipas=; b=O7I8ImKC/7VusZ
	Q7mOJbZ0cUNTDCYfNFTVZgMe81RI70o++Dyt/Hfo2DYQzAlPlX/zv4+CseFlZxgcGK+7hYoDeS7oA
	MoHqzpfCHeCBUaBlZPB98piXSbyHpNnrLCan4y0ZCLq3NsGverfL0vxHH+EwZ2mwaFdBrAqPyy/Xg
	96offQrgHr0NryWIXLS6jLbHjwAYsZrvYwfLwwADhgeR+QWq35t+Hc+pnYWCfVvk1uSQ/XxuISBZf
	9eFVwCwZH6/ZyEKdz5u0is4DvYLEkWRF7E7GOC+RZlTNfw8Vzckw11vJ22OyisBV9dbTX3d5qQJG6
	U4e5u2CdnbkmhMHOfXLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijmPM-0001kM-Lb; Tue, 24 Dec 2019 15:47:40 +0000
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijmP9-0001ae-3J; Tue, 24 Dec 2019 15:47:28 +0000
Received: by mail-pg1-f195.google.com with SMTP id s64so10542820pgb.9;
 Tue, 24 Dec 2019 07:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tRZbwjsZiLdv5LPfBH5AaEk9IY4yrV1a4chfsCyzuvo=;
 b=LEzsjzCZvCROkUZMGgAPS6a6l4R8w+Pn7i2Bgt2f7B7JROIjEpNUSM2AT22UmyqcAU
 TxvcwbJS5yoJpbZHcwiws/M5c+z2qIOOOEK8wcrLAF/XTEE2BRi/ft2aZbZ3sC5DVcCf
 +mQP1yl5luFZvCIC3DR0daVMg2gMQP9ybfhDdqiNyWbjTkn0P20xnXc5AyOm9fUwx/AC
 J4K0FP66+2RggaJ5al9VHJafAXHa8morluE7WVvPJ6zvxfInzTZwHV7fvivFvyY72uca
 gy5MU6ab62QHlfuLDVBd/t6G9WMO8PTrG3Ld1ACo7PhPnWi2sl+COkUB1ljd5/YGIglY
 TAJQ==
X-Gm-Message-State: APjAAAVOJ1ILx3C5rnyI9cA+eYw0cVAnE+79NKEYRlf2N/AGLlImLilk
 X+JXy0zN0oH3uOL8LJeS/D4=
X-Google-Smtp-Source: APXvYqyU3/YxRP76cum9fxpksf5dFUrNFqEVZXrDKO5xc0U7alnCtnPHr/Wdeg9VUGMXJItluJheLA==
X-Received: by 2002:a63:cb09:: with SMTP id p9mr38168685pgg.105.1577202446338; 
 Tue, 24 Dec 2019 07:47:26 -0800 (PST)
Received: from ?IPv6:2601:647:4000:1206:80fd:a97:a7d:f0c8?
 ([2601:647:4000:1206:80fd:a97:a7d:f0c8])
 by smtp.gmail.com with ESMTPSA id y38sm26414530pgk.33.2019.12.24.07.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 07:47:25 -0800 (PST)
Subject: Re: [PATCH v1 2/2] scsi: ufs: use ufshcd_vops_dbg_register_dump for
 vendor specific dumps
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 pedrom.sousa@synopsys.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
 <1577192466-20762-3-git-send-email-stanley.chu@mediatek.com>
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
Message-ID: <b95b94f9-4db3-89d2-95d7-dbcfc9ac6369@acm.org>
Date: Tue, 24 Dec 2019 07:47:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1577192466-20762-3-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_074727_139168_A1EDF1DB 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-24 05:01, Stanley Chu wrote:
> We already have ufshcd_vops_dbg_register_dump() thus all
> "hba->vops->dbg_register_dump" references can be replaced by it.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b6b9665..1ac9272 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -428,8 +428,7 @@ static void ufshcd_print_host_regs(struct ufs_hba *hba)
>  
>  	ufshcd_print_clk_freqs(hba);
>  
> -	if (hba->vops && hba->vops->dbg_register_dump)
> -		hba->vops->dbg_register_dump(hba);
> +	ufshcd_vops_dbg_register_dump(hba);
>  }

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
