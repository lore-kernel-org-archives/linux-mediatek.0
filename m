Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0784C433EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 22:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDF02086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 22:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bSvRkkXH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmn3inGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDF02086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fx3l3qqTt3DeuqvJWGHjJhJFT8SOzo5lPiXE3qvbRsk=; b=bSvRkkXHEfiJUNwDyblr36xwc
	SAbVUynJ4aRWamOOHK0Ixx4gsC9O++bmMEvKEkc1EeziVe2vK4Jpfjlb0b95Ffw81eixYxkNkFY6s
	zVIfD/OhAJA5opiUyq/wlIAWA4DPYB0vRAsvko+Y+xaF9m7lzj5uR6z/pL3WJN/LMwmVtsF9kgFih
	oGfDrBnB9iV456th111RcaCzzFDCC1c+VeykSCI1I/1797+QtxV47NkBsMK8b8DQ5gUTxy8uiZhcV
	kli4PuF/6ON+t+4J73PprQ4QFrNZgl1KuImryTGnOlqLQ68IGP2GKOAyCljBM1Ii/CaMw9L8ybgS3
	edkAZp0iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyjIN-0000t3-6E; Thu, 23 Jul 2020 22:02:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyjIK-0000s2-68; Thu, 23 Jul 2020 22:02:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id b6so6533212wrs.11;
 Thu, 23 Jul 2020 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NuQxLm4oh1YqwrzmCOG37rIcHVvqKWOtQLxSpr2Bytw=;
 b=Bmn3inGNBhbZAPmNzvzk0PoF6hhVlHq2zgwDg+7BRgIs/2zN86NtzsLvQfnEaEovCN
 n4Syrzpn67iBgAsn6+Jl3k76bghC9B74OoXOGqDmCtyB9OxIaPN/bYO8Kp4T3LtjJEqY
 iOlCgsxmYgwYmXR7HNIjVN6GsxvyEj5kgJg1ZR7P6Xbg1qLLyYi+GymXIcXDqgqIFXzT
 p64Dp5eMNf/dRyU6Jp6XDSoSDBsA2YsldyBSmMB7SdngDYCObAU4FHxgCY/tAcvJhE4h
 iEt+29rHggNtSgMZzmIAybjz4CbJoSvVi3G4SvSzBc54P1uYyQWTeshS0TvTxRvU6/BF
 6xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NuQxLm4oh1YqwrzmCOG37rIcHVvqKWOtQLxSpr2Bytw=;
 b=eYADGUzq9xQbifUqZ8nyB3MJ6K2JXbQM0dJjyNhustXo0WwsJTNf585OV4nj1+QMwL
 ajif6Z8ARE3vtdItUGTnICnzgMlr00250LdudTMu78pnIugbUOD07HMD/9Pz01gYQeN9
 XaqryjfSh2VS6ytELPbtpXTKVFQfzQeo1QVgQ9GhPy9WdqqojStpHd/FEn6Gjh/a0P3o
 jJDLs3+K234SLrEpk93hJY9MCF2wpRFnTiMV9bVEvroGY2tQu+eCibwedq4U1LA4n1Qs
 FlmI9y+3lvHSqvDFBV4h1D7glhaVuYbhAZgW9sG93YvEbYD0p6+1d0toiG4/2LZKFL5C
 4r9Q==
X-Gm-Message-State: AOAM532IzbrM5IbYxQFOJefj3QzEqWXNTWOMu1XOMAMzcVwhD8p7WDk/
 bCmxViAqwJQcNspmA5OdM1TmVZ0gY7M=
X-Google-Smtp-Source: ABdhPJwCBWjFqfX9LsEETFlHhgqOHXb0/Jb4JGN0sWE1amMRw6DzjP+yqFsILokrocP9sTCgogVagw==
X-Received: by 2002:a5d:6b08:: with SMTP id v8mr5993254wrw.2.1595541746233;
 Thu, 23 Jul 2020 15:02:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id 65sm5120618wmd.20.2020.07.23.15.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 15:02:25 -0700 (PDT)
Subject: Re: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To: Rob Herring <robh@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-5-seiya.wang@mediatek.com>
 <20200723212935.GA889594@bogus>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d69d441d-b8c7-f4a4-7ae1-a0012d8001f3@gmail.com>
Date: Fri, 24 Jul 2020 00:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723212935.GA889594@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_180228_255888_8772AE40 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-serial@vger.kernel.org,
 Crystal Guo <crystal.guo@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/07/2020 23:29, Rob Herring wrote:
> On Thu, Jul 23, 2020 at 05:07:31PM +0800, Seiya Wang wrote:
>> From: Crystal Guo <crystal.guo@mediatek.com>
>>
>> update mtk-wdt document for MT8192 platform
>>
>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> index 4dd36bd3f1ad..d760ca8a630e 100644
>> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> @@ -12,6 +12,8 @@ Required properties:
>>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>>   	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>> +	"mediatek,mt8192-wdt": for MT8192
>> +
> 
> So, not compatible with "mediatek,mt6589-wdt"? Is so, perhaps summarize
> what the differences are.
> 

Hm, looks to me as if the binding description for mt2712 and mt8183 isn't 
correct, as we have a OF data just as we have for mt8192 now. Could you fix this 
in a separate patch?

Regards,
Matthias

>>   
>>   - reg : Specifies base physical address and size of the registers.
>>   
>> -- 
>> 2.14.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
