Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2981C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGzStEbIybdtsQTGpWdG5kec8IeEiARYjd83SFehxkU=; b=D/tb/QL4ge8rzbmc6mpuSq1MC8
	E5JQG/fdRbF/QKOCoYOtH9CtYeQlbohm1W9oEkAYhWtADQ8e1bxV7qtn2nS3VoSvrCWY+Tz7GNTBV
	D3hBFPr88qP5uXZUdFwG6CLMhEOCGpYnrUdVRZdRheHbEPLThH5rZ7W7azAOog/p/D5eZ8uPygkjJ
	UXiIrwiWg7BvZhxaafrsn3WLn1GZ34jq9flT1FOwJTw1o66l8WG6KVSgNLr0Z024Jr1SEPUt6mAnz
	wXmol1+fzxh89gcu9WhKKqBbl8mVeRM5yWwQWV9dKk7E61LEIO43RN/ZMeKKoR3rQcFfDt4g1+IIt
	VmLCthtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzri-00BMg3-0z; Fri, 22 Jul 2022 21:07:18 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzrg-00BMeA-7Q
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 21:07:17 +0000
Received: by mail-pf1-f173.google.com with SMTP id w205so2095759pfc.8
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 14:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pGzStEbIybdtsQTGpWdG5kec8IeEiARYjd83SFehxkU=;
        b=h6KxPDJIlr/rWXwaGe1lFi3EX3C8jUoAq457RGf4Pwz5VFki+QcI/UmBXMFgt1e6OG
         4r0ymNhJA0wmbA38vLbnjGenhmb5mEVsXGkfzrw0AQre0i8zr8k6+tlvHUVvW6EZfYmv
         crmtDa8AlEHTHlTalg6Qj5W0cnnCT1WHlorDCn7Tqh9dzUn2DfuyjyLbz1B9jikWStMi
         OxRhMw2C6zZbSWSRWJDo5KmFglPS4UCBRxxKLu2b0W4sCMvZzcdUAzl047S+2ff5Pz9T
         sHhG6yzXhYS+Xb/w+Y2fHr6f4yEplysy3W3E8ltYhx0mCW0J87RD0iBSqu9Md4zoRuJi
         Gf5g==
X-Gm-Message-State: AJIora8TpRj0EagSpJjIj2PLdY0WJ7CEkwtNtVv1ILjNumX9rz2kKuuU
	Jv6Kb/+CZ/d+OfwLwuy9kS8=
X-Google-Smtp-Source: AGRyM1vfFtBzYbmOPtYh2GvwYvNteJHnXHE3mc7G5rzhXgfxsC//wn68lAVjBvJAB5Du3DryFhDfIQ==
X-Received: by 2002:a05:6a00:1818:b0:52a:dabd:a232 with SMTP id y24-20020a056a00181800b0052adabda232mr1848030pfa.70.1658524033365;
        Fri, 22 Jul 2022 14:07:13 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:805b:3c64:6a1f:424c? ([2620:15c:211:201:805b:3c64:6a1f:424c])
        by smtp.gmail.com with ESMTPSA id n18-20020a170902969200b0016c37fe48casm4136747plp.193.2022.07.22.14.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 14:07:12 -0700 (PDT)
Message-ID: <60468f8f-c327-47d7-c6bf-bb73c9c84e9b@acm.org>
Date: Fri, 22 Jul 2022 14:07:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] scsi: ufs: correct ufshcd_shutdown flow
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220719130208.29032-1-peter.wang@mediatek.com>
 <afb8d403-f8f5-5161-4680-ce2c3ae7787d@acm.org>
 <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_140716_287582_69AD566C 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On 7/20/22 21:30, Peter Wang wrote:
> On 7/21/22 5:40 AM, Bart Van Assche wrote:
>> On 7/19/22 06:02, peter.wang@mediatek.com wrote:
>>> -    pm_runtime_get_sync(hba->dev);
>>> +    /* Wait ufshcd_wl_shutdown clear ufs state, timeout 500 ms */
>>> +    while (!ufshcd_is_ufs_dev_poweroff(hba) || 
>>> !ufshcd_is_link_off(hba)) {
>>> +        if (ktime_after(ktime_get(), timeout))
>>> +            goto out;
>>> +        msleep(1);
>>> +    }
>>
>> Please explain why this wait loop has been introduced.
> 
> Both ufshcd_shutdown and ufshcd_wl_shutdown could run concurrently.

Are you sure of this? In drivers/base/core.c I see a sequential loop in 
the device_shutdown() function. So how could two shutdown functions run 
concurrently?

Thanks,

Bart.

