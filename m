Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19642C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 08:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAD5610F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 08:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAD5610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wWbgmxbYlvfGhhpThadSiqENVXOJC+PGiihx2XxxYGA=; b=diRCVdd1UkLeB/XI20ahyGpWXV
	cONZNhRHglFRrd9n7qsmzfeqnCcjdeBzm9vm04xFY1P1IDAGtRVYeEBjc+wYFoeYboSwrk65xlsrH
	RkKeHjc54EprGFnFhf1N3CKjR/iaKth/g/kl7/KjTdIIEvOkFuEmT7YFUdcQ1C8GpVRg9CCUmH7/4
	Kzfk00/w8LQRw89IRZlUu7PY5gzEQzlIp1xfNfy4lTyaVYOD1jNkgWtsd9E+Qg4iOhr+d7Cv36PmL
	T3hH2JnOF8kTAlcImwvjZul4GXH1GZG3FA2jQcDclUk5X1s5wpEK3k6MryTq756n30zrFnjP7Yrid
	s6ZKnktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqu1v-00CWIT-9a; Wed, 09 Jun 2021 08:57:43 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtFM-00CHoV-Lk; Wed, 09 Jun 2021 08:07:34 +0000
Received: by mail-wr1-f43.google.com with SMTP id z8so24363291wrp.12;
 Wed, 09 Jun 2021 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kFAOmJ8pJ4xgYGxPRlgaz8KsSajsnGo3Wjp6nlmAIho=;
 b=JQl1iTsPpKJgzW8kORR5X8+lCPr9bhpq/DZ86sXj6+s5jNdyGNIKIAVRMLyobxWgSY
 PCZJtVSIwyxkfJ/gQCKW6TGqbmBhTA/DBys2WIlKUgRa6NuWbTGyjJEgtioAQ+zq/Dul
 E0Q17XklnYgZuVsICX+fm1IlAEIF3qfnoAAS9r/MeTBHacY4C7mcLiddYncakgCWKOWH
 1L1JjRnRvMlXjluHnN8hcPHP48+hKYMXIAt3n1pOzWNIUF38ehnB8xZZQZzFOGz2ncAJ
 VBPPSv0JFCLzbB1tLmuPzrvEHkRnbyNc1VYzz4E3FCCdwFiG28ako+tjSTfKYOCPa68e
 7qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kFAOmJ8pJ4xgYGxPRlgaz8KsSajsnGo3Wjp6nlmAIho=;
 b=HpT9Fe6eGKinBXfzkmdX19cPdilYu6mMCzZ6GTPULENERt/PD9zJGNPq3QarWAmtMN
 vt1vAGmi4R30jw2rUNynA5MZa/U9bcUUm8uxFoDJ8OeBZllKUV43IUOaTXaIUzBmmLeD
 grtYnBsGQRcqBX7gkNT8lC6zPj+T37T4Y626TOKxFu5s1SvsPAkwBSXOylZrdtEZqlax
 uPBElOBnPVfBrRfFzSwKkFpUEYCXShjeraLd52DhXM8ogHgqimhEcrxCfoXJ8CKFM5gY
 NyjmdpPKt3wZyvfa2ja4R4UegN7TYXQ7zVX2lIQf8dmanACAN/YUTMg8Af1mDB+p2oZ8
 XWfg==
X-Gm-Message-State: AOAM531MFxUun9eRjPnQkf4zl7dkkAaIVf7czFjNvDjxQgkK2KGBeOqP
 PRPxtEv6fb4tGHXShjgB0CE=
X-Google-Smtp-Source: ABdhPJxRNr/D5jm2CzvTjkv/w83K9RYOChZVLyEVg5XG0Pd0GbC+Ehf93KQqDRoe9MGQAyK2g1F9Mg==
X-Received: by 2002:adf:b648:: with SMTP id i8mr20585813wre.425.1623225989103; 
 Wed, 09 Jun 2021 01:06:29 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id k12sm5328590wmr.2.2021.06.09.01.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:06:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: add pwrap driver for MT8195 SoC
To: Fei Shao <fshao@chromium.org>, James Lo <james.lo@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
References: <20210602112050.12338-1-james.lo@mediatek.com>
 <20210602112050.12338-3-james.lo@mediatek.com>
 <CAC=S1nhUB=6y1SXUvAuhdj69S36FQnp9nr9V65TtS72pxuoRTg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <87ab50ff-bae3-b2a3-1e54-642cdce3600d@gmail.com>
Date: Wed, 9 Jun 2021 10:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAC=S1nhUB=6y1SXUvAuhdj69S36FQnp9nr9V65TtS72pxuoRTg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010732_793915_FC20899E 
X-CRM114-Status: GOOD (  17.70  )
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



On 09/06/2021 09:51, Fei Shao wrote:
> On Wed, Jun 2, 2021 at 7:21 PM James Lo <james.lo@mediatek.com> wrote:
>>
>> From: Henry Chen <henryc.chen@mediatek.com>
>>
>> MT8195 are highly integrated SoC and use PMIC_MT6359 for
>> power management. This patch adds pwrap master driver to
>> access PMIC_MT6359.
>>
>> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
>> ---
>>  drivers/soc/mediatek/mtk-pmic-wrap.c | 35 ++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index e4de75f35c33..952bc554f443 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -961,6 +961,23 @@ static int mt8183_regs[] = {
>>         [PWRAP_WACS2_VLDCLR] =                  0xC28,
>>  };
>>
>> +static int mt8195_regs[] = {
>> +       [PWRAP_INIT_DONE2] =            0x0,
>> +       [PWRAP_STAUPD_CTRL] =           0x4C,
>> +       [PWRAP_TIMER_EN] =              0x3E4,
>> +       [PWRAP_INT_EN] =                0x420,
>> +       [PWRAP_INT_FLG] =               0x428,
>> +       [PWRAP_INT_CLR] =               0x42C,
>> +       [PWRAP_INT1_EN] =               0x450,
>> +       [PWRAP_INT1_FLG] =              0x458,
>> +       [PWRAP_INT1_CLR] =              0x45C,
>> +       [PWRAP_WACS2_CMD] =             0x880,
>> +       [PWRAP_SWINF_2_WDATA_31_0] =    0x884,
>> +       [PWRAP_SWINF_2_RDATA_31_0] =    0x894,
>> +       [PWRAP_WACS2_VLDCLR] =          0x8A4,
>> +       [PWRAP_WACS2_RDATA] =           0x8A8,
>> +};
>> +
>>  static int mt8516_regs[] = {
>>         [PWRAP_MUX_SEL] =               0x0,
>>         [PWRAP_WRAP_EN] =               0x4,
>> @@ -1066,6 +1083,7 @@ enum pwrap_type {
>>         PWRAP_MT8135,
>>         PWRAP_MT8173,
>>         PWRAP_MT8183,
>> +       PWRAP_MT8195,
>>         PWRAP_MT8516,
>>  };
>>
>> @@ -1525,6 +1543,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>>                 break;
>>         case PWRAP_MT6873:
>>         case PWRAP_MT8183:
>> +       case PWRAP_MT8195:
>>                 break;
>>         }
>>
>> @@ -2025,6 +2044,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
>>         .init_soc_specific = pwrap_mt8183_init_soc_specific,
>>  };
>>
>> +static struct pmic_wrapper_type pwrap_mt8195 = {
>> +       .regs = mt8195_regs,
>> +       .type = PWRAP_MT8195,
>> +       .arb_en_all = 0x777f, /* NEED CONFIRM */
>> +       .int_en_all = 0x180000, /* NEED CONFIRM */
> 
> Please get the confirmative values here then send the next patch, thanks.
> 

Yes please. You can send this as a follow-up patch, otherwise I'd need to remove
this from my queue, as I have overseen the fact that not all values are confirmed.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
