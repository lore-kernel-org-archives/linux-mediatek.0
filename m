Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6783AC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:23:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3572522B47
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uh9tBzlz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFPvat03"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3572522B47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aaUw0QjK+ekeMKzQ7mH+UTMQRRU4RKrsJJr2vLmvG1Y=; b=Uh9tBzlzA91e+jgf9AWPFxILG
	vl/EFRv9YOrPAempSSkSzZiOQ9i6cPXshWfgsmLvoj//AgyU6JxwlTjAmcsBpl6C2Z2klUNMMHRL7
	i0KmjEhRKLV6B/4C5CkoMYBGwwIHqhRA5o9HxtejoG9AsdgwnqqHbruvdLpXTb/BD7N41uTBXsz0m
	tcjylpjzwwhQwCVJu7LtN+npH3urDTD5iaIe2Tc/k2fiPOA+FgWPvlP5DvxgRzycy6k8itgdWesNu
	AiynKxRNHi7aZWXHoYKj/hXvr0gJ6XFUHH3xfPEZouXeoK7dcjuU97r8K0rsBq2zsUZTlFDP7RQzi
	SBR1IOHhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDCJ-0001NN-Mt; Thu, 27 Aug 2020 08:23:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDCH-0001Mp-LI; Thu, 27 Aug 2020 08:23:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id x7so4487791wro.3;
 Thu, 27 Aug 2020 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L4XCCnRN6fG15vCYo2bW4Pc6TLiOQjp7cLIshmu9c9U=;
 b=AFPvat03Xy0424JfFgdxZskpWCg155al8jI1hGe+5UheZKEzOKDhqy027O/CM1zTv+
 zfdalVG0lrpwTR+pRnvJLIcC/AUdTrNykqBBw3SDe2WpDGWeWaM6lx/nXNUYAjLF5tp8
 auYwaMB7NxJ0aV1Bc+4ClWDa7jm5uXtECHmCIGVTvNYVlLa10+Ulpq9Rfxvtn1ptpENV
 uLRmZZiivyg0c6afnm7TydjsXNzmqNaD74iChCObjyFkIdR4tMmrCwQyVfonXFXGIGsx
 LKeSMn0Kh2A0iu2YhCHvTGuoIZ2X1B2GHxR7RPouuBjA3HBkAKvfxxm4osLBBwmCREJG
 JlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L4XCCnRN6fG15vCYo2bW4Pc6TLiOQjp7cLIshmu9c9U=;
 b=rbUbXxwBUTG0w+e3+RF3ng6H0kxiIf00iyJ1bX99PTXJz998vmT3Wn0/OnhfFCDut2
 updLgJuYBowVlsWv0vD69+22YV+zPmc6FLEuCnJqugmnc5yiKurXk49acTgpv/0Xv+jm
 Ue560aDfHUD3brzRX811hKsvy8nw1ISXvTzZYQfTTKbOCXhfaDhfI9rUY+nbkPGt48tk
 27wfZrp6F6u0/f6yaxuX4dqHctnkNWKKA7F+nJxX56bSPwqVDHmYsg2IhH+S8jzSgBo+
 W9Ty3cBLhArYjaBcVMtLX73JH/Yfxl3e6r88l4LRY0MZ3HLzcJo3tVYBewUWniahmvrj
 j5gw==
X-Gm-Message-State: AOAM533ucRfqEYuuh88G5iio8n0KuDmfTeHWd3msmYNolDrmMjX0gDm7
 yvnsezNx/CjNZNq/P4SgWUBfJdr39QCzVw==
X-Google-Smtp-Source: ABdhPJwzK3eFiKm90v/V4n4a5o+w0AzbR7Sg2+CRdvmTmpqjt1qvB5e6vObKUp7mNhpPEzvUNfxKAQ==
X-Received: by 2002:a5d:5223:: with SMTP id i3mr16960587wra.58.1598516628776; 
 Thu, 27 Aug 2020 01:23:48 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id c10sm3843104wrn.24.2020.08.27.01.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 01:23:47 -0700 (PDT)
Subject: Re: [v5,2/3] arm64: dts: mt7622: add reset node for mmc device
To: Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-3-wenbin.mei@mediatek.com>
 <CAPDyKFpt6-a+pkTXb2RZdx=yTONetugSCKbtSsRD2xQ3PRPhDQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1dfc1938-f5e8-c4c8-57c7-d7b6c33dcb1d@gmail.com>
Date: Thu, 27 Aug 2020 10:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpt6-a+pkTXb2RZdx=yTONetugSCKbtSsRD2xQ3PRPhDQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042349_730023_2C39E577 
X-CRM114-Status: GOOD (  20.32  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 4.0+" <stable@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/08/2020 11:50, Ulf Hansson wrote:
> On Fri, 14 Aug 2020 at 03:44, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>>
>> This commit adds reset node for mmc device.
>>
>> Cc: <stable@vger.kernel.org> # v5.4+
>> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
>> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
>> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> 
> I can pick this for my fixes branch, together with the other changes,
> however deferring that until Matthias acks it.

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

My understanding is, that this will land also in v5.9-rc[3,4], correct?

Regards,
Matthias

> 
> Kind regards
> Uffe
> 
> 
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>> index 1a39e0ef776b..5b9ec032ce8d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>> @@ -686,6 +686,8 @@
>>                  clocks = <&pericfg CLK_PERI_MSDC30_0_PD>,
>>                           <&topckgen CLK_TOP_MSDC50_0_SEL>;
>>                  clock-names = "source", "hclk";
>> +               resets = <&pericfg MT7622_PERI_MSDC0_SW_RST>;
>> +               reset-names = "hrst";
>>                  status = "disabled";
>>          };
>>
>> --
>> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
