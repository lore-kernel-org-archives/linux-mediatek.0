Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E7DC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 07:50:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB136124B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 07:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB136124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VtXqOdpn+iIRrQqIK62ZIJLh1vl0+SHnTyGxML57iLs=; b=CEn3qVAB8xSUNPl1iGNzfzIbU
	30/HM4WEiULNjYvz0PPqSKGMO/JVQOna1OkQMi7zjHUGiPqz+B0NFiWwW2Fw7eZ5SJ6vwV3sJv7Sr
	XZr1QuQjLtHRtUryqO3V955U/1zBthh9xBpXZtQWNhXJuRbEgy0tFnZxfgvq926+wstTDTawXhxvM
	esyvgRT6yYkQa8KhTZHbiDF4ANmtIT7bV/QdQMBYpdTaLrdP9eMZXHHGrakINKyWo+ee+bjM4c6kb
	AoTnL2fLhrXma+AeD4NlvAXYy5D3p4p6ySyrpTpHqJNcfm/usL27NGvJV+4Rf9rMnT1LAejQMFmec
	53Jx0kaqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWwl0-00FGsB-IG; Thu, 15 Apr 2021 07:49:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWwki-00FGoa-TB; Thu, 15 Apr 2021 07:49:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id w4so18564077wrt.5;
 Thu, 15 Apr 2021 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZE9WdJxd0ITdiZNNPTZzb0rsrIlRH0qZQZUA7zrpRI4=;
 b=oVwFNPIJ5whCaK6HTN9PPePP0+riK/VG2R7QzoE+xbkqSmn0prTJEhV7SzdSVEjBHt
 0HSnMCHC3It33+GS8/9n9s3ljJ/FzmtJ1GcB2nXQ5PSLLKZqOdHWc6BO9F0da50sNM/1
 g1g1AVHASGH+kFPgxyKC4Tw8j/H/eBO7TwWpVgVQ10sGR794chhBqZ++QIvrciZAJRSF
 W43ciRZ7qBXJOHkxVI2snN0GcOPPvXnCcKO/eXguYpTm3P1ADeA9GjFlfXyPGvD/Kiwk
 zdLhwXqAKICAlCCj4O6lsgdJIJroIZrAZpWu1nZ/3Ie+KE6l9XQqG1zxekfZOaVQp/cJ
 yKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZE9WdJxd0ITdiZNNPTZzb0rsrIlRH0qZQZUA7zrpRI4=;
 b=oYBc3T+wH2/cvYNIvfzdRuLje9o8wo3M62fBjCI7ibboJWcnqrxa2/8dQyr3FB4pY2
 up5kfZ4bU6pJWFUJtFAghUPrtIQMDbo5FTxA8FQcSyOntlLGnFAl4hEXtyu+6yAWvf0c
 68TWQscZKR3yWRmD4WOMMU7LjhKXNuQaaBNkDjXBetCsM0mAulWIpOUBMZspg/a7+cEy
 3v35SUSwH5i0ijfvwfKHKYnJ4Tc1PRAbVnAsUAI0NnTCmzusU2XVoMHHueHLwGNhbnt4
 9zZYYU86HGFTruplbIy4LVI3DvB42RjbWxoSZnPf7r/5D2q1MsgGHtyM5JwIDhIvtihw
 pXIg==
X-Gm-Message-State: AOAM532TGCGvU1wLue43/pJHwTGNIM7O8EENGOOBHRXueRS34ZamlS/E
 G2xE1uxADUV8Slrr1JWbhAtyni9wb53dog==
X-Google-Smtp-Source: ABdhPJwdVtBo1w9zqgnQpw8SIxUc4AnTXQl9R/b3vZy8vuxbldXJKVLKj+X+75zeUj6s2YBuKdiY5Q==
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr1976287wrx.143.1618472847200; 
 Thu, 15 Apr 2021 00:47:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id g12sm1782933wru.47.2021.04.15.00.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 00:47:26 -0700 (PDT)
Subject: Re: [PATCH 3/3] arm64: dts: mt8183-kukui: fix dtbs_check warnings
To: Nicolas Boichat <drinkcat@chromium.org>, matthias.bgg@kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
 <20210414144643.17435-3-matthias.bgg@kernel.org>
 <CANMq1KAxZ+QiRR7LgR22pvhs4us=ne_VtSM-S_byCC0N__6BZA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d87f20bd-2195-663b-dd0b-ea1fa2f28a46@gmail.com>
Date: Thu, 15 Apr 2021 09:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANMq1KAxZ+QiRR7LgR22pvhs4us=ne_VtSM-S_byCC0N__6BZA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_084929_623567_FFC6514F 
X-CRM114-Status: GOOD (  17.34  )
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

Hi Nicolas,

On 15/04/2021 02:29, Nicolas Boichat wrote:
> On Wed, Apr 14, 2021 at 10:46 PM <matthias.bgg@kernel.org> wrote:
>>
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> The dsi children don't have any reg property,
> 
> Confused, see below.
> 
>> so we don't need address and
>> size cells. This makes dtbs_check happy.
>>
>> CC: Hsin-Yi Wang <hsinyi@chromium.org>
>> CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> CC: Nicolas Boichat <drinkcat@chromium.org>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> ---
>>
>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index ff56bcfa3370..f4dca6a33168 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -251,8 +251,7 @@ &cpu7 {
>>
>>  &dsi0 {
>>         status = "okay";
>> -       #address-cells = <1>;
>> -       #size-cells = <0>;
>> +
>>         panel: panel@0 {
>>                 /* compatible will be set in board dts */
>>                 reg = <0>;
> 
> ^^ isn't that... a reg property?
> 

Yes, that's my fault. I'm not quite sure why we would need this reg property. In
any case also we have it present "dtbs_check W=1" throws the following warning:
mediatek/mt8183.dtsi:1234.22-1246.5: Warning (avoid_unnecessary_addr_size):
/soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or
child "reg" property


Can you have a look at that?

Regards,
Matthias

>> --
>> 2.30.2
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
