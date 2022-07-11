Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED6DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlCWnpuHBiBhE7oDhpYPIvbDLmOAPgNxuESwMXrAYiU=; b=cslgDDM8lh3iLRQ+5vJuSFmnVS
	pfYzlq5YiXMH477jaOKVhYvaCN365OOw24YU4qHKigltwbC0qFjNpAhjrbcQUtacyZo5/JZ7AANU3
	bTasVCj2B9oGVFuFQTNjQhgww6nCLCpHNX4cnved0ZS/iEPJQbck/rKUWjZ8i7bFoXpdZQl5Im5AK
	0xdJQ3YQ8twUHjzqP+KCOYvqvhBmlNMpJ0uAp17kOFpXU0jCrspC42ZFpT8AuDCWlewRNLnSnBMfo
	e3JG0ZehQvBH9Zdd3d/acEtYswegSbEDGQWO/BND4TcOX+qcmQWdx83ToQ9AODkag27KykvtddFMk
	9Xn1UbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAw6x-003BKS-TK; Mon, 11 Jul 2022 16:18:15 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAw6u-003BIk-RX; Mon, 11 Jul 2022 16:18:13 +0000
Received: by mail-pj1-f41.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so8836885pjn.0;
        Mon, 11 Jul 2022 09:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vlCWnpuHBiBhE7oDhpYPIvbDLmOAPgNxuESwMXrAYiU=;
        b=p26BiQgmUW59s1KaDh4lf+ztGdNvSz8Iu7omlTZDbSIbEYNlW37RwqTFhLJ1mZuatJ
         5kBJUOBz5/eioKBd4myLC66rN+3xZ/m727OAVfm8gY1lQ4Mbh4j6ZA8xuXsRlyN5a3zA
         cS5EI9cEKaQDoNVLJXOTQ+ATkMcJLPNBvWvtcvgIIJedxtK52tta/NS/sNUdL2nJqqdH
         eR268DJTtJm71ZJffpzrLko0ySJD9KVDAdrhvUJl4f/ZXN7C13wH4LozNhXMxri3HCDr
         r9Gnb0wanT0NyLTWgKf2lntmwZDrzYViFTuXmwlG16k/Um006vR2JpttLcR+l9nY+PNL
         2Zug==
X-Gm-Message-State: AJIora/gklTNG6/ZqKmLp+qbWjKQ6Tnb3nM/EKz7CG9Simr0optnzCOq
	TkIWTnJZDtoyF1K4ioC9GCs=
X-Google-Smtp-Source: AGRyM1tLWkkZqwtTqS/hVhuJzABmpZbeOei2hzW3KRFV8Fvzeep3j8QAn/1PgXUbTXlvSgsDCVpQ2w==
X-Received: by 2002:a17:903:228c:b0:16c:2f61:9158 with SMTP id b12-20020a170903228c00b0016c2f619158mr14413129plh.140.1657556289325;
        Mon, 11 Jul 2022 09:18:09 -0700 (PDT)
Received: from [192.168.50.14] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a348100b001ef7bcb7e61sm7160094pjb.47.2022.07.11.09.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 09:18:08 -0700 (PDT)
Message-ID: <4c63d554-80fb-99bc-68aa-245bdbe4e1a0@acm.org>
Date: Mon, 11 Jul 2022 09:18:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
Content-Language: en-US
To: Ren Zhijie <renzhijie2@huawei.com>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com
Cc: linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220704025632.235968-1-renzhijie2@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220704025632.235968-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_091812_917564_E5AA1BBE 
X-CRM114-Status: UNSURE (   6.18  )
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

On 7/3/22 19:56, Ren Zhijie wrote:
> 

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

