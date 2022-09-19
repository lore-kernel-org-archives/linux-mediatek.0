Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DCFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdD332cfLSFspbljbqZ3rL5eMxMc8503UuRtPaoqp88=; b=Q62UF/vPprBA9fOsiAqItLugII
	fclXZFtdegd3tbHRCKIl4qmPxK/WwEO0liK4td8gahtLTJqTq7KoCHX15uQd7+JN7eY4QiDiGPp2s
	jgVqbbetzxZkjn+AuvPZWZ8189iQA01u4DpB2WJNIjTvLwD5xxRHI+iDg8gOTOAf9RNr5LdB9vZau
	nZypaBFGqkYKHZcisLGxuQShdz+OeL+H9wdXClJrAa93RtA8+qB184bDM5P63bgfRfCJzv20zSRmQ
	v0jQui9OxOS3lJ/bpoKMnojq9eF7XaoUI3B6jpdIjl9AiKpHhhwIDyuux67gmkkSU/1NP6QdZXoz2
	kqxUDS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJaF-00CsAs-GT; Mon, 19 Sep 2022 16:25:23 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJaC-00Cs5s-Ga
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:25:21 +0000
Received: by mail-pj1-f42.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so6621175pjh.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PdD332cfLSFspbljbqZ3rL5eMxMc8503UuRtPaoqp88=;
        b=sJ68H1QSzi9Hk/fwQg9dLH936/URaYFjISlEJQrgASo9lsvh4xe4eGQZyrXtLXkctM
         QPDFApKVcHdZfIjf56HVqtZdeewIYEOXz1Ac5d6SHg+SHOm4uibANuznHxNWfP3G7P+0
         wbs/XEdRRZ4WhzaAr5p/SVTmOEziLV+Csk2nKQCyBd4cC+93Cdzc6yTIJHtYs0PUIZcv
         9lUIXKqWXrsgWtspQdWV+q4yuS0q+EcEjZS6JTtVkwer0nUCgivYMsJQGH79kq7pW0+2
         pSYodzHxnziYKaC1uk2xPtvOCqCsVQ5Px4umYGupzy1jxpx3JSw6mqAND0MhejsO8ODO
         WNSw==
X-Gm-Message-State: ACrzQf09ZEnwoGKMKj8mXxNpcrbDcqwhIz6lvJvZK0dwNbc7OvTwz1Eh
	l0KzVxZE6ldciiPj4do+rN0=
X-Google-Smtp-Source: AMsMyM51d4bdzZ9v0QKCiJcEzOa6v0GxOCk3hpbzBEq7ihgMU/5VClVVxRpNZrN/C1mmhPzB2UoZNA==
X-Received: by 2002:a17:90b:3ec1:b0:203:5eef:fe1e with SMTP id rm1-20020a17090b3ec100b002035eeffe1emr16248910pjb.143.1663604715134;
        Mon, 19 Sep 2022 09:25:15 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9b5b:c086:d392:8ccb? ([2620:15c:211:201:9b5b:c086:d392:8ccb])
        by smtp.gmail.com with ESMTPSA id t20-20020a62d154000000b0053653c6b9f9sm20463114pfl.204.2022.09.19.09.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 09:25:14 -0700 (PDT)
Message-ID: <4acf4f39-f6f8-6b65-2bc6-a4c5225d9a04@acm.org>
Date: Mon, 19 Sep 2022 09:25:11 -0700
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
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <647e3423-94dc-f2c6-0fad-7896e709f291@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_092520_596785_EEC79E45 
X-CRM114-Status: GOOD (  12.22  )
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

On 9/19/22 07:47, Peter Wang wrote:
> If the scsi error happened and need do ufshcd_eh_host_reset_handler, the 
> rpm state should in RPM_ACTIVE.
> Because scsi need wakeup suspended LUN, and send command to LUN then get 
> error, right?

The following sequence may activate the SCSI error handler while the RPM 
state is RPM_RESUMING:
* The RPM state is RPM_SUSPENDED.
* The RPM state is changed into RPM_RESUMING and ufshcd_wl_resume() is 
called.
* ufshcd_set_dev_pwr_mode() calls scsi_execute() and the START STOP UNIT 
command times out.
* Because of this timeout the SCSI error handler is activated.

> If remove ufshcd_rpm_get_sync directly, think about this case.
> ufshcd_err_handler is on going and try to abort some task (which may get 
> stuck and timeout too).
> Then rpm count down try to suspend. Finally runtime suspend callback may 
> return IO error and IO hang.

Hmm ... suspending a UFS device involves calling ufshcd_wl_shutdown(), 
ufshcd_set_dev_pwr_mode() and scsi_execute(). scsi_execute() is 
serialized against the UFS error handler because the latter calls 
ufshcd_scsi_block_requests().

Thanks,

Bart.

