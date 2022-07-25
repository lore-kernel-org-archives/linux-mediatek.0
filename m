Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6370BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55H2reE2l3YivWu/Lf9xXm5xDYR89weNnm+BW4V1Jnw=; b=nz0/bncFPYv/qSPZfqm3hZTuAm
	5BL1ZGt0q+UMk4+BIxsmYXUHQzzlJ46jciM3WflbdVLf0BSx+7sWsQzAFiVILO2Toi+huq4foD94I
	v5M8MJGXZ9peeyLLqDylc+7waWklmzu7vNIgxF2YFii0YSpVGeZMjZYgvD0i16nSnK8jmX4lSMNaW
	9PoJxzy3yoI3wTiKWuHaXHAdPVel1qkwFAHvadaRnig3UkusTQjFJxQo1TEpfdS4k/gJiYXv2w2tU
	nNJgz8v9p+ezzb6bRFto/mweC+WqW/5g7mSWRH1//SbMHs7qZIyGtdcLp6VnTszMU8F3jqvDOCP1k
	NQd5cveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG19U-00FjNp-Qq; Mon, 25 Jul 2022 16:41:52 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG19S-00FjMc-6P
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 16:41:51 +0000
Received: by mail-pl1-f171.google.com with SMTP id d3so3039441pls.4
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 09:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=55H2reE2l3YivWu/Lf9xXm5xDYR89weNnm+BW4V1Jnw=;
        b=Kfx6bPooIrwFklJn2Jsh+uzxnRErkOkTbCAnH5pAG18JanURgWkGQtw2bi6EQsHMhP
         REZlJD397a1s5bU+UcWUwpE7M4ds4Kn98kgGd9ajE1XB6OvFj1vGOHr+IxroOW1C7jX+
         bWLYfs5n3oLW8AIio7+nhlcXISsUUn6Ojr2xa6LwTtbm9y5sewNlngpLF7cvtELRlgmI
         d7kJY5/0MsVkJSq6KobdcwikhTIJ98S8fB3yg1hbUwRnf6dPLAX8l7jJ3nvHJx+G/74G
         yY3Kq3yF2KK7mhxexMBhYRdVT/5vv5p/ofn0NSoi1bbMQTns33NMLK9VDktgpvEHSve1
         VokA==
X-Gm-Message-State: AJIora83XFDALOl4FeNGdYbJRbKXolEnYOtxS/B1FYk4w5YqUq+dS5ue
	sC5CJ7auh5eYB2Nqve3+YlVcmVi9tO0=
X-Google-Smtp-Source: AGRyM1sbLVsMtLPstM1620wElVhAD94WkP+AK28VSU1Ml+TmvuHxdASOdJDWcev9ZuZyP2n9qnwY9g==
X-Received: by 2002:a17:902:b497:b0:16d:1280:ebe5 with SMTP id y23-20020a170902b49700b0016d1280ebe5mr12978542plr.70.1658767308376;
        Mon, 25 Jul 2022 09:41:48 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:54bc:1b55:1813:e7a8? ([2620:15c:211:201:54bc:1b55:1813:e7a8])
        by smtp.gmail.com with ESMTPSA id lb14-20020a17090b4a4e00b001f1f5e812e9sm9505850pjb.20.2022.07.25.09.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:41:47 -0700 (PDT)
Message-ID: <e962c613-7bdc-99f3-4273-b91beec614ee@acm.org>
Date: Mon, 25 Jul 2022 09:41:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] ufs: core: change comment message to popular format
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220725131558.13219-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220725131558.13219-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_094150_251941_3CB7FE74 
X-CRM114-Status: UNSURE (   8.36  )
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

On 7/25/22 06:15, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Some editor cannot display ‘0’ ‘1’ in correct format.
> Change it to '0' '1' for most editor can display.

As far as I know checkpatch accepts non-ASCII UTF-8 characters. Using 
this encoding is essential to spell non-English names correctly in 
source files. I don't think it's feasible nor desirable to eliminate all 
non-ASCII UTF-8 from kernel source code files. Maybe this means that 
it's time to switch to another editor?

Thanks,

Bart.

