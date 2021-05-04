Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2DCC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:18:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5688A6117A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5688A6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LtynSaIVzMw6aVOLmsp7lWLx7TDnsQoDZABCE1cfESQ=; b=bto0/bA01s/+373mLCiwW+R+X
	Eq7peZbyIDT//oPYVbhW/CgELgO8dnm2rDZeQRPeypAik7v+Ym7n1wBCA23WKpgiHJD4DnV7G/aGZ
	VPf4Ri1eD/viwLw7607agAse34id0mQu/ok3egmX8RRQ/ZvE5sslQZ+EewWzSRrGMokrzXcjXjSKz
	y2JFboGwrgNDbQLs1qn51lQC4zplJ67+VAprYnUqGgQqNo0GZ+wA0nYuXxn/WFtRLRnBLiNoNRXcq
	vtPrFd4dQOmafA9yTY965Qrs39UiAI8P5OTxUiuxNKsBPxc2pvpXNcif+p7m8ptIeiuDD44snizIn
	CdIdPAxJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvrw-00GLbm-RU; Tue, 04 May 2021 14:17:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvru-00GLbR-Tj
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 14:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=8Mdj10uq8YyfvX11RWMMGRr3/VZzdY5+rc9TfTZ6UC8=; b=29Qd4wWChYMW5tTOfXnd7+JQ6O
 jfR59fQ0oysNa7zx2eovBkISSbNJsbkWave7u/sBQDo7oeG7LamZEgskOZik5YYlG79taE6jk2sqP
 PKxReyc5lVBpZrX/fhqGJ35mtCaE1MwS9BbXKELSNQ9RZ1HvzEAaFlNG0LX3hiS/1NoCZ158VAxDa
 xWhdAxhOz+Gtz0kIa5zrerRK2sc8TzYvD89/g4iz5eSrgxUGyb+ntNmfcT8rKydHRaCshrUnStZUs
 a5Zwj/aV7udJSs8K3efhiqXK/ucz5Ct5ejOcAc2iQxl27fJoLRgLEsjJTx0+LU2n49J1h+pkzeKYR
 g7IhIEog==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvrs-0041xl-5I
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:17:45 +0000
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ldvrq-0003qf-3x
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:17:42 +0000
Received: by mail-qk1-f198.google.com with SMTP id
 u126-20020a3792840000b02902e769005fe1so7620572qkd.2
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 07:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Mdj10uq8YyfvX11RWMMGRr3/VZzdY5+rc9TfTZ6UC8=;
 b=AnLeAs8zfC0KNjTlV0KD8WXZNHihsEn/2kKUEUz/5LOT1Q0nQ+7XtgfheeSXP169nZ
 2TD/TI0q8Yore80443hWyXdcbZpYCbYXvVIF06sxTnyAt0Vm7epAZ7e8GYRLuGdsfcBX
 I8XVB1q1xbOUWDCFtmi0CA+a/p29fYvFxyqW+5XsAV2gphVuJt4CxtJRQeNI4heKdoix
 nCCXYGiR8dqi8VLsLNKgESVFK6bdQcwAyMqsxXPK2aonieFM38smk0LwuXDI7zJt+NZ0
 r6PydJajoBZ90y9uaV+bW/UILYTGzJsTFrvnGfe4DzOCecoxA0h9BG1o2z5ZBoXz6yYz
 kZiA==
X-Gm-Message-State: AOAM533RDS0TJf9k5K0IubCkugBQURVD9+mpbX3qmPyE+JBEldlJgKAT
 NZlZy9Gy0RqPdmZKJUdetbXLqnW+1SqBT1nU/wQtp4bGGD9XRYwfBIBY2/wEAGC8Wu2+DgnJFsx
 MMQYG3NqY0zR/53Z7WEYMIFo4wufWp9/8SLHhATZ7jWYzLLrLrg==
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr22133289qtm.63.1620137861282; 
 Tue, 04 May 2021 07:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBXSkZplOQFMqdOcrYIdibKIXwCDSIkqvwhTWqybS/PTYVBzFw35eerGZalnS6j+Q4dZ10Fg==
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr22133258qtm.63.1620137861031; 
 Tue, 04 May 2021 07:17:41 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.3])
 by smtp.gmail.com with ESMTPSA id y13sm1047947qkj.84.2021.05.04.07.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:17:40 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] memory: Add support for MediaTek External Memory
 Interface driver
To: EastL Lee <EastL.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, cc.hwang@mediatek.com, joane.wang@mediatek.com,
 adrian-cj.hung@mediatek.com
References: <1611746924-12287-1-git-send-email-EastL.Lee@mediatek.com>
 <1611746924-12287-2-git-send-email-EastL.Lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2cf92fc2-ccac-312f-f4a6-9a4dfd9aee9c@canonical.com>
Date: Tue, 4 May 2021 10:15:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1611746924-12287-2-git-send-email-EastL.Lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_071744_390325_EC2B3AE2 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/01/2021 07:28, EastL Lee wrote:
> MediaTek External Memory Interface(emi) on MT6779 SoC controls all the
> transitions from master to dram, there are emi-cen & emi-mpu drivers.
> 
> emi-cen driver provides phy addr to dram rank, bank, column and other
> information, as well as the currently used dram channel number, rank
> number, rank size.
> 
> emi-mpu (memory protect unit) driver provides an interface to set emi
> regions, need to enter the secure world setting and the violation irq
> isr will collect mpu violation information, after all regions have
> protected their respective regions, emi-mpu will set the ap region to
> protect all the remaining dram.
> 
> Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> ---
>  drivers/memory/Kconfig                   |    1 +
>  drivers/memory/Makefile                  |    1 +
>  drivers/memory/mediatek/Kconfig          |   23 +
>  drivers/memory/mediatek/Makefile         |    4 +
>  drivers/memory/mediatek/emi-cen.c        | 1305 ++++++++++++++++++++++++++++++
>  drivers/memory/mediatek/emi-mpu.c        |  908 +++++++++++++++++++++
>  include/linux/soc/mediatek/mtk_sip_svc.h |    3 +
>  include/soc/mediatek/emi.h               |  101 +++
>  8 files changed, 2346 insertions(+)
>  create mode 100644 drivers/memory/mediatek/Kconfig
>  create mode 100644 drivers/memory/mediatek/Makefile
>  create mode 100644 drivers/memory/mediatek/emi-cen.c
>  create mode 100644 drivers/memory/mediatek/emi-mpu.c
>  create mode 100644 include/soc/mediatek/emi.h
> 

Use scripts/get_maintainers.pl to get list of people you need to Cc.

Run checkpatch, smatch, sparse and coccinelle on your new driver. I can
easily see that some of these steps were missing (e.g. OWNER field...).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
