Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB56DC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 07:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A12C20700
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 07:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d4D42mRE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBT3U2cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A12C20700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLJsc7cNbd3MX19/dNCOZwcLG0AMXk+ym4tXOxrgZ44=; b=d4D42mREWpHf+o
	qxdjeivDStGDVZUub+c49sgbBzHPLV1AN54Riwxp+QNjyxapw6uN0tWIHEQwJygGBMH519BQlrFiV
	04lzoItePLdT51C3xDx1o4HhNq485SzDcg0oKvb4oW30G911IUO/zYHf8SmyVs/QbOxnO2p9dzilY
	68L/L1T2USIhhXvcGP9glcPb5gafS6nP/+VzVavZ5gDtrUtiIlb4FgIr3R4McQH6RWMMtL+AJ5uQq
	bIoOzYWo8KYCs+HlkuQNHed8Kg2C5NukMbDaBoJbMrspwUUOtHb68f7H9oXM7jo14lxwFpN9CDmPi
	nUVKX+5amXxPyj5Iwuuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRsMJ-0006t3-1y; Fri, 24 Apr 2020 07:02:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRsM7-0006ig-Hf; Fri, 24 Apr 2020 07:02:39 +0000
Received: by mail-pf1-x441.google.com with SMTP id d184so4375159pfd.4;
 Fri, 24 Apr 2020 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nYmuPUkpfA/WyQitaSXz7ECHPn+yLvEDC7IL/UihbYA=;
 b=hBT3U2cbQjqSmJ9hzCC57Plx5J+ya1WpV5mw/I3wXmOwbozUSjllVHATaB30bCWA92
 23wS7C+/jrqcDaaBbrQ7/AdRMH4FP8gG8++0vFFmcU9XhaCBYKfHtWo63Lv0hcXge80g
 oXrUVsgxEM0EjP1adJBgStF7x83mW2W1JLIGgDj7DjiGU59YqQKdSqQJEffC0be+ePbI
 r2LOToHjIg6JTaCp8fE/fvUuCTefdRG27nJQT3hqKY4l5+2AgAlGJyD8uWpN+U6n3dCE
 IY1CVFCEq8H3lQB64cgtCoXVUd7v5CZSvrzpIUTc11+7P/oZEn1ugovw+Vnq4vQ2mHop
 74Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nYmuPUkpfA/WyQitaSXz7ECHPn+yLvEDC7IL/UihbYA=;
 b=n3ylghWiD72Lz0G6StbCYHCu+y4RlaRni8KoUEKquQr5sOY4SEjbTuYWTTcFJEKX8b
 VXugkM0mat2n60Px1jhQ+MHGH369Ih6PZXTnvDbSRg+XnyagLN/Qs/3OOdxqZOUTWFWo
 x2kzvuGgSWIeDcH4AHLCnL3wqNlcIDTt5UQDYrj8meSKLdXzIvQj/9f143bTQNuMQkqy
 Rg0JzIkrs+45AcNm7ZbNV71VNCh1mPPXuXTz3KvQbsY+HGcBPUtVN0vGUSx8YH0hSMa0
 HKb6uNCuqfKw/SFa1/Y8BhL7TgITfz5A/Up65XdI5B62JYEvRzGvHhIsn79zWdbSwP3C
 5QEw==
X-Gm-Message-State: AGi0PuYNDCIln9BphUn8s8cUWauYGtNveUva708lV6s7EhugiHrZMfmP
 Ebjtn1uEIgS8LGAqRqrtxcM=
X-Google-Smtp-Source: APiQypJ65WqC35vDojAG67V5X2vRRyA4kfiKKt1BIrZCAN06QLNZMKUzvD262vR3np7dF8JeffGlRA==
X-Received: by 2002:aa7:958f:: with SMTP id z15mr7669227pfj.10.1587711749222; 
 Fri, 24 Apr 2020 00:02:29 -0700 (PDT)
Received: from localhost (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
 by smtp.gmail.com with ESMTPSA id u188sm4774079pfu.33.2020.04.24.00.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 00:02:28 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 24 Apr 2020 16:02:19 +0900
To: "chunlei.wang" <Chunlei.wang@mediatek.com>
Subject: Re: [PATCH] printk: Add printk log prefix information.
Message-ID: <20200424070219.GA543@jagdpanzerIV.localdomain>
References: <1587709294.9792.5.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587709294.9792.5.camel@mbjsdccf07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_000235_587985_EC9732AF 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On (20/04/24 14:21), chunlei.wang wrote:
> Add prefix status/cpu_id/pid/process_name to each kernel log.
> example:
> [ 8408.806432] (4)[19963:kworker/4:1]wifi_fw: ring_emi_seg.sz=4164,
> ring_cache_pt=000000004f5ca8fa, ring_cache_seg.sz=4164
> [ 8408.806729]-(4)[19963:kworker/4:1]connlog_log_data_handler: 1
> callbacks suppressed

It seems that CONFIG_PRINTK_CALLER does this already.

	-ss

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
