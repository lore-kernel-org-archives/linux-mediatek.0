Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AC1C5475B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NJZKXzZcH9Fr2S2jBYAuQSNfFUMMJ+GOJF9NxToya4=; b=OOted0/jZTj+92HQQ35qPr3/WI
	t/0Y39xj3d5cof22XPntECqYi1zQBT7vytL3dnouVawhziHlYKFRXCUxOfrf6G7J8hMR7wYbGJgVd
	squfX9sZQ+/aTNKo6mFhl7y5o6ZBil7vYRvf6YpH/t/HbtdM4ex8191hUbayWrzXN9oEZ+v8paFSL
	i6H47/RRIkwEboYWX7apGSKyTn5ldWIM6jyqGoR8ergR+/PTobjTqfxt1aR74Z2acfdzQtgsC01Jw
	jOZusE7UihgQHxvmY1XAREPapSKimQzZ+tBvggybHgX+qj3CtnPpADxDZxMgk9t6VzEcIu6lKdvhn
	hfNenoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTks-0000000FbUK-03cE;
	Tue, 20 Feb 2024 17:18:06 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTko-0000000FbTR-4Baw
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 17:18:04 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e4741b23d7so1214911b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Feb 2024 09:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708449482; x=1709054282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NJZKXzZcH9Fr2S2jBYAuQSNfFUMMJ+GOJF9NxToya4=;
        b=FDf2aKq4gdcvrPdHNIRvC2HB3RWU8ek/A5TxhGz1TTfWBj5Bf8o5UU60w/xuQWdLsx
         nr52SkRA7qEAL2dQ32LzYp5XU9K2IJeVBxr2KmySBMX51YCe3MxpCRFwNXJqn5C/fp0O
         m/iP6LMNqFUj/4R7NCUHhqIczzevm8HBBbu7i3+yJWTm4/qjdQv2atNGiy032CGxO8nI
         ATsM9a2nqABSL+z28axEsps+R0BbFduPc9NO5vFrcvLiSjjpD/qYs8GPnBpv89CmDgU0
         Hs9oOaKybt4L66C5cDrRvItwenuEsqPcbTz9VC2uUfkOLqWw7ylQKqPMdP5QrZRwPYUd
         BUGw==
X-Forwarded-Encrypted: i=1; AJvYcCXGCuHJz5P2WK+axn5LNbjJQ/R84wpATLnmZADstUmixgxOmW8xePBQOTsR1zYpolRKJP20PEYqMC774gbpfsvoIXC5Oy9secY7UAEIMxYsE8o6
X-Gm-Message-State: AOJu0YzgjvSuPcqeBqRgZwyNVYtIRDzKvUy2j2IK0V8WhSWtiATOeW9e
	PaFaXdsrkFtxxiRU5Ik5duR/Z22VCgPrBmyA5OshoEQncokJ+VrGXoHVyZYp
X-Google-Smtp-Source: AGHT+IEGX9I6dAr4XwDddzjtJJ7E4l/4z8mM80OwXNh/ZK/KcMZPyyc6Pi5EOXeHtBy2uNcNbBboGw==
X-Received: by 2002:a05:6a21:9101:b0:19e:ccb2:fd80 with SMTP id tn1-20020a056a21910100b0019eccb2fd80mr14979835pzb.8.1708449481848;
        Tue, 20 Feb 2024 09:18:01 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:455a:b76d:46a7:7189? ([2620:0:1000:8411:455a:b76d:46a7:7189])
        by smtp.gmail.com with ESMTPSA id t20-20020a632254000000b005cfbf96c733sm6890557pgm.30.2024.02.20.09.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 09:18:01 -0800 (PST)
Message-ID: <46d0c5b7-7158-405d-ba38-cece4030e2bd@acm.org>
Date: Tue, 20 Feb 2024 09:17:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: adjust config_scsi_dev usage
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240220094211.20678-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240220094211.20678-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_091803_066266_33E92E0D 
X-CRM114-Status: UNSURE (   7.49  )
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

On 2/20/24 01:42, peter.wang@mediatek.com wrote:
> Adjust the usage of config_scis_dev to mach the existing usage of
> other vops in ufs driver.

I'm not sure the above is sufficient as motivation to make this change.
Why to introduce the helper function ufshcd_vops_config_scsi_dev() since it
only has one caller? Is this patch really an improvement of the UFS driver
code base?

Thanks,

Bart.

