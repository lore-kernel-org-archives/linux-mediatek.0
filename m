Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB92EC77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ7xESGkDIP+gv/TyxcTjr26EqMcpWBeDTIWa0uSfo8=; b=D6YrPrH66sFlORnGvfKhrT4Z2Y
	oOJuFSmPCpiToA5qbYD1iFQZBOra2HNr3ZEMAx8chIEPDI0fgUSX9TxPQX0zLQZ43fHS2uF7cLV3f
	IGI100ZQBFhR78xkwf75IRgAbt9lwG73Steq6FEDrOOu7/B67pLMxDocnz/BTe1hQiqhpoZT7QuQ9
	exF6aGqcZrvSyGf1aQQu33mTmEmMBRjorsHy4Buy3+db5H5cwfiOQot56NrJRGGXW2nwkXNxexliD
	uEArhPufYCp1Xzer0V6/uaJAr1kmv62yWZuK2tB0ge0deiBBgDGuOu/fjvbOwm7XMs8DEqCEvfzhB
	0Y0xO5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aa2-003A5A-20;
	Fri, 26 May 2023 16:46:18 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aZy-003A3K-18
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 16:46:16 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b01bd7093aso3272855ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685119568; x=1687711568;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ7xESGkDIP+gv/TyxcTjr26EqMcpWBeDTIWa0uSfo8=;
        b=Q74q6Saj1EBoK76IIVWSLFITjXS99onLD7OnggD7NsuTUhOeBiUO21tdTCLzlGV5A/
         TlnaC7YETSg8A/97bcp8pXnCWj7p7Q75exSB6u7nm1GyUbu0b9+KHWQtlh1/xxvWdmRU
         3NiO7Lh2ERs8DO8HmJkVKcuAwQlj7cfnYYPc0XcK6Wekq2np/bxjP9PEMa1JasKTKvi5
         41o2+f4gKZWxiNTS3H7i6EdYkO6zMMhODFCXsq6UloX9Y4MzzPvgpii0h4mygs2+SIzT
         3wt5gTaP0edRSdt+ejB4yUeblBTskrSvL1Bn5FyNt3Xa7dUCw1U7tQ/BsIxC4brdie6f
         yRKg==
X-Gm-Message-State: AC+VfDxEkeccKKrpN/j0zKoB8Qyd8egV6JBcQEyZEzI7XXKYzUo9fqek
	lH3S1pOXwvlEts/UjnEmNxqyAw==
X-Google-Smtp-Source: ACHHUZ7Xubhmddh9lHC80YV+z3qVxVDPAYZeGbq4cA+Ll4YhSqJ35CM4QoUFgfB49VTsdGyJNaRudw==
X-Received: by 2002:a17:903:4282:b0:1b0:fe9:e57e with SMTP id ju2-20020a170903428200b001b00fe9e57emr2665913plb.0.1685119568432;
        Fri, 26 May 2023 09:46:08 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id jc21-20020a17090325d500b001afba6edc8esm3481642plb.166.2023.05.26.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:45:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
In-Reply-To: <20230523114618.laajn2et5nbcxszv@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
 <20230523114618.laajn2et5nbcxszv@blmsp>
Date: Fri, 26 May 2023 09:45:47 -0700
Message-ID: <7hsfbjxcqs.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_094614_408604_4F399914 
X-CRM114-Status: GOOD (  17.15  )
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

Markus Schneider-Pargmann <msp@baylibre.com> writes:

> just wanted to ask if I need to do something specific for it to go into
> a rc? Sorry if I missed doing something for that, I haven't had to fix
> something in an rc that often before.

I think the  Fixes tag is enough to indicate that.

Steven, is there still time for this fix be queued up for v6.4-rc?

Thanks,

Kevin

> On Thu, May 11, 2023 at 03:32:26PM +0200, Markus Schneider-Pargmann wrote:
>> The given operations are inverted for the wrong registers which makes
>> multiple of the mt8365 hardware units unusable. In my setup at least usb
>> did not work.
>> 
>> Fixed by swapping the operations with the inverted ones.
>> 
>> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>  drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
>> index 6b4e193f648d..6d785ec5754d 100644
>> --- a/drivers/clk/mediatek/clk-mt8365.c
>> +++ b/drivers/clk/mediatek/clk-mt8365.c
>> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>>  
>>  #define GATE_TOP0(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr)
>>  
>>  #define GATE_TOP1(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>  
>>  #define GATE_TOP2(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>  
>>  static const struct mtk_gate top_clk_gates[] = {
>>  	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
>> -- 
>> 2.40.1
>> 

