Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EA1C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPwIIZji4mV+ZRru26BAK0A17cLTb3lSIzhJ0eieN5U=; b=RixddWTXQPIbZ23vu5KMdsCunU
	2IE1mxyNtjThuExGxFL0ypc6fJJMLNWPrJYoD2jDTc8wx1dt2CZJ1NKsRvODRH/HbdJWNU0LdpxNu
	9gvXmkQsYeIIjE46Oiv9kNzcFlJ3NW8Ckpx45E8pLFozsx3pq6zKiHKiqygx7mIH0Q8+XtKVKh06v
	J1VNGlznsJNgW8EM2XXYKyci67LkfwISkSW+bqbY+xQYd/Oql51Qex86HqOJr+zk8wLbZ9wyfUBty
	zoJjL3Ywv9joGL5YGMoaSMTc6Ph2KywRWf+llQaOni39fuWTmpNH8/0BwQGL1AqelWNrdGQFaWpKq
	8cMESqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pJl-004vBZ-1Z;
	Thu, 01 Jun 2023 20:54:45 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pJi-004vAw-2i;
	Thu, 01 Jun 2023 20:54:44 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b02497f4cfso8090315ad.3;
        Thu, 01 Jun 2023 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685652880; x=1688244880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPwIIZji4mV+ZRru26BAK0A17cLTb3lSIzhJ0eieN5U=;
        b=ZsrKck26M/93egYVOzkkcepE6oesk4BRkxl9P3NJYmxRLgYy4eDHUWJsJnNlYjKzvo
         UkcwuZ/sIVwWbRf7M7pXFVRDIk9kQgBfUSO4NrLrsBClEcGz5SyEchYVGB/5OgLXWnam
         DZAw7pUX9+2dFulybIqz/vQi0YAjn5kFy1uo5sde6j1GdEtHbwibuswlAD9L7etH6Xrq
         5KKCyqrOoPXJTgDJ503EPgaTEoHO/SjubeOMeciWhrxVeGHXxR/PQwtaAI/OgWSkcl9/
         mcLKwCO+iF8LbNRR17TpLLdS4GryWLNAfiLjnxsJyh2Qi0RnQc4bUkYa19HYOs7MJiGL
         ORVQ==
X-Gm-Message-State: AC+VfDy4uhYaNibnvZm1f+em55tVJgqBX4OPKhxFjCP6lbIQhdc+p1oq
	5A86jC/mMKpQ5SfdpVuFejE=
X-Google-Smtp-Source: ACHHUZ5hUChDXbEmqYIU8V8OQaDiPwT6USDEoTMPSLkgzUsyWLT/1zZYL1PVhpX7Lh14eAmy+9e7hw==
X-Received: by 2002:a17:902:ab96:b0:1a9:bc13:7e20 with SMTP id f22-20020a170902ab9600b001a9bc137e20mr404142plr.44.1685652880497;
        Thu, 01 Jun 2023 13:54:40 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902758d00b001a52c38350fsm3929463pll.169.2023.06.01.13.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 13:54:40 -0700 (PDT)
Message-ID: <f6a79164-944c-a355-40f3-0bddbcb37357@acm.org>
Date: Thu, 1 Jun 2023 13:54:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-2-powen.kao@mediatek.com>
 <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
 <CAGaU9a9TsoaUtoMX8cNmAhfBnCddRtWYEG8ACdRNJfri+sdasg@mail.gmail.com>
 <ec9c378c-fedd-5a90-bb12-085395e0d22e@acm.org>
 <fd0fceb04efa34e6d86f09c5554746cfcc5c993f.camel@mediatek.com>
 <4ea8427d-8b09-d35f-0e2c-2df486b79692@acm.org>
 <d5f239c6f104d9dd4e5493d5d06709e33f12226b.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <d5f239c6f104d9dd4e5493d5d06709e33f12226b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_135442_899702_CE0C9AC4 
X-CRM114-Status: GOOD (  19.62  )
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

On 6/1/23 07:41, Peter Wang (王信友) wrote:
> On Thu, 2023-06-01 at 07:23 -0700, Bart Van Assche wrote:
>> Thanks, I had overlooked this. Do you agree that the above shows that the
>> flag I proposed in my previous email (UFSHCD_CAP_SINGLE_CQ) is sufficient
>> to support the MediaTek use case? I want to keep the SQ-CQ association code
>> in the UFS driver core because the next step will probably to switch from
>> one CQ per SQ to one CQ per CPU core for UFS controllers that support
>> multiple completion interrupts.
>
> If the UFS device speed is geting higher and higher, one CQ may not sufficient.
> 
> So, UFSHCD_CAP_SINGLE_CQ is not flexible for us beacuse we may want to map to two CQs.

Hi Peter,

Let's take a step back. The MediaTek UFSHCI 4.0 host controller only 
supports a single completion interrupt. A significant disadvantage of 
the single completion interrupt approach is that all completion 
interrupts are processed by the same CPU core. This is known to cause 
problems on Android. If sufficient time is spent in an interrupt 
handler, threads that run on the same CPU core as the interrupt handler 
may get scheduled too late. This can result in e.g. audio glitches 
noticeable by humans. Hardware designers told me that the area occupied 
by a single interrupt line is small. So I think it is fair to say that 
the (nonstandard!) approach of only supporting a single completion 
interrupt in an UFSHCI 4.0 controller is not a good choice.

The UFS driver already supports multiple hardware queue types 
(HCTX_TYPE_DEFAULT, READ and POLL). An interesting optimization would be 
to combine the completion queues for at least the DEFAULT and READ queue 
types. Introducing a vop to configure the completion queue ID would make 
it almost impossible to implement this optimization in a generic way.

Asking to add a vop that improves performance by only a few percent for 
a *nonstandard* controller and at the same time that makes it very hard 
to optimize the driver for standards compliant controllers is something 
that I consider unreasonable.

Bart.

