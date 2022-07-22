Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D97C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAec0w8oMUoPsElfLNtomIsL0LPvjitCy/MNYGvUdLc=; b=UjM5DshKd6LiqidsdxlgeUTeZp
	l7fD3a1LUoRu9OfdBhxO/1NXHhqQ6Arn5JKTBYM2z+MHjk+a1YVDkuvCQoX5GxiDLOta500CKCCoW
	m54KmgtlR1HmPzkxVr5HrAdgbPkPkZCT7u4vCYmAVnF3aObjD+2Y9w0MX58Lw1+k4XCbrlcJWhtpy
	XIrRFDSsS23F7xz37C9srhYCL4Ttgb32Op5TA2gqZyZv+tpSFXVm+trMwfwr8OFVKbYAfR43w/Rl2
	1O3NME/27OMxm1Sc2yrh8xAuQAnDH3g6Aq9r9B2Nc6p2BeuJVnRPrrqdZu0L6iidDWxc9TdRfwcTv
	iOqCw2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzku-00BK4b-Bp; Fri, 22 Jul 2022 21:00:16 +0000
Received: from mail-pg1-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzks-00BK25-Ik
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 21:00:15 +0000
Received: by mail-pg1-f177.google.com with SMTP id 72so5384507pge.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 14:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rAec0w8oMUoPsElfLNtomIsL0LPvjitCy/MNYGvUdLc=;
        b=w4EAIcl/DRqAyUreud9B7aBr27S/x2gRt8vqXGx6gOORf2m5+bMAsEARMxOPLo6qtk
         t8VwRtkqsTyf6mTp+YQkq/hqiX0wH9GNx4ffWLe+CIOrPrDe86keINfJqzx/GWaa9mKA
         hKw2FlzRUuNlZF9NGgYZV4ywW7mjq9FTtjYHkYiRCH3lGuq1c5FLV9CPVJG9+EYhAofG
         sXaOMeO5zaPy7wOZpEbEMbeXPjyrQbirEjJrhXY+Glgqc3U1jasqnYxXDiol0YnU1acM
         kmjQPc/n8PS97VEU9ibfVDlYWZ5cFsvOe/X/f4L2lBpJcZy/mnZWeBBnetiQX7dWSw+r
         4JQg==
X-Gm-Message-State: AJIora9OGL42NEbAClkJNMinyulK9qvw1cxN/GpbJzoXboFOL4UN5bZf
	qOtJO8TGVl2VTPFIRccalEs=
X-Google-Smtp-Source: AGRyM1t+ijklLhfmBdOq5r6R7WmV+GtYNSI28+OipEEnUJGpIeFJD3mpD7JFwof03lwnS9zEhENM6g==
X-Received: by 2002:a65:6907:0:b0:415:c9c1:eb4f with SMTP id s7-20020a656907000000b00415c9c1eb4fmr1369175pgq.193.1658523612485;
        Fri, 22 Jul 2022 14:00:12 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:805b:3c64:6a1f:424c? ([2620:15c:211:201:805b:3c64:6a1f:424c])
        by smtp.gmail.com with ESMTPSA id e15-20020a63544f000000b00419b128cf98sm3856789pgm.54.2022.07.22.14.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 14:00:11 -0700 (PDT)
Message-ID: <c9138aae-db78-7163-e207-3fb134db226c@acm.org>
Date: Fri, 22 Jul 2022 14:00:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] ufs: core: fix lockdep warning of clk_scaling_lock
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220722095308.10112-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220722095308.10112-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_140014_650906_4F412AFB 
X-CRM114-Status: GOOD (  12.85  )
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

On 7/22/22 02:53, peter.wang@mediatek.com wrote:
> This patch only release write lock of clk_scaling_lock before
> ufshcd_wb_toggle.

The above is not clear to me. Please make the above more clear.

Additionally, patches must be signed before these can be merged 
upstream. Where is your Signed-off-by?

> -	/* Enable Write Booster if we have scaled up else disable it */
> -	downgrade_write(&hba->clk_scaling_lock);
> -	is_writelock = false;
> -	ufshcd_wb_toggle(hba, scale_up);
> +	wb_toggle = true;
>   
>   out_unprepare:
> -	ufshcd_clock_scaling_unprepare(hba, is_writelock);
> +	ufshcd_clock_scaling_unprepare(hba);
> +
> +	/* Enable Write Booster if we have scaled up else disable it */
> +	if (wb_toggle)
> +		ufshcd_wb_toggle(hba, scale_up);
> +
>   	return ret;
>   }

The patch description should mention that this patch changes the 
ufshcd_wb_toggle() call: before this patch clk_scaling_lock was held in 
reader mode during the ufshcd_wb_toggle() call and with this patch 
applied clk_scaling_lock is not held while ufshcd_wb_toggle() is called. 
I'm missing an explanation of why this change is safe.

Thanks,

Bart.



