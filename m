Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807EBC5AE4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 19:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldrozAYeineeZ/BF/LEq3IJ2o7DgZwcwEmQt6wI/BQE=; b=0DwDuMt7g3IuYs93ApFZSPk1ym
	ZOvwSU80GfR3GmCVwy05HUb53bupJffbILZsTcGpzMDszPX5/wqh3ed0joddukFM54/khTOcN+N6U
	RWw+WadhKmpCF+j3VwG6yYFIf/XqWqx5kiUPLLUkA974g70Pt16iHH0oGWl3q9puw8284t1OaL3Q2
	LtLSc84QP5YP17uUA6/Y0zdg1zDUTQzS2pGlwep1eZG6Ye8b3cM1NjtwhhUZlClbQKCDv2Yl3mzgE
	B6aY7kGMf49g1qfFM5K07jj6rxsLp/jpbXZCo8Gh13gOSSxBa0wf/bUyiKck41vkUOjursGvfDqIp
	ePoCq3Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3LU7-001a4W-0u;
	Wed, 15 Nov 2023 19:23:35 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3LU5-001a3k-0F
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 19:23:34 +0000
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bdc185c449so18689a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 11:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700076211; x=1700681011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldrozAYeineeZ/BF/LEq3IJ2o7DgZwcwEmQt6wI/BQE=;
        b=J3kHOJaetQUpMhEk7QIhMkrqFBOwNIW6f/Yr2Tkto8wfIKTg8ZGtOwu+xC3ms0f8Jb
         YdYdthOgBi/6ziNB3HrWXjjCk9Py9PkV3IhA0iZG9ARE9DK5YFcvDE1pLrhAc3Bswb9f
         lfug+zQMJt9m6/z0bg+8pbRNPhF4OUDm1gyRhF6SrRgQEPG2BWqK5U7vTplP/2uNyBSB
         sNwRx7dqUI/qqH9KhgKoxTWSP9MYIaPN9ERktSpLqI6Homod4Ata5o2hVC4/xb2jwGII
         gvC1UFufykqkTl5pnLlXa42dhc4h3H3Efs+kTrBCH7NQgVDH5fKkIdh23hSAbCVHEZ1J
         3XoA==
X-Gm-Message-State: AOJu0Yx519oxkUZDeEdrfZIuvMeyn3AvsxFMCg4a9F4MixTV7sCN9GdY
	Sl+qmpO0Dss9SMil+eBPSAw=
X-Google-Smtp-Source: AGHT+IGq0v6pa9Jdeag9qRSdRmRPWvaBS8KkivlScZwV+8fLay4ixrQ6HcxZmmpsBH1ODg4GTcks0w==
X-Received: by 2002:a05:6a20:54a4:b0:17b:3438:cf92 with SMTP id i36-20020a056a2054a400b0017b3438cf92mr12829670pzk.5.1700076210814;
        Wed, 15 Nov 2023 11:23:30 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:56f1:2160:3a2a:2645? ([2620:0:1000:8411:56f1:2160:3a2a:2645])
        by smtp.gmail.com with ESMTPSA id k9-20020aa78209000000b00692cac7a065sm3124100pfi.151.2023.11.15.11.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 11:23:30 -0800 (PST)
Message-ID: <03a436a0-b0cf-4173-b846-44509205dacf@acm.org>
Date: Wed, 15 Nov 2023 11:23:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: clear cmd if abort success in mcq mode
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, stable@vger.kernel.org
References: <20231115131024.15829-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231115131024.15829-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_112333_111750_E1A43EAF 
X-CRM114-Status: UNSURE (   5.49  )
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

On 11/15/23 05:10, peter.wang@mediatek.com wrote:
> In mcq mode, if cmd is pending in device and abort success, response
> will not return from device. So we need clear this cmd right now,
> else command timeout happen and next time use same tag will have
> warning. WARN_ON(lrbp->cmd).
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

