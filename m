Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EC0C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 01:39:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CB1206B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 01:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="finfaXQL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CB1206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K5qVC7DWl4MA/lF5ywaogpCxJwsIu6QvyomntLVEcJI=; b=finfaXQLXJONNG8oH0W3z6YAm
	kh1+Uvq1nQBjdqQiEETNtP8fJNKfBl5sriUWcpnYN0l1oaK+uCUEhonhOnW32S06DhnFJyGj9muev
	czL24VfGXd+69P2RNRX7IEb3RYVqWLXYOJb9EyNlqIBbPNhMRsus34HyEkAFHyDWlYv9PVZ/KyiRV
	MzPOxXtvz9q7Mx+541w3I5YXmqf2wXK86xj29zEHwBHQel1n+/ZmKG5O6kez+QCOk3zMOLYBdtfQV
	oJgqSH+o7YbPn3HWAOcQw8X0/QYzvvSOdcShuiWe2R+RjbEbPAO/6b3hq+1mnWAZOyWB/EeT5w4mD
	KiG80vlbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1junRP-0008Ge-TX; Mon, 13 Jul 2020 01:39:36 +0000
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1junRK-0008FX-GZ; Mon, 13 Jul 2020 01:39:31 +0000
Received: by mail-pj1-f66.google.com with SMTP id cm21so5385250pjb.3;
 Sun, 12 Jul 2020 18:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2hoCXmRUkmSAyEgVETfaP+qlFXIyx2KPK0JhSxhlAFQ=;
 b=ue8t8Ckb08DogyvofAW5CjTpKfPsfTcWUYjLxlI7lOMDOgyaS1WJ7eYLWdJY2Ndtyh
 yd8iqrcjNVhtZVG7zF2cmVhNCmck6EL09NKI0W+h+omyCDNygvIJ2HvylPRSgFXr/dwa
 18VqykIDYYj3lW+CpD1RWQeQ5/tWj+6/yzo848+sEshn09DLEFLX9B6L9lIOmfrh0kQh
 /uGyXrlZymZyQhJO6FtfAZsX4y3xWnq3XEW69C95IfivW04i2kU02dmpQRkKe4e2jb9p
 8aBGRJlFD6meA8XlpRTwt5ppzlcaDPb+y5Y6RETRsYmGyvtIn/0XXct3CNr6cVLDWkQL
 e1Wg==
X-Gm-Message-State: AOAM533+sf25qIgmiV9IfMtBFpmdOWNEttyfzNmEJJ9tLBjJIN0ZQZAL
 4dNAT24HwIA6QOSAvW5n39o=
X-Google-Smtp-Source: ABdhPJzdDeA2xlKZ1yna59khRDATChQUzpmgQPewoUCIxQ+qmCV51cmLCQn6MTNl1wknjsieUJRCKA==
X-Received: by 2002:a17:902:a50d:: with SMTP id
 s13mr59728593plq.149.1594604368866; 
 Sun, 12 Jul 2020 18:39:28 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id m31sm13186578pjb.52.2020.07.12.18.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2020 18:39:28 -0700 (PDT)
Subject: Re: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
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
Message-ID: <3d509c4b-d66d-2a4a-5fbd-a50a0610ad31@acm.org>
Date: Sun, 12 Jul 2020 18:39:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706132113.21096-1-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_213930_603673_595A6E6D 
X-CRM114-Status: GOOD (  12.37  )
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-06 06:21, Stanley Chu wrote:
> If somehow no interrupt notification is raised for a completed request
> and its doorbell bit is cleared by host, UFS driver needs to cleanup
> its outstanding bit in ufshcd_abort().

How is it possible that no interrupt notification is raised for a completed
request? Is this the result of a hardware shortcoming or rather the result
of how the UFS driver works? In the latter case, is this patch perhaps a
workaround? If so, has it been considered to fix the root cause instead of
implementing a workaround?

In section 7.2.3 of the UFS specification I found the following about how
to process request completions: "Software determines if new TRs have
completed since step #2, by repeating one of the two methods described in
step #2. If new TRs have completed, software repeats the sequence from step
#3." Is such a loop perhaps missing from the Linux UFS driver?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
