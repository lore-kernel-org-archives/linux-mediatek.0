Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E28C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QODGe8XQrN2AfrxhMBF7VvZeMPDvCS3eDqJW1xbLQYg=; b=mhC9NFB6crjiLG0ryhnSCzY0Wf
	NflUZqGD3CVrVMD6g9NEQsmvdgRvj1oWFLI2+Z5Kb8ETvEKkiUxg98YtqMuMoAC7VYrRtzaFbc1qZ
	LZZHP2rcMT7veshperiWclB/Hr36vHg746B30fbSSG0dgjmwovdUuYWDli/04idMIWN1XtgSEj6rR
	HEsR/8JEegKcozmvWJKer03SctI44JBiRM+4bHDES0a3xR+JOSHPYR1z//g/0EReOSvc6GxOW9mMG
	yvYsusyhKf92wCHRk34p+SV5E2P1gPOoaPzmh2ruYIDp7Ya5OnJuHJ0k1lL+c2WbxFHu0CE/00l4b
	uBT6ThYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ROW-001Jty-EH; Wed, 30 Nov 2022 18:01:16 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RCw-001BBq-W1
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 17:49:20 +0000
Received: by mail-pg1-f169.google.com with SMTP id w37so11619515pga.5
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 09:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QODGe8XQrN2AfrxhMBF7VvZeMPDvCS3eDqJW1xbLQYg=;
        b=ClCwAHNC6I2CqndfBAOswZuW+kFVjzAS5ApHti4sJHlvhCtaUqrqkzE9SUz1DfxKTw
         xVKkAAg5TUbq02CAyH8Ipuisus0QbBC2mUHr+0t1gPt2Xr8lkwguIhQljDZEy1YHOmUF
         J3yXKNj8r8FmZGT8+V/PHsUskGpioh4T97cQOMPTd8vU7Cetxp0XwVwl/iVhmJhazW7B
         2T0VHzxSm+Ix0aNngOF3cCtJTCPlgCXlekh1EHpyv/u4qU00MSQ6ZJ3NZU1GejgMR2cy
         /GvjOSeNauf3W3yrDJ+iM3pGOXRHtkGmzbd1sSus5drgNTisg5Rho4f4orqwl1lCLUjs
         DsRQ==
X-Gm-Message-State: ANoB5pnm48QW5qMynV7vR97PXsKt4wuP77/zUJvVcgibzhvxNXAMDgWw
	lT++E3Lf626Rhbrbgh6Fkr4=
X-Google-Smtp-Source: AA0mqf7Thgy/URFKtK7bJBJgxBHxENZbJRZTowkER0TCYeV6b7x7JFFIrmvxitWNrTDEKMJpsmTZvg==
X-Received: by 2002:a62:84c5:0:b0:574:32ac:a47a with SMTP id k188-20020a6284c5000000b0057432aca47amr39706827pfd.7.1669830555943;
        Wed, 30 Nov 2022 09:49:15 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:3729:bd90:53d2:99e3? ([2620:15c:211:201:3729:bd90:53d2:99e3])
        by smtp.gmail.com with ESMTPSA id e68-20020a621e47000000b00574db8ca00fsm1652367pfe.185.2022.11.30.09.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 09:49:14 -0800 (PST)
Message-ID: <5e00ce60-3859-4964-11f7-e036f6dda56a@acm.org>
Date: Wed, 30 Nov 2022 09:49:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1] ufs: core: wlun suspend SSU fail recovery
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20221101142410.31463-1-peter.wang@mediatek.com>
 <98bfafd3-c7b7-89b5-497a-aa694d0152dd@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <98bfafd3-c7b7-89b5-497a-aa694d0152dd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_094919_070924_FD4FE3E3 
X-CRM114-Status: UNSURE (   9.37  )
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

On 11/30/22 02:17, Adrian Hunter wrote:
> On 1/11/22 16:24, peter.wang@mediatek.com wrote:
>> From: Peter Wang <peter.wang@mediatek.com>
>>
>> When SSU fail in wlun suspend flow, trigger error handlder and
> 
> handlder -> handler
> 
> Why / how does SSU fail?

I'm not sure but the issue that Peter is trying to fix with this patch 
may already have been fixed by my patch series "Fix a deadlock in the 
UFS driver".

Thanks,

Bart.


