Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56693C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AE860F35
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21AE860F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UFl3a00Mx+cRMIikzE1vFgQ03xPCUBqmbrBj4/4rqWQ=; b=S5pgkZ9R0ZlbYwOSwrm/xxaud1
	RaR/76ZREMoGLjcip9RkT2EPDKUe58x9O8O6bhBf+U9ogybR2/laDAYnbfJrsE2S5nVIN04CkM2LF
	iHZSBUmm8k+sStcuWjYMtL8PabxXyZ2hA7Tcl0QHR2UTv2C+z69qbaasZ828WmNWvZS+KXrjGNBws
	eBu7QdGOHRSdCDte6vasZnwC5LkHV/ZRU1YAcepiYvOjRiUXURDXItytE24p4mCHVnGkG2chctiuL
	drjGFT/WVjlzURiaui0j5eAtLYX/909cf0E5jA5hE2PjjwYSF90qfxDk2I8WhkaZi2vys7IscCcR5
	jyocNULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKm4-0071YK-8N; Wed, 04 Aug 2021 17:33:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKVz-006tnw-FL; Wed, 04 Aug 2021 17:17:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id h13so3077902wrp.1;
 Wed, 04 Aug 2021 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OcuNUS5du1cPG/Bhl2RhgxFiUmmqBvvOg+MihcCyu3U=;
 b=qessE7/60zmeiz1bpGMJaCD1lvSifU42ShPJhKn8OVVWpzgQQzGVBOpCPFZA7vCDr8
 tjdEMrwLfl9NGPBWBXvlzC8TrtPeD8NlrxCSI4QGXh5tG8y+k4Gqnub3kfmmn6M1Odgc
 KShC1mel4OhHm52VDc8A/q9gZgR1fY9HYm0cca2bbhF5E26w2mp7QMKyNH/M56OkX6xO
 fndS6BEntvjLCWXoxxLMxEEEXi+MzK2QVdfBD5zefqY8yJx+GDkdeQf9y5Li8WxPz2OE
 /cfeVMa4vW1rPVkqYufpxmXpGZScvN+uh/zoMEQSjB/mgKJB0ZDckZC3n5x/coRUHQr3
 Ascg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OcuNUS5du1cPG/Bhl2RhgxFiUmmqBvvOg+MihcCyu3U=;
 b=pGRBCD2Cz2nEnx967dLNEu2vOTQfSgz1R1h169aqxR2Fe16RqO7yxmnErOIesZyX8t
 HLQWkPJ3JrGY5wovpCmkMjYKFNMtmVJGFdkejt/PXS0M01GwtIbuBskdSrYHlVr1EX35
 PxZ5GHzSBvwmsvB3+a5KbzJrIDuDzR/tAWWdobgWMaIwhlw3atwXb/8rrOfyc4hv66Qn
 Wl1FanN/ZfiBcreBP77bcM+Hh+BllDJVJMqjbD8L666hIxV6D+Mber4TXVxf58THbLjF
 bF8VrlsUHxYUI4Te5q06jLBNwbgLnNQZR1aKO5PvuNrpg5qU6ZDb1/oLA/MQTNRzxVuq
 zCog==
X-Gm-Message-State: AOAM531Hl3mx1nUr54YXu51TNfFBoPGoi54nM6wBUNCZMirw6uoX1BQK
 uVJtcuRi9wfRZEXGJ8dGUBw=
X-Google-Smtp-Source: ABdhPJzODXrVtwYqebGDZKq41DwQ76Sh/ruDhIJ6BoSWFeg4hmebqdIm8zUC4gVLVF9DpvWESHtOvQ==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr459212wrn.52.1628097429876;
 Wed, 04 Aug 2021 10:17:09 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id b14sm3496281wrm.43.2021.08.04.10.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 10:17:09 -0700 (PDT)
Subject: Re: [PATCH v3 RESEND 1/2] arm64: dts: mt8183: add mediatek, gce-events
 in mutex
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>
References: <20210622030741.2120393-1-hsinyi@chromium.org>
 <CAJMQK-hiDDH1ypoDcQYEQZ0Vq3X-mTfZbF7qfRbGtD2zBH=oxw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6d7cd8ec-8a88-81bf-b4ff-60335b8b70bc@gmail.com>
Date: Wed, 4 Aug 2021 19:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJMQK-hiDDH1ypoDcQYEQZ0Vq3X-mTfZbF7qfRbGtD2zBH=oxw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_101711_577849_BB278BEA 
X-CRM114-Status: GOOD (  15.80  )
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



On 26/07/2021 12:27, Hsin-Yi Wang wrote:
> On Tue, Jun 22, 2021 at 11:07 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> mediatek,gce-events is read by mutex node.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Gentle ping on this series. thanks
> 

Both are pushed to v5.14-next/dts64 now. Sorry for the delay.

Matthias

>> ---
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index c5e822b6b77a3..cf22d71161e58 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
>>                         reg = <0 0x14016000 0 0x1000>;
>>                         interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
>>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>> +                       mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
>> +                                             <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
>>                 };
>>
>>                 larb0: larb@14017000 {
>> --
>> 2.32.0.288.g62a8d224e6-goog
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
