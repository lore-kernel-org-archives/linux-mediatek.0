Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AAEC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 04:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCAA3206D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 04:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WP+M1ihZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCAA3206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6jpsaZ74L3lb0Yn7oMaOV28nxQ17Iz85rXJeDntdLr8=; b=WP+M1ihZ1UHeRVVL7Cw1W6W14
	LENw60DDqPKJq9bvcZJaDSgIQBxvhA6dsQ1FR3nAGSHfQwXCu+LLWlq5PeoyBtMvX2T8AAeMCsI83
	dbxHdNbdb5ushqrkTt8oGvF6aUlC5FZFLnZ7IcO4lcdGNcvYfljdEfYjTl1nFaf770FkuTCfIXW/e
	YBx5lTtffQNX0TVOZ54AYjj6KyxnJXuvafi+3wqNdkaRhmZwAcqCfZP43fH2hgEWuMRFITaYvLo6g
	MVQ0V/KjnCb/BgvSPMCYgJCtsyMFcDYzhdjmFLyUsozrfMH6bm/7ip8yJPnNm+pBd6Ev1hVDY4Zk6
	dH8H3h8cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvYbF-0001at-KI; Wed, 15 Jul 2020 04:00:53 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvYbB-0001Zz-Ox; Wed, 15 Jul 2020 04:00:50 +0000
Received: by mail-pl1-f196.google.com with SMTP id x9so1624428plr.2;
 Tue, 14 Jul 2020 21:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lERFJsVziUIHdDubkh5EQsGRx2WiD8PPl5yIF/RY6ck=;
 b=swofpCJcWYNzmbkW7QmL017GrWMKOfKAt4PcD6YZptq2GPpnkAHqFNhFn7gBRFodRh
 RZg/AyS/eIM5JnaI+xwGjuyPKb77+fEBYywsXGtSKJq2VfC57OeDzrK6ojKtWJJoReQp
 +k6byMCGutQdcZVFwErWOR8Ygt3D9LWCisHWw5sRKagutDe0luuWhzlJmb9JNKBFdQQj
 95Qdkf02fdCis4H4wey+gMfp/xTL9y2ldQdqsN4vW57Zogl9RTHu7wVeFQEG3tB0rRh6
 HgvE5W5bm3r4bH3a3vjNaiPMByfYnW6fZHrC5D6hI7fMV7yutmBaqz/RRsSjk9tYEC/V
 HvgA==
X-Gm-Message-State: AOAM531lW7zmJUWpijii5wAalQupnu5puRQc/BF2ac6YXC8aEsCXgqdP
 YKZ6Kq91+T4lGVsJbvReTIg=
X-Google-Smtp-Source: ABdhPJx1qYjuOEb0D4RJpuqJbzCrkMb27Oza/CFeXaMET7dz1U0JmL/QBR5OITuGJreervEq8almHw==
X-Received: by 2002:a17:902:b589:: with SMTP id
 a9mr6097265pls.98.1594785647018; 
 Tue, 14 Jul 2020 21:00:47 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id i132sm568002pfe.9.2020.07.14.21.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 21:00:46 -0700 (PDT)
Subject: Re: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
To: Avri Altman <Avri.Altman@wdc.com>, Stanley Chu <stanley.chu@mediatek.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
 <1594607245.22878.8.camel@mtkswgap22>
 <SN6PR04MB46409838AE9D4BD63797E26DFC600@SN6PR04MB4640.namprd04.prod.outlook.com>
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
Message-ID: <912623e8-5915-8380-f39a-fac7b5868a6d@acm.org>
Date: Tue, 14 Jul 2020 21:00:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SN6PR04MB46409838AE9D4BD63797E26DFC600@SN6PR04MB4640.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_000049_844547_011DDBD7 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-13 01:10, Avri Altman wrote:
> Artificially injecting errors is a very common validation mechanism,
> Provided that you are not breaking anything of the upper-layers,
> Which I don't think you are doing.

Hi Avri,

My concern is that the code that is being added in the abort handler
sooner or later will evolve into a duplicate of the regular completion
path. Wouldn't it be better to poll for completions from the timeout
handler by calling ufshcd_transfer_req_compl() instead of duplicating
that function?

>>> In section 7.2.3 of the UFS specification I found the following about how
>>> to process request completions: "Software determines if new TRs have
>>> completed since step #2, by repeating one of the two methods described in
>>> step #2. If new TRs have completed, software repeats the sequence from
>>> step #3." Is such a loop perhaps missing from the Linux UFS driver?
>
> Could not find that citation.
> What version of the spec are you using?

That quote comes from the following document: "Universal Flash Storage
Host Controller Interface (UFSHCI); Version 2.1; JESD223C; (Revision of
JESD223B, September 2013); MARCH 2016".

Bart.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
