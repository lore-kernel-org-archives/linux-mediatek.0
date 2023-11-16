Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00DBC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzOlheFwXArRNlERVd0wsnja017eUXH4i4Jl4/RUJVM=; b=s3wVICFawFaq0vYdwW872023yv
	IJDI/lnDvTEA6m/7x3Se//4zY5N5FOjCwlwjRyM6xY+6Vujt2LSqRVWrFYBk8o15Fq7hDo1o3c5h4
	k5qKc1QzNhuzkk9f2SHc9sdgK8NES7Md1xskWWWSQ6clmOsA7CZibLkiIYVLRZ/3NiBJsul8X08mv
	0walOCPPbtxnXDvlWC0hfLJZ1gUvFYZIEkS2WyQMQTdNv5dKkVI+QgocCbNY4qk3cDRrnrTwyaS9P
	uhgw7BogUismz18GGKFVBSIi2Jjifd0CzmfoD3yGZiLaCw7p5TMpdxBDEY0fLzlYFJmQ5zFWSbL/4
	qMM/2gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SCd-002FLE-17;
	Thu, 16 Nov 2023 02:33:59 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3SCZ-002FKB-2o;
	Thu, 16 Nov 2023 02:33:57 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc9b626a96so3103415ad.2;
        Wed, 15 Nov 2023 18:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700102035; x=1700706835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzOlheFwXArRNlERVd0wsnja017eUXH4i4Jl4/RUJVM=;
        b=Ms53KeqXpgMN3m66XbyQ4pRh//7lxAIV588JWcaojld2M3Iuq0MV+IMnr/4d3GfOPy
         ueYs8N6LruUI+jbaTQZw6vr8qKsHun+Ue0MoMcyFCeEJMw7tE7cd66AHU/JBUDSPITqz
         gbFdWZ5mhNSqhkgWaTUOaM/GuzkejjyBaMMwIrR7Uf68rtrerCIAPTsKittmIBDgLjXB
         Fi7bfJ7N99uqsTK1w9JdOPQvuhLdryUmrnfsnG+BrCalOdR+jbMxckjTTK2mQ2exXGku
         nTqxBEBjW1u0nK2DpsFE0IENvzdIgQn2d7MCXFQPZz1FszvyKeJ4VR9PDKjzevXUZrLn
         ERJA==
X-Gm-Message-State: AOJu0YzZYXvA7z8VyDSTK3oaWVFUyhw3o1BvsjayvLPBhDH9Zg7w+LYD
	MuLB0WStEFdURaQyialoDWs=
X-Google-Smtp-Source: AGHT+IHdl+3RcU9uX6yfyZH8PL/1dGRSa25bKqxBsJcrIvGzeRu4clD8brbfWCIVYnI1wvWs6QPECQ==
X-Received: by 2002:a17:902:bf02:b0:1cc:29ef:df81 with SMTP id bi2-20020a170902bf0200b001cc29efdf81mr6738724plb.41.1700102034770;
        Wed, 15 Nov 2023 18:33:54 -0800 (PST)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b001c737950e4dsm8109504pld.2.2023.11.15.18.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 18:33:54 -0800 (PST)
Message-ID: <663b4db6-6c8d-4948-80d0-a7bbf75a33b4@acm.org>
Date: Wed, 15 Nov 2023 18:33:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: mediatek: Fix the maintainer for MediaTek UFS
 hooks
Content-Language: en-US
To: Stanley Jhu <chu.stanley@gmail.com>, inux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 alim.akhtar@samsung.com, avri.altman@wdc.com, peter.wang@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
References: <20231116020254.10590-1-chu.stanley@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231116020254.10590-1-chu.stanley@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_183355_903469_90B8B867 
X-CRM114-Status: UNSURE (   7.50  )
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

On 11/15/23 18:02, Stanley Jhu wrote:
> Fix the maintainer for MediaTek UFS hooks since the origianl
> email address is not available anymore.

Why is the original email address no longer valid?

How to verify that the old and the new email address are associated
with the same person?

Thanks,

Bart.


