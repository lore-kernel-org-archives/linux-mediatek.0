Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B7C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw1p4Ct4038ajzG7YO2p29jpkoZuGnzz5bWfg0LQBtM=; b=P6qNBTSJ7kLY31AqwU4+jsCoVF
	jVgnckcqXz8KchVri4qR+8gySy82CoM7odS2pvOpk8Mpo/NuEOUZrbsT/ZYiAIoWjRDfhBQVObX66
	VdtWPqOmZ4m2FHQU1rUCH6rO1eiCnnKKtCDpLs4NE4xMkfPwSyF7AUqUB7fy28PbzHFfSdihLPa9N
	dMBj7g3RWJT1Um+IwEnJvQxzCDHdJAe+RlccDUkfuYzBl3t5CBWlu+EsLskANghaGKQAQiXsTEv43
	YZBbKp+iLtWlrwqVA0a3XYa3Vc53w/5Gq8uWClzYfnZeQkcDSxtoOkEr29YWJRhMQ3avglXoRdyAE
	cdETtALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Yf-00Fsm7-MF; Mon, 25 Jul 2022 17:07:53 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG1Yd-00Fskq-Ar
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 17:07:52 +0000
Received: by mail-pj1-f49.google.com with SMTP id l14-20020a17090a72ce00b001f20ed3c55dso10841580pjk.5
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 10:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sw1p4Ct4038ajzG7YO2p29jpkoZuGnzz5bWfg0LQBtM=;
        b=v8Igx/+ONSQ1FhElb1uuBPanNkBGEynT7mQ5MMlxa7L/lywGQdN2yH9yvdnJiAj3lT
         YRrTUIySNyZF6cY+IU2krfEF+x2Kn3zmvZpICDVT27HcmmX55pyeleGLMFRVecHqq/7J
         vD2IgH0yl8xgsIicF58iQq5cIOFQj1s9cAi8cByg7mXf6E/pa9kgelLYpCIDLW/Li8j2
         osNW/LIdpe5ON1w48n+XYL3uojaAqJaXtxTDu+F3u++JVH6BMnWr3MhXj6XS5IoaKRdA
         HbxhNs2yT/Vpa//RuV7fUhDjdrtE2CNTCVRmf4lh9CbPIDlmppQU3saV9jYyioTn1ZUz
         sBXg==
X-Gm-Message-State: AJIora+nUyqCkxHuo5raADrxLwkO8UWDyLJvDbBBeRoH4rbuWDDuUypG
	6xWWgAFAJWfZcqR/8DSmCvY=
X-Google-Smtp-Source: AGRyM1unNMYA1GUxNbVV21SCt/CEhvRgmKS5ZtPL3ilnIkmvLlHcY5dIokCQMDpDtfBn4ZknBqhWVg==
X-Received: by 2002:a17:90a:5e0b:b0:1f0:5565:ee6e with SMTP id w11-20020a17090a5e0b00b001f05565ee6emr32488117pjf.128.1658768869293;
        Mon, 25 Jul 2022 10:07:49 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:54bc:1b55:1813:e7a8? ([2620:15c:211:201:54bc:1b55:1813:e7a8])
        by smtp.gmail.com with ESMTPSA id v188-20020a6261c5000000b0051b9ecb53e6sm9801300pfb.105.2022.07.25.10.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:07:48 -0700 (PDT)
Message-ID: <2edfdadc-2a93-591f-c5ca-98dc02a30499@acm.org>
Date: Mon, 25 Jul 2022 10:07:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] scsi: ufs: correct ufshcd_shutdown flow
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220721065833.26887-1-peter.wang@mediatek.com>
 <2f66f4ba-f0d5-6b8a-cc3b-fa896a302d60@acm.org>
 <090da948-0fce-9a89-0e1c-a26b3e0b735f@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <090da948-0fce-9a89-0e1c-a26b3e0b735f@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_100751_405658_3C3ACB94 
X-CRM114-Status: GOOD (  11.36  )
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

On 7/24/22 20:47, Peter Wang wrote:
> Because kernel_restart is export, and mediatek may call kernel_restart 
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is this code upstream?

> while shutdown is on going.
> EXPORT_SYMBOL_GPL(kernel_restart);
> kernel_restart -> kernel_restart_prepare -> device_shutdown
> 
> So, there may have two thread execute device_shutdown concurrently.
> And the list_lock in device_shutdown function is not protect shutdown 
> callback function,
> caused two callback function(ufshcd_shutdown/ufshcd_wl_shutdown) could 
> run concurrently.
> 
> Here is the error log that two thread in device_shutdown.
> [37684.002227] [T1500641] platform +platform:112b0000.ufshci 
> kpoc_charger: ufshcd-mtk 112b0000.ufshci: [name:core&]shutdown
> [37684.002264] [T1600339] scsi +scsi:0:0:0:49488 charger_thread: 
> ufs_device_wlun 0:0:0:49488: [name:core&]shutdown

Hi Peter,

I had not yet taken a look at the kernel_restart() function. Now that I 
have taken a look, it seems to me that kernel_restart() calls must be 
serialized via the system_transition_mutex. Please make sure that the 
kernel_restart() calls are serialized.

Thanks,

Bart.

