Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7720EC4707B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gE416TbjEYVis8prf1cXZYaoI5U/2BL23yGsz4kqVcY=; b=axKGbD/SwB4UAq2fGnUqfGKbaI
	UZaaiQuuz9MWYvu26YduGwB7NYLxYt2SvgtYW86TstTbJSyo+ConxR2ki7MXVkCDkMCwyTQFA2Ox9
	iI4I4GkgZESstAj6Bj7BQ1HeNHRRe2Sef/U5fHOXNMCKsac6EmqLSueewqnYoxo9+jISvQO76hgEV
	PAhSY1TAwNe0okzEz/m3oyFZiB/AjqkRi83qAaHxw6RGViwmO7Msljz52FPm2rM57CXpenP1xqbGA
	dLV7NKigxvOEbE1oXrhn3hK6o4K0y9Qtq5UBPrzlnloP3rjKPpipjNMfAeWG7lOsQP8HgnB3Gidnw
	QLgnXGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNJji-009ZFY-1k;
	Tue, 09 Jan 2024 21:34:14 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNJjf-009ZEq-2A
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 21:34:12 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d54b763d15so14191985ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jan 2024 13:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704836050; x=1705440850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gE416TbjEYVis8prf1cXZYaoI5U/2BL23yGsz4kqVcY=;
        b=iucrEnUyufT4x0wZJAveopHVqTYAGdQhRCxSRFBhVWE8BypERgKiraBITpVN6wTFH0
         i+V9HLY/VDIh0xuNnUuwS2EFqngLCp9XfmiRv3cVUXDywtxeOkundxLZACkIzcmN26nh
         Japea3NSC6gxb9HFzTyG6fXhT+VrlQ68z4RrgfUxGacPoM6N4MczFJaKOvW2M+5wPswD
         d27pqfNXJ4zXgBxQkglK5azKWuJ1zRHevNt2v8au2N6WHgOaqpuQ1uoC5vjrPDxInq8c
         geqtv2vCeKHJq5CTaK3qSCfmdpwx3nR7zp3uXO9jNApsb4Hr3aQ+A5ZZJ6Ndhx7MrdeS
         mcrQ==
X-Gm-Message-State: AOJu0YwKDbZxM8fzxqq8y/q+FHliP8VMYwuW3BwUnYBd+9UcWxQ1imBl
	lkCG2/peobL8NKcFvTC0+jc=
X-Google-Smtp-Source: AGHT+IG4rBkEvRL39X6PgG0KP4QJbqKwxIRkuTDkYKKNIgR4JAvpmVnPlNU9UihIMnbPAp3cmN2XRQ==
X-Received: by 2002:a17:90b:3d12:b0:28d:950f:a207 with SMTP id pt18-20020a17090b3d1200b0028d950fa207mr1393071pjb.30.1704836050211;
        Tue, 09 Jan 2024 13:34:10 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:b76f:b657:4602:d182? ([2620:0:1000:8411:b76f:b657:4602:d182])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090b005000b0028aea6c24bcsm9010150pjt.53.2024.01.09.13.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:34:09 -0800 (PST)
Message-ID: <53d4c814-0b6a-4328-852c-7dfa2d8466b9@acm.org>
Date: Tue, 9 Jan 2024 13:34:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] scsi: core: move auto suspend timer to Scsi_Host
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240109124015.31359-1-peter.wang@mediatek.com>
 <20240109124015.31359-2-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240109124015.31359-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_133411_711636_7BB384FD 
X-CRM114-Status: UNSURE (   6.31  )
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

On 1/9/24 04:40, peter.wang@mediatek.com wrote:
> Runtime suspend timer is a const value in scsi_host_template, which
> host cannot modify this value.
> Move it to Scsi_Host for host flexible use.

It would help to mention in the cover letter that the UFSHCI driver is
the only driver that sets .rpm_autosuspend_delay in the SCSI host template
and hence that this patch does not break any SCSI drivers. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

