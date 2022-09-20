Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6065C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+IcVK+v4CCuYArCNziI40d9nX4GKcgElGsEyRL6zqE=; b=tpW5tJb8WZAN/NR4DdvI/VBKRI
	DpzMJQDQGralgv153DKFcbfnR0m5XU5+BzxWWqt5WPlsFeDOD0IuPqDoVFPYAqsSk8kTuonRPUN78
	7pSPiad8QI0gcHeZesS5fksKGbgH33LaqMuYKK6JJkac74q0You6pNGjwcsVUNRr/W27C7+5ZENwR
	t8L93ZhAPHk6dreSscrBK0TK+1Gr7tTFxIVsKkYkVFpAoxS0HzytoSxyJrSWFv3ofyAcvAjkLWXU3
	wCU2MkI6TdTHLm+meBU/m3K9RdFhFzwtwgm97sYpgtJW36KywJygmtnGePnJ3g4LTX9FwIpl/mqyR
	fWVF5nig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahvv-005iHb-Ou; Tue, 20 Sep 2022 18:25:23 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahvr-005iE0-6Z
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 18:25:21 +0000
Received: by mail-pl1-f179.google.com with SMTP id l10so3227964plb.10
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U+IcVK+v4CCuYArCNziI40d9nX4GKcgElGsEyRL6zqE=;
        b=wMlY0THXADwHtzh7WwK2tUAK31Bi8VDUZ2I0jLGFWtKbiqNvFCzyf3/oE4zZWzcNNN
         9Xro47oizrwbgUaguvdw5bHqia7GskHeUJttKmXrSjJhcKLIY3nDZnA/uM5i97hKw2F5
         QDcfnOnYRZxgKZErfCjmySuGXxdYgf7ptvAry4aYBHq+1R69lnOsPUp3YwilHGY4axR0
         MUOyUA2xe+iKRQtGWDe5OuaKGsMCFqsJ7KpjLwOn9JwVX/yFyjv8xkxj/68npZIl4n5H
         BVNjmUlIcqWrysUJClu4bWXF3VwFo51Oqz8k8dNmOy4xpA3ieaOoeYoEF6UlHNbbG8gI
         DsCA==
X-Gm-Message-State: ACrzQf3Kn3hrThfXkxZgyrrkwmVdjH5SgOrv6ju7+T1GvUh7F5Ri18Uv
	5bGcUadV1J6mtPAeuDaT0f4=
X-Google-Smtp-Source: AMsMyM73dqtDqEEhJL50ZyYJFr+TuE2WH4w3NVLhlUhDM9QKcQLeIjQAhUkThz1APHaiTtGhbDA2Mg==
X-Received: by 2002:a17:90b:1d07:b0:203:6732:e280 with SMTP id on7-20020a17090b1d0700b002036732e280mr5098215pjb.172.1663698307895;
        Tue, 20 Sep 2022 11:25:07 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:c7e0:1691:74c9:2e9? ([2620:15c:211:201:c7e0:1691:74c9:2e9])
        by smtp.gmail.com with ESMTPSA id u20-20020a627914000000b00540a8074c9dsm202759pfc.166.2022.09.20.11.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 11:25:06 -0700 (PDT)
Message-ID: <10519b85-7b5d-17cf-e5be-640129a5ad7c@acm.org>
Date: Tue, 20 Sep 2022 11:25:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1] ufs: core: bypass get rpm when err handling with
 pm_op_in_progress
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220915115858.7642-1-peter.wang@mediatek.com>
 <4fadab02-5ab7-03d5-e849-55eaa26113cf@acm.org>
 <647e3423-94dc-f2c6-0fad-7896e709f291@mediatek.com>
 <4acf4f39-f6f8-6b65-2bc6-a4c5225d9a04@acm.org>
 <aec67382-d9d4-052a-50c4-574cf5c4a501@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <aec67382-d9d4-052a-50c4-574cf5c4a501@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_112519_270368_26939F61 
X-CRM114-Status: GOOD (  13.75  )
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

On 9/19/22 19:00, Peter Wang wrote:
> 
> On 9/20/22 00:25, Bart Van Assche wrote:
>> On 9/19/22 07:47, Peter Wang wrote:
>>> If the scsi error happened and need do ufshcd_eh_host_reset_handler, 
>>> the rpm state should in RPM_ACTIVE.
>>> Because scsi need wakeup suspended LUN, and send command to LUN then 
>>> get error, right?
>>
>> The following sequence may activate the SCSI error handler while the 
>> RPM state is RPM_RESUMING:
>> * The RPM state is RPM_SUSPENDED.
>> * The RPM state is changed into RPM_RESUMING and ufshcd_wl_resume() is 
>> called.
>> * ufshcd_set_dev_pwr_mode() calls scsi_execute() and the START STOP 
>> UNIT command times out.
>> * Because of this timeout the SCSI error handler is activated.
> 
> This case will not get rpm, because pm_op_in_progress is true.
> 
> So it won't hang with ufshcd_rpm_get_sync.

Right, but I think the following scenario will result in a hang:
* The RPM state is changed from RPM_SUSPENDED into RPM_RESUMING and
   ufshcd_wl_resume() has not yet been called.
* ufshcd_eh_host_reset_handler() queues ufshcd_err_handler() and the
   latter function calls ufshcd_rpm_get_sync().
* This results in a deadlock: the scsi_execute() call by
   ufshcd_wl_resume() cannot make progress because the SCSI host state is
   SHOST_RECOVERY and the error handler cannot make progress because it
   keeps waiting until ufshcd_rpm_get_sync() has finished.

Thanks,

Bart.

