Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAF4C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:39:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480DA61057
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 480DA61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dTiPnfGW8U6pKLZtYwjdN81s1lrulyGuqnxsdmWcuX4=; b=qjiCWtf456XAJnABt+neyU0V0
	C+mnHtTbvDz1JeOSt6M/0NOMUXC9dPD1YEkCCaU0u6on0F7Dj084Nfy75Xb0ckYQJQVXxsP57kncN
	gs9W0Vmxuxhm/g0u9axhKErnCr51OvK7zqDYeFxNOugXf0qXIKjJ957Af+CoIhTwOvB3qIhpycXUz
	GLOE9okMoNjSumiDXI15pCC67SaePNyN4UNdYySLDkc901HwUsWyIhcqIrx9woXwh0jPzdtTN4IYc
	KvRt5qMZXwPVUNWT4Rt7KymP9791/aKmsZQc87MsAVzW779/l4Pi5fEFshoU6Kk6G5RYuay4V2YMu
	FGtGf5uQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRtn2-0095Vy-Oq; Thu, 01 Apr 2021 09:39:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtmo-0095QE-Hy; Thu, 01 Apr 2021 09:38:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o16so1171625wrn.0;
 Thu, 01 Apr 2021 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zqr07vO7upTy6e/RfoTA/s/3/fiA55XFyYEasLBQqAs=;
 b=p0kuOLQzv7pOsdzulIw0amiLHAVOfPGe5DwWjMeFJf5AzMxzaCYEMUgM9T3FypvUdv
 e/bMIZ8nI3hxskYZiOGabqQ4a+/Y2k/My3Yt/DKyaMyNASskHbtDMWQ3q8/7FH/ZPl4L
 ZCO3Q2Nu61go8RTQSXpvJB7nkG6W82+rnPyxrx29La6dgk2z/4Jg/y4LcEAmRJDzOMxu
 y5NUQuQIkAkl+CMJ8ZpHUU48CBTdBLBgCE5jpe8XiDZI+GB6tGs2zefrZXHfZl/bREwq
 VlowOiql+sUl6pTygLI9Fh98sNyvqagzrvW29OPzuieF3oUykBrV6XSh0h718fGf8Znv
 kriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zqr07vO7upTy6e/RfoTA/s/3/fiA55XFyYEasLBQqAs=;
 b=OUJs7HzFWNxWh/QxFW6LXdV8s9jDvNcnOuBXJ4IMqvqQgCrCj+aBsIuTQ5veyATOAw
 aIQiKmw+KKqUfgeiSUVi0nSp1xPvfQtKku1gJu71eb6heiFX0z7ghpAed+r+0a78gtep
 x1KWD+gOqTevWbSaNxiDI3/zekrijigBxNOKPkjiaz/JM+OsdaVgJ0wtXvcdmpQT78a5
 bKEjkMOxu1Srt65uwHqMuAFkylYbAY2yaaa7zppjKp6kse8emEkWiv8aIxe9rdLPJXep
 4o3IVZMHygIKuhk0IOVgjNLr+uDuKIdJF33zPmldbhz1qjjQ3mzGwcQelGhteavew8Ph
 sJpA==
X-Gm-Message-State: AOAM533Kuv3YtNLcNbOEfX+h6rfY9TQB608RxVXq+a9ehscEZfTB9WqJ
 khPXA057scBerXP0/A6k/xQ=
X-Google-Smtp-Source: ABdhPJweFebP/Y9EsngFkTBEoYEMOAIhx/IutptK0Pf+C/0UMSu2/tnCwPdU/DZEPTl2HAr4BMnZeA==
X-Received: by 2002:adf:f587:: with SMTP id f7mr8572552wro.147.1617269925248; 
 Thu, 01 Apr 2021 02:38:45 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id k4sm12625016wrd.9.2021.04.01.02.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:38:44 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: Add power-domains properity to mfgcfg
To: Enric Balletbo Serra <eballetbo@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210224091742.1060508-1-ikjn@chromium.org>
 <CAFqH_50BWF4sQnJAnVZDf3Dbuw+LaN67q39DvOh7ipzqNeNEMw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6df6486e-89fc-6ea8-2b36-59e2bf49eb3a@gmail.com>
Date: Thu, 1 Apr 2021 11:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_50BWF4sQnJAnVZDf3Dbuw+LaN67q39DvOh7ipzqNeNEMw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_103847_585960_C48D3D70 
X-CRM114-Status: GOOD (  17.78  )
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



On 24/02/2021 11:30, Enric Balletbo Serra wrote:
> Hi Ikjoon,
> 
> Thank you for your patch.
> 
> Missatge de Ikjoon Jang <ikjn@chromium.org> del dia dc., 24 de febr.
> 2021 a les 10:21:
>>
>> mfgcfg clock is under MFG_ASYNC power domain
>>
>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>> ---
>>
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 5b782a4769e7..3384df5284c0 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -962,6 +962,7 @@ mfgcfg: syscon@13000000 {
>>                         compatible = "mediatek,mt8183-mfgcfg", "syscon";
>>                         reg = <0 0x13000000 0 0x1000>;
>>                         #clock-cells = <1>;
>> +                       power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_ASYNC>;
> 
> I don't think this will work in mainline, at least, the reference name
> should be &spm
> 

Correct. Would you mind to resend with the comment from Enric. Apart from that,
patch looks fine to me.

Regards,
Matthias

> Thanks,
>   Enric
>>                 };
>>
>>                 mmsys: syscon@14000000 {
>> --
>> 2.30.0.617.g56c4b15f3c-goog
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
