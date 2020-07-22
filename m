Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B83C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:43:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EAC2077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiW2FvBr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILgCH7OV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9EAC2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ngFnjQv8kckp8SNAeZs6v2ng3VHap+AdNo6bXiNSYxE=; b=aiW2FvBrs/V9jA+tM7/UCffGT
	YBRfBc2pZmp2TQzm6DvOGVvpZLtoJG29yt/v3vdMSYJy1FG83TqUAScf0PqKQ0eyMjxkd+uDHwv4G
	nHCMH/azFCVZ401UDF4M4Cimw/+xJYMIOC7HYOy4f3YQDGVl1tXOtRv6iQhAw2T9mpKXyj2GP4apI
	hB00D9/pl70VgGHAfUyzECrnEtcQKOWRgqrXJqOUzgsooxji/1K8s6AxOZ9ea6plEBaVQiFCG2hh5
	0TdiC7RV8pnQCAcAsIj0M8Zk1cXAE4aJDjx0J1ZAtWnSqp6D4jr30ODB5Qfo5UyxZvYS1NNi1SjI1
	BqlbUUkrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyALQ-0004Ji-Fo; Wed, 22 Jul 2020 08:43:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyALO-0004Im-A0; Wed, 22 Jul 2020 08:43:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id a14so1059566wra.5;
 Wed, 22 Jul 2020 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wjB5ELp9SHAf9SrbqAcXBLR0Nucf1cmk8PLR4YQ6EeE=;
 b=ILgCH7OVE1I2wwwPOX+7NQudT+l7/ZlhvlAf2Wxc+ALPOdpvxovZVdBQnKDv4VvSOX
 WeKNWKbs6o41dVeiDf1bHgAM+FhsHf5ijbZnbipChAvemxTzKPiQf0ThMl/3Zg67x32f
 YPJF15cSwmSj7JPKUDfnHxj4P0QGdiDgQtRZh3mzOAWBbKcPluLSJXKEl9vlyNRdk0Bp
 iO77Mv5K5Vst6unlftQXlcONA8EM6WRUvB4+9NMBIuAVZJx5Lm/j7PU1OmNSz7DpGfIi
 C9FMKzrLXZeEsXq3GDm9z3Hnpv+ZjohX9kD/HP9YLzjasxAgbSWD7X1jyZrp3MQLP4kh
 QmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wjB5ELp9SHAf9SrbqAcXBLR0Nucf1cmk8PLR4YQ6EeE=;
 b=pwmUFPKi3vVVZ0d5gelxDprUNm0P3X/zg7yj+ghKRbuNf8h/l+I5BvqllKQOFwazf7
 etJJzTVupZBxvFTS5rqICwfF6oSLV08Iiok+U9CJjkZwx6vfEUFPeIqyzUWHbbvjj+mq
 UsOnp3Tghg5RbzMMhTddRO6xUvaqcdh07zEZQsCxqYQCT/9J26yBfp1Y05ooMY349Uue
 PGYC2L1Y/fSmFLATLxAXsaMnL1tGOfdstl8hxKvDaPvVxzPe02+J3BRbLUCgJApMdaKr
 iv575OCWygiVg34qhQrhYpA00IIFe9y6UOeqvVr6VJAL5gTPYniyDJGndWP+pEdWp02l
 Zc1A==
X-Gm-Message-State: AOAM531Lwwj8TnD+aFrAYDeV0itZDvOinzrkEHY3tQDPZgtTNdZ29tw6
 K0Qi9A6koTxb0MC81P0PbWs=
X-Google-Smtp-Source: ABdhPJxlWiEov15iy9/riqXA7B2hI67oGx3zp7/BbZOGyfUGYQf4x5XHJFdL6u7mY1E1itglTCxrcw==
X-Received: by 2002:adf:f18c:: with SMTP id h12mr28847223wro.375.1595407397275; 
 Wed, 22 Jul 2020 01:43:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id n16sm6255231wmc.40.2020.07.22.01.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 01:43:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
To: Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
Date: Wed, 22 Jul 2020 10:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_044318_400945_CDA5E782 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 05:09, Hanks Chen wrote:
> remove the redundant clk interface of uart.
> CLK_INFRA_UART3 is a dummy clk interface,
> it has no effect on the operation of the read/write instruction.
> 
> Change since v2:
> Commit "dt-bindings: clock: remove UART3 clock support"

Sorry just another comment. I think we can make this one patch deleting everything.

> -- remove Fixes tag
> Commit "clk: mediatek: remove UART3 clock support"
> -- remove Fixes tag
> 
> Hanks Chen (2):
>    dt-bindings: clock: remove UART3 clock support
>    clk: mediatek: remove UART3 clock support
> 
>   drivers/clk/mediatek/clk-mt6779.c      | 2 --
>   include/dt-bindings/clock/mt6779-clk.h | 1 -
>   2 files changed, 3 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
