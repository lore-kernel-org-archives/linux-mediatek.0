Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F1AC2D0CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 15:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC87520643
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 15:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKC9rg0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC87520643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuFt62Lmad94xYh/b6baMhhEHcX72tI9bsPucmmahEc=; b=mKC9rg0fdBJIxh
	6jg3pzLmeidGMHBKbDEiqR1LFajfoqht4cT9qxo0utr9f8XCyOQXwzWJIRDaEE4ZlBg6zu+dtFNny
	PVdG6wR8Z/2P6/s984tI2QfO1W0+PP8zZp6E4eDN9VviLcoWxut93mifMxubkQcphWUwIIRTwxRBu
	V6vqqez5P0YEYiDXOUJjbJK4UXQ6sK3gByYJy7MGnMLjfcmCkjS/CJUIkWPZpuz4Bn1wKXV3ijHs9
	xUNup9vaqK7kw76B7hHJoIMDzdtCpF+eCw3fDK2RqkFzgAPfNdROAJcB7VhCa4JlsNuGKws61kTNA
	WCfyfTHb3b/Ovlo2diqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijmOL-0001Oy-WA; Tue, 24 Dec 2019 15:46:37 +0000
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijmOA-0001HU-Pt; Tue, 24 Dec 2019 15:46:29 +0000
Received: by mail-pj1-f65.google.com with SMTP id m13so1369648pjb.2;
 Tue, 24 Dec 2019 07:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0ui3frYlfiXdTUjqfeUJDp5cIjjrIwzBPWUplqeRkEk=;
 b=gg2ey8bUo2PVr1r3955zWwkmi0+mpByeIbi+Dk23D+BVl7MvF4aeVREjUDe8puZF89
 EtcAk8r+sAEPnI6ye4mOCQXC3zj69gvFoSG3hJ3dRADCbGG0/oKrDLdD3jwVQZFPhjPz
 LTdj1L5FAS0N5fqmrHnjf3hso91dCF59c4fQWBA8O3DkAYIuj5KR3T712OtwVSVS1rZE
 vXIsZAMwF9rMrvXNi3vENRnGoneFA1YS750jOA/i7QA1BhsTWZ9YgsXYkEzUlIu86qr1
 bBFwOSoeZB73X2793eThj2Gn3jnJ9KcZatS/PJ89lSBWcnQCacNjmTVlkeWBl77AxjGP
 XBKw==
X-Gm-Message-State: APjAAAWQdbeRNHVuH3I9v3UYjLp+MY+b1Au8qeVoJCDZgY/GR8zS/ZH1
 YRb8RH9dMiL1DjwXZN4v+J0=
X-Google-Smtp-Source: APXvYqz6iZAH2fqKHGMMuLejkF7qSezx7mDt7SYKF2IxG3sn/bcC/8HKxqA19xeTQtTHJV6egAKYeg==
X-Received: by 2002:a17:902:708c:: with SMTP id
 z12mr15543251plk.15.1577202384233; 
 Tue, 24 Dec 2019 07:46:24 -0800 (PST)
Received: from ?IPv6:2601:647:4000:1206:80fd:a97:a7d:f0c8?
 ([2601:647:4000:1206:80fd:a97:a7d:f0c8])
 by smtp.gmail.com with ESMTPSA id 199sm30715193pfv.81.2019.12.24.07.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 07:46:23 -0800 (PST)
Subject: Re: [PATCH v1 1/2] scsi: ufs: unify scsi_block_requests usage
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 pedrom.sousa@synopsys.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
 <1577192466-20762-2-git-send-email-stanley.chu@mediatek.com>
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
Message-ID: <e9a8fbc0-5f08-75f5-b23b-2bbaa28a6222@acm.org>
Date: Tue, 24 Dec 2019 07:46:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1577192466-20762-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_074626_839471_FBF2B310 
X-CRM114-Status: GOOD (  15.81  )
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
> Currently UFS driver has ufshcd_scsi_block_requests() with
> reference counter mechanism to avoid possible racing of blocking and
> unblocking requests flow. Unify all users in UFS driver to use the
> same function.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index ed02a70..b6b9665 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -5177,7 +5177,7 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
>  	hba = container_of(work, struct ufs_hba, eeh_work);
>  
>  	pm_runtime_get_sync(hba->dev);
> -	scsi_block_requests(hba->host);
> +	ufshcd_scsi_block_requests(hba);
>  	err = ufshcd_get_ee_status(hba, &status);
>  	if (err) {
>  		dev_err(hba->dev, "%s: failed to get exception status %d\n",
> @@ -5191,7 +5191,7 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
>  		ufshcd_bkops_exception_event_handler(hba);
>  
>  out:
> -	scsi_unblock_requests(hba->host);
> +	ufshcd_scsi_unblock_requests(hba);
>  	pm_runtime_put_sync(hba->dev);
>  	return;
>  }

Hi Stanley,

From the SCSI core:

void scsi_block_requests(struct Scsi_Host *shost)
{
	shost->host_self_blocked = 1;
}

In other words, neither scsi_block_requests() nor
ufshcd_scsi_block_requests() wait for ongoing ufshcd_queuecommand()
calls to finish. Is it required to wait for these calls to finish before
exceptions are handled? If not, can the scsi_block_requests() and
scsi_unblock_requests() calls be left out? If it is required to wait for
ongoing ufshcd_queuecommand() calls to finish then I think the
scsi_block_requests() and scsi_unblock_requests() will have to be
changed into something else.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
