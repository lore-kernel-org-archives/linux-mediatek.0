Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB318C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdLt9Pv7yaEIwuMqlRgYlWgDDk3PKBNe2wyPJ/gdfyE=; b=VA+IEju/7We4xcMYuS4WSlW8nu
	HKabOgPWDctPJIfgGV8Mu3705pc9G9M2v83TlVGhhZv9/Qs8vRAgK6JBMR2JIEnL2D2urMQ0YizXn
	Z4ttizJoIW+XtvwXkrtN+zab+g2iX3WKHdHHdKJ77va62xd1B8n1ycuKWRwetfFd6abCYOnvYrETi
	E24eqPAsLIdua/1Cltz33ZLs2HZBEJMQABNtkFBhwQa2TuTCfDkoJ7nfORCXwwtZwP/S4iq19L5lS
	NOyMKsUSwzOqfFmMMKJ+vm5LyiS3iR42PTWfHFiApr3YruIfVbSJS3pjQGLaiRYGLfZfPUckzPffX
	Pa1TybLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIYW3-007yRC-DP; Mon, 01 Aug 2022 16:43:39 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIYW0-007yPX-Sq
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 16:43:38 +0000
Received: by mail-pj1-f44.google.com with SMTP id b4so1002800pji.4
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 09:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bdLt9Pv7yaEIwuMqlRgYlWgDDk3PKBNe2wyPJ/gdfyE=;
        b=pJBO/qEllAGmVD9jC2Ikl023vWXWpaLhZSPl1N7T4FOB61l4zy3domqXq1UOHmTfl3
         weu42k6hDD+7bgTyzxaUj5rYFJ0EhaCQl2ChgzTPNAQhF+rQeZK87g066AEL2Qccsb07
         uuYZuqEwgTUBtwhrRzxTqy8sWCvZzuTqSNlluS/bIIUO9wmf43ZTC+wP5fG/DdO7XOQX
         5sUXUPh06XHDzmmjfL4nkIhrcakDLpIDCM6LgpkeiLqYB+H/Z7WT9GGeChSWNMY0O5dE
         wHXMkRoyVWZpA7xd9OI580Fw9PN/yUA5OU7heC85a573jMMmwj+c7YeTqO6/sUN1xb5L
         RIqw==
X-Gm-Message-State: ACgBeo1IzHr2ErEB1T+p+AbJVh6JvNsBy2sA5BVWTfSCxFQLYnH/tGfg
	skl6eTjCkyR7h4Zbr5dlT+A=
X-Google-Smtp-Source: AA6agR7dI3xrYpst3diC8fGBS6AVX4M64xuY5D7YgOgDwJJGMRpLygpa9TmB96S0008GC7sJanv0hw==
X-Received: by 2002:a17:90a:e7cd:b0:1f0:2304:f579 with SMTP id kb13-20020a17090ae7cd00b001f02304f579mr20218306pjb.212.1659372214957;
        Mon, 01 Aug 2022 09:43:34 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:6496:b2a7:616f:954d? ([2620:15c:211:201:6496:b2a7:616f:954d])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902f64500b0016cd74e5f87sm9790048plg.240.2022.08.01.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 09:43:34 -0700 (PDT)
Message-ID: <dadc85ee-1252-38e8-a34f-3d1935f16b29@acm.org>
Date: Mon, 1 Aug 2022 09:43:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
Content-Language: en-US
To: Asutosh Das <asutoshd@codeaurora.org>
Cc: Peter Wang <peter.wang@mediatek.com>, martin.petersen@oracle.com,
 stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
References: <20220728071637.22364-1-peter.wang@mediatek.com>
 <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
 <ca760b93-e6e9-abea-f2b2-dbb0c592690b@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ca760b93-e6e9-abea-f2b2-dbb0c592690b@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_094336_958655_9938094E 
X-CRM114-Status: GOOD (  10.99  )
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

On 8/1/22 07:30, Peter Wang wrote:
> Or, do you think we can direct remove ufshcd_wb_toggle in clock scaling 
> and only let sysfs to control wb behavior?

I think it's worth asking the people who introduced this feature whether 
it can be removed.

Hi Asutosh,

Commit 3d17b9b5ab11 ("scsi: ufs: Add write booster feature support") 
introduced the following code in ufshcd_devfreq_scale():

+       /* Enable Write Booster if we have scaled up else disable it */
+       up_write(&hba->clk_scaling_lock);
+       ufshcd_wb_ctrl(hba, scale_up);
+       down_write(&hba->clk_scaling_lock);

Would you mind if the code for enabling/disabling the WriteBooster is 
removed again from ufshcd_devfreq_scale() and that a new mechanism is 
introduced for controlling the WriteBooster mechanism?

Thanks,

Bart.

