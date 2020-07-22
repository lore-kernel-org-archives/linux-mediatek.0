Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0277CC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C170B2071A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neUtZTxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H04Y+qWa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C170B2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LOdNNWNKweer/U8cPlx/V0pqOb2hpX/cFBh8CMaubB0=; b=neUtZTxKOrG2jO2bPSRFOP+CB
	mtHbyaI8RbVqrH2eoWz+sUMPNYrEibOR+7S9aW04hasogdt7Zi81Cj2bSSQSWdPMW6CvASVcskK1h
	CW7yXQM+VQjfvfQYY2Izab4mMwtqYhL6vR8z9jFOaX2hY9eei+4di+ZB26LvI9rbubYEaIhKspmt2
	YO9lxHZBmFsecLYKz7cImNDG+/O0sXyI/2kcn5+TLZL7OqOAWM249ZlrDj6JgNBJFOq6nSyWIXxaD
	fNN5xuD1xsPt9iE0B/deoWyzyNIc5B0pwXIcGssIwwHSEYTMLjxDz/wNfYVTaVwOP6YcVZ4SmviGS
	+qPaYKWpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGZ0-0005FA-MW; Wed, 22 Jul 2020 15:21:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGYy-0005EI-LL; Wed, 22 Jul 2020 15:21:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id 17so2389795wmo.1;
 Wed, 22 Jul 2020 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=APcE0dq9NffscdZqhCykq7zOiZI+MLpwiU+amE/ixCo=;
 b=H04Y+qWavDP+79AZ0wYfzTZY0nZ2U6Vr2mMgwqWQGMVTAJhO01mWw+VnJEnFIi5g6j
 d+Dc4o+NeAKcqGbPJPjmYtWQLuhCP/IzvJ55jQvu4eeIK+1nl53YslvrXWpsyGIp7ymb
 OZD573KORP9179/VXbJ8AWPEq7E6x6cXED1yUDeu5BMN/PiGpYFYahoZjGhRD/rZW0Yv
 +EnA08w8dp08iB+NYlr1qbrqJ8v/w/EpPxxGFCGqgC8N50W47drDEqEFNTlcT9XLjUBM
 u3DuPLtD34PCPK5iOirBpsXvJH3s2gvGiaJjbILYfMerHraw9IZtfuzsy6HGY6a80ljN
 FVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=APcE0dq9NffscdZqhCykq7zOiZI+MLpwiU+amE/ixCo=;
 b=qjVwDPfdsdCpYV1pbLdZEvB+T+e8ccDvtDmyBtcrRaEqMvCqeRx4mRVoxYP7eFB2zn
 3cBky1gK6H/avermGTTL5aAoKvD3T/A0QkhjeZ2nhh953d4JQRnQ+AV4zg5Lgl+3kcTD
 0xv8plUulbom/HopQ9VWXEd4hFIJ1wMLXEPJm9Ksp/se8mGZW4EcpGQikGgJGFC+q70w
 KQDXfXH7nm6AYNVTbRz7fPYmrKxiwPNIiksc/4/m23dI4l7r6sajCWLT//TwvrSYBlmH
 sLwXgKEPVvWTUa0KH7/SFwyUNsSWNuIH45MN3yA/2EoP+nvppKSggqq479CIwtV4Y7Fa
 KX+A==
X-Gm-Message-State: AOAM531sr8xDRJqyGF2C2pdq2KKSYgL3GmdUFENiT2xdGzt0+xE1gdjF
 YFjyBQni9+CLQk6UcsLIWnU=
X-Google-Smtp-Source: ABdhPJxnY3ccClP249C1jjXhVlvCN6U/cJtwqYjECuera/bTvS+XWkZNTW5km1E6Ff/jPK85BYcwQw==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr183927wmd.86.1595431303576; 
 Wed, 22 Jul 2020 08:21:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id t141sm42767wmt.26.2020.07.22.08.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:21:42 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
To: Hanks Chen <hanks.chen@mediatek.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
 <1595416581.5511.6.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
Date: Wed, 22 Jul 2020 17:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595416581.5511.6.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112144_752906_838C453A 
X-CRM114-Status: GOOD (  16.66  )
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
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 13:16, Hanks Chen wrote:
> On Wed, 2020-07-22 at 10:43 +0200, Matthias Brugger wrote:
>>
>> On 22/07/2020 05:09, Hanks Chen wrote:
>>> remove the redundant clk interface of uart.
>>> CLK_INFRA_UART3 is a dummy clk interface,
>>> it has no effect on the operation of the read/write instruction.
>>>
>>> Change since v2:
>>> Commit "dt-bindings: clock: remove UART3 clock support"
>>
>> Sorry just another comment. I think we can make this one patch deleting everything.
>>
> Sorry, I don't understand the comment. Do I need to merge them into one
> big patch?
> Btw, if I use one patch, I would get check patch fail.
> ---
> [2020-07-22 19:12:49,046 ERROR] Run check patch results:
> WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
> separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst
> ---

Hm, I think that's a debatable error message from checkpatch, but let's leave it 
as it is.

Regards,
Matthias


> 
> Hanks
> 
>>> -- remove Fixes tag
>>> Commit "clk: mediatek: remove UART3 clock support"
>>> -- remove Fixes tag
>>>
>>> Hanks Chen (2):
>>>     dt-bindings: clock: remove UART3 clock support
>>>     clk: mediatek: remove UART3 clock support
>>>
>>>    drivers/clk/mediatek/clk-mt6779.c      | 2 --
>>>    include/dt-bindings/clock/mt6779-clk.h | 1 -
>>>    2 files changed, 3 deletions(-)
>>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
