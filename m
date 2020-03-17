Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06DBC18E5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 03:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695D620658
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 03:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kowy43Ht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695D620658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJO5wSISos5AR03oRoSd8DZ8peDuF0c3k+5a4KB8SsM=; b=Kowy43HtHOLKnJ
	gJrRMY7YcyPmGcrPiKqyANRuEcN6pu/TrgM3s2yN+oP771uo46jlO1FiL3HuvnbSeR3kENnGoc1Zk
	egJ9MgIFejESyb/ASkmHSXCvyfz9d3d7ErJMmYkFAAg/bgOLiKKsxbGMNGx8LqV9e3tfMraKq0nTN
	Liw3KbTXUcjglrwEuuG/M0YN1BgmYLPRtudxByyiH1kRhIosjL0UEuPeBUOsJSsbigFPnI340mDu7
	aiinG4M6pkwV+Co+DG2FwmpPlLj/8r7Gcb54Mz06cqdyLOzOM+D5Fz2aYgmq88GxvaBm3hy3ZEhOC
	CBSXZB2u2sT3X4rLQy1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE3ON-0006zW-UZ; Tue, 17 Mar 2020 03:59:47 +0000
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE3OE-0006qJ-8X; Tue, 17 Mar 2020 03:59:40 +0000
Received: by mail-pl1-f193.google.com with SMTP id ay11so9017782plb.0;
 Mon, 16 Mar 2020 20:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o+0HagUr4HI/xbZe0kDuhSARtN12WFdm90lmgkXYbjo=;
 b=SPTkwXpZGbvwzI20SEsQXmKEW8uk66TbqKEkWoN50jKLC3Rd8BVTloUqt+zMc80NoW
 8ISvWCmiRdW9uLy+1+ls94Yw9YU816bxCqo5UfzTSXzJVKGRlJKyScpyykSvqwZXokgm
 +Aw2LHehBtxI/DCuAu9S1gXzwJADgXxsnlUZJlo6UISfpnhm0k6vkqp7rwto/JJVKy64
 IYau0GprVyp/Q5PYIenmpOuojdA1U1Kmadp86ajP0jlFW6o7uqlhWJSYQKeLmTPs1ZEB
 LLlsNmJJ0T6sFFMVS5IzCtyl16B8sgiBZrTAx3jmBaD+SnR17qX1iQ3nCGW+NEvOmr4q
 GV4Q==
X-Gm-Message-State: ANhLgQ1eYrjva2PfKsgxzbT4w7EuOFjmdP8P7CHcYWx/mm+N8hO7zKKl
 1gAl18Uwo/UvR1MT0qHW7c8=
X-Google-Smtp-Source: ADFU+vsXomTDgzT6KgwIqseoW04GHkn2UK/Mw6vKIvY+mvHnkDTo863+r8mAFDy8AB4kc8InAOyEmw==
X-Received: by 2002:a17:90b:352:: with SMTP id
 fh18mr3039940pjb.168.1584417577134; 
 Mon, 16 Mar 2020 20:59:37 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:f131:b83b:a5b4:4b1b?
 ([2601:647:4000:d7:f131:b83b:a5b4:4b1b])
 by smtp.gmail.com with ESMTPSA id 8sm1293481pfv.65.2020.03.16.20.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 20:59:36 -0700 (PDT)
Subject: Re: [PATCH v6 3/7] scsi: ufs: introduce common delay function
To: Stanley Chu <stanley.chu@mediatek.com>
References: <20200316085303.20350-1-stanley.chu@mediatek.com>
 <20200316085303.20350-4-stanley.chu@mediatek.com>
 <fdf91490-9c7d-df34-1c1f-e03e12855378@acm.org>
 <1584404000.14250.28.camel@mtksdccf07>
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
Message-ID: <b7a6045e-9615-0cd2-9812-2871bf9ba44c@acm.org>
Date: Mon, 16 Mar 2020 20:59:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584404000.14250.28.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_205938_793013_FADA105F 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-03-16 17:13, Stanley Chu wrote:
> On Mon, 2020-03-16 at 09:23 -0700, Bart Van Assche wrote:
>> On 3/16/20 1:52 AM, Stanley Chu wrote:
>>> +void ufshcd_wait_us(unsigned long us, unsigned long tolerance, bool can_sleep)
>>> +{
>>> +	if (!us)
>>> +		return;
>>> +
>>> +	if (us < 10 || !can_sleep)
>>> +		udelay(us);
>>> +	else
>>> +		usleep_range(us, us + tolerance);
>>> +}
>>> +EXPORT_SYMBOL_GPL(ufshcd_wait_us);
>>
>> I don't like this function because I think it makes the UFS code harder 
>> to read instead of easier. The 'can_sleep' argument is only set by one 
>> caller which I think is a strong argument to remove that argument again 
>> and to move the code that depends on that argument from the above 
>> function into the caller. Additionally, it is not possible to comprehend 
>> what a ufshcd_wait_us() call does without looking up the function 
>> definition to see what the meaning of the third argument is.
>>
>> Please drop this patch.
> 
> Thanks for your review and comments.
> 
> If the problem is the third argument 'can_sleep' which makes the code
> not be easily comprehensible, how about just removing 'can_sleep' from
> this function and keeping left parts because this function provides good
> flexibility to users to choose udelay or usleep_range according to the
> 'us' argument?

Hi Stanley,

I think that we need to get rid of 'can_sleep' across the entire UFS
driver. As far as I can see the only context from which 'can_sleep' is
set to true is ufshcd_host_reset_and_restore() and 'can_sleep' is set to
true because ufshcd_hba_stop() is called with a spinlock held. Do you
agree that it is wrong to call udelay() while holding a spinlock() and
that doing so has a bad impact on the energy consumption of the UFS
driver? Has it already been considered to use another mechanism to
serialize REG_CONTROLLER_ENABLE changes, e.g. a mutex?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
